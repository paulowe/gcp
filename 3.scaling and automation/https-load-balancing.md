
## (Global LBs) HTTP(S) Load balancing 

- Layer 7 or Application Layer of the OSI Model
- Can handle content based routing if you want to deal with **actual Content of each message** (/default or /video)
- Global Load balancing
- Anycast IP address
- HTTP (port 80 or 8080)
- HTTPS (port 443)
- IPv4 or IPv6
- Autoscaling
- **Routing decisions** based on URLs
- Requests are routed to the nearest instance group to users


# Architecture of an HTTP(S) LB

1. **Global Forwarding rule** - Directs incoming requests from internet to a target HTTP proxy

2. **Target Proxy** - checks each request against a URL map

3. **URL map** - defines which backend service to route requests to

4. Backend service -> 
  - Contains **one or more backends**: same instance group type or different type (audio processing backend (instance group) ; video processing backend (instance group))
  - Backends contain
      - Balancing mode - tells the LB how to determine when backend is at full usage. The balancing mode can be based on requests/s or CPU utilization
      - Capacity scaler - (ceiling % of CPU/ rate targets)
  - Backend service directs requests to appropriate instance groups based on serving capacity, zone and health checks
  - Time out setting (30 sec default)
  - Uses a **round-robin algorithm** to distribute requests across instances. Can be overriden with **Session affinity**

Note: Changes to a LB conifg may take several minutes before they propagate in your network.

**Cross region load balancing** refers to when traffic from users in one region (e.g EMEA) is routed to a backend (managed instance group) in a different region (e.g US) due to reasons such as failed health checks / unavailable capacity in EMEA backend
