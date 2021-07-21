# (Regional) Network Load Balancing

- **Regional; Non-proxied LB** (all traffic is passed through the LB instead of being proxied)
- Supported Traffic:
  - UDP
  - TCP / SSL ports (on ports that are not supported by TCP and SSL proxy services)

- Uses forwarding rules to balance load of your systems **based on the incoming IP protocol data**
- Architecture
   - Backend-service based (Newer)
   - Target pool-based (Older)

Backend service (regional)
- Defines how to distribute traffic to its instance groups
- Non-legacy health checks (http)
- Configurable failover policy

Target pool
- Up to 50 target pools and 
- each pool can only have one health check 
