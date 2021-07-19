
## (Global LBs) HTTP(S) Load balancing 

- Layer 7 or Application Layer of the OSI Model - **Deals with actual Content of each message**
- Global Load balancing
- Anycast IP address
- HTTP (port 80 or 8080)
- HTTPS (port 443)
- IPv4 or IPv6
- Autoscaling
- **Routing decisions** based on URLs
- Requests are routed to the nearest instance group to users


# Architecture of an HTTP(S) LB

Global Forwarding rule - Directs incoming requests from internet to a target HTTP proxy

Target Proxy - checks each request against a URL map

URL map - defines which backend service to route requests to

Backend service -> 
  - Contains **one or more backends**: audio processing backend (managed/unmanaged instance group) ; video processing backend (instance group)
  - Backends contain
      - Balancing mode - tells the LB how to determine when backend is at full usage. The balancing mode can be based on requests/s or CPU utilization
      - Capacity scaler - (ceiling % of CPU/ rate targets)
  - Backend service directs requests to appropriate instance groups based on serving capacity, zone and health checks
  - Time out setting (30 sec default)
  - Uses a **round-robin algorithm** to distribute requests across instances. Can be overriden with **Session affinity**

Note: Changes to a LB conifg may take several minutes before they propagate in your network.
