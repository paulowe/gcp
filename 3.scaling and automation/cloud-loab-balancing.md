# Load Balancing and Autoscaling

## Overview

[Managed Instance Groups]()

[Autoscaling and Health checks]()

[HTTP(S) Load Balancing]()

[Lab]()

[SSL Proxy/TCP Proxy Load Balancing]()

[Network Laod Balancing]()

[Internal Load Balancing]()

[Lab]()

[Choosing a Load Balancer]()

## Cloud Load Balancer
Ability to distribute Load Balanced Compute resources in 
- **Single or multiple regions** to 
- meet your **High Availibility** requirements 
- behind a **single anycast IP**
- intelligent **autoscaling**

Using CLB you can 
- Serve content as close as possible to users
- Respond to **1M queries per second**

Cloud Load balancing is a **fully distributed, software-defined, managed service**. 

It is not instance or device based, therefore you do not need to manage any infrastructure.

### Global and Regional LB
GCP offers **two categories of LB**

1. Global (leverage **Google Frontends** which are software defined; globally distributed systems that sit in Goggle's PoPs.)
  - HTTP(S)
  - SSL proxy
  - TCP proxy

Use Global load balancers when your users are globally distributed ; Your users need access to the same content ; and you want to provide access using a single anycast IP

2. Regional (Distribute traffic to instances in a single region)
  - Internal TCP/UDP (Uses **Andromena** - GCP software defined network virtualization stack)
  - Network TCP/UDP (Uses **Maglev** - Large distributed software system)
  - Internal HTTP(S) (Proxy based ; regional ; Layer 7 ; Enables run and scale services behind a private load balancing IP address ; in your region )
