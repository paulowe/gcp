## VMs can have internal and external IP addresses

1. **Internal IP addresses** are allocated from the subnet range to VMs by the [Dynamic Host Configuration Protocol (DHCP)](https://www.efficientip.com/glossary/dhcp-lease/#:~:text=A%20DHCP%20lease%20is%20a%20temporary%20assignment%20of,the%20network%20is%20only%20%E2%80%9Crenting%E2%80%9D%20its%20IP%20address.). The DHCP lease is renewed every 24 hours. Any service that depends on Compute Engine (GKE, GCE, App Engine ...)

                           Symbolic VM name + IP are registeres with network scoped DNS

2. **External IP addresses** are (optionally) allocated to VMs that are externally facing from a pool (ephemeral). Alternatively, you have the option to reserved IP address (static). Static IPs that are not allocated to a forwarding rule / a running VM resource are billed more.

                            VM doesnt know external IP; It is mapped to the internal IP

                          **Note** Although you can create large network sizes that can accomodate a lot of attachable IPs, in GCP there is a limit to the number of instances                             you can provision per network - 15,000 VMs (as of 28 June 2021). Further hardware limitations may exist based on the region/zone. 

