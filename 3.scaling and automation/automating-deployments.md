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
This base configuration is a great starting point for any Google Cloud resource. The name field allows you to name the resource, and the type field allows you to specify the Google Cloud resource that you want to create. You can also define properties, but these are optional for some resources.
