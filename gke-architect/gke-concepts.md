# GKE Concepts


| Open Source Kubernetes      | GKE | 
| :---        |    :----:   | 
|Open source coommand ```Kube-adm``` automates most of the cluster component setup, but if a node fails or needs maintenance a human admin has to respond manually.|GKE provisions and manages **all of the control plane components**. GKE abstracts away the need of having a separate Control plane. Responsibilities of the control plane are absorbed by GKE and you are not separately billed for it.|
| Doesn't create nodes. Cluster admins create nodes and add them to Kubernetes      | GKE manages this by deploying and registering Compute Engine instances as nodes|
|Not available in OS Kubernetes. You would have to build and maintain an analgous feature.| You can use node pools to manage different kinds of nodes. a) Node pools also provide and easy way to ensure that workloads run on the right type of hardware in your cluster. Just label them with a desired node pool. b) You can enable automatic node repairs, automatic node operates and cluster auto scaling at the node pool level |

!Caution Some of each Node's CPU and Memory are needed to manage to run GKE and Kubernetes components that let it work as part of your cluster.  
 For example if you allocate 15GB for your cluster's nodes, not all of it will be available for your workload. Read this [documentation]() to understand how reserved memory is calculated
![Screen Shot 2021-10-10 at 12 00 37 PM](https://user-images.githubusercontent.com/40435982/136703746-b4f047f9-3dd7-4e3c-a2aa-8281253d1780.png)
