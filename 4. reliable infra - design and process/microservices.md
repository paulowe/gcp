 ## Microservices
 Microservices divide a large program into multiple smaller, independent services
  
  - Multiple code bases and 
  - Each service manages its own data. Do not coupling through data store

**Pros**
- Easier to develop and maintain
- Scale services independently to optimize use of infrastructure
- Faster to innovate and add new features
- Can use different languages and frameworks
- Choose runtime appropriate to each service

**Cons**
- Increased complexity when communicating between services
- Increased latency across service boundaries (network latency)
- Securing inter-service traffic
- Multiple deployments
- Must maintain backward compatibility

### The key to architecting applications is recognizing service boundaries
- Decompose apps by feature to minimize dependencies
- Organize services by architectural layer
- Isolate services that provide shared functionality

### Stateful services have different challenges than stateless ones.

Stateful services manage stored data over time
- Harder to scale
- Harder to upgrade
- Need to backup

### Avoid storing shared state in-memory on your servers
- Requires sticky sessions to be set up (Session affinity)
- Hinders elastic autoscaling

### Store state using backend storage services shared by the frontend server
- Cache state data for faster access
- Take advantage og GCP managed data services (Firestore, Cloud SQL) AND Memorystore for Cache.

### 12 Factor app is a set of best practices for building web or SaaS applications
Use the [12 factor app](https://12factor.net) to design your microservice implementations in order to
- Maximize portability
- Deploy to the cloud
- Enable CI/CD
- Scale easily

1. Codebase - Use Git (or Cloud Source repos)
2. Dependencies (Declare and isolated. Use package managers such as NPM as Pip and Maven)
3. Config
4. Backing services (Accessed via URLs. So you can swap backing services easily)
5. Build, release, run (SDE process should be split from this. Allows easily rollbacks and audit trails)
6. Processes (apps should run as one or more stateless processes)
7. Port binding (Expose services via port binding)
8. Concurrency (Scale out via proceeses)
9. Disposability (Apps should be more reliable than the underlying infrastructure they run on)
10. Dev/prod parity (Keep dev, staging and production as similar as possible)
11. Logs (Treat logs as event streams. Write log messages to standard output and aggregate all logs to a single source)
12. Admin processes (Decouple from the app. Must be automated and repeatable. Use cron jobs, Cloud tasks [GKE] And Cloud Scheduler)
 
