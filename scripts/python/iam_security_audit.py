#!/usr/bin/env python3
"""
IAM security audit: MFA status, inactive access keys, inline policies.
Aligned with Module 2 (IAM). Reports users without MFA and with inline policies.
Usage: python iam_security_audit.py [--profile PROFILE] [--region REGION]
"""
import argparse
import sys
from datetime import datetime, timezone

try:
    import boto3
    from botocore.exceptions import ClientError
except ImportError:
    print("Install boto3: pip install boto3", file=sys.stderr)
    sys.exit(1)


def get_iam_client(profile=None, region=None):
    session = boto3.Session(profile_name=profile, region_name=region or "us-east-1")
    return session.client("iam")


def main():
    parser = argparse.ArgumentParser(description="IAM security audit")
    parser.add_argument("--profile", help="AWS profile name")
    parser.add_argument("--region", default="us-east-1", help="AWS region")
    args = parser.parse_args()

    iam = get_iam_client(args.profile, args.region)
    report = []

    paginator = iam.get_paginator("list_users")
    for page in paginator.paginate():
        for user in page.get("Users", []):
            username = user["UserName"]
            mfa_enabled = False
            try:
                mfa_devices = iam.list_mfa_devices(UserName=username)
                mfa_enabled = bool(mfa_devices.get("MFADevices"))
            except ClientError:
                pass

            inline_count = 0
            try:
                inline = iam.list_user_policies(UserName=username)
                inline_count = len(inline.get("PolicyNames", []))
            except ClientError:
                pass

            active_keys = 0
            last_used = "Never"
            try:
                keys = iam.list_access_keys(UserName=username)
                for key in keys.get("AccessKeyMetadata", []):
                    if key.get("Status") == "Active":
                        active_keys += 1
                        try:
                            last = iam.get_access_key_last_used(AccessKeyId=key["AccessKeyId"])
                            if last.get("AccessKeyLastUsed", {}).get("LastUsedDate"):
                                last_used = last["AccessKeyLastUsed"]["LastUsedDate"].strftime("%Y-%m-%d %H:%M UTC")
                        except ClientError:
                            pass
                        break
            except ClientError:
                pass

            report.append({
                "UserName": username,
                "MFAEnabled": mfa_enabled,
                "InlinePolicyCount": inline_count,
                "ActiveAccessKeys": active_keys,
                "LastKeyUsed": last_used,
            })

    print("\n=== IAM Security Audit ===")
    no_mfa = [r for r in report if not r["MFAEnabled"]]
    if no_mfa:
        print("Users without MFA:")
        for r in no_mfa:
            print(f"  {r['UserName']} (inline policies: {r['InlinePolicyCount']}, keys: {r['ActiveAccessKeys']})")
    print("\nUsers with inline policies (consider managed policies):")
    inline = [r for r in report if r["InlinePolicyCount"] > 0]
    for r in inline:
        print(f"  {r['UserName']}: {r['InlinePolicyCount']}")
    print("\nDone.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
