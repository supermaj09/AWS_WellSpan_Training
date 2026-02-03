# Module 6: Compliance and Governance

## Learning Objectives

By the end of this module, you will be able to:
- Understand compliance frameworks (HIPAA, PCI-DSS, SOC 2, etc.)
- Implement governance controls
- Use AWS compliance services
- Understand audit and compliance reporting

## Estimated Time: 8-10 hours

---

## 1. Compliance Frameworks

### HIPAA (Healthcare)

- **Purpose:** Healthcare data protection
- **Requirements:**
  - Administrative safeguards
  - Physical safeguards
  - Technical safeguards
  - Business Associate Agreement (BAA)

**AWS HIPAA Compliance:**
- AWS services eligible for HIPAA
- BAA required
- Encryption requirements
- Access controls

### PCI-DSS (Payment Card Industry)

- **Purpose:** Payment card data security
- **Requirements:**
  - Build and maintain secure networks
  - Protect cardholder data
  - Maintain vulnerability management
  - Implement strong access controls

**AWS PCI-DSS Compliance:**
- PCI-DSS Level 1 certified
- Shared responsibility model
- Compliance documentation

### SOC 2 (Service Organization Control)

- **Purpose:** Security, availability, processing integrity
- **Trust Service Criteria:**
  - Security
  - Availability
  - Processing integrity
  - Confidentiality
  - Privacy

**AWS SOC 2 Compliance:**
- SOC 2 Type II reports
- Available via AWS Artifact

### GDPR (General Data Protection Regulation)

- **Purpose:** EU data protection regulation
- **Requirements:**
  - Data subject rights
  - Data protection by design
  - Data breach notification
  - Data processing agreements

**AWS GDPR Compliance:**
- GDPR-ready services
- Data processing addendum
- Data residency options

### FedRAMP (Federal Risk and Authorization Management Program)

- **Purpose:** US government cloud security
- **Authorization Levels:**
  - FedRAMP Moderate
  - FedRAMP High
  - FedRAMP High + IL5/IL6

**AWS FedRAMP Compliance:**
- FedRAMP authorized services
- Government cloud regions

### NIST Cybersecurity Framework

- **Purpose:** Cybersecurity risk management
- **Framework Functions:**
  - Identify
  - Protect
  - Detect
  - Respond
  - Recover

**AWS NIST Alignment:**
- NIST 800-53 controls
- Framework mapping
- Compliance tools

---

## 2. AWS Compliance Programs

### AWS Artifact

- **Purpose:** Access compliance reports
- **Available Reports:**
  - SOC reports
  - PCI-DSS reports
  - ISO certifications
  - Other compliance reports

### Compliance Certifications

- **ISO 27001:** Information security management
- **ISO 27017:** Cloud security
- **ISO 27018:** Cloud privacy
- **CSA STAR:** Cloud Security Alliance

### Compliance Reports

- **Purpose:** Demonstrate compliance
- **Types:**
  - Audit reports
  - Certifications
  - Attestations
  - Compliance documentation

### AWS Compliance Resources

- **Compliance Programs:** List of compliance programs
- **Compliance Documentation:** Detailed guides
- **Compliance Tools:** AWS services for compliance

---

## 3. Governance with AWS Organizations

### Service Control Policies (SCPs)

- **Purpose:** Centralized permission management
- **Features:**
  - Applied at OU or account level
  - Cannot grant permissions
  - Deny or allow actions
  - Inheritance

**SCP Examples:**
- Prevent root account usage
- Require MFA
- Restrict regions
- Enforce encryption

### Account Management

- **Account Structure:**
  - Management account
  - Member accounts
  - Organizational units (OUs)

- **Best Practices:**
  - Separate accounts per environment
  - Use OUs for grouping
  - Implement account baselines

### Consolidated Billing

- **Purpose:** Single bill for all accounts
- **Features:**
  - Volume discounts
  - Reserved instance sharing
  - Cost allocation tags

### Tag Policies

- **Purpose:** Enforce tagging standards
- **Features:**
  - Required tags
  - Tag value formats
  - Automatic enforcement

### Backup Policies

- **Purpose:** Centralized backup management
- **Features:**
  - Backup plans
  - Backup rules
  - Cross-account backup

---

## 4. AWS Control Tower

### Landing Zone Setup

- **Purpose:** Multi-account AWS environment
- **Components:**
  - Management account
  - Log archive account
  - Audit account
  - Member accounts

### Guardrails

- **Purpose:** Governance rules
- **Types:**
  - Preventive guardrails
  - Detective guardrails
- **Examples:**
  - Disallow public S3 buckets
  - Require encryption
  - Enforce MFA

### Account Factory

- **Purpose:** Automated account provisioning
- **Features:**
  - Standardized account setup
  - Baseline configurations
  - Automated guardrail application

### Compliance Monitoring

