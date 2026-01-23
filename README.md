# AWS Security Training Curriculum

## 🎯 Overview

This comprehensive AWS Security Training Curriculum is designed to provide WellSpan team members with the knowledge and skills needed to secure AWS environments effectively. The curriculum covers fundamental security concepts, AWS security services, best practices, and hands-on exercises.

**Target Audience:** IT professionals, cloud engineers, security analysts, and system administrators  
**Duration:** 8-12 weeks (self-paced)  
**Prerequisites:** Basic understanding of cloud computing and AWS fundamentals

---

## 📚 Table of Contents

1. [Module 1: AWS Security Fundamentals](#module-1-aws-security-fundamentals)
2. [Module 2: Identity and Access Management (IAM)](#module-2-identity-and-access-management-iam)
3. [Module 3: Network Security](#module-3-network-security)
4. [Module 4: Data Protection](#module-4-data-protection)
5. [Module 5: Monitoring, Logging, and Incident Response](#module-5-monitoring-logging-and-incident-response)
6. [Module 6: Compliance and Governance](#module-6-compliance-and-governance)
7. [Module 7: Security Best Practices and Hardening](#module-7-security-best-practices-and-hardening)
8. [Module 8: Hands-On Labs and Projects](#module-8-hands-on-labs-and-projects)
9. [Module 9: AWS Security Certifications](#module-9-aws-security-certifications)
10. [Resources and References](#resources-and-references)

---

## Module 1: AWS Security Fundamentals

### Learning Objectives
- Understand the AWS Shared Responsibility Model
- Learn AWS security architecture and design principles
- Identify AWS security services and their use cases
- Understand security threats and attack vectors in cloud environments

### Topics Covered
1. **AWS Shared Responsibility Model**
   - AWS responsibilities (security OF the cloud)
   - Customer responsibilities (security IN the cloud)
   - Understanding the division of responsibilities

2. **AWS Security Architecture**
   - Defense in depth
   - Zero trust principles
   - Security by design
   - Least privilege access

3. **AWS Security Services Overview**
   - AWS Identity and Access Management (IAM)
   - AWS CloudTrail
   - AWS Config
   - Amazon GuardDuty
   - AWS Security Hub
   - Amazon Inspector
   - AWS WAF
   - AWS Shield
   - AWS Secrets Manager
   - AWS Key Management Service (KMS)

4. **Common Security Threats**
   - Data breaches
   - DDoS attacks
   - Unauthorized access
   - Misconfiguration
   - Insider threats
   - Account hijacking

### Hands-On Activities
- Review AWS Shared Responsibility Model documentation
- Explore AWS Security services in the console
- Complete AWS Security Fundamentals quiz

### Estimated Time: 4-6 hours

---

## Module 2: Identity and Access Management (IAM)

### Learning Objectives
- Master IAM fundamentals and best practices
- Implement least privilege access
- Configure multi-factor authentication (MFA)
- Understand IAM roles, policies, and permissions
- Implement identity federation

### Topics Covered
1. **IAM Fundamentals**
   - Users, groups, and roles
   - IAM policies (identity-based and resource-based)
   - Policy evaluation logic
   - IAM best practices

2. **Access Control**
   - Principle of least privilege
   - Role-based access control (RBAC)
   - Attribute-based access control (ABAC)
   - Service control policies (SCPs) in AWS Organizations

3. **Multi-Factor Authentication (MFA)**
   - Enabling MFA for users
   - MFA for root account
   - MFA for API access
   - Virtual MFA devices

4. **IAM Roles**
   - EC2 instance roles
   - Lambda execution roles
   - Cross-account roles
   - Role assumption and trust policies

5. **Identity Federation**
   - SAML 2.0 federation
   - OpenID Connect (OIDC)
   - Active Directory integration
   - AWS SSO (now AWS IAM Identity Center)

6. **IAM Advanced Topics**
   - IAM Access Analyzer
   - Permissions boundaries
   - Session policies
   - IAM policy simulator

### Hands-On Activities
- Create IAM users and groups
- Write and test IAM policies
- Configure IAM roles for EC2 instances
- Set up MFA for IAM users
- Implement cross-account access
- Use IAM Access Analyzer to identify unused permissions

### Estimated Time: 8-10 hours

---

## Module 3: Network Security

### Learning Objectives
- Design secure network architectures
- Implement network segmentation
- Configure VPC security
- Understand AWS network security services
- Protect against DDoS attacks

### Topics Covered
1. **Virtual Private Cloud (VPC) Security**
   - VPC design best practices
   - Subnet configuration
   - Security groups
   - Network ACLs (NACLs)
   - VPC Flow Logs
   - VPC endpoints

2. **Network Segmentation**
   - Public vs. private subnets
   - DMZ architecture
   - Multi-VPC architectures
   - Transit Gateway security

3. **AWS Network Security Services**
   - AWS WAF (Web Application Firewall)
   - AWS Shield (DDoS protection)
   - AWS Network Firewall
   - AWS PrivateLink
   - AWS Direct Connect security

4. **VPN and Connectivity**
   - Site-to-Site VPN
   - Client VPN
   - VPN security best practices
   - Encryption in transit

5. **DNS Security**
   - Route 53 security features
   - DNS filtering
   - DNSSEC

### Hands-On Activities
- Create a secure VPC with public and private subnets
- Configure security groups and NACLs
- Enable VPC Flow Logs
- Set up AWS WAF rules
- Configure AWS PrivateLink
- Implement network segmentation

### Estimated Time: 10-12 hours

---

## Module 4: Data Protection

### Learning Objectives
- Implement encryption at rest and in transit
- Understand AWS Key Management Service (KMS)
- Secure data storage (S3, EBS, RDS)
- Implement data classification and lifecycle management
- Understand backup and disaster recovery

### Topics Covered
1. **Encryption Fundamentals**
   - Encryption at rest
   - Encryption in transit
   - Key management concepts
   - Encryption algorithms

2. **AWS Key Management Service (KMS)**
   - Customer Master Keys (CMKs)
   - Key policies
   - Envelope encryption
   - Automatic key rotation
   - Multi-region keys
   - KMS best practices

3. **S3 Security**
   - S3 bucket policies
   - S3 encryption options
   - S3 access logging
   - S3 versioning and MFA delete
   - S3 Block Public Access
   - Presigned URLs

4. **Database Security**
   - RDS encryption
   - DynamoDB encryption
   - Database authentication
   - Network isolation for databases
   - Database backup encryption

5. **EBS and Instance Store Security**
   - EBS encryption
   - Instance store encryption
   - EBS snapshot security

6. **Data Classification and Lifecycle**
   - Data classification schemes
   - S3 lifecycle policies
   - Data retention policies
   - Data deletion and secure disposal

7. **Backup and Disaster Recovery**
   - Backup encryption
   - Cross-region replication
   - Disaster recovery strategies
   - Backup testing

### Hands-On Activities
- Create and manage KMS keys
- Encrypt S3 buckets
- Configure S3 bucket policies
- Encrypt RDS databases
- Set up EBS encryption
- Implement S3 lifecycle policies
- Configure cross-region replication

### Estimated Time: 10-12 hours

---

## Module 5: Monitoring, Logging, and Incident Response

### Learning Objectives
- Implement comprehensive logging and monitoring
- Use AWS security monitoring services
- Detect and respond to security incidents
- Understand security automation and orchestration

### Topics Covered
1. **AWS CloudTrail**
   - Enabling CloudTrail
   - CloudTrail log analysis
   - CloudTrail Insights
   - CloudTrail security best practices
   - Multi-region CloudTrail

2. **Amazon CloudWatch**
   - CloudWatch Logs
   - CloudWatch Metrics
   - CloudWatch Alarms
   - CloudWatch Dashboards
   - Log Insights queries

3. **AWS Config**
   - Config rules
   - Configuration compliance
   - Configuration history
   - Config aggregators
   - Custom Config rules

4. **Amazon GuardDuty**
   - Threat detection
   - GuardDuty findings
   - GuardDuty integration
   - GuardDuty best practices

5. **AWS Security Hub**
   - Security findings aggregation
   - Security standards
   - Automated compliance checks
   - Security Hub insights

6. **Amazon Inspector**
   - Vulnerability assessments
   - EC2 instance assessments
   - Container image assessments
   - Inspector findings

7. **VPC Flow Logs**
   - Enabling Flow Logs
   - Flow Log analysis
   - Flow Log formats

8. **Incident Response**
   - Incident response plan
   - AWS security incident response
   - Forensic analysis
   - Containment and remediation
   - Post-incident review

9. **Security Automation**
   - AWS Lambda for security automation
   - EventBridge for security events
   - Automated remediation
   - Security orchestration

### Hands-On Activities
- Enable and configure CloudTrail
- Create CloudWatch alarms for security events
- Set up AWS Config rules
- Review GuardDuty findings
- Configure Security Hub
   - Run Inspector assessments
- Analyze VPC Flow Logs
- Create automated security responses with Lambda

### Estimated Time: 12-14 hours

---

## Module 6: Compliance and Governance

### Learning Objectives
- Understand compliance frameworks (HIPAA, PCI-DSS, SOC 2, etc.)
- Implement governance controls
- Use AWS compliance services
- Understand audit and compliance reporting

### Topics Covered
1. **Compliance Frameworks**
   - HIPAA (Healthcare)
   - PCI-DSS (Payment Card Industry)
   - SOC 2 (Service Organization Control)
   - GDPR (General Data Protection Regulation)
   - FedRAMP (Federal Risk and Authorization Management Program)
   - NIST Cybersecurity Framework

2. **AWS Compliance Programs**
   - AWS Artifact
   - Compliance certifications
   - Compliance reports
   - AWS compliance resources

3. **Governance with AWS Organizations**
   - Service Control Policies (SCPs)
   - Account management
   - Consolidated billing
   - Tag policies
   - Backup policies

4. **AWS Control Tower**
   - Landing zone setup
   - Guardrails
   - Account factory
   - Compliance monitoring

5. **AWS Audit Manager**
   - Audit framework mapping
   - Evidence collection
   - Compliance reports
   - Audit automation

6. **Data Privacy**
   - Data residency requirements
   - Data processing agreements
   - Privacy by design
   - Data subject rights

7. **Compliance Monitoring**
   - Continuous compliance
   - Compliance dashboards
   - Compliance reporting
   - Remediation workflows

### Hands-On Activities
- Access AWS Artifact
- Review compliance reports
- Set up AWS Organizations
- Configure Service Control Policies
- Use AWS Control Tower
- Set up AWS Audit Manager
- Create compliance dashboards

### Estimated Time: 8-10 hours

---

## Module 7: Security Best Practices and Hardening

### Learning Objectives
- Apply security best practices across AWS services
- Harden AWS environments
- Understand security patterns and anti-patterns
- Implement security checklists

### Topics Covered
1. **EC2 Security**
   - Security groups best practices
   - Instance hardening
   - Patch management
   - Systems Manager for security
   - Instance metadata service (IMDS) security

2. **Container Security**
   - ECS security best practices
   - EKS security
   - Container image scanning
   - Pod security policies
   - Network policies

3. **Serverless Security**
   - Lambda security best practices
   - API Gateway security
   - Function permissions
   - Secrets management in Lambda

4. **Application Security**
   - Secure coding practices
   - Dependency management
   - Vulnerability scanning
   - Secure software development lifecycle (SDLC)

5. **Infrastructure as Code Security**
   - CloudFormation security
   - Terraform security
   - Template scanning
   - Infrastructure security reviews

6. **Account Security**
   - Root account protection
   - Account security best practices
   - Billing alerts
   - Account activity monitoring

7. **Security Checklists**
   - AWS Well-Architected Security Pillar
   - CIS AWS Foundations Benchmark
   - Security hardening checklists

### Hands-On Activities
- Harden EC2 instances
- Configure Systems Manager Patch Manager
- Secure Lambda functions
- Review and fix security misconfigurations
- Implement security scanning in CI/CD
- Complete AWS Well-Architected Security review

### Estimated Time: 10-12 hours

---

## Module 8: Hands-On Labs and Projects

### Lab 1: Secure Multi-Tier Web Application
**Objective:** Build a secure, production-ready web application on AWS

**Tasks:**
- Create a VPC with public and private subnets
- Deploy web servers in public subnets
- Deploy database in private subnet
- Implement security groups and NACLs
- Enable encryption at rest and in transit
- Configure CloudTrail and CloudWatch
- Set up WAF rules
- Implement backup and disaster recovery

**Estimated Time:** 4-6 hours

### Lab 2: IAM Security Audit and Remediation
**Objective:** Audit IAM permissions and implement least privilege

**Tasks:**
- Use IAM Access Analyzer to identify unused permissions
- Review IAM policies for overly permissive access
- Implement permissions boundaries
- Set up MFA for all users
- Configure IAM roles for applications
- Create IAM policy documents following best practices

**Estimated Time:** 3-4 hours

### Lab 3: Security Monitoring and Incident Response
**Objective:** Set up comprehensive security monitoring

**Tasks:**
- Enable CloudTrail in all regions
- Configure GuardDuty
- Set up Security Hub
- Create CloudWatch alarms for security events
- Configure automated responses
- Simulate and respond to a security incident

**Estimated Time:** 4-5 hours

### Lab 4: Compliance Assessment
**Objective:** Assess and improve compliance posture

**Tasks:**
- Enable AWS Config
- Configure Config rules for compliance
- Set up AWS Audit Manager
- Review compliance findings
- Implement remediation
- Generate compliance reports

**Estimated Time:** 3-4 hours

### Lab 5: Data Protection Implementation
**Objective:** Implement comprehensive data protection

**Tasks:**
- Create and manage KMS keys
- Encrypt S3 buckets and objects
- Encrypt RDS databases
- Configure S3 lifecycle policies
- Set up cross-region replication
- Implement data classification

**Estimated Time:** 3-4 hours

### Capstone Project: End-to-End Security Implementation
**Objective:** Design and implement a complete security solution for a hypothetical organization

**Requirements:**
- Multi-account AWS Organizations setup
- Complete IAM structure with least privilege
- Secure network architecture
- Data encryption everywhere
- Comprehensive monitoring and logging
- Compliance framework implementation
- Incident response procedures
- Documentation and runbooks

**Estimated Time:** 8-12 hours

---

## Module 9: AWS Security Certifications

### AWS Certified Security - Specialty
**Preparation Guide**

1. **Exam Overview**
   - Exam format: 65 questions, 170 minutes
   - Question types: Multiple choice, multiple response
   - Passing score: 750/1000
   - Cost: $300 USD

2. **Exam Domains**
   - Domain 1: Incident Response (12%)
   - Domain 2: Logging and Monitoring (20%)
   - Domain 3: Infrastructure Security (26%)
   - Domain 4: Identity and Access Management (20%)
   - Domain 5: Data Protection (22%)

3. **Study Resources**
   - AWS Security Specialty exam guide
   - AWS whitepapers
   - Hands-on practice
   - Practice exams
   - AWS training courses

4. **Recommended Study Path**
   - Complete all modules in this curriculum
   - Review AWS Security documentation
   - Take practice exams
   - Hands-on practice with AWS services
   - Join study groups or forums

### Other Relevant Certifications
- AWS Certified Solutions Architect (Associate/Professional)
- AWS Certified SysOps Administrator
- AWS Certified DevOps Engineer
- CISSP (for broader security knowledge)

---

## Resources and References

### AWS Documentation
- [AWS Security Documentation](https://docs.aws.amazon.com/security/)
- [AWS Well-Architected Framework - Security Pillar](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/welcome.html)
- [AWS Security Best Practices](https://aws.amazon.com/security/security-resources/)
- [AWS Compliance Programs](https://aws.amazon.com/compliance/programs/)

### AWS Training Resources
- [AWS Training and Certification](https://aws.amazon.com/training/)
- [AWS Security Learning Path](https://aws.amazon.com/training/learning-paths/security/)
- [AWS re:Post Security Community](https://repost.aws/topics/security)

### Security Frameworks and Standards
- [CIS AWS Foundations Benchmark](https://www.cisecurity.org/benchmark/amazon_web_services)
- [NIST Cybersecurity Framework](https://www.nist.gov/cyberframework)
- [OWASP Top 10](https://owasp.org/www-project-top-ten/)

### Tools and Utilities
- [AWS CLI](https://aws.amazon.com/cli/)
- [AWS CloudShell](https://aws.amazon.com/cloudshell/)
- [AWS Policy Simulator](https://policysim.aws.amazon.com/)
- [IAM Policy Validator](https://github.com/awslabs/aws-iam-policy-validator-for-terraform)

### Books and Publications
- "AWS Security" by Dylan Shields
- "AWS Well-Architected Framework" (AWS Whitepaper)
- "Security Pillar" (AWS Well-Architected Framework)

### Practice and Labs
- [AWS Free Tier](https://aws.amazon.com/free/)
- [AWS Hands-On Tutorials](https://aws.amazon.com/getting-started/hands-on/)
- [Well-Architected Labs](https://www.wellarchitectedlabs.com/)

---

## Learning Path Recommendations

### Beginner Path (8-10 weeks)
1. Week 1-2: Module 1 (Fundamentals) + Module 2 (IAM)
2. Week 3-4: Module 3 (Network Security) + Module 4 (Data Protection)
3. Week 5-6: Module 5 (Monitoring) + Module 6 (Compliance)
4. Week 7-8: Module 7 (Best Practices) + Module 8 (Labs)
5. Week 9-10: Review + Certification Preparation

### Intermediate Path (6-8 weeks)
1. Week 1: Module 1 + Module 2
2. Week 2: Module 3 + Module 4
3. Week 3: Module 5 + Module 6
4. Week 4: Module 7
5. Week 5-6: Module 8 (All Labs)
6. Week 7-8: Capstone Project + Certification Prep

### Advanced Path (4-6 weeks)
1. Week 1: Review Modules 1-4 (focus on advanced topics)
2. Week 2: Review Modules 5-7 (focus on automation)
3. Week 3-4: Module 8 (Advanced Labs + Capstone)
4. Week 5-6: Certification Preparation + Practice Exams

---

## Assessment and Progress Tracking

### Knowledge Checks
Each module includes:
- Learning objectives checklist
- Knowledge quiz
- Hands-on activity completion
- Module review questions

### Skills Assessment
- Lab completion and evaluation
- Capstone project review
- Security scenario problem-solving
- Practical security implementation

### Certification Readiness
- Practice exam scores
- Domain knowledge assessment
- Hands-on skills verification
- Study plan completion

---

## Support and Community

### Getting Help
- AWS Support (if available)
- AWS re:Post Security Community
- Internal team discussions
- Study groups

### Contributing
- Share additional resources
- Report errors or improvements
- Contribute new labs or exercises
- Share real-world security scenarios

---

## Version History

- **v1.0** (Initial Release) - Comprehensive AWS Security Training Curriculum
  - 9 modules covering all aspects of AWS security
  - Hands-on labs and projects
  - Certification preparation guide
  - Complete resource library

---

## License

This curriculum is provided for educational purposes within WellSpan. Please ensure compliance with AWS Terms of Service and your organization's policies when implementing security practices.

---

## Contact and Feedback

For questions, suggestions, or feedback about this curriculum, please contact the training team or create an issue in this repository.

---

**Last Updated:** January 2025  
**Maintained by:** Cordea Training Team
