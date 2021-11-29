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

### Service Discovery through KubeDNS Server
![image](https://user-images.githubusercontent.com/40435982/143922553-ab38bff0-faca-4acb-ae65-e071c9a9ab7b.png)

### Service Discovery through Istio (Open source, Google, IBM, Visual)
