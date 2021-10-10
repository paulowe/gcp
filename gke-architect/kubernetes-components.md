# Kubernetes Components
Cooperating processes make a Kubernetes cluster work. Computers that compose a Kubernetes cluster are usually VMs. Always are in GKE but could be physical computers too.

## A: Kubernetes Control Plane Components
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
    
3. kube-scheduler is responsible for scheduling pods onto nodes. To do that, it
   - evaluates requirements of each individual pod
   - select which node is most suitable 
 
   **BUT** it does NOT do the work of actually launching the pods on the nodes. Instead,
   - whenever it discovers a pod that doesnt yet have an assignment to a node it chooses a node and writes the name of that node into the pod object.  

   Q: How does Kube-scheduler decide where to run a pod??
   A: It knows the state of all the nodes and will obey constraints that you define based on hardware, software and policy. 
   
   For example:
   Hardware constraint: You specify that a pod can only run in nodes with 16GB of Memory
   Affinity specifications: Which cause groups of pods to prefer running on the same Node 
   Anti Affinity specifications: Which ensure groups of pods do not run on the same Node
   
4. Kube-controller-manager has a broader job. It **continuously monitors state of the cluster through Kube-APIserver**. Whenever 
   Curr_State != Desired_State: Kube-Controller-Manager will attempt to make changes to achieve the desired state. 
   
   It's called the Controller Manager because **many Kubernetes objects are managed by loops of code called Controllers**. 
   
   Controllers handle the process of remediation. 
   
5. Kube-cloud-manager - manages controllers that interact with the underlying cloud providers. For example if you launched Kubernetes on GKE, Kube cloud manager would be responsible for bringing in Google Cloud features like Load balancers and Storage volumes when you needed them
   

## B: Kubernetes Node Components
Nodes run your pods (which can have one or more containers). HOWEVER, **each node also runs a small family of Control plane components:**

1. Kubelets -  Kubernetes' agent on each node
   - Whenever the Kube-Api server wants to launch a pod on a node, it connects to that node's kubelet  
   - Kubelet uses the *container runtime* to start the pod and
   - Monitors its lifecycle, including readiness and liveness probes and **reports back to Kube-APIserver** 
   
   #### Container Runtimes
   Container runtime - this is the software that knows how to launch a container from a container image
   
   There are many choices for container runtimes. The linux distribution GKE uses for its node launches containers using **container d** (Docker runtime component)

2. Kube-proxy's job is Pod networking. Kube-proxy **maintains network connectivity among pods in the cluster**. 
   
   In open source Kubernetes Kube-proxy does so using the firewall capabilities of IP Tables which are built into the linux kernel.
   
