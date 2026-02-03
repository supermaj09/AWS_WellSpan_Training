# Module 8: Hands-On Labs and Projects

## Overview

This module provides comprehensive hands-on labs to reinforce the concepts learned in previous modules. Each lab builds practical skills and real-world experience with AWS security services.

---

## Lab 1: Secure Multi-Tier Web Application

### Objective
Build a secure, production-ready web application on AWS with comprehensive security controls.

### Estimated Time: 4-6 hours

### Prerequisites
- AWS account with appropriate permissions
- Basic understanding of VPC, EC2, RDS, and S3
- Completion of Modules 1-4

### Tasks

#### 1. Create VPC with Public and Private Subnets
- Create VPC with CIDR block 10.0.0.0/16
- Create public subnets in 2 Availability Zones
- Create private subnets in 2 Availability Zones
- Create Internet Gateway and attach to VPC
- Create NAT Gateways in public subnets
- Configure route tables for public and private subnets

#### 2. Deploy Web Servers in Public Subnets
- Create security group for web servers
- Launch EC2 instances in public subnets
- Configure Application Load Balancer
- Set up Auto Scaling Group
- Enable health checks

#### 3. Deploy Database in Private Subnet
- Create security group for database
- Launch RDS instance in private subnet
- Enable encryption at rest
- Configure automated backups
- Set up Multi-AZ deployment

#### 4. Implement Security Groups and NACLs
- Configure security group rules (least privilege)
- Set up Network ACLs for additional protection
- Test connectivity
- Verify security rules

#### 5. Enable Encryption at Rest and in Transit
- Encrypt RDS database
- Encrypt EBS volumes
- Enable SSL/TLS for database connections
- Configure HTTPS for application

#### 6. Configure CloudTrail and CloudWatch
- Enable CloudTrail in all regions
- Create CloudWatch log groups
- Set up CloudWatch alarms
- Configure SNS notifications

#### 7. Set Up WAF Rules
- Create WAF Web ACL
- Configure managed rule sets
- Create custom rules
- Associate with Application Load Balancer

#### 8. Implement Backup and Disaster Recovery
- Configure RDS automated backups
- Set up S3 backup bucket
- Enable S3 versioning
- Configure cross-region replication

### Deliverables
- Architecture diagram
- Security configuration documentation
- Testing results
- Lessons learned

---

## Lab 2: IAM Security Audit and Remediation

### Objective
Audit IAM permissions and implement least privilege access.

### Estimated Time: 3-4 hours

### Prerequisites
- AWS account with IAM permissions
- Completion of Module 2

### Tasks

#### 1. Use IAM Access Analyzer
- Enable IAM Access Analyzer
- Create access analyzer
- Review findings for unused permissions
- Identify external access

#### 2. Review IAM Policies
- Review all IAM policies
- Identify overly permissive policies
- Check for wildcard permissions
- Review resource-specific policies

#### 3. Implement Permissions Boundaries
- Create permissions boundaries
- Apply to IAM users/roles
- Test permission restrictions
- Verify least privilege

#### 4. Set Up MFA for All Users
- Enable MFA for IAM users
- Configure virtual MFA devices
- Test MFA-protected access
- Document MFA setup

#### 5. Configure IAM Roles for Applications
- Create IAM roles for EC2
- Create IAM roles for Lambda
- Attach appropriate policies
- Test role assumption

#### 6. Create IAM Policy Documents
- Write custom IAM policies
- Use IAM Policy Simulator
- Test policy effects
- Apply best practices

### Deliverables
- IAM audit report
- Remediation plan
- Updated IAM policies
- Security improvements documentation

---

## Lab 3: Security Monitoring and Incident Response

### Objective
Set up comprehensive security monitoring and incident response capabilities.

### Estimated Time: 4-5 hours

### Prerequisites
- AWS account with security service permissions
- Completion of Module 5

### Tasks

#### 1. Enable CloudTrail in All Regions
- Create CloudTrail trail
- Enable in all regions
- Configure S3 bucket for logs
- Enable log file validation

#### 2. Configure GuardDuty
- Enable GuardDuty in all regions
- Review GuardDuty findings
- Configure SNS notifications
- Set up automated responses

#### 3. Set Up Security Hub
- Enable Security Hub
- Enable security standards
- Review findings
- Create custom insights

#### 4. Create CloudWatch Alarms
- Create alarms for security events
- Configure SNS topics
- Set up email notifications
- Test alarm functionality

#### 5. Configure Automated Responses
- Create Lambda functions for remediation
- Configure EventBridge rules
- Set up automated responses
- Test automation

#### 6. Simulate and Respond to Security Incident
- Simulate security incident
- Follow incident response procedures
- Contain and remediate
- Document incident response

### Deliverables
- Monitoring configuration
- Incident response plan
- Automated response documentation
- Incident simulation report

---

## Lab 4: Compliance Assessment

### Objective
Assess and improve compliance posture using AWS compliance services.

### Estimated Time: 3-4 hours

### Prerequisites
- AWS account with compliance service permissions
- Completion of Module 6

### Tasks

#### 1. Enable AWS Config
- Enable AWS Config
- Configure Config rules
- Set up Config aggregator
- Review compliance status

