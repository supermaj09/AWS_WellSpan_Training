# Module 7: Security Best Practices and Hardening

## Learning Objectives

By the end of this module, you will be able to:
- Apply security best practices across AWS services
- Harden AWS environments
- Understand security patterns and anti-patterns
- Implement security checklists

## Estimated Time: 10-12 hours

---

## 1. EC2 Security

### Security Groups Best Practices

- **Least Privilege:** Minimal required ports
- **Specific Sources:** Specific IP ranges, not 0.0.0.0/0
- **Regular Reviews:** Audit security group rules
- **Separate Groups:** Different groups for different tiers

### Instance Hardening

- **Operating System:**
  - Minimal OS installation
  - Remove unnecessary services
  - Disable unused ports
  - Apply security patches

- **Application Security:**
  - Secure application configuration
  - Remove default credentials
  - Enable application logging
  - Use secure protocols

### Patch Management

- **AWS Systems Manager Patch Manager:**
  - Automated patching
  - Patch baselines
  - Maintenance windows
  - Compliance reporting

### Systems Manager for Security

- **Session Manager:** Secure shell access
- **Run Command:** Execute commands securely
- **State Manager:** Enforce configurations
- **Patch Manager:** Automated patching

### Instance Metadata Service (IMDS) Security

- **IMDSv2:** Token-based access
- **Best Practices:**
  - Use IMDSv2
  - Restrict IMDS access
  - Use IAM roles, not access keys
  - Monitor IMDS access

---

## 2. Container Security

### ECS Security Best Practices

- **Task Roles:** Use IAM roles for tasks
- **Network Isolation:** Use security groups
- **Image Security:** Scan container images
- **Secrets Management:** Use Secrets Manager

### EKS Security

- **Cluster Security:**
  - Enable encryption
  - Use private endpoints
  - Enable audit logging
  - Network policies

- **Pod Security:**
  - Pod security policies
  - Network policies
  - Resource limits
  - Security contexts

### Container Image Scanning

- **Amazon ECR:** Built-in scanning
- **Third-Party Tools:** Additional scanning
- **CI/CD Integration:** Scan in pipeline
- **Vulnerability Management:** Track and remediate

### Pod Security Policies

- **Purpose:** Enforce pod security standards
- **Policies:**
  - Privileged containers
  - Host network access
  - Volume types
  - Capabilities

### Network Policies

- **Purpose:** Control pod-to-pod communication
- **Implementation:**
  - Network policy rules
  - Namespace isolation
  - Pod selector matching

---

## 3. Serverless Security

### Lambda Security Best Practices

- **Execution Roles:**
  - Least privilege
  - Separate roles per function
  - No wildcard permissions

- **Function Configuration:**
  - VPC configuration for private resources
  - Environment variables encryption
  - Dead letter queues
  - Timeout and memory limits

### API Gateway Security

- **Authentication:**
  - IAM authentication
  - Lambda authorizers
  - Cognito user pools
  - API keys

- **Authorization:**
  - Resource policies
  - Method-level permissions
  - Usage plans

### Function Permissions

- **Principle of Least Privilege:**
  - Minimum required permissions
  - Resource-specific policies
  - Regular reviews

### Secrets Management in Lambda

- **AWS Secrets Manager:**
  - Retrieve secrets at runtime
  - Automatic rotation
  - Encryption

- **Environment Variables:**
  - Encrypt sensitive values
  - Use KMS encryption
  - Avoid hardcoding secrets

---

## 4. Application Security

### Secure Coding Practices

- **Input Validation:** Validate all inputs
- **Output Encoding:** Encode outputs
- **Error Handling:** Secure error messages
- **Authentication:** Strong authentication
- **Authorization:** Proper authorization checks

### Dependency Management

- **Vulnerability Scanning:** Scan dependencies
- **Regular Updates:** Update dependencies
- **Dependency Tracking:** Track dependencies
- **Security Advisories:** Monitor advisories

### Vulnerability Scanning

- **Tools:**
  - AWS Inspector
  - Third-party scanners
  - SAST/DAST tools

### Secure Software Development Lifecycle (SDLC)

- **Security Requirements:** Define security requirements
- **Threat Modeling:** Identify threats
- **Secure Design:** Design securely
- **Secure Coding:** Code securely
- **Security Testing:** Test security
- **Security Review:** Review code

---

## 5. Infrastructure as Code Security

### CloudFormation Security

- **Template Security:**
  - No hardcoded secrets
  - Use parameters
  - Validate templates
  - Version control

- **Stack Security:**
  - IAM roles for stacks
  - Stack policies
  - Termination protection

### Terraform Security

- **State Security:**
  - Encrypt state files
  - Use remote state
  - Restrict state access

- **Provider Security:**
  - Secure credentials
  - Use IAM roles
  - Regular updates

### Template Scanning

