[Previous <-- Volumes](https://github.com/paulowe/gcp/blob/main/gke%20workloads/gke_persistent_storage/volumes.md)

As a summary Volumes can be ephemeral (EmptyDir such as ConfigMaps, Secrets and DownwardAPI) or Persistent (NFS, Persistent Disk)

While the **Secret and ConfigMap Volumes that attach to individual Pods are
ephemeral, the objects are not.**

All of the examples we’ve looked at so far are Volumes, and whether the data is
long-lived or not, **Volumes are tied to the lifecycle of the Pods where they’re defined.**

## 3. Persistent Disk Volume type

**Persistent Disks are network-based block storage that can provide durable storage.**
### A: Pod level Volumes vs. B: Cluster level Persistent Volumes
![image](https://user-images.githubusercontent.com/40435982/144956085-cb13ba2f-47c8-4f1c-936d-4ba2fd17f1f6.png)

### A. Not good practice: Pod-level Volume definition of Persistent disk

First a 100-GB (volume capacity) Compute Engine Persistent Disk **must be created** using a gcloud command. **Before this Persistent Disk can be used by any Pod, someone or some process must create it**, and that person or process must have Compute Engine administration rights

![image](https://user-images.githubusercontent.com/40435982/144950083-40998901-ef31-4c8b-a760-3284d307b3e8.png)

**PdName**  must correspond to a Compute Engine Persistent Disk that **has already been
created. This is the old way of attaching to Persistent Disks**, and it’s no longer the
best way to do it.

**Don’t forget that a Persistent Disk must be created before it can be
used.** The Persistent Disk can have pre-populated data that can be shared by the
containers within a Pod. That’s very convenient.

However, **the application owner must
include the specific details of the Persistent Disk inside the Pod manifest for their
application and must confirm that the Persistent Disk already exists.** That’s not very
convenient.

#### Conifguring Volumes in Pods makes portability difficult, risks of error
![image](https://user-images.githubusercontent.com/40435982/144950894-df40811f-4e11-4854-8cfd-b1df837f31c1.png)

Whenever you need to reconfigure an application to move it from one environment to
another, there’s a risk of error.

To address this problem, Kubernetes provides an
abstraction called **Persistent Volumes**. 

### B: Best practice: Use PersistentVolumes abstraction 
This abstraction lets a Pod claim a Volume of a
certain size, or of a certain name, from a pool of storage without forcing you to define
the storage type details inside the Pod specification.

#### PersistentVolumes Has Two components
**1. PersistentVolume (PV)** 
  -  Compute Engine Persistent Disks managed at the cluster level
  -  Independent of the pod's lifecycle
  -  Manually or dynamically provisioned

  Access Modes determine how the Volume will read or write
  - ReadWriteOnce (most applications, sinlge node)
  - ReadOnlyMany (for static data, many nodes)
  - ReadWriteMany (GCE PD dont support this. Only NFS does, Many nodes)


● ReadWriteOnce mounts the Volume as read-write to a single node.
● ReadOnlyMany mounts a Volume as read-only to many nodes.
● ReadWriteMany mounts Volumes as read-write to many nodes. 

Deployment replicas can share an existing Persistent Volume using a ReadOnlyMany or ReadWriteMany access mode

#### Deadlock condition: ReadWriteOnce, isn’t recommended for Deployments, because the replicas need to attach and reattach to Persistent Volumes dynamically.

**2. PersistentVolumeClaim (PVC)**
  -  Requests made by pod to use PV
    
    For PV & PVC to be bound together:
    - PV storage class name and PVC storage class name must match 
    - PV access mode and PVC access modes must match
    - PVC must request within size (<=) AVAILABLE capacity of the PV


### Storage classes
Storage classes are parameters for a class of storage for which **persistent volumes are dynmically provisoned**. They are choices for how persistent volumes are backed.

#### Left (Example PV definition) Right (Default StorageClass name (standard) used if PVC doesnt define one) 
![image](https://user-images.githubusercontent.com/40435982/144953831-0c284bb1-c513-429e-825a-8fcd20c2cac1.png)

## What happens when if there isn't a PV to satisfy a PVC?
- Kubernetes will try to dynamically provision a new one
- If a matching already exists, Kubernetes will bind it to the claim.
- Dynamic provisioining only works if it is enabled for the cluster


## By default, deleting a PVC will ALSO delete the provisioned PV
![image](https://user-images.githubusercontent.com/40435982/144957890-6cf1941a-452b-4204-9d0e-2f91ed8cd26d.png)

If you want to retain the PV, configure persistentVolumeReclaimPolicy to **Retain**

In general it is good practice to delte PVC if underying PV is no longer required.. Duuhhh?

## Availability for PV
Configure your storageClass to use replication type : regional-pd. If a zonal outage occurs, Kubernetes can fail over WORKLOADS THAT USE THE VOLUME.

HA stateful workloads that use PV in GKE.

## Pod failure
#### What happens if a Pod fails while it is using a persistent volume
The volumes are unmounted from the failing Pod, and they continue to exist with their last contents.

## You can use PVs for OTHER Controllers beyond Pods: Deployments and StatefulSets 

Deployments can only share state using ReadOnlyMany or ReadWriteMany (NFS)

## PV with AccessMode ReadWriteOnce + Deployment = Deadlock
StatefulSets resolve this deadlock. Whenever your application needs to maintain state in
Persistent Volumes, managing it with a StatefulSet rather than a Deployment is the
way to go.

## StatefulSets
 StatefulSets run and maintain a set of
Pods, just like Deployments do. A StatefulSet object defines a desired state, and its
controller achieves it. However, unlike Deployments, StatefulSets maintain a
**persistent identity for each Pod.**



