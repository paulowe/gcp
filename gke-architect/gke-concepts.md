# GKE Concepts


| Open Source Kubernetes      | GKE | 
| :---        |    :----:   | 
|Open source coommand ```Kube-adm``` automates most of the cluster component setup, but if a node fails or needs maintenance a human admin has to respond manually.|GKE provisions and manages **all of the control plane components**

Abstracts away of having a separate Control plane. Responsibilities of the control plane are absorbed by GKE and you ar enot separately billed for it.|
| Doesn't create nodes. Cluster admins create nodes and add them to Kubernetes      | GKE manages this by deploying and registering Compute Engine instances as nodes       |
|||

