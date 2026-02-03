# AWS Security PowerShell Scripts

PowerShell scripts for AWS security operations, aligned with the [AWS Security Training Curriculum](../README.md). Use with **AWS Tools for PowerShell** (requires `AWSPowerShell` or `AWS.Tools.*` modules).

## Prerequisites

- PowerShell 7+ (or Windows PowerShell 5.1)
- [AWS Tools for PowerShell](https://docs.aws.amazon.com/powershell/latest/userguide/pstools-getting-set-up.html) installed
- AWS credentials configured (`Set-AWSCredential` or environment variables)

```powershell
# Install AWS Tools for PowerShell (modular - recommended)
Install-Module -Name AWS.Tools.Common, AWS.Tools.IdentityManagement, AWS.Tools.S3, AWS.Tools.CloudTrail, AWS.Tools.GuardDuty -Scope CurrentUser -Force
```

## Scripts Overview

| Script | Description | Curriculum Module |
|--------|-------------|-------------------|
| [Get-IAMSecurityAudit.ps1](Get-IAMSecurityAudit.ps1) | IAM users without MFA, unused credentials, inline policies | Module 2: IAM |
| [Get-S3SecurityReport.ps1](Get-S3SecurityReport.ps1) | S3 buckets: public access, encryption, versioning | Module 4: Data Protection |
| [Get-SecurityMonitoringStatus.ps1](Get-SecurityMonitoringStatus.ps1) | CloudTrail, GuardDuty, Security Hub status | Module 5: Monitoring |
| [Enable-CloudTrailMultiRegion.ps1](Enable-CloudTrailMultiRegion.ps1) | Enable or verify CloudTrail in all regions | Module 5: Monitoring |
| [Get-RootAccountSecurity.ps1](Get-RootAccountSecurity.ps1) | Root account MFA and access key check | Module 7: Best Practices |

## Usage

```powershell
# Set profile or credentials
Set-AWSCredential -ProfileName your-profile
# Or: $env:AWS_PROFILE = "your-profile"

# Run from this directory
.\Get-IAMSecurityAudit.ps1
.\Get-S3SecurityReport.ps1 -Region us-east-1
.\Get-SecurityMonitoringStatus.ps1 -AllRegions
```

## Safety

- Scripts are **read-only** by default (reports and status checks).
- Scripts that make changes (e.g. `Enable-CloudTrailMultiRegion.ps1`) support `-WhatIf`.
- Test in a non-production account first.

## License

Educational use within WellSpan. Follow AWS Terms of Service and organizational policies.
