# Module 5: Monitoring, Logging, and Incident Response

## Learning Objectives

By the end of this module, you will be able to:
- Implement comprehensive logging and monitoring
- Use AWS security monitoring services
- Detect and respond to security incidents
- Understand security automation and orchestration

## Estimated Time: 12-14 hours

---

## 1. AWS CloudTrail

### Enabling CloudTrail

- **Purpose:** Log API calls and account activity
- **Configuration:**
  - Create trail
  - Select regions
  - Configure S3 bucket
  - Enable log file validation

### CloudTrail Log Analysis

- **Log Format:** JSON format
- **Analysis Tools:**
  - CloudWatch Logs Insights
  - Athena queries
  - Third-party SIEM tools

### CloudTrail Insights

- **Purpose:** Automated anomaly detection
- **Features:**
  - Unusual API activity
  - API error rate increases
  - Unusual API calls

### CloudTrail Security Best Practices

1. **Enable in All Regions**
2. **Enable Log File Validation**
3. **Encrypt Log Files**
4. **Restrict S3 Bucket Access**
5. **Enable CloudWatch Logs Integration**
6. **Monitor Trail Status**

### Multi-Region CloudTrail

- **Purpose:** Centralized logging
- **Configuration:**
  - Single trail for all regions
  - Centralized S3 bucket
  - Aggregated analysis

---

## 2. Amazon CloudWatch

### CloudWatch Logs

- **Purpose:** Centralized log management
- **Features:**
  - Log groups and streams
  - Log retention
  - Log Insights queries
  - Metric filters

### CloudWatch Metrics

- **Purpose:** Monitor resource metrics
- **Features:**
  - Custom metrics
  - Metric math
  - Anomaly detection
  - Dashboards

### CloudWatch Alarms

- **Purpose:** Automated alerting
- **Configuration:**
  - Threshold-based alarms
  - Anomaly detection alarms
  - Composite alarms
  - SNS notifications

### CloudWatch Dashboards

- **Purpose:** Visualize metrics
- **Features:**
  - Custom dashboards
  - Widget types
  - Auto-refresh
  - Sharing

### Log Insights Queries

- **Purpose:** Query log data
- **Syntax:** CloudWatch Logs Insights query language
- **Use Cases:**
  - Security event analysis
  - Error investigation
  - Performance analysis

---

## 3. AWS Config

### Config Rules

- **Purpose:** Evaluate resource configurations
- **Types:**
  - Managed rules
  - Custom rules (Lambda)
  - Service-linked rules

### Configuration Compliance

- **Purpose:** Ensure compliance with policies
- **Features:**
  - Compliance dashboard
  - Compliance reports
  - Remediation actions

### Configuration History

- **Purpose:** Track configuration changes
- **Features:**
  - Configuration timeline
  - Change history
  - Configuration snapshots

### Config Aggregators

- **Purpose:** Aggregate data across accounts/regions
- **Use Cases:**
  - Multi-account compliance
  - Centralized monitoring
  - Organization-wide visibility

### Custom Config Rules

- **Purpose:** Custom compliance checks
- **Implementation:**
  - Lambda functions
  - Rule evaluation
  - Remediation actions

---

## 4. Amazon GuardDuty

### Threat Detection

- **Purpose:** Continuous security monitoring
- **Threat Types:**
  - Unauthorized API calls
  - Compromised instances
  - Malware
  - Suspicious activity

### GuardDuty Findings

- **Severity Levels:**
  - Low
  - Medium
  - High
- **Finding Types:**
  - Backdoor
  - CryptoCurrency
  - Stealth
  - UnauthorizedAPICall

### GuardDuty Integration

- **Integrations:**
  - Security Hub
  - CloudWatch Events
  - Lambda functions
  - SNS notifications

### GuardDuty Best Practices

1. **Enable in All Regions**
2. **Review Findings Regularly**
3. **Configure Automated Responses**
4. **Integrate with Security Hub**
5. **Set Up Notifications**

---

## 5. AWS Security Hub

### Security Findings Aggregation

- **Purpose:** Centralized security findings
- **Sources:**
  - GuardDuty
  - Inspector
  - Macie
  - Config
  - Custom findings

### Security Standards

- **CIS AWS Foundations Benchmark**
- **PCI-DSS**
- **AWS Foundational Security Best Practices**
- **Custom standards**

### Automated Compliance Checks

- **Purpose:** Continuous compliance monitoring
- **Features:**
  - Automated checks
  - Compliance scores
  - Remediation guidance

### Security Hub Insights

- **Purpose:** Identify security trends
- **Features:**
  - Custom insights
  - Automated insights
  - Finding aggregation

---

## 6. Amazon Inspector

### Vulnerability Assessments

- **Purpose:** Automated security assessments
- **Assessment Types:**
  - Network reachability
  - Host assessment
  - Common Vulnerabilities and Exposures (CVE)

### EC2 Instance Assessments

- **Purpose:** Assess EC2 security
- **Features:**
  - Agent-based assessment
  - Vulnerability scanning
  - Security findings

### Container Image Assessments

- **Purpose:** Scan container images
- **Features:**
  - ECR integration
  - Vulnerability detection
  - Security findings

### Inspector Findings

