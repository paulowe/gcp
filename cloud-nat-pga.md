[Overview](https://github.com/paulowe/gcp/blob/main/readme.md)

[Next](https://github.com/paulowe/gcp/blob/main/virtual-machines-overview.md)

## Cloud NAT and Private Google Access

VM instances without external IP addresses are isolated from external networks.

Scenario: For instances without and external IP

**Cloud NAT gateway** - The Cloud NAT gateway implements outbound NAT, but not inbound NAT. In other words, hosts outside of your VPC network can only respond to connections initiated by your instances; they cannot initiate their own, new connections to your instances via NAT.

Using Cloud NAT, these instances can access the internet for updates and patches, and in some cases, for bootstrapping. As a managed service, Cloud NAT provides high availability without user management and intervention.

Cloud NAT uses NAT gateway to manage those connections. **A NAT gateway is region- and VPC network-specific.** If you have VM instances in multiple regions, you'll need to create a NAT gateway for each region. 

<img src="https://github.com/paulowe/gcp/blob/main/captures/Capture%207.PNG" width="300" height="200" />

Furthermore,  You can configure Cloud NAT to allow traffic from 
- all ranges of all subnets in a region, 
- from specific subnets in the region only, or 
- from specific primary and secondary CIDR ranges only.

The NAT mapping section allows you to choose the subnets to map to the NAT gateway. You can also manually assign static IP addresses that should be used when performing NAT. 

**Cloud NAT Logging** - allows you to log NAT connections and errors.

When Cloud NAT logging is enabled, one log entry can be registered when
- a network connection using NAT is created
- a packet is dropped because no port was available for NAT

You may log one or both events. Logs are sent to *Cloud Logging*

**Google Cloud Router** dynamically exchanges routes between your Virtual Private Cloud (VPC) and on-premises networks by using Border Gateway Protocol (BGP)

**Private Google Access** - enables such instances to communicate with other GCP APIs, services and resources 

<img src="https://github.com/paulowe/gcp/blob/main/captures/Capture%206.PNG" width="300" height="200" />

Enabled at the subnet level

**Connecting through Identity Aware Proxy (IAP) tunnel**

IAP TCP forwarding allows administrative access to VM instances that do not have public IP addresses or do not permit direct access over the internet.

IAP TCP forwarding allows you to establish an encrypted tunnel over which you can forward SSH, RDP, and other traffic to VM instances. 

IAP TCP forwarding also provides you fine-grained control over which users are allowed to establish tunnels and which VM instances users are allowed to connect to.

In order to connect to your private instance using SSH, you need to 
- open an appropriate port on the firewall (tcp : 22). 
- IAP connections come from a specific set of IP addresses (35.235.240.0/20). Therefore, you can limit the firewall rule to this CIDR range.

When instances do not have external IP addresses, they can only be reached by other instances on the network via a managed VPN gateway or via a Cloud IAP tunnel. Cloud IAP enables context-aware access to VMs via SSH and RDP without bastion hosts

IAP uses your existing project roles and permissions when you connect to VM instances. By default, instance owners are the only users that have the IAP Secured Tunnel User role. If you want to allow other users to access your VMs using IAP tunneling, you need to grant this role to those users.

Review Course 2: Implementing Private Google Access and Cloud NAT Lab
