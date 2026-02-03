# Module 1: AWS Security Fundamentals

## Learning Objectives

By the end of this module, you will be able to:
- Understand the AWS Shared Responsibility Model
- Learn AWS security architecture and design principles
- Identify AWS security services and their use cases
- Understand security threats and attack vectors in cloud environments

## Estimated Time: 4-6 hours

---

## 1. AWS Shared Responsibility Model

### AWS Responsibilities (Security OF the Cloud)

AWS is responsible for the security **of** the cloud infrastructure:

- **Physical Infrastructure**
  - Data center security
  - Hardware security
  - Network infrastructure
  - Compute, storage, and database infrastructure

- **Software Infrastructure**
  - Hypervisor security
  - AWS service software
  - Platform and application management
  - Operating system (for managed services)

- **Global Infrastructure**
  - Availability Zones
  - Edge locations
  - Regional infrastructure

### Customer Responsibilities (Security IN the Cloud)

You are responsible for security **in** the cloud:

- **Identity and Access Management**
  - IAM users, groups, roles, and policies
  - Multi-factor authentication (MFA)
  - Access keys and credentials management

- **Data Protection**
  - Data encryption (at rest and in transit)
  - Data classification
  - Backup and recovery
  - Data lifecycle management

- **Network Security**
  - VPC configuration
  - Security groups and NACLs
  - Network access controls
  - VPN and Direct Connect configuration

- **Application Security**
  - Application code security
  - Secure configuration
  - Patch management
  - Vulnerability management

- **Compliance**
  - Compliance requirements
  - Audit logging
  - Compliance reporting
  - Data residency requirements

### Understanding the Division

The division of responsibilities varies by service type:

- **Infrastructure Services (EC2, VPC, S3)**
  - AWS: Infrastructure security
  - Customer: Operating system, applications, data, network configuration

- **Container Services (ECS, EKS)**
  - AWS: Container orchestration platform
  - Customer: Container images, application code, data

- **Abstracted Services (S3, DynamoDB, Lambda)**
  - AWS: Operating system, platform, infrastructure
  - Customer: Data, access management, resource configuration

---

## 2. AWS Security Architecture

### Defense in Depth

Multiple layers of security controls:

1. **Network Layer**
   - VPC isolation
   - Security groups
   - Network ACLs
   - WAF rules

2. **Identity Layer**
   - IAM policies
   - MFA
   - Access controls
   - Federation

3. **Data Layer**
   - Encryption at rest
   - Encryption in transit
   - Key management
   - Data classification

4. **Application Layer**
   - Secure coding practices
   - Vulnerability scanning
   - Patch management
   - Secure configuration

5. **Monitoring Layer**
   - CloudTrail logging
   - CloudWatch monitoring
   - GuardDuty threat detection
   - Security Hub aggregation

### Zero Trust Principles

- **Never Trust, Always Verify**
  - Verify every access request
  - Authenticate and authorize all users
  - Validate all network traffic

- **Least Privilege Access**
  - Grant minimum necessary permissions
  - Regular access reviews
  - Just-in-time access

- **Assume Breach**
  - Continuous monitoring
  - Incident response readiness
  - Network segmentation

### Security by Design

- **Security First**
  - Integrate security from the start
  - Security requirements in design phase
  - Threat modeling

- **Automated Security**
  - Infrastructure as Code (IaC) security
  - Automated compliance checks
  - Automated remediation

- **Continuous Improvement**
  - Regular security assessments
  - Security reviews
  - Lessons learned

---

## 3. AWS Security Services Overview

### Identity and Access Management (IAM)
- **Purpose:** Manage user access and permissions
- **Key Features:**
  - Users, groups, roles, policies
  - MFA support
  - Identity federation
  - Access Analyzer

### AWS CloudTrail
- **Purpose:** Log API calls and account activity
- **Key Features:**
  - API call logging
  - Audit trail
  - Compliance support
  - CloudTrail Insights

### AWS Config
- **Purpose:** Assess, audit, and evaluate configurations
- **Key Features:**
  - Configuration history
  - Compliance rules
  - Configuration drift detection
  - Automated remediation

