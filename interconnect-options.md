## Interconnect Options

1. VPN
  - Over the internet using the **IPSec Protocol**
  - Cloud Router is what allows other networks and your VPC to exchange route information over the VPN
    using the **Border gateway protocol**

2. Direct Peering
  - Peering means putting a router in the same public data center as a Google point of presence and exchanging traffic
  - Peering **is not** covered by a Google SLA

Customers who want the highest uptime for their interconnection should use **Dedicated Interconnect**

3. Carrier Peering
  - Connection through the largest partner network of service providers for customers who are not in one of the Google points of presence
 
4. Dedicated Interconnect
  - Consistent, reliable bandwidth and uptime
  - Private connection to Google
  - Up to 99.9% SLA coverage
  - Can also use VPN for even greater reliability
