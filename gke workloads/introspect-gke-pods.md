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
