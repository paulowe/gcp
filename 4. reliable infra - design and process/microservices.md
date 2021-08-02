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
- Increased latency across service boundaries
- Securin inter-service traffic
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

