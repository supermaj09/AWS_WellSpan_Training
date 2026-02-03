# Module 4: Data Protection

## Learning Objectives

By the end of this module, you will be able to:
- Implement encryption at rest and in transit
- Understand AWS Key Management Service (KMS)
- Secure data storage (S3, EBS, RDS)
- Implement data classification and lifecycle management
- Understand backup and disaster recovery

## Estimated Time: 10-12 hours

---

## 1. Encryption Fundamentals

### Encryption at Rest

- **Definition:** Encrypting data stored on disk
- **Methods:**
  - Server-side encryption (SSE)
  - Client-side encryption
  - AWS managed keys
  - Customer managed keys

### Encryption in Transit

- **Definition:** Encrypting data during transmission
- **Methods:**
  - TLS/SSL
  - VPN
  - Direct Connect with encryption
  - HTTPS

### Key Management Concepts

- **Symmetric Encryption:** Same key for encrypt/decrypt
- **Asymmetric Encryption:** Public/private key pairs
- **Key Rotation:** Regular key changes
- **Key Lifecycle:** Creation, usage, rotation, deletion

### Encryption Algorithms

- **AES-256:** Advanced Encryption Standard (256-bit)
- **RSA:** Asymmetric encryption
- **TLS 1.2/1.3:** Transport Layer Security

---

## 2. AWS Key Management Service (KMS)

### Customer Master Keys (CMKs)

**AWS Managed Keys:**
- Managed by AWS
- Automatic rotation
- Free (no charges for key management)
- Limited control

**Customer Managed Keys:**
- Full control
- Custom key policies
- Manual or automatic rotation
- Usage charges apply

### Key Policies

- **Purpose:** Control key access
- **Components:**
  - Key administrators
  - Key users
  - Resource permissions

**Example Key Policy:**
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Enable IAM User Permissions",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::123456789012:root"
      },
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
```

### Envelope Encryption

- **Purpose:** Encrypt data encryption keys (DEKs) with CMK
- **Process:**
  1. Generate DEK
  2. Encrypt data with DEK
  3. Encrypt DEK with CMK
  4. Store encrypted DEK with encrypted data

### Automatic Key Rotation

- **AWS Managed Keys:** Automatic (annually)
- **Customer Managed Keys:** Optional automatic (annually)
- **Benefits:**
  - Enhanced security
  - Compliance requirements
  - Best practice

### Multi-Region Keys

- **Purpose:** Replicate keys across regions
- **Use Cases:**
  - Multi-region applications
  - Disaster recovery
  - Compliance requirements

### KMS Best Practices

1. **Use Customer Managed Keys for Control**
2. **Implement Key Rotation**
3. **Use Key Policies for Access Control**
4. **Monitor Key Usage**
5. **Enable CloudTrail for KMS**
6. **Use Separate Keys for Different Environments**

---

## 3. S3 Security

### S3 Bucket Policies

- **Purpose:** Control bucket and object access
- **Features:**
  - Public access control
  - Cross-account access
  - IP-based restrictions
  - Time-based access

**Example Bucket Policy:**
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": [
        "arn:aws:s3:::example-bucket",
        "arn:aws:s3:::example-bucket/*"
      ],
      "Condition": {
        "Bool": {
          "aws:SecureTransport": "false"
        }
      }
    }
  ]
}
```

### S3 Encryption Options

**Server-Side Encryption (SSE):**
- SSE-S3 (AWS managed keys)
- SSE-KMS (KMS managed keys)
- SSE-C (customer-provided keys)

**Client-Side Encryption:**
- Encrypt before uploading
- Full control over encryption

### S3 Access Logging

- **Purpose:** Track access requests
- **Configuration:** Enable access logging
- **Destination:** Another S3 bucket
- **Use Cases:**
  - Security auditing
  - Compliance
  - Access analysis

### S3 Versioning and MFA Delete

- **Versioning:** Keep multiple object versions
- **MFA Delete:** Require MFA for deletion
- **Benefits:**
  - Data protection
  - Recovery from accidental deletion
  - Compliance

### S3 Block Public Access

- **Purpose:** Prevent public access
- **Settings:**
  - Block public ACLs
  - Block public policies
  - Block public cross-account access
  - Block public access via access points

### Presigned URLs

- **Purpose:** Temporary access to private objects
- **Features:**
  - Time-limited access
  - No AWS credentials needed
  - Secure sharing

---

## 4. Database Security

### RDS Encryption

- **Encryption at Rest:**
  - Enable during creation
  - Uses KMS
  - Cannot be disabled after creation

- **Encryption in Transit:**
  - SSL/TLS connections
  - Force SSL connections
  - Certificate management

### DynamoDB Encryption

- **Encryption at Rest:**
  - Default encryption enabled
  - AWS managed keys
  - Customer managed keys option

- **Encryption in Transit:**
  - HTTPS by default
  - TLS connections

### Database Authentication

- **IAM Database Authentication:**
  - Use IAM roles for database access
  - No password management
  - Enhanced security

- **Native Authentication:**
  - Username/password
  - Regular rotation
  - Strong passwords

### Network Isolation for Databases

