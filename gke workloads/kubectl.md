### The kubectl command syntax has several parts
##### Access to your cluster for kubectl
```
gcloud container clusters get-credentials $my_cluster --zone $my_zone
```

```
kubectl [command] [TYPE] [NAME] [flags]

kubectl get pods

kubectl get pod my-test-app

kubectl get pod my-test-app -o=yaml #great practice for recreating envs

kubectl get pod my-test-app -o=wide #for more column information 
```

## Configure kubectl tab completion in Cloud Shell
```
source <(kubectl completion bash)
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


![Screen Shot 2021-10-23 at 10 03 32 PM](https://user-images.githubusercontent.com/40435982/138577275-91f13942-3c7b-42aa-8d28-eb217f728db3.png)

 
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

## inspect a GKE cluster - kubectl cluster-info

![Screen Shot 2021-10-23 at 9 43 41 PM](https://user-images.githubusercontent.com/40435982/138576666-b1fe5bb7-8a48-46a2-9cad-e679b2c1e47c.png)

## Show Active context

```kubectl config current-context``` to sho which cluster we are connected to.

## Show all contexts/clusters
kubectl config get-contexts

## Switch context/cluster. Note context naming convention as well...
```
kubectl config use-context gke_${GOOGLE_CLOUD_PROJECT}_us-central1-a_standard-cluster-1
```
You may have **more than one cluster in a project.** You can use this approach to switching the active context when your kubeconfig file has the credentials and configuration for several clusters already populated. 

This approach requires 
- the full name of the cluster, which includes 
    - the gke prefix, 
    - the project ID, 
    - the location, and 
    - the display name, 
    - **all concatenated with underscores.**

# View Resource usage across nodes
```
kubectl top nodes
```
# View Resource usage across all deployed Pods in the cluster
```
kubectl top pods
```

## Enable Kubectl Autocompletion
```
source <(kubectl completion bash)
```
kubectl followed by a space and press the Tab key twice outputs **all the possible commands.**


# Push a file into a container
Execute the following command to place the HTML file into the appropriate location within the nginx container in the nginx Pod to be served statically:

```
kubectl cp ~/test.html $my_nginx_pod:/usr/share/nginx/html/test.html
```
 You need to have created deployment with an image to the pod.
 
 ## Expose pod for testing
 ```
 kubectl expose pod $my_nginx_pod --port 80 --type LoadBalancer

 ```
## Services
 view details about services in the cluster:
 
![Screen Shot 2021-10-23 at 10 27 46 PM](https://user-images.githubusercontent.com/40435982/138577678-11906cc1-9763-4b4f-8a5a-47a5b13565df.png)

- **The kubernetes service** is one of the default services created or used by the cluster. 
- **The nginx service** that you created is also displayed.

You may need to re-run this command several times before the External IP address is displayed.

![Screen Shot 2021-10-23 at 10 30 42 PM](https://user-images.githubusercontent.com/40435982/138577754-ac8f37af-3a07-4cfa-b7c1-fb6d5dd151b2.png)


