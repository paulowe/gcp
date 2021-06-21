## Deployment Manager
Enables repeatable deployments

### Sample YAML file for deploying a Compute Engine

```
 resources:
  - name: my-vm
    type: compute.v1.instance
    properties:
      zone: ZONE
      machineType: zones/ZONE/machineTypes/n1-standard-1
      metadata:
        items:
        - key: startup-script
          value: "apt-get update"
      disks:
      - deviceName: boot
        type: PERSISTENT
        boot: true
        autoDelete: true
        initializeParams:
          sourceImage: https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-9-stretch-v20180806
      networkInterfaces:
      - network: https://www.googleapis.com/compute/v1/projects/PROJECT_ID/global/networks/default
        accessConfigs:
        - name: External NAT
          type: ONE_TO_ONE_NAT
```
You can also access this file directly from a Google managed Cloud Storage bucket

``` gsutil cp gs://cloud-training/gcpfcoreinfra/mydeploy.yaml mydeploy.yaml ```

**Replace PROJECT_ID and ZONE placeholders with your environtment setting**

```sed -i -e "s/PROJECT_ID/$DEVSHELL_PROJECT_ID/" mydeploy.yaml ```

```  
export MY_ZONE=northamerica-northeast1-a 
sed -i -e "s/ZONE/$MY_ZONE/" mydeploy.yaml
```
