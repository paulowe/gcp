


Create a Job from Yaml file you define
```
kubectl apply -f example-job.yaml
```

To check the status of this Job, execute the following command:
```
kubectl describe job example-job
```
Returns important metadata about the job you defined:
![image](https://user-images.githubusercontent.com/40435982/143324309-ac8bdc49-7a67-4e09-a9aa-3d8d526a47b7.png)

When a Job completes, the Job stops creating Pods. The Job API object is not removed when it completes, which allows you to view its status. Pods created by the Job are not deleted, but they are terminated. Retention of the Pods allows you to view their logs and to interact with them.

```
kubectl get jobs
```

To retrieve the log file from the Pod that ran the Job execute the following command
```
kubectl logs [pod-name]
```
