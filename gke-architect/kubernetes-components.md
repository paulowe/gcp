Cooperating processes make a Kubernetes cluster work.
Computers that compose a Kubernetes cluster are usually VMs. Always are in GKE but could be physical computers too.

## Kubernetes Control Plane Components
Computers in the **control plane** have the job to coordinate the entire cluster. These are the servers in the control plane

1. kube-APIserver's is the computer you will usually interact with. Its job is to:
   - authenticate incoming requests (determine whether they are authorized AND valid)
   - accept commands, that view or change state of the cluster (Including launching pods).
   - address any change at the cluster state (etcd database reports to the kube-APIserver if it wants to change )

```kubectl``` command is used to connect to the kubeAPIserver and communicate with it using the kubernetes api

2. etcd is the clusters database. You will never directly interact with it. Its job is to:
   - **reliably store the state of the cluster. This includes**
  
   *Static data about the  cluster*
   - Configuration data
  
   *Dynamic data about the cluster*
   - what nodes are part of the cluster
   - what pods should be running and
   - where they should be running
    
3. kube-scheduler is responsible for scheduling pods onto nodes. To do that, it contnuously monitors and
   - evaluates requirements of each individual pod
   - select which node is most suitable 
 
   **BUT** it does NOT do the work of actually launching the pods on the nodes. Instead,
   - whenever it discovers a pod that doesnt yet have an assignment to a node it chooses a node and writes the name of that node into the pod object.  

# Kubernetes Worker Components
Nodes - Run pods
