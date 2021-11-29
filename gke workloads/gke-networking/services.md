## Services
Services give Pods a stable IP address
and name that remains the same through updates, upgrades, scalability changes, and
even Pod failures. 

Virtual IP is durable

The range of IP addresses reserved for services is managed for you in GKE and by default contains 4000 IPs

![image](https://user-images.githubusercontent.com/40435982/143908666-f1d95e59-938d-4eaf-89fb-fca13c185d75.png)

Services are a dependable way to locate the
applications running in your cluster

![image](https://user-images.githubusercontent.com/40435982/143530536-05dfb2bd-c367-4198-9696-bf7be403f66e.png)

The Virtual IP is durable. It is published to all nodes in the cluster. It doesn't change,
even if all of the pods behind it change.
In GKE, this range is automatically managed for you, and by default contains over
4,000 addresses per cluster.

![image](https://user-images.githubusercontent.com/40435982/143530549-34eb2500-4f41-49e9-90a7-3dfe75d3aebb.png)
## Setting Up Services
### Service Discovery through Environment Variables - Default, Open source Kubernetes
Not good. When variables are changed, only new Pods launched after the change will see those changes

### Service Discovery through KubeDNS Server - Better Practice, Default GKE
![image](https://user-images.githubusercontent.com/40435982/143922553-ab38bff0-faca-4acb-ae65-e071c9a9ab7b.png)

In GKE service discovery through DNS can be 
- Server based (KubeDNS Server)
- Pod based (kube-dns, for service discovery within pods, lower latency)

### Service Discovery through Istio (Open source, Google, IBM, Envoy @ Lyft ) - Best Practice, Optional GKE

A service mesh provides an infrastructure layer that is **configurable for microservices
applications.** 

Istio is a service mesh to aid in 
- service discovery, 
- control, and 
- visibility in your microservices deployments. 

#### How are the Pods for which a Service provides an endpoint determined?
Using a label selector

#### What is the purpose of Services?
To provide a static, load-balanced front end for transient Pods.

#### a Pod can connect to a Service running in a different namespace in its cluster
True. Kubernetes DNS allows a mechanism for cross-namespace service discovery by offering fully-qualified domain names.

## Kubernetes Service Types and Load Balancers
### Service Types
There are three principal types of Services: 
1. ClusterIP, 
2. NodePort, and 
3. LoadBalancer

These Services build conceptually on one another, adding functionality with each
step. 

#### ClusterIP
###### Best practice: Always create service before its corresponding workloads (Pods)

##### Setting up Cluster IP service
Kind (Service object)
Type (default is ClusterIP)
Selector for pod deployments it should monitor 
Ports

in comes external traffic through -> {port} parameter -> and it remaps the traffic as it delivers it to -> {targetPort} where the Pods and containers are running

Qn what if my Pods run containers that expose different ports for incoming traffic?


#### NodePort

#### LoadBalancer
