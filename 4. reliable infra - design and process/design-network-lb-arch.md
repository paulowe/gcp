# Overview of Hybrid network architectures
- Design VPC networks to optimize for cost, security and performance
- Configure Global load balancers to provide access to services
- Leverage Cloud CDN to provide lower latency and decrease network egress
- Evaluate network architecture using Network Intelligence Center
- Connect networks using peering, VPN and Cloud Interconnect

## A single VM can have multiple network interfaces connection to different networks
- Up to 8 interfaces per VM
- Each network must have a subnet in the region the VM is created in
- Each interface must be attached to a different VPC

## A shared VPC is created in one project, but can be shared and used by other projects
- Enables resources to communicate securely with each other using Private IPs
- **Requires an organization**

## Desinging Google Cloud Load Balancers
Use a gloabl load balancer to provide access to services deployed in multiple regions
- Global Load balancing is Supported by HTTP(S), SSL, and TCP proxies
- HTTP load balancer routes requests to the region closest to the user (using an anycast IP)

Use a regional load balancer to provide access to services deployed in a single region
- Supported by HTTP, TCP, UDP load balancers
- Can have a public or private IP address
- Can use any TCP or UDP port

**Secure Load balancers with a public IP with SSL**.
- Supported by HTTP and TCP load balancers
- SSL certificates can be self-manages or Google-managed

For **lower latency and decreased egress** cost leverage Cloud CDN
- Can be enabled when configuring the HTTP global load balancer
- Caches static content worldwide using **Google Cloud edge-caching location**
- Cache static data from web-servers, GKE pods, or Cloud Storage buckets

## Network Intelligence Center can be used to visualize network topology and test network connectivity
You can test network connectivity by selecting
- Protocol and Port
- Destination and Source 
  - Source and destination endpoints in your VPC network
  - From internet -> VPC network and vice versa
  - From on-prem network -> VPC network and vice versa   

## Defining network characteristics for each microservice criteria (so you can choose a load balancer)
- Internet facing or internal?
- HTTP, TCP or UDP?
- Multiregional?


