\[Overview](https://github.com/paulowe/gcp/blob/main/readme.md)

[Next](https://github.com/paulowe/gcp/blob/main/ip-addresses.md)

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
- Each subnet is associated with a **private RFC 1918 CIDR block** for its internal IP addresses range and 
- A gateway

**Auto Mode Networks**
  
- **One subnet per region** is automatically created within the AM network
- The automatically created **subnets use a set of predefined IP ranges with a /20 mask** (2^12 available IPs/devices; 4 IPs reserved in each subnet) (a mask is simply the "subnet-id" in an IP address) 
- Expandable up to /16 (2^16 available IPs)
- **All the subnets fit in the 10.128.0.0/9 CIDR block** (2^11 unique subnets, or "regions" can exist and be supported by one default AM network)

  Its 2^11 because we use the first 9 bits as a network-id or "CIDR block", and we have 7 bits in the 2nd byte remaining and 4 bits from the third byte to compute 2^11         unique subnet-ids
  
  **Limitations of AM Networks**
  
   Auto mode networks are easy to set up and use because they automatically create subnets in each region. However, you don't have complete control over the subnets created in your VPC network, including regions and IP address ranges used. Feel free to explore more [considerations for choosing an auto mode network](https://cloud.google.com/vpc/docs/vpc#auto-mode-considerations)
   
**Custom Mode**
  
  - **Complete control** over subnets and IP ranges
  - No default subnets created
  - Decide which subnets to create and in which region
  - Using customer specified **IP ranges within the RFC 1918 adress space**
  - IP ranges cannot overlap between subnets of the same network

**Note :** You can convert an Auto Mode network -> Custom network, but not the other way around

**Routes**

Routes tell VM instances and the VPC network how to send traffic from ann instance to a destination, either inside the network or outside Google Cloud.

Default routes: 
- Route ttraffic among subnets
- Send traffic from eligible instances to the internet

**Firewall Rules**
Firewall rules allow you to control which packets are allowed to travel to which destinations

Default (implied) Firewall rules
-  Block all incoming connections and 
-  Allow all outgoing connections.

 4 Ingress firewall rules for the default network:

- default-allow-icmp - allows ping traffic to reach a VM's external IP address
- default-allow-rdp
- default-allow-ssh - ssh into machine for admin purposes
- default-allow-internal - allow local traffic for instances within the VPC to reach other instances using internal ip

These firewall rules allow ICMP, RDP, and SSH ingress traffic from anywhere

**One benefit of applying firewall rules by tag rather than by address** is that when a VM is created with a matching tag, the firewall rules apply irrespective og the IP address it is assigned.

When a VM is created the ephemeral external IP address is assigned from a pool. There is no way to predict which address will be assigned, so there is no way to write a rule that will match that VM's IP address before it is assigned. Tags allow a symbolic assignment that does not depend on order in the IP addresses. It makes for simpler, more general, and easier to maintain, firewall rules.

### Communication in VPC Networks

VMs in the same network **can communicate with each other using Internal IPs** (Regardless of whether they ar ein separate regions)

    - The VMs take advantage of Google's global Fibre network

    - Appear as though they are on the same rack

VMs in separate networks **cannot communicate with each other using Internal Ips** (Regardless of whether they are in the same region)

    - By default VMs must communicate using External IP
    
    - Traffic is not going through the internet, but is going through Google's Edge Routers. 
      This has billing and security ramifications
      
On-prem communication to your GCP network can be done using a single **VPN Gateway**. 

    - Reduces cost
    
    - Reduces Network management complexity
   
   
**Subnet cross-zones**

A subnet is simply an IP address you can use within a defined range

    - VMs can be on the same subnet but different zones
    
    - A single firewall rule can apply to both VMs in a subnet. Regardless of their zone
    
**Expand subnets without re-creating instances**

    - Expand IP address range without workload interruption 

    - Cannot overlap with other subnets in the same network, in any region

    - Can expand but not shrink

    - Must be in the RFC 1918 address space / range

    - Avoid large, wasteful subnets - This may cause CIDR range collisions when working
      with VPC Network Peering or when configuring a VPN connections to an On-prem network



