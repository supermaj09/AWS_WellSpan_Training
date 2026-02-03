# Module 3: Network Security

## Learning Objectives

By the end of this module, you will be able to:
- Design secure network architectures
- Implement network segmentation
- Configure VPC security
- Understand AWS network security services
- Protect against DDoS attacks

## Estimated Time: 10-12 hours

---

## 1. Virtual Private Cloud (VPC) Security

### VPC Design Best Practices

- **CIDR Block Selection**
  - Choose non-overlapping CIDR blocks
  - Plan for future growth
  - Consider peering requirements

- **Subnet Design**
  - Separate public and private subnets
  - Use multiple Availability Zones
  - Reserve IP addresses for future use

- **Route Table Configuration**
  - Separate route tables for public/private subnets
  - Minimal routes in private subnets
  - Route table associations

### Subnet Configuration

**Public Subnets:**
- Direct internet access via Internet Gateway
- Host load balancers, NAT gateways
- No sensitive resources

**Private Subnets:**
- No direct internet access
- Host application servers, databases
- Access internet via NAT Gateway

**Isolated Subnets:**
- No internet access (no NAT)
- Host databases, backup systems
- Maximum security

### Security Groups

- **Stateful Firewall:** Tracks connection state
- **Instance Level:** Applied to EC2 instances
- **Default Deny:** All traffic denied by default
- **Rules:** Allow rules only (no explicit deny)

**Best Practices:**
- Least privilege rules
- Specific ports and protocols
- Source IP restrictions
- Regular reviews

### Network ACLs (NACLs)

- **Stateless Firewall:** No connection tracking
- **Subnet Level:** Applied to subnets
- **Default Allow:** All traffic allowed by default
- **Rules:** Both allow and deny rules

**Best Practices:**
- Use for additional layer of security
- Deny specific traffic
- Ephemeral port ranges
- Numbered rules (evaluated in order)

### VPC Flow Logs

- **Purpose:** Capture IP traffic flow
- **Destinations:** CloudWatch Logs, S3, Kinesis
- **Use Cases:**
  - Network troubleshooting
  - Security monitoring
  - Compliance auditing

### VPC Endpoints

- **Purpose:** Private connectivity to AWS services
- **Types:**
  - Gateway endpoints (S3, DynamoDB)
  - Interface endpoints (other services)
- **Benefits:**
  - No internet gateway needed
  - Improved security
  - Lower latency

---

## 2. Network Segmentation

### Public vs. Private Subnets

**Public Subnets:**
- Internet Gateway route
- Public IP addresses
- Load balancers, NAT gateways

**Private Subnets:**
- NAT Gateway route
- Private IP addresses only
- Application servers, databases

### DMZ Architecture

- **Purpose:** Isolated network segment
- **Components:**
  - Public-facing services
  - Limited access to internal resources
  - Multiple security layers

### Multi-VPC Architectures

- **Account Isolation:** Separate VPCs per account
- **Environment Separation:** Dev, Test, Prod VPCs
- **VPC Peering:** Connect VPCs
- **Transit Gateway:** Centralized connectivity

### Transit Gateway Security

- **Centralized Routing:** Single network hub
- **Security Features:**
  - Route table filtering
  - VPN attachments
  - Cross-account sharing
- **Best Practices:**
  - Route table segmentation
  - Security group references
  - Monitoring and logging

---

## 3. AWS Network Security Services

### AWS WAF (Web Application Firewall)

- **Purpose:** Protect web applications
- **Features:**
  - Custom rules
  - Managed rule sets
  - Rate limiting
  - Geographic restrictions

**Use Cases:**
- SQL injection protection
- XSS protection
- Rate limiting
- IP filtering

### AWS Shield

- **Standard:** Free DDoS protection
- **Advanced:** Enhanced protection with 24/7 support
- **Features:**
  - Automatic DDoS mitigation
  - Cost protection
  - Real-time notifications

### AWS Network Firewall

- **Purpose:** Managed network firewall service
- **Features:**
  - Stateful inspection
  - Intrusion detection/prevention
  - Web filtering
  - Custom rules

### AWS PrivateLink

