# Get logs failing Pod
```
kubectl logs [name-pod]
kubectl logs -l labelkey=labelvalue
```

![image](https://user-images.githubusercontent.com/40435982/145139995-8eaa4a16-3a55-45ff-9c97-f57a295bf5fe.png)

## HH
```
kubectl create secret generic pubsub-key \
 --from-file=key.json=$HOME/credentials.json
```
