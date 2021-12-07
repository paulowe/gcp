## Volumes are attached to Pods, not Nodes
Ephemeral volumes

Persistent volumes
- Are Block storage or
- Use NFS
- Are independedn of pod's lifecycle
- Provide durable storage outside the pod

## Volumes allow containers within a pod to share data and are necessary for Pods to be stateful


### Volume types 
##### 1 .Persistent Disk - Long lived (same as GCE Persistent Disk)

##### 2. EmptyDir - An empty directory that allows the containers within the Pod to read and write to and from it.
    - Temporary, Short-lived
    - Used to exchange data between containers using file system
    - Deleted if the Pod is removed from a node 
    - Kubernetes creates emptyDir volumes from the node’s local disk, or by using a memory-backed file system
    
   **Example of EmptyDir volume objects** 
- **ConfigMap** - The configMap resource provides a way to inject application configuration data
into Pods from Kubernetes
- 


##### 3. Networked volumes (such as NFS, Iscazzi)


