# Introspect GKE Pods

Objective: connect to a Pod to adjust settings, edit files, and make other live changes to the Pod.

**(Best practice)** The preferred way of deploying Pods and other resources to Kubernetes is through configuration files, which are sometimes called manifest files. Configuration files are typically written in the YAML syntax, specifying the details of the resource.

```
git clone https://github.com/GoogleCloudPlatform/training-data-analyst
#soft link as as a shortcut to working dir

ln -s ~/training-data-analyst/courses/ak8s/v1.1 ~/ak8s
cd ~/ak8s/GKE_Shell/
```

### Sample nginx.yaml

```
apiVersion: v1
kind: Pod
metadata:
  name: new-nginx
  labels:
    name: new-nginx
spec:
  containers:
  - name: new-nginx
    image: nginx
    ports:
    - containerPort: 80
  ```
  
  And deploy it ```kubectl apply -f ./new-nginx-pod.yaml```

# Connect to a pod

Some container images include a shell environment that you can launch. This shell environment might be more convenient than executing individual commands with kubectl. For instance, the nginx image includes a bash shell. In this task you use shell redirection to connect to the bash shell in your new nginx pod to carry out a sequence of actions.

**bash** : ```kubectl exec -it new-nginx /bin/bash```

## PORT FORWARDING FROM CLOUD SHELL TO THE NGINX POD (FROM PORT 10081 OF CLOUD SHELL vm TO PORT 80 IF THE NGINX CONTAINER
```kubectl port-forward new-nginx 10081:80```

![Screen Shot 2021-10-23 at 10 43 44 PM](https://user-images.githubusercontent.com/40435982/138578115-183a92ee-65c0-4cf5-a58f-dbca58152ace.png)

This is a foreground process, so you need to open another Cloud Shell instance to test.

![Screen Shot 2021-10-23 at 10 43 08 PM](https://user-images.githubusercontent.com/40435982/138578102-ae0864ba-9180-4c29-b25c-e9b51536dc52.png)

