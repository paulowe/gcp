## Cloud NAT and Private Google Access

VM instances without external IP addresses are isolated from external networks.

Scenario: For instances without and external IP

**Cloud NAT gateway** - enables instances to create egress (outbound) connections to internet clients outside the Google Network

Using Cloud NAT, these instances can access the internet for updates and patches, and in some cases, for bootstrapping. As a managed service, Cloud NAT provides high availability without user management and intervention.

**Private Google Access** - enables such instances to communicate with other GCP services/resources 

Enabled at the subnet level

**Connecting through Identity Aware Proxy (IAP) tunnel**

