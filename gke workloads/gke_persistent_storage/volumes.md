[Next -> Volumes 2](https://github.com/paulowe/gcp/blob/main/gke%20workloads/gke_persistent_storage/volumes2.md)
## Volumes are attached to Pods, not Nodes
Ephemeral volumes

Persistent volumes
- Are Block storage or
- Use NFS
- Are independedn of pod's lifecycle
- Provide durable storage outside the pod

## Volumes allow containers within a pod to share data and are necessary for Pods to be stateful


### Volume types 
#### 1. Persistent Disk - Long lived (same as GCE Persistent Disk)
    - Physical storage (backed by Persisten Disks) defined at the Pod-level (cannot dynamically provision, must be created before Pod creation)
    - Physical storage (backed by Persistent Disks) managed at the Cluster level using PersistentVolume and PersistenVolumeClaims (dynamic provisioning)
#### 2. EmptyDir - An empty directory that allows the containers within the Pod to read and write to and from it.
    - Temporary, Short-lived
    - Used to exchange data between containers using file system
    - Deleted if the Pod is removed from a node 
    - Kubernetes creates emptyDir volumes from the node’s local disk, or by using a memory-backed file system
    
   **Example of EmptyDir volume objects** 
- **ConfigMap** - The configMap resource provides a way to **inject application configuration data
into Pods** from Kubernetes
- **Secrets -  use Secrets to store sensitive
information, such as passwords, tokens, and ssh keys**. Just like ConfigMap, a
Secret Volume is created to pass sensitive information to the Pods. These
Secret Volumes are **backed by in-memory file systems, so the Secrets are 
never written to non-volatile storage**. And it’s a common practice to obfuscate
the values that go into secrets using the familiar base64 encoding


#### A Volume is a directory that’s accessible to the containers in a Pod
At its core, a Volume is just a directory that is accessible to the containers in a Pod.
How that directory is created, the medium that backs it, and its contents are
determined by the particular Volume type used.

In this case, we’ll create a Pod with an NFS Volume. The NFS server that backs this
could be anywhere. In Google Cloud, the lowest-overhead way to serve NFS volumes
is the Filestore managed service

#### 3. Networked volumes (such as NFS, Iscazzi)
![image](https://user-images.githubusercontent.com/40435982/144947609-a15728d8-f481-43da-aa93-3cf3d8457bfe.png)

In order to mount the Volume to a container, the Volume name and mount path must
be specified under the volumeMounts field for the container. 

##### The container will only start when all the volumes are ready to be mounted.

![image](https://user-images.githubusercontent.com/40435982/144948263-78672511-7acb-4896-ada1-8a1334604c95.png)
