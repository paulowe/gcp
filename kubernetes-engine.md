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
