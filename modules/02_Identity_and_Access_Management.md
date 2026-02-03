# Module 2: Identity and Access Management (IAM)

## Learning Objectives

By the end of this module, you will be able to:
- Master IAM fundamentals and best practices
- Implement least privilege access
- Configure multi-factor authentication (MFA)
- Understand IAM roles, policies, and permissions
- Implement identity federation

## Estimated Time: 8-10 hours

---

## 1. IAM Fundamentals

### Users, Groups, and Roles

#### IAM Users
- **Definition:** Individual identities with credentials
- **Use Cases:**
  - Human users accessing AWS
  - Applications requiring long-term credentials
- **Best Practices:**
  - Create individual users (no shared accounts)
  - Use groups for permissions
  - Enable MFA
  - Rotate access keys regularly

#### IAM Groups
- **Definition:** Collections of users
- **Use Cases:**
  - Organizing users by function
  - Applying permissions to multiple users
- **Best Practices:**
  - Use groups for permission management
  - Avoid attaching policies directly to users
  - Create groups based on job functions

#### IAM Roles
- **Definition:** Temporary credentials for services/users
- **Use Cases:**
  - EC2 instance access
  - Cross-account access
  - Federated access
  - Lambda function execution
- **Best Practices:**
  - Use roles instead of access keys when possible
  - Implement least privilege
  - Use role assumption for temporary access

### IAM Policies

#### Policy Types

**Identity-Based Policies**
- Attached to users, groups, or roles
- Define what actions are allowed/denied
- JSON format

**Resource-Based Policies**
- Attached to AWS resources (S3 buckets, etc.)
- Define who can access the resource
- Cross-account access support

**Service Control Policies (SCPs)**
- Applied at AWS Organizations level
- Define maximum permissions for accounts
- Cannot grant permissions, only deny

**Permissions Boundaries**
- Maximum permissions a user/role can have
- Used with identity-based policies
- Enforces least privilege

#### Policy Structure

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject"
      ],
      "Resource": "arn:aws:s3:::example-bucket/*"
    }
  ]
}
```

**Policy Elements:**
- **Version:** Policy language version
- **Statement:** Array of policy statements
- **Effect:** Allow or Deny
- **Action:** Actions to allow/deny
- **Resource:** Resources the policy applies to
- **Condition:** Optional conditions

### Policy Evaluation Logic

1. **Default Deny:** All requests are denied by default
2. **Explicit Allow:** Policy explicitly allows the action
3. **Explicit Deny:** Policy explicitly denies the action (overrides Allow)
4. **Final Decision:** Allow if no explicit deny and at least one allow

### IAM Best Practices

1. **Use Root Account Sparingly**
   - Only for account management
   - Enable MFA
   - Create IAM users for daily tasks

2. **Implement Least Privilege**
   - Grant minimum necessary permissions
   - Regular access reviews
   - Remove unused permissions

3. **Use Groups for Permissions**
   - Attach policies to groups
   - Add users to groups
   - Easier permission management

4. **Enable MFA**
   - For root account (required)
   - For privileged users
   - For console access

5. **Use Roles Instead of Access Keys**
   - More secure
   - Temporary credentials
   - Automatic rotation

6. **Rotate Credentials Regularly**
   - Access keys
   - Passwords
   - Certificates

7. **Monitor IAM Activity**
   - CloudTrail logging
   - Access Analyzer
   - Regular audits

---

## 2. Access Control

### Principle of Least Privilege

- **Definition:** Grant minimum permissions necessary
- **Implementation:**
  - Start with no permissions
  - Add permissions as needed
  - Regular reviews
  - Remove unused permissions

### Role-Based Access Control (RBAC)

- **Definition:** Permissions based on job roles
- **Implementation:**
  - Create groups for roles
  - Attach policies to groups
  - Add users to appropriate groups

### Attribute-Based Access Control (ABAC)

- **Definition:** Permissions based on attributes/tags
- **Implementation:**
  - Use tags for resources
  - Use condition keys in policies
  - Dynamic permission assignment

**Example ABAC Policy:**
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:GetObject",
      "Resource": "*",
      "Condition": {
        "StringEquals": {
          "s3:ResourceTag/Department": "${aws:PrincipalTag/Department}"
        }
      }
    }
  ]
}
```

### Service Control Policies (SCPs)

- **Purpose:** Centralized permissions management
- **Scope:** AWS Organizations
- **Limitations:**
  - Cannot grant permissions
  - Only deny or allow
  - Applied to all accounts in OU

---

## 3. Multi-Factor Authentication (MFA)

### Enabling MFA for Users

1. **Virtual MFA Device**
   - Use authenticator apps (Google Authenticator, Authy)
   - Free and easy to set up
   - Works with multiple devices

2. **Hardware MFA Device**
   - Physical security keys
   - More secure
   - Higher cost

3. **SMS MFA**
   - Text message codes
   - Less secure than other methods
   - Not recommended for production

### MFA for Root Account

- **Required:** Enable MFA on root account
- **Best Practice:** Use hardware MFA device
- **Protection:** Prevents account compromise

### MFA for API Access

- **Condition Keys:** Require MFA for API calls
- **Implementation:** Add MFA condition to policies
- **Use Cases:** Sensitive operations

**Example MFA Condition:**
```json
{
  "Condition": {
    "BoolIfExists": {
      "aws:MultiFactorAuthPresent": "true"
    }
  }
}
```

