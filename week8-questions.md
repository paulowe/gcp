Whats the difference between Truncated exponential backoff and Circuit breaker (Implementing Intelligent retries for reliable system desing)

Can you explain Cloud Identity aware proxy? And why does it only work for apps deployed BEHIND A HTTPS LB (for GKE, App engine and GCE only)?

Frontend in Google cloud load balancer ?

Difference between Cloud Armor and Firewall rules?? Is Cloud Armor only deployed on HTTPS LBs?
![image](https://user-images.githubusercontent.com/40435982/128537430-bf4cc791-2845-4fd4-b179-326e67608c4d.png)

Rolling updates vs. Blue/green deployments?
#### Rolling updates allow you to deploy new versions with no downtime
- Typically, you have multiple instances of a service behind a load balancer
- Update each instance one at a time
- Rolling updates work when it is ok to have **2 different versions running simultaneously during the update**
- Roloing updates are a feature of instance groups; **just change the instance template**
- **In Kubernetes, rolling updates are the default**; Just change the Docker image
- Completely **automated in App Engine**

#### Use Blue/green deployments when you dont want multiple versions of a service running simultaneously
-blue current, green new
-Once green is tested migrate traffic/requests to it
