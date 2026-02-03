# Troubleshooting AWS Security Issues

This guide gives a structured approach to diagnosing and resolving common AWS security findings and access issues. It aligns with the [AWS Security Training Curriculum](README.md) and the scripts in this repo.

---

## General approach

1. **Identify** – What is the finding or symptom? (alert, Config rule failure, access denied, etc.)
2. **Locate** – Which service, resource, account, and region?
3. **Confirm** – Use CloudTrail, Config, or the finding console to verify current state and cause.
4. **Remediate** – Apply the recommended fix (policy, configuration, or containment).
5. **Verify** – Re-run checks or wait for the next evaluation; document the resolution.

---

## By category

### IAM and access

**Symptom:** Access denied, or finding “user/role has excessive permissions” or “no MFA.”

- **CloudTrail:** Event history → filter by `AccessDenied` or the user/role. Check `errorCode` and `requestParameters` to see which action and resource failed.
- **IAM Console:** Users → Permissions (managed + inline), MFA, access keys. Use **Access Analyzer** for unused permissions and external access.
- **Tools:** [IAM Policy Simulator](https://policysim.aws.amazon.com/) to test “would this call succeed?” for a given user/role.
- **Scripts:** Run `scripts/python/iam_security_audit.py` or `scripts/powershell/Get-IAMSecurityAudit.ps1` to list users without MFA and with inline policies.

**Common fixes:** Add the missing permission to the role/user policy (principle of least privilege); enable MFA; remove unused keys; replace inline policies with managed policies.

---

### S3 and data protection

**Symptom:** “Bucket is public,” “encryption not enabled,” or “versioning disabled.”

- **S3 Console:** Bucket → **Permissions** (Block Public Access, bucket policy), **Properties** (default encryption, versioning).
- **Scripts:** `scripts/python/s3_security_report.py` or `scripts/powershell/Get-S3SecurityReport.ps1` for a quick report across buckets.

**Common fixes:** Enable “Block all public access”; set default encryption (SSE-S3 or SSE-KMS); enable versioning; fix bucket policy so it doesn’t grant `s3:GetObject` to `*` or public principals.

---

### Monitoring and logging

**Symptom:** “No trail in region,” “GuardDuty not enabled,” or “can’t find who made a change.”

- **CloudTrail:** Trails per region; ensure at least one trail exists and logs to an S3 bucket (and optionally CloudWatch Logs). Check **Event history** for the region.
- **GuardDuty:** Detector per region; ensure it’s enabled and findings are reviewed in Security Hub if you use it.
- **Scripts:** `scripts/python/security_monitoring_status.py` or `scripts/powershell/Get-SecurityMonitoringStatus.ps1` to see CloudTrail/GuardDuty status by region.

**Common fixes:** Create a trail in the missing region; enable GuardDuty; ensure the trail and log bucket have correct permissions and retention.

---

### GuardDuty and Security Hub findings

**Symptom:** A finding appears in GuardDuty or Security Hub (e.g. suspicious API call, compromised resource).

- **Console:** Open the finding → read **Description**, **Remediation**, and **Affected resources**. Note severity and resource IDs.
- **Correlation:** Use CloudTrail and VPC Flow Logs (if applicable) for the same time window and resource to see the full activity.
- **Actions:** Follow AWS remediation (e.g. rotate credentials, isolate instance, revoke keys). Contain first if the resource may be compromised, then fix root cause.

---

### AWS Config and compliance

**Symptom:** A Config rule is non-compliant or a compliance dashboard shows failures.

- **Config Console:** Rules → select the rule → see non-compliant resources and the reason. Resources → select resource → see configuration and history.
- **Remediation:** Either change the resource to match the rule (e.g. enable encryption, restrict ports) or document an approved exception and adjust the rule/scope if your process allows.

---

### Root account and account security

**Symptom:** “Root has no MFA” or “root has access keys.”

- **Scripts:** `scripts/python/root_account_check.py` or `scripts/powershell/Get-RootAccountSecurity.ps1`.
- **Console:** Sign in as root only when necessary → Security credentials → MFA and access keys. Prefer IAM users and roles for day-to-day use; do not use root access keys.

---

## When to escalate

- **High/critical severity** or suspected compromise (e.g. GuardDuty “backdoor” or credential abuse).
- **Cross-account or organization** changes (e.g. SCPs, cross-account roles).
- **Unclear remediation** or need for exception/risk acceptance.
- **Repeated failures** after remediation (possible misconfiguration or tool issue).

Document the finding, actions taken, and outcome; then involve your security or cloud team and use AWS Support or [AWS re:Post Security](https://repost.aws/topics/security) as needed.

---

## Quick reference: repo scripts

| Goal | Python | PowerShell |
|-----|--------|------------|
| IAM (MFA, inline policies, keys) | `scripts/python/iam_security_audit.py` | `scripts/powershell/Get-IAMSecurityAudit.ps1` |
| S3 (encryption, versioning, public) | `scripts/python/s3_security_report.py` | `scripts/powershell/Get-S3SecurityReport.ps1` |
| CloudTrail/GuardDuty status | `scripts/python/security_monitoring_status.py` | `scripts/powershell/Get-SecurityMonitoringStatus.ps1` |
| Root MFA and keys | `scripts/python/root_account_check.py` | `scripts/powershell/Get-RootAccountSecurity.ps1` |

See [scripts/README.md](scripts/README.md) for prerequisites and usage.
