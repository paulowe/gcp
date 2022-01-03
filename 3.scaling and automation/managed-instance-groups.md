[Next](https://github.com/paulowe/gcp/blob/main/3.scaling%20and%20automation/https-load-balancing.md)
# Managed Instance Groups
m
- Deploy identical instances based on instance template
- Instance group can be resized
- Manager ensures all instances are RUNNING
- Typically used with auoscaler
- Can be single zone or regional (recommended for HA)
- Instance groups for **Stateless serving** (webfrontend; batch processing such as image processing from a queue) or
- **Stateful serving** (such as databases)

## Autoscaling and Health checks for Managed Instance groups

Managed instance groups offer autoscaling capabilities.

1. **Dynamically add/remove** instances

2. Based on an **Autoscaling policy**
    - CPU utilization
    - Load balancing capacity
    - Monitoring metrics
    - Queue-based workload ( Cloud Pub/Sub )

Monitoring your metrics such as CPU utilization is essential to defining good autoscaling policies

## Health checks
Configuring **Health checks** is important for Load balancing and managed instance groups.

A health check is similar to an **uptime check in Stackdriver** monitoring. 

Define :
- a protocol, 
- port and 
- health criteria. 

Based on this Configuration GCP computes a health state for each instance. 

The **health criteria** defines 
- How often to check whether instances are healthy (Check Interval)
- How long to wait for a response (Timer)
- How many Successful attempts are decisive (Health threshold)
- How many failed attempts are decisive (Unhealthy threshold)
