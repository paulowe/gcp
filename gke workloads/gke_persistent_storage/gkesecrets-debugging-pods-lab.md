# Get logs failing Pod
```
kubectl logs [name-pod]
kubectl logs -l labelkey=labelvalue
```

![image](https://user-images.githubusercontent.com/40435982/145139995-8eaa4a16-3a55-45ff-9c97-f57a295bf5fe.png)

# Creating Secrets using file and naming keys
```
kubectl create secret generic pubsub-key \
 --from-file=key.json=$HOME/credentials.json
```

# Creating Secrets using Volumes

![image](https://user-images.githubusercontent.com/40435982/145141849-1199f457-f260-403e-bbf1-08fb452705e7.png)

### Note that this is Generic type of secret, Not TLS (using Private/Public PEM file keys?, or Docker registry image type of secret


## When creating ConfigMap from file the filename.properites is considered key
```
Name:         sample2
Namespace:    default
Labels:       <none>
Annotations:  <none>
Data
====
***sample2.properties:***
----
message2=world
foo=bar
meaningOfLife=42
Events:  <none>
```
