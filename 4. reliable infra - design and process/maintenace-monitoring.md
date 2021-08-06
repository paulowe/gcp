## Managing Version
In a microservice architecture, becareful not to break clients when services are updates
- Include version in URI
- Need to deploy new versions with zero downtime
- Need to effectively test version prior to going live

Startegies to achieve these

#### Rolling updates allow you to deploy new versions with no downtime
- Typically, you have multiple instances of a service behind a load balancer
- Update each instance one at a time
- Rolling updates work when it is ok to have **2 different versions running simultaneously during the update**
- Roloing updates are a feature of instance groups; **just change the instance template**
- **In Kubernetes, rolling updates are the default**; Just change the Docker image
- Completely **automated in App Engine**

#### Use Blue/green deployments when you dont want multiple versions of a service running simultaneously