### Amazon GuardDuty
- **Purpose:** Threat detection service
- **Key Features:**
  - Continuous monitoring
  - Threat intelligence
  - Anomaly detection
  - Security findings

### AWS Security Hub
- **Purpose:** Centralized security findings
- **Key Features:**
  - Findings aggregation
  - Security standards
  - Compliance checks
  - Automated remediation

### Amazon Inspector
- **Purpose:** Automated security assessments
- **Key Features:**
  - Vulnerability scanning
  - EC2 assessments
  - Container image scanning
  - Security findings

### AWS WAF (Web Application Firewall)
- **Purpose:** Protect web applications
- **Key Features:**
  - Web traffic filtering
  - Custom rules
  - Rate limiting
  - DDoS protection

### AWS Shield
- **Purpose:** DDoS protection
- **Key Features:**
  - Standard (free) protection
  - Advanced protection
  - DDoS mitigation
  - Cost protection

### AWS Secrets Manager
- **Purpose:** Manage secrets and credentials
- **Key Features:**
  - Secret storage
  - Automatic rotation
  - Encryption
  - Access control

### AWS Key Management Service (KMS)
- **Purpose:** Manage encryption keys
- **Key Features:**
  - Customer Master Keys (CMKs)
  - Key rotation
  - Envelope encryption
  - Multi-region keys

---

## 4. Common Security Threats

### Data Breaches
- **Description:** Unauthorized access to sensitive data
- **Prevention:**
  - Encryption at rest and in transit
  - Access controls
  - Data classification
  - Monitoring and alerting

### DDoS Attacks
- **Description:** Distributed Denial of Service attacks
- **Prevention:**
  - AWS Shield
  - WAF rules
  - Auto Scaling
  - Rate limiting

### Unauthorized Access
- **Description:** Access by unauthorized users
- **Prevention:**
  - Strong IAM policies
  - MFA
  - Least privilege
  - Regular access reviews

### Misconfiguration
- **Description:** Incorrect security configurations
- **Prevention:**
  - AWS Config rules
  - Security best practices
  - Infrastructure as Code
  - Regular audits

### Insider Threats
- **Description:** Threats from authorized users
- **Prevention:**
  - Least privilege access
  - Monitoring and logging
  - Access reviews
  - Separation of duties

### Account Hijacking
- **Description:** Unauthorized account access
- **Prevention:**
  - MFA
  - Strong passwords
  - Access key rotation
  - Monitoring suspicious activity

---

## Hands-On Activities

### Activity 1: Review AWS Shared Responsibility Model
1. Read AWS documentation on Shared Responsibility Model
2. Identify which services fall under which responsibility
3. Document your understanding

### Activity 2: Explore AWS Security Services
1. Log into AWS Console
2. Navigate to each security service
3. Review service features and capabilities
4. Document key use cases

### Activity 3: Complete Security Fundamentals Quiz
1. Review all module content
2. Complete the knowledge check questions
3. Verify your understanding

---

## Knowledge Check

1. What is the AWS Shared Responsibility Model?
2. What are AWS's responsibilities in the Shared Responsibility Model?
3. What are customer responsibilities?
4. What is defense in depth?
5. What are the key AWS security services?
6. What are common security threats in cloud environments?

---

## Additional Resources

- [AWS Shared Responsibility Model](https://aws.amazon.com/compliance/shared-responsibility-model/)
- [AWS Security Documentation](https://docs.aws.amazon.com/security/)
- [AWS Well-Architected Framework - Security Pillar](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/welcome.html)
- [AWS Security Best Practices](https://aws.amazon.com/security/security-resources/)

---

## Next Steps

After completing this module:
1. Review your notes
2. Complete all hands-on activities
3. Take the knowledge check
4. Proceed to [Module 2: Identity and Access Management (IAM)](../modules/02_Identity_and_Access_Management.md)

---

**Module Completion Checklist:**
- [ ] Read all module content
- [ ] Completed Activity 1: Review AWS Shared Responsibility Model
- [ ] Completed Activity 2: Explore AWS Security Services
- [ ] Completed Activity 3: Security Fundamentals Quiz
- [ ] Reviewed additional resources
- [ ] Ready to proceed to Module 2
