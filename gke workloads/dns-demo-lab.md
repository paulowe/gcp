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
