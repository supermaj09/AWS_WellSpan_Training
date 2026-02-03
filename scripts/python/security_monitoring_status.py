#!/usr/bin/env python3
"""
Security monitoring status: CloudTrail, GuardDuty per region.
Aligned with Module 5 (Monitoring).
Usage: python security_monitoring_status.py [--profile PROFILE] [--region REGION] [--all-regions]
"""
import argparse
import sys

try:
    import boto3
    from botocore.exceptions import ClientError
except ImportError:
    print("Install boto3: pip install boto3", file=sys.stderr)
    sys.exit(1)

# Common regions to check (subset; use --all-regions for more)
DEFAULT_REGIONS = [
    "us-east-1", "us-east-2", "us-west-1", "us-west-2",
    "eu-west-1", "eu-central-1", "ap-southeast-1", "ap-northeast-1",
]


def check_cloudtrail(session, region):
    try:
        ct = session.client("cloudtrail", region_name=region)
        trails = ct.describe_trails()
        return len(trails.get("trailList", [])) > 0
    except ClientError:
        return False


def check_guardduty(session, region):
    try:
        gd = session.client("guardduty", region_name=region)
        detectors = gd.list_detectors()
        return len(detectors.get("DetectorIds", [])) > 0
    except ClientError:
        return False


def main():
    parser = argparse.ArgumentParser(description="Security monitoring status")
    parser.add_argument("--profile", help="AWS profile name")
    parser.add_argument("--region", help="Single region (default: us-east-1)")
    parser.add_argument("--all-regions", action="store_true", help="Check multiple regions")
    args = parser.parse_args()

    session = boto3.Session(profile_name=args.profile)
    regions = [args.region or "us-east-1"] if not args.all_regions else DEFAULT_REGIONS

    print("\n=== Security Monitoring Status ===")
    for r in regions:
        try:
            cloudtrail = check_cloudtrail(session, r)
            guardduty = check_guardduty(session, r)
            print(f"  {r}: CloudTrail={cloudtrail}, GuardDuty={guardduty}")
        except Exception as e:
            print(f"  {r}: Error - {e}")
    print("\nDone.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
