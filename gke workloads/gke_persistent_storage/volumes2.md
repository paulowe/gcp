[Previous <-- Volumes](https://github.com/paulowe/gcp/blob/main/gke%20workloads/gke_persistent_storage/volumes.md)

As a summary Volumes can be ephemeral (EmptyDir such as ConfigMaps, Secrets and DownwardAPI) or Persistent (NFS, Persistent Disk)

While the **Secret and ConfigMap Volumes that attach to individual Pods are
ephemeral, the objects are not.**

All of the examples we’ve looked at so far are Volumes, and whether the data is
long-lived or not, **Volumes are tied to the lifecycle of the Pods where they’re defined.**

## 3. Persistent Disk Volume type

**Persistent Disks are network-based block storage that can provide durable storage.**

- First a 100-GB Compute Engine Persistent Disk is created using a gcloud command. Before this Persistent Disk can be used by any Pod, someone or some process must
create it, and that person or process must have Compute Engine administration rights

### Not good practice: Pod-level definition of Persistent disk
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

### Best practice: Use Persistent Volumes
This abstraction lets a Pod claim a Volume of a
certain size, or of a certain name, from a pool of storage without forcing you to define
the storage type details inside the Pod specification.
