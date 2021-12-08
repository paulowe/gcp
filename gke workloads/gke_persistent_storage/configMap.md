# ConfigMaps decouple configuration from Pods
- Prevents configuration drift
- Single source of truth

## Use cases for ConfigMap
Using configMap, you can make the
following available inside Containers: 
- configuration files, 
- command-line arguments,
- environment variables, 
- port numbers, and 
- other configuration artifacts 

# A. Creating configMaps

## 1. Using Literal values in kubectl create configmap command
![image](https://user-images.githubusercontent.com/40435982/145127129-7eeebe33-c2d0-46c2-83a8-05537f75340f.png)

## 2. Using Files in kubectl create configmap command
![image](https://user-images.githubusercontent.com/40435982/145127332-9207b441-7c17-44a7-b917-9dd7c44a8dc3.png)

Note:
- You can have more than one config file
- Check these files into your source code control system, to **maintain their versioning
and history** of configurations


## 3. Creating a ConfigMap using a directory
Instead of specifying each file from the same directory, you can simply use the
directory name directly.

**All files within a directory are added to the ConfigMap.**

## 4. Using a Manifest and applying it using kubectly apply command
![image](https://user-images.githubusercontent.com/40435982/145127769-9d8d0f7b-0074-4cf6-bbaf-213454b344f8.png)

# B. Pods refer to ConfigMap in 3 ways

## 1. Environment variable (kubelet does not refresh COnfigMap values stored this)
![image](https://user-images.githubusercontent.com/40435982/145124988-69a7e995-d8a3-47a0-90e7-24965d09efa8.png)

Here, a single ConfigMap is used in the Pod as a container environment variable.
Within an env field, a container environment variable is named as VARIABLE_DEMO.
The values are retrieved using configMapKeyRef.
Multiple variables can be added from the same or different ConfigMapss

#### How frequently does the kubelet refresh the values of ConfigMaps stored in environment variables inside Pods?
Never. The values of environment variables are inserted into a Pod at the time of the Pod's birth; the kubelet has no way to reach into the Pod and modify these values later.

## 2. In Pod commands
![image](https://user-images.githubusercontent.com/40435982/145125074-366681b1-30ea-4342-90d4-fa7d93b4f5d7.png)

## 3. By creating a Volume (Ephemeral)
![image](https://user-images.githubusercontent.com/40435982/145125458-3b4a5122-1b3c-41aa-b558-4840ccc5d81c.png)

In this example, a Volume named config-volume is created in the Volumes section,
with a ConfigMap named demo.
The result: a ConfigMap Volume is created for this Pod. All the data from the
ConfigMap is stored in this ConfigMap Volume as files, and then this Volume is
mounted to the container using the mountPath directory.

Each node’s Kubelet periodically syncs with
ConfigMap to keep the ConfigMap Volume updated

When a ConfigMap Volume is already mounted and the source ConfigMap is
changed, the projected keys are **eventually** (seconds-minutes) updated

### For frequently changing configuration variables
 If you have a piece of configuration
data that will change more rapidly than that, you should probably implement a
microservice to provide its value to Pods

### How frequently does the kubelet refresh the values of ConfigMaps mounted as volumes inside Pods?
Roughly on the order of seconds or minutes

### How frequently does the kubelet refresh the values of ConfigMaps stored in environment variables inside Pods?
