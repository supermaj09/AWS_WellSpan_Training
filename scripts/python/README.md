# AWS Security Python Scripts

Basic Python scripts for AWS security best practices, aligned with the [AWS Security Training Curriculum](https://github.com/supermaj09/AWS_WellSpan_Training). Uses **boto3** and read-only APIs where possible.

## Prerequisites

- Python 3.7+
- AWS credentials configured (profile, env vars, or instance role)

```bash
pip install -r requirements.txt
```

## Scripts Overview

| Script | Description | Curriculum Module |
|--------|-------------|-------------------|
| [iam_security_audit.py](iam_security_audit.py) | IAM users without MFA, inline policies, access keys | Module 2: IAM |
| [s3_security_report.py](s3_security_report.py) | S3 encryption, versioning, public access block | Module 4: Data Protection |
| [security_monitoring_status.py](security_monitoring_status.py) | CloudTrail, GuardDuty status by region | Module 5: Monitoring |
| [root_account_check.py](root_account_check.py) | Root MFA and access key check | Module 7: Best Practices |

## Usage

```bash
# Use default profile / region
python iam_security_audit.py
python s3_security_report.py --region us-east-1
python security_monitoring_status.py --all-regions
python root_account_check.py

# With profile
python iam_security_audit.py --profile my-aws-profile
```

Or with environment:

```bash
export AWS_PROFILE=my-aws-profile
export AWS_DEFAULT_REGION=us-east-1
python iam_security_audit.py
```

## Safety

- Scripts are **read-only** (reports and status checks only).
- Test in a non-production account first.
- Ensure IAM permissions follow least privilege for the role/user running these scripts.

## License

Educational use within WellSpan. Follow AWS Terms of Service and organizational policies.
