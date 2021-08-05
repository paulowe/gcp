# When designing for reliability, the key performance metrics are
1. Availability - The percent of time a system is running and able to process requests
  - Achieved with fault tolerance
  - Creating back up systems
  - Health checks
  - Metrics to count real trafic success andd failure
3. Durability - The odds of losing data due to hardware or system failure
  - Replicate data in multiple zones
  - Perfrom regular backups
  - Practice restoring from backups
4. Scalability - The ability of a system to handle growing user and data load
  - Monitor usage
  - Use capacity auto-scaling to add/remove servers

## Avoid single points of failure
- Deploy N+2 instances (one for upgrades or testing; Another for failure)
- Try to make instances interchangeable, stateless clones

## Beware of correlated failures
Correlated failures ocur when related items fail at the same time. A group of related items that could fail together is a **failure/fault domain**

To avoid correlated failures
- Decouple servers and use microservices distributed among multiple failure domains
- Divide business logic based on failure domains
- Deploy to multiple zones/regions
- Design independent, loosely coupled but collaborating services

## Beware of cascading failures
- Occur when one system fails, casuing others to be overloaded, such as a message queue becoming overloaded because of a failing backend
- Use **health checks** (GCE) or **liveliness/readiness** (GKE) probes to detect and repair unhealthy instances
-  Ensure new instances start fast and do not rely on other backends/services before they are ready

**Note:** This only works for stateless services

## Query of death overload
Problem: Business logic errors shows up as overconsumption of resources and the service overloads

Solution: Monitor query performance.

## Plan against positive feedback cycle overload failure
Problem: Adding retires and instead you create potential for overload

Solution: Intelligent retries
- Use **truncated exponential backoff pattern to avoid positive feedback overload at the client**. Wait 1 second + random_number_milliseconds and retry; Wait 2 seconds + random_number_milliseconds and retry; and so on before giving up
- Use **circuit breaker pattern**(a proxy in front of a service that monitors service health) to protect the service from too many retries. For GKE use **Istio** to automatically implement circuit breakers.

## Use Lazy deletion to reliably recover when users delete data by mistake
User deletes data -> Trash (< 30 days) -> Soft-deletion phase (protects against any mistakes in the application; < 60 days) -> Hard-deletion (data is gone, can only be restored if there were any backups made)  


