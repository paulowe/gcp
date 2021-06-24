## VPC Objects

In GCP you can **provision, connect, or isolate resources in a Virtual Private Cloud**

You can define fine-grained policies for resources between GCP VPCs, On-prem or other public cloud environment.

## VPC is a comprehensive set of Google managed networking objects
- Projects
- Networks
    - Default, Auto mode, Custom mode
- Subnets - to divide/segregate your environment
- Regions and Zones 
- IP Addresses
    - Internal, external, IP address range selection capabilities
 - VMs
 - Routes
 - Firewalls 

### Projects, networks and subnetworks

**Projects**

- Associates objects and services with **billing**
- **Contain entire networks** (up to 5) that 
- Can be **shared/peered with projects in other networks**. 
- You may **request to increase this default quota** in the Google Cloud Console

**Networks**
 
- Networks are constructs of all IP address range
- Global scope; Spanning all GCP Regions
- Contain subnets
- Available as default, auto, or custom netwok types

  **Default Networks**
  
- Every project has one
- One subnet per region with **non-overlapping CIDR blocks**
- Default firewall rules that allow ingress traffic from ICMP (ping traffic) SSH, and all internal network traffic on any port

  **Auto Mode Networks**
  
- **One subnet per region** is automatically created within the AM network
- The automatically created **subnets use a set of predefined IP ranges with a /20 mask** (2^12 available IPs/devices; 4 IPs reserved in each subnet) (a mask is simply the "subnet-id" in an IP address) 
- Expandable up to /16 (2^16 available IPs)
- **All the subnets fit in the 10.128.0.0/9 CIDR block** (2^11 unique subnets, or "regions" can exist and be supported by one default AM network)

  Its 2^11 because we use the first 9 bits as a network-id or "CIDR block", and we have 7 bits in the 2nd byte remaining and 4 bits from the third byte to compute 2^11         unique subnet-ids
  