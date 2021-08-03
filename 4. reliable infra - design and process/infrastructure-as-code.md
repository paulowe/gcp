## IaC allows for disposable infrastructure
To make infra disposable, automate everything with code
- Can automate using scripts
- Can use declarative tools to define infrastructure

IaC allows for quick provisioning and removind of infrastructure
- Creatre identical infra fro dev, test, and prod
- Can be part of CI/CD
- Templates are the building blocks for disaster recovery
- Manage resource dependencies and complexity

IaC tools
- Terraform
- Cloud Deployment Manager
- Chef
- Ansible
- Puppet

### Cloud Deployment Manager
- Define infrastructure using YAML syntax
- Can create dynamic templates using jinja or python
- Use gcloud to create, update and delete deployments

### Terraform is similar to DM but can be used in public and private clouds
- Considered a first-class tool in Google cloud