- **Purpose:** Monitor compliance status
- **Features:**
  - Compliance dashboard
  - Guardrail compliance
  - Account compliance status

---

## 5. AWS Audit Manager

### Audit Framework Mapping

- **Purpose:** Map controls to frameworks
- **Supported Frameworks:**
  - AWS Control Tower
  - AWS Well-Architected Framework
  - Custom frameworks

### Evidence Collection

- **Purpose:** Collect compliance evidence
- **Sources:**
  - CloudTrail logs
  - Config snapshots
  - Security Hub findings
  - Custom evidence

### Compliance Reports

- **Purpose:** Generate compliance reports
- **Features:**
  - Automated report generation
  - Framework-specific reports
  - Evidence attachments

### Audit Automation

- **Purpose:** Automate audit processes
- **Features:**
  - Continuous evidence collection
  - Automated assessments
  - Report generation

---

## 6. Data Privacy

### Data Residency Requirements

- **Purpose:** Meet data location requirements
- **Implementation:**
  - Select appropriate regions
  - Configure data replication
  - Document data locations

### Data Processing Agreements

- **Purpose:** Define data processing terms
- **AWS DPA:** AWS Data Processing Addendum
- **Requirements:**
  - Data controller responsibilities
  - Data processor responsibilities
  - Data subject rights

### Privacy by Design

- **Purpose:** Build privacy into systems
- **Principles:**
  - Data minimization
  - Purpose limitation
  - Storage limitation
  - Transparency

### Data Subject Rights

- **Right to Access:** Access personal data
- **Right to Rectification:** Correct personal data
- **Right to Erasure:** Delete personal data
- **Right to Portability:** Export personal data

---

## 7. Compliance Monitoring

### Continuous Compliance

- **Purpose:** Maintain compliance continuously
- **Tools:**
  - AWS Config
  - Security Hub
  - Audit Manager
  - Custom monitoring

### Compliance Dashboards

- **Purpose:** Visualize compliance status
- **Components:**
  - Compliance scores
  - Control status
  - Findings
  - Trends

### Compliance Reporting

- **Purpose:** Generate compliance reports
- **Types:**
  - Executive reports
  - Technical reports
  - Audit reports
  - Regulatory reports

### Remediation Workflows

- **Purpose:** Fix compliance issues
- **Process:**
  1. Identify non-compliance
  2. Assess risk
  3. Remediate
  4. Verify compliance

---

## Hands-On Activities

### Activity 1: Access AWS Artifact
1. Navigate to AWS Artifact
2. Review available reports
3. Download compliance reports
4. Understand report contents

### Activity 2: Review Compliance Reports
1. Review SOC 2 report
2. Review PCI-DSS report
3. Understand compliance requirements
4. Document findings

### Activity 3: Set Up AWS Organizations
1. Create AWS Organizations
2. Create organizational units
3. Create member accounts
4. Configure account structure

### Activity 4: Configure Service Control Policies
1. Create SCPs
2. Attach SCPs to OUs
3. Test SCP enforcement
4. Verify restrictions

### Activity 5: Use AWS Control Tower
1. Set up Control Tower
2. Configure guardrails
3. Provision accounts
4. Monitor compliance

### Activity 6: Set Up AWS Audit Manager
1. Enable Audit Manager
2. Create audit framework
3. Configure evidence collection
4. Generate compliance reports

### Activity 7: Create Compliance Dashboards
1. Create compliance dashboard
2. Add compliance metrics
3. Configure alerts
4. Monitor compliance status

---

## Knowledge Check

1. What is HIPAA and how does AWS support it?
2. What is PCI-DSS compliance?
3. How do Service Control Policies work?
4. What is AWS Control Tower used for?
5. How does AWS Audit Manager help with compliance?
6. What are data privacy requirements?

---

## Additional Resources

- [AWS Compliance Programs](https://aws.amazon.com/compliance/programs/)
- [AWS Artifact](https://aws.amazon.com/artifact/)
- [AWS Organizations](https://docs.aws.amazon.com/organizations/)
- [AWS Control Tower](https://docs.aws.amazon.com/controltower/)

---

## Next Steps

After completing this module:
1. Review your notes
2. Complete all hands-on activities
3. Take the knowledge check
4. Proceed to [Module 7: Security Best Practices and Hardening](../modules/07_Security_Best_Practices_Hardening.md)

---

**Module Completion Checklist:**
- [ ] Read all module content
- [ ] Completed Activity 1: Access AWS Artifact
- [ ] Completed Activity 2: Review Compliance Reports
- [ ] Completed Activity 3: Set Up AWS Organizations
- [ ] Completed Activity 4: Configure Service Control Policies
- [ ] Completed Activity 5: Use AWS Control Tower
- [ ] Completed Activity 6: Set Up AWS Audit Manager
- [ ] Completed Activity 7: Create Compliance Dashboards
- [ ] Reviewed additional resources
- [ ] Ready to proceed to Module 7
