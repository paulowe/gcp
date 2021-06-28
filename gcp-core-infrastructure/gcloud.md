[Overview](https://github.com/paulowe/gcp/blob/main/readme.md)

[Next](https://github.com/paulowe/gcp/blob/main/gcp-core-infrastructure/gsutil.md)

## Helpful commands for working with the gcloud command line tool

### Account Management

``` gcloud auth list``` to list active account

```gcloud config set account 'ACCOUNT' ``` to switch accounts

### Project Management

```gcloud config list project``` list currently active project

```gcloud config set project $PROJECT_iD``` switch active project used in Cloud Shell

```$DEVSHELL_PROJECT_ID ``` always contains your project ID

### Infrastructure regions and health status

```gcloud compute regions list``` to list available regions and view their health status

### Instances

 ```gcloud compute instances list ``` list VMs

## VPC Networks

```gcloud compute networks create privatenet --subnet-mode=custom``` to create a custom mode VPC network called privatenet 

```gcloud compute networks subnets create privatesubnet-eu --network=privatenet --region=europe-west1 --range=172.20.0.0/20``` to create a subnet in europe-west1 region and assigning it a range of internal IP address

```gcloud compute networks subnets list``` list available networks in current gcp project

```gcloud compute networks subnets list --sort-by=NETWORK``` list subnets and order by networks it belongs to
