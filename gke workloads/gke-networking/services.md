## Services
Services give Pods a stable IP address
and name that remains the same through updates, upgrades, scalability changes, and
even Pod failures. 

Services are a dependable way to locate the
applications running in your cluster

![image](https://user-images.githubusercontent.com/40435982/143530536-05dfb2bd-c367-4198-9696-bf7be403f66e.png)

The Virtual IP is durable. It is published to all nodes in the cluster. It doesn't change,
even if all of the pods behind it change.
In GKE, this range is automatically managed for you, and by default contains over
4,000 addresses per cluster.

![image](https://user-images.githubusercontent.com/40435982/143530549-34eb2500-4f41-49e9-90a7-3dfe75d3aebb.png)
