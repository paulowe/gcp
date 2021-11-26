### Create a deployment

![image](https://user-images.githubusercontent.com/40435982/143502253-c2d60da7-7cc9-42b8-9d31-35928949d0b0.png)

```
kubectl create -f web.yaml --save-config
```

### Create a Service resource of type NodePort on port 8080
```
kubectl expose deployment web --target-port=8080 --type=NodePort
```

### Configure Cluster Autoscaling
```
kubectl autoscale deployment web --max 4 --min 1 --cpu-percent 1
```
Creats a HorizontalPodAutoscaler object that sets the max num replicas to 4, min to 1, with a CPU utilization target of 1%

The command above creates a HorizontalPodAutoscaler object that targets a specified resource, called the scale target, and scales it as needed. 
The autoscaler periodically adjusts the number of replicas of the scale target to match the average CPU utilization that you specify when creating the autoscaler

### High level information about HPA
```
kubectl get hpa [name-deployment-hpa]
```

### Detailed information about HPA
```
kubectl describe hpa [name-deployment-hpa]
```

### Deploy New node pool with 2 preemptible VMs
```
gcloud container node-pools create "temp-pool-1" \
--cluster=$my_cluster --zone=$my_zone \
--num-nodes "2" --node-labels=temp=true --preemptible
```
### Get list of nodes in cluster with specific label
```
kubectl get nodes -l temp=true
```

### Command to rollback the environment to the deployment identifies in history as revision 2
```
'kubectl rollout undo deployment --to-revision=2'
```

### You have autoscaling enabled on your cluster. What conditions are required for the autoscaler to decide to delete a node?
If a node is underutilized and running Pods can be run on other Nodes

### What status or event is used by the GKE autoscaler to decide when scaleout is required and a new node needs to be added?
When the scheduler cannot schedule a Pod due to resource constraints and the Pod has been marked as unschedulable.

### You are configuring the rollout strategy for your Deployment that contains 8 Pods. You need to specify a Deployment property that will ensure at least 75% of the desired number of Pods is always running at the same time. What property and value should you set for the deployment to ensure that this is the case? 
maxUnavailable=25%

### How do you configure a Kubernetes Job so that Pods are retained after completion
Configure the cascade flag for the Job with a value of false.

