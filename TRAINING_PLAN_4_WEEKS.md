# 4-Week AWS Security Training Plan

A **month-long plan** for [AWS_WellSpan_Training](https://github.com/supermaj09/AWS_WellSpan_Training) for learners with **2–4 hours per week**. Each week includes reading, a hands-on assignment or lab, and optional stretch activities.

**Total time:** 8–16 hours over 4 weeks  
**Prerequisites:** AWS account (or sandbox), basic familiarity with the AWS Console.  
**Repo:** [github.com/supermaj09/AWS_WellSpan_Training](https://github.com/supermaj09/AWS_WellSpan_Training/tree/main)

---

## Week 1 – Fundamentals & IAM (2–4 hours)

### Goals
- Understand the AWS Shared Responsibility Model and main security services.
- Learn IAM basics: users, roles, MFA, least privilege.
- Run your first security check with repo scripts.

### Reading (≈1–1.5 hours)
- [README – Module 1: AWS Security Fundamentals](README.md#module-1-aws-security-fundamentals) (Shared Responsibility, security architecture, threat overview).
- [modules/01_AWS_Security_Fundamentals.md](modules/01_AWS_Security_Fundamentals.md) – full module if you have time.
- [README – Module 2: IAM](README.md#module-2-identity-and-access-management-iam) (users, roles, MFA, policies).

### Assignment / Lab (≈1–2 hours)
1. **Console:** In IAM, review one IAM user and one role. Note attached policies and whether MFA is enabled.
2. **Script:** Run an IAM security audit using this repo:
   - **Python:** `pip install -r scripts/python/requirements.txt` then  
     `python scripts/python/iam_security_audit.py` (use `--profile` if needed).
   - **PowerShell:** See [scripts/powershell/README.md](scripts/powershell/README.md) for setup, then run  
     `.\scripts\powershell\Get-IAMSecurityAudit.ps1`.
3. **Deliverable:** Note 2–3 findings (e.g. users without MFA, inline policies). No write-up required unless your team asks for it.

### Optional (if you have 4 hours)
- Skim [modules/02_Identity_and_Access_Management.md](modules/02_Identity_and_Access_Management.md).
- Try the [IAM Policy Simulator](https://policysim.aws.amazon.com/) for one action (e.g. `s3:GetObject`).

---

## Week 2 – Network Security & Data Protection (2–4 hours)

### Goals
- Understand VPC security (security groups, subnets) and S3 security (encryption, public access).
- Run S3 and (optional) root-account checks from the repo.

### Reading (≈1–1.5 hours)
- [README – Module 3: Network Security](README.md#module-3-network-security) (VPC, security groups, WAF, flow logs).
- [README – Module 4: Data Protection](README.md#module-4-data-protection) (encryption, KMS, S3 security).

### Assignment / Lab (≈1–2 hours)
1. **Console:** In VPC, open one security group and note inbound/outbound rules. In S3, open one bucket and check **Permissions** (Block Public Access) and **Properties** (encryption, versioning).
2. **Script:** Run the S3 security report:
   - **Python:** `python scripts/python/s3_security_report.py` (use `--region` / `--profile` if needed).
   - **PowerShell:** `.\scripts\powershell\Get-S3SecurityReport.ps1 -Region <your-region>`.
3. **Optional:** Run root account check:  
   `python scripts/python/root_account_check.py` or `.\scripts\powershell\Get-RootAccountSecurity.ps1`.
4. **Deliverable:** List 2–3 S3 or network observations (e.g. bucket without encryption, open security group rule).

### Optional (if you have 4 hours)
- Read [modules/04_Data_Protection.md](modules/04_Data_Protection.md) sections on S3 and KMS.
- Enable default encryption on one non-production S3 bucket.

---

## Week 3 – Monitoring & Logging (2–4 hours)

### Goals
- Understand CloudTrail, GuardDuty, and Security Hub.
- Verify monitoring coverage in at least one region and run the repo monitoring script.

### Reading (≈1–1.5 hours)
- [README – Module 5: Monitoring, Logging, and Incident Response](README.md#module-5-monitoring-logging-and-incident-response).
- [modules/05_Monitoring_Logging_Incident_Response.md](modules/05_Monitoring_Logging_Incident_Response.md) – at least CloudTrail and GuardDuty.

### Assignment / Lab (≈1–2 hours)
1. **Console:** In CloudTrail, confirm at least one trail exists in your primary region and that it logs to S3. In GuardDuty, confirm the detector is enabled in that region.
2. **Script:** Run the monitoring status script:
   - **Python:** `python scripts/python/security_monitoring_status.py --region us-east-1`  
     or `python scripts/python/security_monitoring_status.py --all-regions` for a broader check.
   - **PowerShell:** `.\scripts\powershell\Get-SecurityMonitoringStatus.ps1` or with `-AllRegions`.
3. **Console:** Open Security Hub (if enabled) or GuardDuty Findings. Review one finding and its remediation steps.
4. **Deliverable:** One-paragraph summary: “In region X, CloudTrail is [enabled/not], GuardDuty is [enabled/not]. One finding I reviewed was … and the recommended action is ….”

### Optional (if you have 4 hours)
- Use CloudTrail Event history to find one API call (e.g. by your user) and note event name and resource.
- Read [TROUBLESHOOTING.md](TROUBLESHOOTING.md) “Monitoring and logging” and “GuardDuty and Security Hub findings.”

---

## Week 4 – Best Practices, One Lab & Troubleshooting (2–4 hours)

### Goals
- Apply security best practices and hardening concepts.
- Complete one hands-on lab from Module 8 (IAM audit or data protection).
- Use the troubleshooting guide so you can respond to common security issues.

### Reading (≈1 hour)
- [README – Module 7: Security Best Practices and Hardening](README.md#module-7-security-best-practices-and-hardening).
- [TROUBLESHOOTING.md](TROUBLESHOOTING.md) – full read (identify → locate → confirm → remediate → verify).

### Assignment / Lab (≈1–2.5 hours)
1. **Pick one lab** from [README – Module 8: Hands-On Labs](README.md#module-8-hands-on-labs-and-projects):
   - **Option A – Lab 2 (IAM):** Use IAM Access Analyzer in the console, review one policy for least privilege, and run `scripts/python/iam_security_audit.py` or `Get-IAMSecurityAudit.ps1` again. Document one change you would make (e.g. remove unused permission, add MFA).
   - **Option B – Lab 5 (Data Protection):** Enable default encryption on one S3 bucket and run `scripts/python/s3_security_report.py` or `Get-S3SecurityReport.ps1` before/after. Document what changed.
2. **Troubleshooting practice:** In [TROUBLESHOOTING.md](TROUBLESHOOTING.md), pick one “Common issue area” (e.g. Access denied, S3 public, Config rule failure). Write 3–5 bullet steps you would take to diagnose and fix it (no need to perform in production).
3. **Deliverable:** (1) Brief notes on the lab you did and the one change or before/after. (2) Your 3–5 troubleshooting steps for the chosen scenario.

### Optional (if you have 4 hours)
- Skim [README – Module 9: AWS Security Certifications](README.md#module-9-aws-security-certifications) and note one resource (e.g. exam guide, practice exam) for later.
- Run all repo scripts once and keep a short “security snapshot” (IAM, S3, monitoring, root) for your account or sandbox.

---

## Summary Checklist

| Week | Focus | Reading | Assignment / Lab |
|------|--------|--------|-------------------|
| 1 | Fundamentals + IAM | Module 1 & 2 (README + optional module doc) | IAM console review + run IAM audit script |
| 2 | Network + Data | Module 3 & 4 (README) | VPC/S3 console + run S3 report (and optional root check) |
| 3 | Monitoring | Module 5 (README + module doc) | CloudTrail/GuardDuty check + run monitoring script + one finding |
| 4 | Best practices + lab + troubleshooting | Module 7, full TROUBLESHOOTING | One Module 8 lab (IAM or Data) + troubleshooting steps |

---

## Tips

- **2 hours/week:** Do the Reading and the core Assignment; skip or shorten Optional.
- **4 hours/week:** Add Optional activities and a short deliverable (notes or paragraph).
- **Repo links:** All paths are relative to the repo root; clone or open the repo so you can open `modules/`, `scripts/`, and `TROUBLESHOOTING.md` directly.
- **Credentials:** Use a sandbox or non-production account for labs. Set `AWS_PROFILE` or use `--profile` in scripts if you have multiple accounts.
- **Next steps:** After 4 weeks, continue with [Module 6: Compliance](README.md#module-6-compliance-and-governance), more Module 8 labs, and [Module 9: Certifications](README.md#module-9-aws-security-certifications) when you’re ready.

---

**Last updated:** February 2026  
**Repo:** [supermaj09/AWS_WellSpan_Training](https://github.com/supermaj09/AWS_WellSpan_Training)