---

## 4. IAM Roles

### EC2 Instance Roles

- **Purpose:** Grant EC2 instances access to AWS services
- **Benefits:**
  - No access keys stored on instances
  - Automatic credential rotation
  - Temporary credentials

**Best Practices:**
- Use instance roles instead of access keys
- Implement least privilege
- Regular role reviews

### Lambda Execution Roles

- **Purpose:** Grant Lambda functions permissions
- **Configuration:** Set at function creation
- **Best Practices:**
  - Separate roles per function
  - Least privilege
  - No wildcard permissions

### Cross-Account Roles

- **Purpose:** Access resources in other AWS accounts
- **Components:**
  - Trust policy (who can assume)
  - Permission policy (what they can do)
- **Use Cases:**
  - Centralized access management
  - Cross-account resource access

### Role Assumption and Trust Policies

**Trust Policy Example:**
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::123456789012:user/Admin"
      },
      "Action": "sts:AssumeRole",
      "Condition": {
        "Bool": {
          "aws:MultiFactorAuthPresent": "true"
        }
      }
    }
  ]
}
```

---

## 5. Identity Federation

### SAML 2.0 Federation

- **Purpose:** Single sign-on with SAML
- **Use Cases:**
  - Enterprise identity providers
  - Active Directory integration
- **Benefits:**
  - Centralized identity management
  - No AWS user creation needed

### OpenID Connect (OIDC)

- **Purpose:** Identity federation with OIDC providers
- **Use Cases:**
  - GitHub Actions
  - CI/CD pipelines
  - Third-party identity providers

### Active Directory Integration

- **AWS Directory Service:**
  - Managed Microsoft AD
  - AD Connector
  - Simple AD
- **Use Cases:**
  - Enterprise authentication
  - Existing AD infrastructure

### AWS SSO (IAM Identity Center)

- **Purpose:** Centralized SSO for AWS
- **Features:**
  - Single sign-on
  - Multi-account access
  - Application assignments
  - User provisioning

---

## 6. IAM Advanced Topics

### IAM Access Analyzer

- **Purpose:** Identify unused permissions and external access
- **Features:**
  - Unused permission identification
  - External access detection
  - Policy validation
  - Findings and recommendations

### Permissions Boundaries

- **Purpose:** Set maximum permissions for users/roles
- **Use Cases:**
  - Delegating user creation
  - Limiting role permissions
  - Enforcing least privilege

**Example Permissions Boundary:**
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:*",
        "ec2:*"
      ],
      "Resource": "*"
    }
  ]
}
```

### Session Policies

- **Purpose:** Temporary permissions for role sessions
- **Use Cases:**
  - Temporary elevated access
  - Just-in-time permissions
  - Session-specific restrictions

### IAM Policy Simulator

- **Purpose:** Test IAM policies before applying
- **Features:**
  - Test policy effects
  - Simulate API calls
  - Identify policy issues

---

## Hands-On Activities

### Activity 1: Create IAM Users and Groups
1. Create IAM users for different roles
2. Create IAM groups (Admin, Developer, ReadOnly)
3. Attach policies to groups
4. Add users to appropriate groups

### Activity 2: Write and Test IAM Policies
1. Create custom IAM policies
2. Use IAM Policy Simulator to test
3. Apply policies to users/groups
4. Test access

### Activity 3: Configure IAM Roles for EC2
1. Create IAM role for EC2
2. Attach policies to role
3. Launch EC2 instance with role
4. Test access from instance

### Activity 4: Set Up MFA
1. Enable MFA for IAM users
2. Configure virtual MFA device
3. Test MFA-protected access
4. Add MFA condition to policies

### Activity 5: Implement Cross-Account Access
1. Create cross-account role
2. Configure trust policy
3. Test role assumption
4. Verify permissions

### Activity 6: Use IAM Access Analyzer
1. Enable IAM Access Analyzer
2. Review findings
3. Identify unused permissions
4. Remediate issues

---

## Knowledge Check

1. What is the difference between IAM users, groups, and roles?
2. How does IAM policy evaluation work?
3. What is the principle of least privilege?
4. How do you enable MFA for IAM users?
5. What are the benefits of using IAM roles?
6. How does identity federation work?
7. What is IAM Access Analyzer used for?

---

## Additional Resources

- [IAM Documentation](https://docs.aws.amazon.com/iam/)
- [IAM Best Practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)
- [IAM Policy Examples](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_examples.html)
- [IAM Access Analyzer](https://docs.aws.amazon.com/IAM/latest/UserGuide/what-is-access-analyzer.html)

---

## Next Steps

After completing this module:
1. Review your notes
2. Complete all hands-on activities
3. Take the knowledge check
4. Proceed to [Module 3: Network Security](../modules/03_Network_Security.md)

---

**Module Completion Checklist:**
- [ ] Read all module content
- [ ] Completed Activity 1: Create IAM Users and Groups
- [ ] Completed Activity 2: Write and Test IAM Policies
- [ ] Completed Activity 3: Configure IAM Roles for EC2
- [ ] Completed Activity 4: Set Up MFA
- [ ] Completed Activity 5: Implement Cross-Account Access
- [ ] Completed Activity 6: Use IAM Access Analyzer
- [ ] Reviewed additional resources
- [ ] Ready to proceed to Module 3
