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
 
