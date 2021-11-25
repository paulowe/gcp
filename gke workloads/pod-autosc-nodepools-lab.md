Create a deployment
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

High level information about HPA
```
kubectl get hpa [name-deployment-hpa]
```

Detailed information about HPA
```
kubectl describe hpa [name-deployment-hpa]
```

## Deploy New node pool with 2 preemptible VMs
```
gcloud container node-pools create "temp-pool-1" \
--cluster=$my_cluster --zone=$my_zone \
--num-nodes "2" --node-labels=temp=true --preemptible
```
### Get list of nodes in cluster with specific label
```
kubectl get nodes -l temp=true
```
