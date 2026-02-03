#!/usr/bin/env python3
"""
Root account security: MFA and access key check.
Aligned with Module 7 (Best Practices). Root should have MFA and no access keys.
Usage: python root_account_check.py [--profile PROFILE]
"""
import argparse
import sys

try:
    import boto3
    from botocore.exceptions import ClientError
except ImportError:
    print("Install boto3: pip install boto3", file=sys.stderr)
    sys.exit(1)


def main():
    parser = argparse.ArgumentParser(description="Root account security check")
    parser.add_argument("--profile", help="AWS profile name")
    args = parser.parse_args()

    session = boto3.Session(profile_name=args.profile)
    iam = session.client("iam")

    try:
        summary = iam.get_account_summary()
    except ClientError as e:
        print(f"Error: {e}. Need iam:GetAccountSummary.", file=sys.stderr)
        return 1

    m = summary.get("SummaryMap", {})
    root_mfa = m.get("AccountMFAEnabled", 0) == 1
    root_keys = int(m.get("AccountAccessKeysPresent", 0))

    print("\n=== Root Account Security ===")
    print(f"  Root MFA enabled: {root_mfa}")
    print(f"  Root access keys present: {root_keys}")

    if not root_mfa:
        print("  Recommendation: Enable MFA for the root account.")
    if root_keys > 0:
        print("  Recommendation: Remove root access keys; use IAM users/roles instead.")
    if root_mfa and root_keys == 0:
        print("  Root account security checks passed.")
    print("\nDone.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
