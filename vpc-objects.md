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

- Associates objects and services with billling
- Contains networks (up to 5) that can be shared/peered. You may request to increase this default quota

**Networks**

- Has no IP address range
- Global scope
- Contain subnets
- Available as default, auto, or custom netwok types

Default Networks
- Every project has one
- One subnet per region with **non-overlapping CIDR blocks**
- Default firewall rules that allow ingress traffic from ICMP (ping traffic) SSH, and all internal network traffic on any port