- **Severity Levels:**
  - Critical
  - High
  - Medium
  - Low
  - Informational

---

## 7. VPC Flow Logs

### Enabling Flow Logs

- **Purpose:** Capture IP traffic flow
- **Destinations:**
  - CloudWatch Logs
  - S3
  - Kinesis Data Firehose

### Flow Log Analysis

- **Analysis Tools:**
  - CloudWatch Logs Insights
  - Athena
  - Third-party tools

### Flow Log Formats

- **Default Format:** Standard fields
- **Custom Format:** Selected fields
- **Fields:**
  - Source/destination IPs
  - Ports
  - Protocol
  - Action (accept/reject)

---

## 8. Incident Response

### Incident Response Plan

- **Preparation:**
  - Response team
  - Procedures
  - Tools and access
  - Communication plan

- **Detection:**
  - Monitoring systems
  - Alerting
  - Threat intelligence

- **Response:**
  - Containment
  - Eradication
  - Recovery
  - Post-incident review

### AWS Security Incident Response

- **AWS Support:** Contact for security incidents
- **Documentation:** Incident response procedures
- **Tools:** AWS services for response

### Forensic Analysis

- **CloudTrail Logs:** API call analysis
- **VPC Flow Logs:** Network traffic analysis
- **CloudWatch Logs:** Application log analysis
- **S3 Access Logs:** Object access analysis

### Containment and Remediation

- **Isolation:** Isolate affected resources
- **Access Revocation:** Revoke compromised credentials
- **Resource Termination:** Terminate compromised resources
- **Patch Application:** Apply security patches

### Post-Incident Review

- **Documentation:** Document incident
- **Root Cause Analysis:** Identify root cause
- **Lessons Learned:** Identify improvements
- **Process Updates:** Update procedures

---

## 9. Security Automation

### AWS Lambda for Security Automation

- **Purpose:** Automated security responses
- **Use Cases:**
  - Automated remediation
  - Alert processing
  - Compliance checks

### EventBridge for Security Events

- **Purpose:** Event-driven security automation
- **Event Sources:**
  - GuardDuty findings
  - Config rule violations
  - Security Hub findings

### Automated Remediation

- **Purpose:** Automatic issue resolution
- **Examples:**
  - Close security groups
  - Rotate credentials
  - Terminate instances
  - Update configurations

### Security Orchestration

- **Purpose:** Coordinate security processes
- **Tools:**
  - Step Functions
  - Lambda functions
  - EventBridge
  - Systems Manager

---

## Hands-On Activities

### Activity 1: Enable and Configure CloudTrail
1. Create CloudTrail trail
2. Configure S3 bucket for logs
3. Enable log file validation
4. Test trail functionality

### Activity 2: Create CloudWatch Alarms
1. Create metric filters
2. Create CloudWatch alarms
3. Configure SNS notifications
4. Test alarm functionality

### Activity 3: Set Up AWS Config
1. Enable AWS Config
2. Configure Config rules
3. Review compliance findings
4. Set up remediation

### Activity 4: Review GuardDuty Findings
1. Enable GuardDuty
2. Review findings
3. Configure notifications
4. Set up automated responses

### Activity 5: Configure Security Hub
1. Enable Security Hub
2. Enable security standards
3. Review findings
4. Create custom insights

### Activity 6: Run Inspector Assessments
1. Enable Inspector
2. Run assessment
3. Review findings
4. Remediate issues

### Activity 7: Analyze VPC Flow Logs
1. Enable VPC Flow Logs
2. Create CloudWatch Logs Insights queries
3. Analyze traffic patterns
4. Identify anomalies

### Activity 8: Create Automated Security Responses
1. Create Lambda function for remediation
2. Configure EventBridge rules
3. Test automated response
4. Monitor effectiveness

---

## Knowledge Check

1. What is CloudTrail used for?
2. How do you analyze CloudWatch Logs?
3. What is AWS Config used for?
4. How does GuardDuty detect threats?
5. What is Security Hub used for?
6. How do you respond to security incidents?

---

## Additional Resources

- [CloudTrail Documentation](https://docs.aws.amazon.com/cloudtrail/)
- [CloudWatch Documentation](https://docs.aws.amazon.com/cloudwatch/)
- [AWS Config Documentation](https://docs.aws.amazon.com/config/)
- [GuardDuty Documentation](https://docs.aws.amazon.com/guardduty/)

---

## Next Steps

After completing this module:
1. Review your notes
2. Complete all hands-on activities
3. Take the knowledge check
4. Proceed to [Module 6: Compliance and Governance](../modules/06_Compliance_and_Governance.md)

---

**Module Completion Checklist:**
- [ ] Read all module content
- [ ] Completed Activity 1: Enable and Configure CloudTrail
- [ ] Completed Activity 2: Create CloudWatch Alarms
- [ ] Completed Activity 3: Set Up AWS Config
- [ ] Completed Activity 4: Review GuardDuty Findings
- [ ] Completed Activity 5: Configure Security Hub
- [ ] Completed Activity 6: Run Inspector Assessments
- [ ] Completed Activity 7: Analyze VPC Flow Logs
- [ ] Completed Activity 8: Create Automated Security Responses
- [ ] Reviewed additional resources
- [ ] Ready to proceed to Module 6
