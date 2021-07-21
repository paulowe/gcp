# Automating the Deployment of Infra using Terrafrom or Deployment Manager
Deployment Manager is an infrastructure deployment service that automates the creation and management of Google Cloud resources. Write flexible template and configuration files and use them to create deployments that have a variety of Cloud Platform services, such as Cloud Storage, Compute Engine, and Cloud SQL, configured to work together.

```
resources:
# Create the automode network
- name : [RESOURCE_NAME]
  type : [RESOURCE_TYPE]
  properties :
    #RESOURCE properties go here
```
**This base configuration** is a great starting point for any Google Cloud resource. The name field allows you to name the resource, and the type field allows you to specify the Google Cloud resource that you want to create. You can also define properties, but these are optional for some resources.

``` gcloud deployment-manager types list | grep <resource you are searching for>``` to search for resource type values when defining ```type``` in your config 

Full list of types [here](https://cloud.google.com/deployment-manager/docs/configuration/supported-resource-types)

```
resources:
# Create the automode network
- name : mynetwork
  type : compute.v1.network
  properties :
    #RESOURCE properties go here
    autoCreateSubnetworks: true

# Create the firewall rule
- name: mynetwork-allow-http-ssh-rdp-icmp
  type: compute.v1.firewall
  properties:
    #RESOURCE properties go here
    network: $(ref.mynetwork.selfLink)
    sourceRanges: ["0.0.0.0/0"]
    allowed:
    - IPProtocol: TCP
      ports: [22, 80, 3389]
    - IPProtocol: ICMP
    
```

### CONFIGURING VM INSTANCE TEMPLATE

```
resources:
- name: {{ env["name"] }}
  type: compute.v1.instance  
  properties:
     machineType: zones/{{ properties["zone"] }}/machineTypes/{{ properties["machineType"] }}
     zone: {{ properties["zone"] }}
     networkInterfaces:
      - network: {{ properties["network"] }}
        subnetwork: {{ properties["subnetwork"] }}
        accessConfigs:
        - name: External NAT
          type: ONE_TO_ONE_NAT
     disks:
      - deviceName: {{ env["name"] }}
        type: PERSISTENT
        boot: true
        autoDelete: true
        initializeParams:
          sourceImage: https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/family/debian-9
 ```
 
 ### Back in config.yaml
 
 - Import template
 ```
 imports: 
 - path: [path-to-template-file]
 resources: 
 ...
 ```
- Create specific VMs using your template
```
# Create the mynet-us-vm instance
- name: mynet-us-vm
  type: instance-template.jinja
  properties:
    zone: us-central1-a
    machineType: n1-standard-1
    network: $(ref.mynetwork.selfLink)
    subnetwork: regions/us-central1/subnetworks/mynetwork

# Create the mynet-eu-vm instance
- name: mynet-eu-vm
  type: instance-template.jinja
  properties:
    zone: europe-west1-d
    machineType: n1-standard-1
    network: $(ref.mynetwork.selfLink)  
    subnetwork: regions/europe-west1/subnetworks/mynetwork
 ```
 
### Deploy
```
gcloud deployment-manager deployments create dminfra --config=config.yaml --preview
```
**The --preview flag** gives you a preview of how your configuration is applied before creating it. Previewing a configuration causes Deployment Manager to start creating your deployment but then stop before actually creating any resources.  The --preview flag is especially useful when you update a deployment.

```gcloud deployment-manager deployments update dminfra``` 

The update command commits the preview. If you don't preview a configuration, you can directly run the following command:

```
gcloud deployment-manager deployments create dminfra --config=config.yaml
```
