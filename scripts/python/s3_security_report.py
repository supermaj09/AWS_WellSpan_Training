#!/usr/bin/env python3
"""
S3 security report: public access block, encryption, versioning.
Aligned with Module 4 (Data Protection).
Usage: python s3_security_report.py [--profile PROFILE] [--region REGION]
"""
import argparse
import sys

try:
    import boto3
    from botocore.exceptions import ClientError
except ImportError:
    print("Install boto3: pip install boto3", file=sys.stderr)
    sys.exit(1)


def get_s3_client(profile=None, region=None):
    session = boto3.Session(profile_name=profile, region_name=region or "us-east-1")
    return session.client("s3")


def main():
    parser = argparse.ArgumentParser(description="S3 security report")
    parser.add_argument("--profile", help="AWS profile name")
    parser.add_argument("--region", default="us-east-1", help="AWS region")
    args = parser.parse_args()

    s3 = get_s3_client(args.profile, args.region)
    report = []

    buckets = s3.list_buckets().get("Buckets", [])
    for b in buckets:
        name = b["Name"]
        encryption = "None"
        versioning = "Off"
        block_public = False
        try:
            enc = s3.get_bucket_encryption(Bucket=name)
            if enc.get("ServerSideEncryptionConfiguration", {}).get("Rules"):
                encryption = "Enabled"
        except ClientError as e:
            if e.response["Error"]["Code"] != "ServerSideEncryptionConfigurationNotFoundError":
                encryption = "Error"
        try:
            ver = s3.get_bucket_versioning(Bucket=name)
            if ver.get("Status") == "Enabled":
                versioning = "Enabled"
        except ClientError:
            pass
        try:
            pub = s3.get_public_access_block(Bucket=name)
            cfg = pub.get("PublicAccessBlockConfiguration", {})
            block_public = cfg.get("BlockPublicAcls", False) and cfg.get("BlockPublicPolicy", False)
        except ClientError:
            pass

        report.append({
            "BucketName": name,
            "Encryption": encryption,
            "Versioning": versioning,
            "BlockPublicAccess": block_public,
        })

    print("\n=== S3 Security Report ===")
    no_enc = [r for r in report if r["Encryption"] == "None"]
    if no_enc:
        print("Buckets without encryption:")
        for r in no_enc:
            print(f"  {r['BucketName']}")
    no_ver = [r for r in report if r["Versioning"] == "Off"]
    if no_ver:
        print("\nBuckets without versioning:")
        for r in no_ver:
            print(f"  {r['BucketName']}")
    print("\nFull report:")
    for r in report:
        print(f"  {r['BucketName']}: encryption={r['Encryption']}, versioning={r['Versioning']}, block_public={r['BlockPublicAccess']}")
    print("\nDone.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
