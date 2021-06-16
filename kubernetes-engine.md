## Kubernetes Engine

- Kubernetes is an open source orchestrator for containers
- Manages and scales your apps
- Offers API to control its operations through several utility commands such as kubectl
- You can deploy a set of nodes also called a cluster (a node is a compute engine VM instance)

### Clusters
 Clusters consist of 
 - master components that control kubernetes, and
 - set of nodes that run containers
 
 Its a lot of work to self host and manage kubernetes, and thats why you can use Kubernetes Engine
 
 ### GKE
 Fully managed solution to create kubernetes cluster using gcloud or the GCP console.
 
 #### Pods
 A pod is the smalles deployable unit in Kubernetes. You can think of it as a running process.
 
 It could be a compnent of your app or even the entrie app. Its common to have 1 container per pod.
 
 #### What is a deployment?

A deployment represents a group of replicas of the same pod. It keeps your pods running even if some of the nodes running you pod fails.
You can use a pod to contain part of your application or the entire application.

In this case, its the entire nginx web server.
 
 #### Deploying Pods
 
 To quickly deploy a container in a pod you can use the ```kubectl``` command
 
 ```
 kubectl run nginx
 --image=nginx:1.15.7
 ```
 In this example the container deployed inside the pod is the nginx webserver. The command will fetch the image of nginx version we request
from a container registry

#### View running pods
``` kubectl get pods ```

#### To make pods publicly available on the internet by connecting a Load balancer

By default pods in a deployment are only accessible inside your cluster.
```
kubectl expose deployments
nginx --port=80
--type=LoadBalancer
```
Kubernetes then creates a service with a fixed IP address. A service is the fundamental way Kubernetes represents a load balancer.
This is a Network Load balancer 

#### Services

A service groups a set of pods (contained in nodes/VMs) together and provides a stable endpoint for acessing your application.
- Great because it embraces failure of nodes as part of normal operations. By having a stable IP we maintain high availability even if some of our pods were to go down and reboot with a new public IP.

```
kubectl get services
```
This command shows you your Load balancer's Public IP address. Clients can use this to hit your application remotely

#### Scaling your deployments

You can simly scale using the 
 ```
 kubectl scale nginx --replicas=3
 ```
 and your app will now have 3 redundant instances all running behind a stable IP address provided by the LB service
 
 #### Autoscaling based on CPU usage
 ```
 kubectl autoscale 
 nginx --min=10 
```
In this case, we define the
- min, and max number of pods and 
- the criteria for scaling up. We scale up once cpu usage reaches 80% of capacity


 
  
