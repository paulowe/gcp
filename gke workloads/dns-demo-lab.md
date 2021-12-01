## Start a bash shell in pod
```
kubectl exec -it podname -- /bin/bash
```

Now that you are inside a container in the cluster, 
subsequent commands will run from that context 
and you will use this to test network connectivity 
by pinging various targets in later tasks.

## Install ping command
```
apt-get update
apt-get install -y iputils-ping
```
![image](https://user-images.githubusercontent.com/40435982/144326706-6abb8c78-f5fe-4c09-8cfb-b48d937fce2a.png)

Port 80 receives HTTP traffic (Service)
Port 8080 is for Web servers (Your Pods)

# Query your IP addresses 
```
export STATIC_LB=$(gcloud compute addresses describe name-of-ipaddress --region us-central1 --format json | jq -r '.address')
```

###### kubectl apply -f file.yaml - for deploying services
###### kubectl create -f - for deployments

## List services
```
kubectl get services
```
