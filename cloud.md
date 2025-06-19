# Cloud Concepts
### Cloud Storage
##### 1. What are the different types of cloud storage services?
**Answer:**  
* **Object Storage** (e.g., Amazon S3, Azure Blob): Stores data as objects; ideal for unstructured data like images and
backups.
* **Block Storage** (e.g., AWS EBS, Azure Managed Disks): Stores data in blocks; ideal for databases and OS-level 
operations.
* **File Storage** (e.g., Amazon EFS, Azure Files): Shared file systems accessible over a network; used for shared 
access and legacy apps.

### Networking
##### 1. What is a Virtual Network (VNet/VPC)?
**Answer:**  A VNet (Azure) or VPC (AWS/GCP) is a logically isolated network in the cloud. It allows cloud resources
(VMs, databases, services) to communicate with each other securely, as well as with on-prem or internet-connected
networks.
##### 2. What is Public vs Private Subnets?
**Answer:** 
* **Public subnet:** Resources have direct internet access (via public IP and route to an Internet Gateway).
* **Private subnet:** No direct internet access; used for internal resources (like databases).
##### 3. What is IP addressing and CIDR?
**Answer:** CIDR (Classless Inter-Domain Routing) defines IP ranges (e.g., 10.0.0.0/16). It's used to allocate IPs for 
subnets and route traffic in a cloud network.
##### 4. What is NAT?
**Answer:** Network Address Translation (NAT) enables private subnet instances to access the internet 
(e.g., updates, API calls) without exposing them to incoming internet traffic.
##### 5. What is DNS in the cloud?
**Answer:** DNS (Domain Name System) resolves domain names to IP addresses. Cloud providers offer DNS services 
(e.g., Route 53, Azure DNS) to manage domain records and internal DNS resolution.
##### 6. How to connect on-prem to cloud?
**Answer:** 
* VPN Gateway: Encrypted connection over the public internet.
* Direct Connect / ExpressRoute / Interconnect: Dedicated private lines for high-performance hybrid networking.
##### 7. How does AWS Transit Gateway compare to VPC peering in terms of scalability and routing complexity?
**Answer:**
* Transit Gateway (TGW): Hub-and-spoke model supporting thousands of VPCs; 
centralizes routing and simplifies management.
* VPC Peering: Point-to-point; does not scale well for many VPCs; 
no transitive routing.
* Use TGW for multi-VPC, multi-account architectures.
##### 8. When would you use AWS PrivateLink over Gateway Endpoints?
**Answer:** Use PrivateLink to privately access SaaS or AWS services via VPC endpoints. 
Gateway Endpoints are limited to S3 and DynamoDB and use route tables instead of ENIs.
##### 9. How do you implement network segmentation using AWS tools?
**Answer:** Use Security Groups and NACLs with subnet isolation. Deploy shared services in a centralized VPC and connect
via Transit Gateway. Use tagging and IAM policies for control.
##### 10. How do you secure a public ALB for both public and protected access?
**Answer:**  Attach AWS WAF for basic protection, configure Cognito user pools for authentication, and use ALB listener rules to
route traffic based on path or header.
##### 11. How do you implement hybrid DNS resolution between Route 53 and on-prem?
**Answer:**  Use Route 53 Resolver with inbound/outbound endpoints and forwarding rules. Allow on-prem DNS to query 
cloud domains and vice versa through conditional forwarding.