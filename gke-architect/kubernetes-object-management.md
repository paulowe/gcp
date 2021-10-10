# Kubernetes Object Management

All Kubernetes Objects are identified by Unique name and Unique ID. Objects are defined with manifest files. These are ordinary text files that can be written in
YAML (Recommended option) or JSON format.

YAML files are less tedious to edit

```
# Required field: Which Kubernetes API version is used to create the object. 
# The Kubernetes protocol is versioned so as to help maintain backwards compatibility

apiVersion: apps/v1

# Defines the object you want
kind: Pod

# helps identify the object using name, unique id, and an optional namespace. 
# You can define several related objects in the same YAML file (Best practice)

metadata:
    name: nginx
    labels:
        app: nginx
spec:
    containers:
    - name: nginx
      image: nginx:latest
```
