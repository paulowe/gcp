### VPC Network
- Each VPC is contained in a GCP Project
- You can provision Cloud platform resources in VPC
- You can connect VPC - VPC
- Use Firewalls to restric access

### The VPC networks have Global Scope; Subnets are regional
- A subnet can have resources from different zones
- Can dynamically increase the size of the subnet by expanding the range of IP addresses allocated (without affecting 
  existing resources)
  
#### You can use this to build resilient solutions with simple network layout

### 1. Routing Tables
Used to forward traffic from one instance to another instance

**You DO NOT have to provision or manage this component**

### 2. Firewall instances
Use the network Firewall to control what network traffic is allowed

**You DO NOT have to provision or manage this component**

### 3. Cloud Load Balancer
A single Anycast IP

Monitors the health status of your VMs

Highly available

### 4. VPC Peering

Recall: VPCs belong to projects

Use VPC Peering for VPC to interconnect/exchange traffic across GCP projects

### 5. Shared VPC

For finer grained control of who/what in one project can interact with a VPC in another using IAM

Use Shared VPC to share a netowrk or individual subnets, with other GCP projects
### Quickstart
You can define your own VPC or use the default
