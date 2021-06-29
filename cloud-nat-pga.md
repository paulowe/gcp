## Cloud NAT and Private Google Access

VM instances without external IP addresses are isolated from external networks.

Scenario: For instances without and external IP

**Cloud NAT gateway** - enables instances to create egress (outbound) connections to internet clients outside the Google Network

Using Cloud NAT, these instances can access the internet for updates and patches, and in some cases, for bootstrapping. As a managed service, Cloud NAT provides high availability without user management and intervention.

**Private Google Access** - enables such instances to communicate with other GCP APIs, services and resources 

Enabled at the subnet level

**Connecting through Identity Aware Proxy (IAP) tunnel**

IAP TCP forwarding allows administrative access to VM instances that do not have public IP addresses or do not permit direct access over the internet.

IAP TCP forwarding allows you to establish an encrypted tunnel over which you can forward SSH, RDP, and other traffic to VM instances. 

IAP TCP forwarding also provides you fine-grained control over which users are allowed to establish tunnels and which VM instances users are allowed to connect to.

In order to connect to your private instance using SSH, you need to 
- open an appropriate port on the firewall (tcp : 22). 
- IAP connections come from a specific set of IP addresses (35.235.240.0/20). Therefore, you can limit the firewall rule to this CIDR range.

When instances do not have external IP addresses, they can only be reached by other instances on the network via a managed VPN gateway or via a Cloud IAP tunnel. Cloud IAP enables context-aware access to VMs via SSH and RDP without bastion hosts
