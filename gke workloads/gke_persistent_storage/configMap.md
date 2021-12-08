# Pods refer to ConfigMap in 3 ways

### 1. Environment variable
![image](https://user-images.githubusercontent.com/40435982/145124988-69a7e995-d8a3-47a0-90e7-24965d09efa8.png)

Here, a single ConfigMap is used in the Pod as a container environment variable.
Within an env field, a container environment variable is named as VARIABLE_DEMO.
The values are retrieved using configMapKeyRef.
Multiple variables can be added from the same or different ConfigMapss

### 2. In Pod commands
![image](https://user-images.githubusercontent.com/40435982/145125074-366681b1-30ea-4342-90d4-fa7d93b4f5d7.png)

### 3. By creating a Volume (Ephemeral)
![image](https://user-images.githubusercontent.com/40435982/145125458-3b4a5122-1b3c-41aa-b558-4840ccc5d81c.png)

In this example, a Volume named config-volume is created in the Volumes section,
with a ConfigMap named demo.
The result: a ConfigMap Volume is created for this Pod. All the data from the
ConfigMap is stored in this ConfigMap Volume as files, and then this Volume is
mounted to the container using the mountPath directory.