#### 2. Configure Config Rules for Compliance
- Enable managed Config rules
- Create custom Config rules
- Configure remediation actions
- Review rule compliance

#### 3. Set Up AWS Audit Manager
- Enable Audit Manager
- Create audit framework
- Configure evidence collection
- Set up assessments

#### 4. Review Compliance Findings
- Review Config compliance findings
- Review Audit Manager findings
- Identify non-compliance
- Prioritize remediation

#### 5. Implement Remediation
- Fix compliance issues
- Verify remediation
- Re-run assessments
- Document changes

#### 6. Generate Compliance Reports
- Generate Config compliance reports
- Generate Audit Manager reports
- Create executive summary
- Document compliance status

### Deliverables
- Compliance assessment report
- Remediation plan
- Compliance dashboard
- Executive summary

---

## Lab 5: Data Protection Implementation

### Objective
Implement comprehensive data protection using AWS encryption and data management services.

### Estimated Time: 3-4 hours

### Prerequisites
- AWS account with KMS and storage permissions
- Completion of Module 4

### Tasks

#### 1. Create and Manage KMS Keys
- Create customer managed KMS key
- Configure key policy
- Enable automatic key rotation
- Test key usage

#### 2. Encrypt S3 Buckets and Objects
- Create S3 bucket
- Enable encryption (SSE-KMS)
- Configure bucket policy
- Test encryption

#### 3. Encrypt RDS Databases
- Create RDS instance with encryption
- Configure SSL connections
- Test encrypted connections
- Verify encryption status

#### 4. Configure S3 Lifecycle Policies
- Create lifecycle policy
- Configure transitions
- Set expiration rules
- Monitor transitions

#### 5. Set Up Cross-Region Replication
- Enable S3 cross-region replication
- Configure replication rules
- Test replication
- Verify encryption

#### 6. Implement Data Classification
- Classify data by sensitivity
- Apply appropriate encryption
- Configure access controls
- Document classification scheme

### Deliverables
- Encryption implementation documentation
- Data classification scheme
- Lifecycle policy configuration
- Testing results

---

## Capstone Project: End-to-End Security Implementation

### Objective
Design and implement a complete security solution for a hypothetical organization.

### Estimated Time: 8-12 hours

### Prerequisites
- Completion of all previous modules
- Completion of all labs
- Comprehensive understanding of AWS security

### Requirements

#### 1. Multi-Account AWS Organizations Setup
- Create AWS Organizations structure
- Set up management account
- Create member accounts
- Configure organizational units

#### 2. Complete IAM Structure with Least Privilege
- Design IAM structure
- Create users, groups, and roles
- Implement least privilege
- Enable MFA
- Configure permissions boundaries

#### 3. Secure Network Architecture
- Design VPC architecture
- Implement network segmentation
- Configure security groups and NACLs
- Set up VPC endpoints
- Enable VPC Flow Logs

#### 4. Data Encryption Everywhere
- Encrypt all data at rest
- Encrypt all data in transit
- Implement KMS key management
- Configure encryption for all services

#### 5. Comprehensive Monitoring and Logging
- Enable CloudTrail
- Configure CloudWatch
- Set up GuardDuty
- Enable Security Hub
- Configure AWS Config

#### 6. Compliance Framework Implementation
- Enable compliance standards
- Configure Config rules
- Set up Audit Manager
- Generate compliance reports

#### 7. Incident Response Procedures
- Create incident response plan
- Set up automated responses
- Configure alerting
- Document procedures

#### 8. Documentation and Runbooks
- Architecture documentation
- Security configuration documentation
- Operational runbooks
- Compliance documentation

### Deliverables
- Complete architecture design
- Implementation documentation
- Security configuration
- Compliance reports
- Incident response plan
- Operational runbooks
- Presentation of solution

### Evaluation Criteria
- Security best practices implementation
- Completeness of solution
- Documentation quality
- Compliance coverage
- Practical applicability

---

## Lab Resources

### AWS Free Tier
- Use AWS Free Tier for practice
- Monitor usage to avoid charges
- Set up billing alerts

### Documentation
- AWS service documentation
- Security best practices guides
- Architecture patterns

### Tools
- AWS CLI
- AWS CloudShell
- Terraform/CloudFormation
- Security scanning tools

---

## Lab Completion Checklist

- [ ] Lab 1: Secure Multi-Tier Web Application
- [ ] Lab 2: IAM Security Audit and Remediation
- [ ] Lab 3: Security Monitoring and Incident Response
- [ ] Lab 4: Compliance Assessment
- [ ] Lab 5: Data Protection Implementation
- [ ] Capstone Project: End-to-End Security Implementation

---

## Next Steps

After completing all labs:
1. Review lab documentation
2. Complete capstone project
3. Proceed to [Module 9: AWS Security Certifications](../modules/09_AWS_Security_Certifications.md)

---

**Module Completion Checklist:**
- [ ] Completed Lab 1
- [ ] Completed Lab 2
- [ ] Completed Lab 3
- [ ] Completed Lab 4
- [ ] Completed Lab 5
- [ ] Completed Capstone Project
- [ ] Reviewed all lab documentation
- [ ] Ready to proceed to Module 9
