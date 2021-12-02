## Services
![image](https://user-images.githubusercontent.com/40435982/143942941-0f132813-037b-4947-a4c1-98598d2f2940.png)

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

## What is the difference between a Service of type ClusterIP and one of type NodePort?
In addition to exposing the service at a particular cluster IP address, a NodePort Service also exposes the service on every node at a particular port number.


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
You have frontend Pods that must be able to locate the backend
Pods.

When you create the Service, the cluster control plane assigns a virtual IP
address—also known as ClusterIP—from a reserved pool of Alias IP addresses in the
cluster’s VPC. 

This IP address won’t change throughout the lifespan of the Service.

Internal front end pods use this IP address to locate backend services.
![image](https://user-images.githubusercontent.com/40435982/143935659-1608926e-8821-410b-bc41-9d5fc5e1e384.png)

###### Best practice: Always create service before its corresponding workloads (Pods)

##### Setting up Cluster IP service
- Kind (Service object)
- Type (default is ClusterIP)
- Selector for pod deployments it should monitor 
- Ports. in comes internal (vpc-bound) traffic through -> {port} parameter -> and it remaps the traffic as it delivers it to -> {targetPort} where the Pods and containers are running

![image](https://user-images.githubusercontent.com/40435982/143935758-dc3640cf-f256-43f8-891a-a91c48583aa2.png)

Qn: what if my Pods run containers that expose different ports for incoming traffic?

#### NodePort
In addition to the setup of the internal ClusterIP Service, a specific port is exposed for
external traffic on every node. This port—also known as nodePort —is automatically
allocated from the range 30,000 to 32767

![image](https://user-images.githubusercontent.com/40435982/143933716-f9c9cdaf-7208-49b3-9ae0-13189b230b09.png)

![image](https://user-images.githubusercontent.com/40435982/143934831-d592ee32-860a-4f78-87f9-a6d9e7e63f82.png)

#### LoadBalancer

When you create a LoadBalancer Service, GKE automatically provisions a Google
Cloud network load balancer for inbound access to the Services from outside the
cluster. 

Traffic will be directed to the IP address of the **network load balancer**, and the
load balancer forwards the traffic on to the nodes for this Service.

When you specify kind: Service with type: LoadBalancer in the resource
manifest, GKE creates a Service of type LoadBalancer

GKE makes appropriate Google Cloud API calls to create either 
- an external network load balancer (DEFAULT) or 
- an internal TCP/UDP load balancer. GKE creates an internal TCP/UDP load balancer
when you add the networking.gke.io/load-balancer-type: "Internal"
annotation; otherwise, GKE creates an external network load balancer.


![image](https://user-images.githubusercontent.com/40435982/143939617-9632d9f7-fa6d-4713-a0cd-6da5e1d8f549.png)

## Ingress
Used to provide external access to one or more Services.

Defines rules. Ingress resource decides how to route incoming requests based on the host name and resource path requested

![image](https://user-images.githubusercontent.com/40435982/144127723-fea35303-6d74-49ff-ab05-d33afccc8d8a.png)

Ingress supports multiple host names for the same IP address.
![image](https://user-images.githubusercontent.com/40435982/144127781-856895a4-38fa-4875-a6bb-e3b373748087.png)

Additional Ingress Features
● TLS termination.
● Multiple SSL certificates.
● HTTP/2 and gRPC.
● Multi-cluster and multi-region support.


### Create an ingress resource
Ingress is a Kubernetes resource that encapsulates a collection of rules and configuration for routing external HTTP(S) traffic to internal services

When you create an ingress resource in your cluster, GKE creates an HTTP(S) load balancer and configures it to route traffic to your application.

![image](https://user-images.githubusercontent.com/40435982/144334949-92e9e02c-eef9-48c7-8744-6ae980f30dea.png)

The kubernetes.io/ingress.global-static-ip-name annotation allows you to specify a named reserved ip-address that the Ingress resource will use when creating the Google Cloud Global HTTP(S) load balancer for the Ingress resource.

When you deploy this manifest, Kubernetes creates an ingress resource on your cluster. The ingress controller running in your cluster is responsible for creating an HTTP(S) load balancer to route all external HTTP traffic (on port 80) to the web NodePort service and the LoadBalancer service that you exposed.

![image](https://user-images.githubusercontent.com/40435982/144335422-22847d28-dab4-4a91-84b7-69a528414826.png)

As you can see Ingress resource can route HTTP traffic to any one of our deployed services (Nodeport and Network Lb)
![image](https://user-images.githubusercontent.com/40435982/144333177-25ceb088-426a-41a8-95c3-891d7f5fc59e.png)
![image](https://user-images.githubusercontent.com/40435982/144334073-10adb0c1-6446-421c-b858-8f732d02f4a2.png)

Difference between ClusterIP, NodePort and LoadBalancer is in the ports
- ClusterIP Uses 80/TCP
- NodePort uses 80:30100/TCP
- LoadBalancer uses 80:30262/TCP

TCP Load Balancer == Network Load balancer