- **Purpose:** Private connectivity to services
- **Benefits:**
  - No internet exposure
  - Simplified network architecture
  - Improved security

### AWS Direct Connect Security

- **Purpose:** Dedicated network connection
- **Security Features:**
  - Private connectivity
  - Encryption options
  - BGP routing
  - VPN backup

---

## 4. VPN and Connectivity

### Site-to-Site VPN

- **Purpose:** Connect on-premises to AWS
- **Components:**
  - Virtual Private Gateway
  - Customer Gateway
  - VPN tunnels
- **Security:**
  - IPsec encryption
  - BGP routing
  - Redundant tunnels

### Client VPN

- **Purpose:** Remote user access
- **Features:**
  - SSL/TLS VPN
  - User authentication
  - Network access control
  - Split tunneling

### VPN Security Best Practices

- **Encryption:** Strong encryption algorithms
- **Authentication:** Certificate-based authentication
- **Monitoring:** VPN connection monitoring
- **Redundancy:** Multiple VPN tunnels

### Encryption in Transit

- **TLS/SSL:** Application layer encryption
- **IPsec:** Network layer encryption
- **HTTPS:** Web traffic encryption
- **VPN:** Site-to-site encryption

---

## 5. DNS Security

### Route 53 Security Features

- **DNSSEC:** DNS security extensions
- **Private Hosted Zones:** Internal DNS
- **Health Checks:** Application monitoring
- **Traffic Flow:** Advanced routing

### DNS Filtering

- **Purpose:** Block malicious domains
- **Implementation:**
  - Route 53 Resolver
  - DNS Firewall
  - Custom rules

### DNSSEC

- **Purpose:** DNS authentication
- **Features:**
  - DNS record signing
  - Validation
  - Protection against DNS spoofing

---

## Hands-On Activities

### Activity 1: Create Secure VPC
1. Create VPC with public and private subnets
2. Configure route tables
3. Set up Internet Gateway and NAT Gateway
4. Verify connectivity

### Activity 2: Configure Security Groups and NACLs
1. Create security groups for different tiers
2. Configure NACLs for subnet protection
3. Test connectivity
4. Review and refine rules

### Activity 3: Enable VPC Flow Logs
1. Create CloudWatch Log Group
2. Enable VPC Flow Logs
3. Analyze flow log data
4. Create CloudWatch Insights queries

### Activity 4: Set Up AWS WAF
1. Create WAF Web ACL
2. Configure managed rule sets
3. Create custom rules
4. Associate with CloudFront/ALB

### Activity 5: Configure AWS PrivateLink
1. Create VPC endpoint
2. Configure endpoint policy
3. Test connectivity
4. Verify security

### Activity 6: Implement Network Segmentation
1. Design multi-tier architecture
2. Create separate subnets for each tier
3. Configure security groups
4. Test isolation

---

## Knowledge Check

1. What is the difference between security groups and NACLs?
2. How do you design a secure VPC?
3. What are VPC endpoints used for?
4. How does AWS WAF protect web applications?
5. What is AWS Shield used for?
6. How do you implement network segmentation?

---

## Additional Resources

- [VPC Documentation](https://docs.aws.amazon.com/vpc/)
- [Security Groups](https://docs.aws.amazon.com/vpc/latest/userguide/security-groups.html)
- [AWS WAF](https://docs.aws.amazon.com/waf/)
- [AWS Shield](https://docs.aws.amazon.com/shield/)

---

## Next Steps

After completing this module:
1. Review your notes
2. Complete all hands-on activities
3. Take the knowledge check
4. Proceed to [Module 4: Data Protection](../modules/04_Data_Protection.md)

---

**Module Completion Checklist:**
- [ ] Read all module content
- [ ] Completed Activity 1: Create Secure VPC
- [ ] Completed Activity 2: Configure Security Groups and NACLs
- [ ] Completed Activity 3: Enable VPC Flow Logs
- [ ] Completed Activity 4: Set Up AWS WAF
- [ ] Completed Activity 5: Configure AWS PrivateLink
- [ ] Completed Activity 6: Implement Network Segmentation
- [ ] Reviewed additional resources
- [ ] Ready to proceed to Module 4