- **Private Subnets:** No public access
- **Security Groups:** Restrict access
- **VPC Endpoints:** Private connectivity
- **No Internet Gateway:** Complete isolation

### Database Backup Encryption

- **Encrypted Backups:** Use same key as database
- **Snapshot Encryption:** Encrypted snapshots
- **Cross-Region Replication:** Encrypted replication

---

## 5. EBS and Instance Store Security

### EBS Encryption

- **Default Encryption:** Enable by default
- **Encryption Types:**
  - AWS managed keys
  - Customer managed keys
- **Benefits:**
  - Data at rest protection
  - Snapshot encryption
  - Volume encryption

### Instance Store Encryption

- **Purpose:** Encrypt ephemeral storage
- **Methods:**
  - Application-level encryption
  - OS-level encryption
  - Third-party tools

### EBS Snapshot Security

- **Encryption:** Encrypted snapshots
- **Sharing:** Encrypted snapshot sharing
- **Access Control:** IAM policies
- **Public Sharing:** Avoid public snapshots

---

## 6. Data Classification and Lifecycle

### Data Classification Schemes

- **Public:** No restrictions
- **Internal:** Internal use only
- **Confidential:** Limited access
- **Restricted:** Highly sensitive

### S3 Lifecycle Policies

- **Purpose:** Automate data transitions
- **Transitions:**
  - Standard to IA
  - IA to Glacier
  - Glacier to Deep Archive
- **Expiration:** Automatic deletion

### Data Retention Policies

- **Purpose:** Define retention periods
- **Implementation:**
  - S3 Object Lock
  - Lifecycle policies
  - Compliance requirements

### Data Deletion and Secure Disposal

- **Secure Deletion:**
  - Cryptographic erasure
  - Physical destruction
  - Compliance requirements

---

## 7. Backup and Disaster Recovery

### Backup Encryption

- **Encrypted Backups:** All backups encrypted
- **Key Management:** Use KMS for backup encryption
- **Cross-Region:** Encrypted cross-region backups

### Cross-Region Replication

- **Purpose:** Disaster recovery
- **Configuration:**
  - S3 Cross-Region Replication
  - RDS Read Replicas
  - EBS Snapshot Copy

### Disaster Recovery Strategies

- **Backup and Restore:** Basic DR
- **Pilot Light:** Minimal infrastructure
- **Warm Standby:** Scaled-down environment
- **Multi-Site Active-Active:** Full redundancy

### Backup Testing

- **Regular Testing:** Test restore procedures
- **Documentation:** Restore procedures
- **Validation:** Verify backup integrity
- **Recovery Time Objectives (RTO):** Time to recover
- **Recovery Point Objectives (RPO):** Acceptable data loss

---

## Hands-On Activities

### Activity 1: Create and Manage KMS Keys
1. Create customer managed KMS key
2. Configure key policy
3. Enable automatic rotation
4. Test key usage

### Activity 2: Encrypt S3 Buckets
1. Create S3 bucket
2. Enable encryption (SSE-KMS)
3. Configure bucket policy
4. Test encryption

### Activity 3: Configure S3 Bucket Policies
1. Create bucket policy
2. Test access restrictions
3. Configure presigned URLs
4. Enable access logging

### Activity 4: Encrypt RDS Databases
1. Create RDS instance with encryption
2. Configure SSL connections
3. Test encrypted connections
4. Verify encryption status

### Activity 5: Set Up EBS Encryption
1. Create encrypted EBS volume
2. Launch EC2 with encrypted volume
3. Create encrypted snapshots
4. Test encryption

### Activity 6: Implement S3 Lifecycle Policies
1. Create lifecycle policy
2. Configure transitions
3. Set expiration rules
4. Monitor transitions

### Activity 7: Configure Cross-Region Replication
1. Enable S3 cross-region replication
2. Configure replication rules
3. Test replication
4. Verify encryption

---

## Knowledge Check

1. What is the difference between encryption at rest and in transit?
2. How does AWS KMS work?
3. What are the S3 encryption options?
4. How do you secure RDS databases?
5. What is envelope encryption?
6. How do you implement data lifecycle management?

---

## Additional Resources

- [AWS KMS Documentation](https://docs.aws.amazon.com/kms/)
- [S3 Security](https://docs.aws.amazon.com/AmazonS3/latest/userguide/security.html)
- [RDS Security](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.html)
- [EBS Encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html)

---

## Next Steps

After completing this module:
1. Review your notes
2. Complete all hands-on activities
3. Take the knowledge check
4. Proceed to [Module 5: Monitoring, Logging, and Incident Response](../modules/05_Monitoring_Logging_Incident_Response.md)

---

**Module Completion Checklist:**
- [ ] Read all module content
- [ ] Completed Activity 1: Create and Manage KMS Keys
- [ ] Completed Activity 2: Encrypt S3 Buckets
- [ ] Completed Activity 3: Configure S3 Bucket Policies
- [ ] Completed Activity 4: Encrypt RDS Databases
- [ ] Completed Activity 5: Set Up EBS Encryption
- [ ] Completed Activity 6: Implement S3 Lifecycle Policies
- [ ] Completed Activity 7: Configure Cross-Region Replication
- [ ] Reviewed additional resources
- [ ] Ready to proceed to Module 5
