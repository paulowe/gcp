## Volumes are attached to Pods, not Nodes
Ephemeral volumes

Persistent volumes
- Are Block storage or
- Use NFS
- Are independedn of pod's lifecycle
- Provide durable storage outside the pod

## Volumes allow containers within a pod to share data and are necessary for Pods to be stateful


#### Volume types 
- Persistent Disk - Long lived (same as GCE Persistent Disk)
- EmptyDir - Temporary, Short-lived, used to exchange data between containers using file system
- Networked volumes (such as NFS, Iscazzi)


