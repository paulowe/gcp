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
- **Pending** - Accepted but not scheduled yet. Container images have not been created yet by the container runtime (container d)
- **Running** - Pods have been successfully attached to a node and all its containers created. Containers in a pod can starting, running, or restarting
- **Succeeded** - All containers have finished running successfully. Finished running and wont be restarted
- **Failed** - Container has terminated with failure. and it will not be restarted 
- **Unknown** - Communication error between Control plane and kubelet issue, therefore state of the Pod is unknown.
- **CrashLoopBackOff** - One of the containers in the pod exited unexpectedly even after it was restarted at least once. Common error, usually due to misconfiguration of the Pod

## To investigate Pods in more detail. Information about Pods and its containers...

```
kubectl describe pod [POD_NAME]
```

Pod Information
- NamE
- Namespace
- Node name
- Labels
- Status
- IP address

Container Information
- State (WAITING, RUNNING, TERMINATED)
- Images
- Ports
- Commands
- Restart counts,
- Restart policy (always)

What is Image pull backoff?

## Troubleshoot an application, connectivity, etc: exec command

```
kubectl exec [POD_NAME] -- [command]
kubectl exec demo -- ls /
```


