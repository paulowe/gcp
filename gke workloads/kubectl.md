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

- Allows you to pass the terminal's standard input (stdin) to the container. You can use this to debug apps, e.g install dependncies to solve an issue. But remmeber to redploy container image. Do not make temporary fixes in env because once terminal session is over it will be ephmeneral

## View Logs of a Pod 

```
kubectl logs [POD_NAME]
```

**If Pod has multiple container, use the -c flag to show logs for a specific container in the pod**

Pod logs include application generated :
- stderr : Error messages
- stdout : Standard output on the console

## Kubeconfig

![Screen Shot 2021-10-23 at 9 39 40 PM](https://user-images.githubusercontent.com/40435982/138576560-3f72b447-a508-4ad3-b551-4b133c983fde.png)


![Screen Shot 2021-10-23 at 9 39 06 PM](https://user-images.githubusercontent.com/40435982/138576552-0bb6b293-a925-4c5f-9c56-b903bf0bb952.png)