- **Purpose:** Identify security issues
- **Tools:**
  - cfn-nag
  - Checkov
  - Snyk
  - AWS Security Hub

### Infrastructure Security Reviews

- **Code Reviews:** Review IaC code
- **Security Scans:** Scan templates
- **Compliance Checks:** Verify compliance
- **Best Practices:** Follow best practices

---

## 6. Account Security

### Root Account Protection

- **MFA:** Enable MFA (required)
- **Access:** Limit root account usage
- **Monitoring:** Monitor root account activity
- **Credentials:** Secure root credentials

### Account Security Best Practices

- **IAM Users:** Use IAM users, not root
- **MFA:** Enable MFA for all users
- **Access Keys:** Rotate access keys
- **Password Policy:** Strong password policy

### Billing Alerts

- **Purpose:** Monitor costs
- **Configuration:**
  - Billing alerts
  - Budget alerts
  - Cost anomaly detection

### Account Activity Monitoring

- **CloudTrail:** Enable CloudTrail
- **CloudWatch:** Monitor account activity
- **GuardDuty:** Threat detection
- **Security Hub:** Centralized findings

---

## 7. Security Checklists

### AWS Well-Architected Security Pillar

- **Identity and Access Management:**
  - Implement least privilege
  - Enable MFA
  - Rotate credentials

- **Detection:**
  - Enable logging
  - Monitor and alert
  - Automate responses

- **Infrastructure Protection:**
  - Apply defense in depth
  - Automate security
  - Manage vulnerabilities

- **Data Protection:**
  - Encrypt data
  - Classify data
  - Protect data in transit

- **Incident Response:**
  - Prepare for incidents
  - Detect incidents
  - Respond and recover

### CIS AWS Foundations Benchmark

- **Identity and Access Management:**
  - MFA for root account
  - IAM user access
  - Password policy

- **Storage:**
  - S3 bucket security
  - EBS encryption
  - RDS encryption

- **Logging:**
  - CloudTrail enabled
  - Log file validation
  - Config enabled

- **Monitoring:**
  - GuardDuty enabled
  - Security Hub enabled
  - VPC Flow Logs

### Security Hardening Checklists

- **Account Level:**
  - Root account MFA
  - IAM best practices
  - Billing alerts

- **Network Level:**
  - VPC security
  - Security groups
  - Network ACLs

- **Compute Level:**
  - Instance hardening
  - Patch management
  - Monitoring

- **Storage Level:**
  - Encryption
  - Access controls
  - Backup

---

## Hands-On Activities

### Activity 1: Harden EC2 Instances
1. Review instance configuration
2. Apply security patches
3. Configure security groups
4. Enable monitoring

### Activity 2: Configure Systems Manager Patch Manager
1. Set up patch baselines
2. Configure maintenance windows
3. Schedule patching
4. Monitor compliance

### Activity 3: Secure Lambda Functions
1. Review function permissions
2. Encrypt environment variables
3. Configure VPC access
4. Test security

### Activity 4: Review and Fix Security Misconfigurations
1. Run security scans
2. Review findings
3. Fix misconfigurations
4. Verify fixes

### Activity 5: Implement Security Scanning in CI/CD
1. Set up scanning tools
2. Integrate with pipeline
3. Configure alerts
4. Test scanning

### Activity 6: Complete AWS Well-Architected Security Review
1. Use Well-Architected Tool
2. Answer security questions
3. Review recommendations
4. Implement improvements

---

## Knowledge Check

1. What are EC2 security best practices?
2. How do you secure container workloads?
3. What are Lambda security best practices?
4. How do you secure Infrastructure as Code?
5. What is the AWS Well-Architected Security Pillar?
6. What is the CIS AWS Foundations Benchmark?

---

## Additional Resources

- [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/)
- [CIS AWS Foundations Benchmark](https://www.cisecurity.org/benchmark/amazon_web_services)
- [AWS Security Best Practices](https://aws.amazon.com/security/security-resources/)
- [Systems Manager Documentation](https://docs.aws.amazon.com/systems-manager/)

---

## Next Steps

After completing this module:
1. Review your notes
2. Complete all hands-on activities
3. Take the knowledge check
4. Proceed to [Module 8: Hands-On Labs and Projects](../modules/08_Hands_On_Labs_Projects.md)

---

**Module Completion Checklist:**
- [ ] Read all module content
- [ ] Completed Activity 1: Harden EC2 Instances
- [ ] Completed Activity 2: Configure Systems Manager Patch Manager
- [ ] Completed Activity 3: Secure Lambda Functions
- [ ] Completed Activity 4: Review and Fix Security Misconfigurations
- [ ] Completed Activity 5: Implement Security Scanning in CI/CD
- [ ] Completed Activity 6: Complete AWS Well-Architected Security Review
- [ ] Reviewed additional resources
- [ ] Ready to proceed to Module 8
