Whats the difference between Truncated exponential backoff and Circuit breaker (Implementing Intelligent retries for reliable system desing)

Can you explain Cloud Identity aware proxy? And why does it only work for apps deployed BEHIND A HTTPS LB (for GKE, App engine and GCE only)?

Frontend in Google cloud load balancer ?

Difference between Cloud Armor and Firewall rules?? Is Cloud Armor only deployed on HTTPS LBs?
![image](https://user-images.githubusercontent.com/40435982/128537430-bf4cc791-2845-4fd4-b179-326e67608c4d.png)

Rolling updates vs. Canary releases ?
#### Rolling updates allow you to deploy new versions with no downtime
- Typically, you have multiple instances of a service behind a load balancer
- Update each instance one at a time
- Rolling updates work when it is ok to have **2 different versions running simultaneously during the update**
- Rolling updates are a feature of instance groups; **just change the instance template**
- **In Kubernetes, rolling updates are the default**; Just change the Docker image
- Completely **automated in App Engine**

#### Use Blue/green deployments when you dont want multiple versions of a service running simultaneously
- Blue (old deployment/ current version)
- Create a Green deployment in a new environment
- Once green deployment is tested, migrate requests to it
- If failure occurrs, switch back to blue.
- In GCE, you can use DNS to migrate requests from one load balancer to another
- In GKE, configure your service to route to new pods using labels (simple YAML config change)
- In App Engine, use traffic splitting feature

#### Canary releases can be used prior to a rolling update to reduce the risk
- The curent service version continues to run
- Deploy an instance of the new version and give it a portion of requests
- Monitor errors until you are confident with the deployment
- In GCE, you can create a new instance group and add it as an additional backend for your Load balancers
- In GKE, create a new pod with the same labels as the existing pods; the service will automatically route a portion of requests to it
- In App Engine, use traffic splitting
