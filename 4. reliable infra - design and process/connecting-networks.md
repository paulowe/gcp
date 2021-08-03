# Connecting Networks
- Peering
- VPN
- Interconnect

## A. Use VPC peering to connect networks when they are both in Google Cloud (regardless of project, or organization)
- Subnets cannot overlap
- Network admis for each VPC must approve the peering requests

<img width="400" height="300" alt="peering" src="https://user-images.githubusercontent.com/40435982/128070922-27c8ac2d-be09-4e81-bed8-5966783434f4.PNG">

## B. Use Cloud VPN to connect a Google Cloud network to a network on-prem or in another cloud
- 99.9% **monthly SLA**
- For low volume data connections **(up to 3Gbps)**
- Can configure static or **dynamic routes using BGP** (Border Gateway Protocol)

**B1. Classic VPN Gateway Architecture**
<img width="606" alt="classsic-vpn" src="https://user-images.githubusercontent.com/40435982/128071672-b00c40a4-ca85-4257-b107-8233db2d3977.PNG">

Classic VPN gateways have 
- Single network interface
- Sinlge external IP
- Support tunnels using static/ dynamic routing

**B2. High Availability VPN ensures 99.9% availability**
- (On-prem) VPN gateway has 2 network interfaces
- Creates two external IP addresses
- Each gateway supports multiple VPN tunnels

<img width="498" alt="ha-vpn" src="https://user-images.githubusercontent.com/40435982/128072473-9773fdbb-0832-49e7-b036-e169d5ff2bc8.PNG">

**B3. Cloud Router enables dynamic discovery of routes between connected networks**
- Routes updates and exchanged without changing tunnel config
- Via Border gateway protocol

## C. Use Cloud Interconnect when a dedicated high-speed connection is required between networks

**C1. Dedicated interconnect provides a direct connection to a colocation facility**
- 10 TO 200 Gbps
- Must provision your own router in a colocation facility
- To exchange routes, configure a **BGP session** over the interconnect between Cloud router and On-prem router

<img width="800" alt="dedicated-interconnect" src="https://user-images.githubusercontent.com/40435982/128074222-4b7852f0-9c09-4510-8cb2-eaab4839aa7e.PNG">

**C2. Partner Interconnect
- Can purchase less bandwidth from 50 Mbps
- Use this if your data requirements dont warrant a Dedicated interconnect or if you are not nearby a Google PoP

<img width="759" alt="partner-interconnect" src="https://user-images.githubusercontent.com/40435982/128074253-9dafce0a-5c58-43c0-9c46-8f0210d22300.PNG">

Both Interconnect options 
- allow access to VPC resources using internal RFC1918 ip address space
- Private google access for on-prem hosts to access Google services using private Ips 
