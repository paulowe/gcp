# Use Network Policy for restricitng acccess between Pods

Network policy is a set of **firewall rules applied at the pod level*** that restrict access to other pods and services in the cluster

Web layer - Application layer - DB layer

#### Promotes defense in depth

By default network policies are disabled. To enable them you need
- at least 2 nodes (recommended minimum is 3)
- n1-standard-1 or higher
- Requires nodes to be recreated if policy is applied after (GKE can do this automatically during an active maintenance window or manually using Kubectl commands)

![image](https://user-images.githubusercontent.com/40435982/144497665-0135bd02-2865-404e-a725-cf1de3a6e824.png)

Enabling network policy consumes more resources!
### If podSelector is left empty, Network policy willl appky to all pods in the namespace
![image](https://user-images.githubusercontent.com/40435982/144502024-b93859a0-aea5-4941-865d-7c609c87d2b6.png)

## Policy types
1. Ingress (Default, if type left unspecified. Has nothing to do with Ingress rules)
  Traffic flowing into your pod can be defined by looking at its **source**
  - ipBlock
  - namespaceSelector
  - podSelector
  
  And ONLY IF its in bound to permitted **port**
  - 
2. Egress
Traffic destined for a specific destiination e.g
  - ipBlock
  - namespaceSelector
  - podSelector

And ONLY IF its out-bound to permitted **port**

![image](https://user-images.githubusercontent.com/40435982/144502531-892c318c-9e70-4896-88c8-a08a4b01acf5.png)

### Disabling network policy is a two step process
1. Disable it for the pods
2. Disable it for the control plane

 ![image](https://user-images.githubusercontent.com/40435982/144503132-a136706c-cf88-48c2-942a-58f15cffa1fd.png)


