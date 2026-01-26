# AWS Storage & Operations Training Package

## Target Audience
Engineers transitioning to AWS or supporting cloud workloads, including:
- System Administrators  
- DevOps Engineers  
- Infrastructure Engineers  
- Site Reliability Engineers (SRE)

## Duration
3–5 days (or modular sessions)

---

## 1. Learning Objectives

By the end of this course, participants will be able to:

- Design and operate AWS storage solutions  
- Deploy and manage Amazon RDS databases  
- Implement backup, monitoring, and security best practices  
- Optimize performance and cost  
- Handle incidents and recovery scenarios  
- Apply operational excellence principles  

---

## 2. Course Modules

---

### Module 1: AWS Storage Overview

#### Topics
- AWS Global Infrastructure  
- Shared Responsibility Model  
- Storage categories:
  - Object storage (Amazon S3)  
  - Block storage (Amazon EBS)  
  - File storage (Amazon EFS, Amazon FSx)  
  - Database storage (Amazon RDS, DynamoDB)  
- Use case mapping  

#### Lab
- Explore AWS Management Console  
- Identify storage services  
- Create an S3 bucket and upload objects  

---

### Module 2: Amazon S3 Deep Dive

#### Topics
- Buckets and objects  
- Storage classes  
- Versioning  
- Lifecycle policies  
- Encryption (SSE-S3, SSE-KMS)  
- Access control (IAM, bucket policies, ACLs)  
- Replication (CRR, SRR)  
- Static website hosting  

#### Operations Focus
- Monitoring with Amazon CloudWatch  
- Logging with AWS CloudTrail  
- Cost optimization  
- Data protection strategies  

#### Labs
- Create an S3 bucket with encryption and versioning  
- Configure lifecycle rules  
- Set bucket policy  
- Enable replication  
- Host a static website  

---

### Module 3: Amazon EBS & EFS

#### Topics
- EBS volume types (gp3, io2, st1, sc1)  
- Snapshots and backup  
- Multi-AZ usage  
- Performance tuning  
- EFS concepts and throughput modes  
- Security and encryption  

#### Labs
- Attach an EBS volume to an EC2 instance  
- Create snapshot and restore data  
- Mount EFS to an EC2 instance  

---

### Module 4: Amazon RDS (Relational Database Service)

#### Topics
- Supported engines (MySQL, PostgreSQL, SQL Server, Oracle, Aurora)  
- Instance types and storage options  
- Multi-AZ deployments  
- Read replicas  
- Backups and snapshots  
- Parameter groups  
- Security (VPC, Security Groups, IAM, KMS)  
- Maintenance windows  
- Patching and upgrades  

#### Operations Focus
- Monitoring (CloudWatch, Performance Insights)  
- Failover scenarios  
- Scaling strategies  
- Disaster recovery  
- Cost management  

#### Labs
- Deploy an RDS instance  
- Enable Multi-AZ  
- Create a read replica  
- Perform backup and restore  
- Simulate failover  

---

### Module 5: Backup & Disaster Recovery

#### Topics
- AWS Backup  
- Snapshot strategies (EBS, RDS)  
- Cross-region replication  
- RPO and RTO concepts  
- DR architectures:
  - Pilot light  
  - Warm standby  
  - Multi-site  
- Testing recovery plans  

#### Lab
- Configure an AWS Backup plan  
- Restore a resource from backup  

---

### Module 6: Monitoring & Operations

#### Topics
- CloudWatch metrics and alarms  
- Logs and dashboards  
- AWS CloudTrail  
- AWS Config  
- Amazon EventBridge  
- AWS Systems Manager (SSM)  
- Incident response workflows  

#### Lab
- Create a CloudWatch alarm  
- Build a monitoring dashboard  
- Use SSM Session Manager  

---

### Module 7: Security & Compliance

#### Topics
- Encryption at rest and in transit  
- IAM roles and policies  
- AWS Key Management Service (KMS)  
- AWS Secrets Manager  
- Network security  
- Least privilege  
- Auditing and logging  

#### Lab
- Encrypt RDS using KMS  
- Restrict S3 access using bucket policies  
- Enable CloudTrail  

---

### Module 8: Cost Optimization

#### Topics
- Storage class analysis  
- Rightsizing RDS  
- Reserved Instances  
- Lifecycle policies  
- Cost Explorer  
- Budgets  
- S3 Intelligent-Tiering  

#### Lab
- Configure a budget  
- Analyze storage usage  

---

### Module 9: Automation & Infrastructure as Code

#### Topics
- AWS CloudFormation / Terraform (optional)  
- Automated backups  
- Scheduled snapshots  
- Tagging strategies  
- DevOps pipelines overview  

#### Lab
- Deploy S3 and RDS using a CloudFormation template  

---

### Module 10: Capstone Project

#### Scenario
Design and implement a production-ready architecture including:
- EC2 application  
- RDS backend  
- S3 storage  
- Backup plan  
- Monitoring  
- Security controls  
- Cost optimization  

#### Deliverables
- Architecture diagram  
- Deployment  
- Presentation  
- Incident recovery demonstration  

---

## 3. Training Materials Package

### A. Slide Decks
One per module, including:
- Diagrams  
- Best practices  
- Real-world scenarios  
- Comparison tables  

### B. Lab Guides (Step-by-step)
- Objectives  
- Prerequisites  
- Instructions  
- Expected results  
- Cleanup steps  

### C. Student Workbook
- Key notes  
- Glossary  
- Architecture diagrams  
- Checklists  

### D. Assessments
- Quizzes per module  
- Final practical exam  
- Scenario-based questions  

---

## 4. Example Weekly Schedule (5 Days)

**Day 1**
- AWS basics  
- Amazon S3  
- Amazon EBS & EFS  

**Day 2**
- Amazon RDS deep dive  
- Hands-on labs  

**Day 3**
- Backup and disaster recovery  
- Monitoring and operations  

**Day 4**
- Security  
- Cost optimization  
- Automation  

**Day 5**
- Capstone project  
- Review  
- Assessment  

---

## 5. Key Real-World Scenarios to Teach

- RDS outage and failover  
- Accidental S3 deletion and recovery  
- Performance tuning for slow databases  
- Cost spikes from storage misuse  
- Security breach investigation  
- Cross-region disaster recovery  

---

## 6. Tools to Include

- AWS Management Console  
- AWS CLI  
- Amazon CloudWatch  
- AWS Backup  
- AWS CloudFormation  
- AWS Systems Manager (SSM)  
- IAM  
- AWS Cost Explorer  