# Cloud VPN securely connects your on-prem network to your GCP VPC network

- Connects your on-prem with GCP VPC through an **IPSec VPN tunnel**
- You need **two VPN tunnels** To establish a connection
- Traffic travelling between the two networks is 
    - **Encrypted by one VPN gateway** and 
    - **Decrypted by the other VPN gateway**
 
This protects data travelling over the internet

**Cloud VPN features :**
- Useful for low-volume data connections
- 99.9% SLA
- Supports:
  - Site-to-site VPN
  - Static routes
  - Dynamic routes (configured with Cloud Router) 
  - IKEv1 and IKEv2 ciphers

Cloud VPN does not support connections where a client computers need to dial in to another VPN network using one VPN software

## VPN Topology

<img src="" />


**VPN Gateways**

Cloud VPN gateway is a **regional resource** that uses a regional External IP

On-prem VPN gateway can be :
  - Physical device/hardware, or
  - Software based
  - Has a **Maximum Transmission Unit (MTU) of 1460bytes** due to the encryption and encapsulation of packets

The on-prem VPN gateway also has an external IP address

**VPN Tunnel**

- Serves as the medium for **private; encrypted communication** between the two gateways
- Each tunnel defines the connection from the perspective of its gateway and traffic flows only when the pair of tunnels is established

## Dynamic routing with Cloud Router
In order to use DYnamic routes, you need to configure CLoud Router.

**Cloud Router**
Cloud Router is a routing method that manages routes from a VPN tunnel using the **Border Gateway Protocol**. This routing method enables routes to be updated and exchanged without changing the tunnel configuration
