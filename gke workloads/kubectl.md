### The kubectl command syntax has several parts

```
kubectl [command] [TYPE] [NAME] [flags]

kubectl get pods

kubectl get pod my-test-app

kubectl get pod my-test-app -o=yaml #great practice for recreating envs

kubectl get pod my-test-app -o=wide #for more column information 
```

## Introspection - Gather info about the cluster's Pods, Services and other engines running in the cluster

```
kubectl get pods
```
Tells you whether your pods are running. Pod phases
- Pending - Accepted but not scheduled yet. Container images have not been created yet by the container runtime (container d)
- Running - Pods have been successfully attached to a node and all its containers created. Containers in a pod can starting, running, or restarting
- Succeeded - All containers have finished running successfully. Finished running and wont be restarted
- Failed - Container has terminated with failure. and it will not be restarted 
- Unknown - Communication error between Control plane and kubelet issue, therefore state of the Pod is unknown.
