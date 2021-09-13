[Overview](https://github.com/paulowe/gcp/blob/main/readme.md)

[Next](https://github.com/paulowe/gcp/blob/main/gcp-core-infrastructure/gsutil.md)

## Helpful commands for working with the gcloud command line tool

### Account Management

``` gcloud auth list``` to list active account

```gcloud config set account 'ACCOUNT' ``` to switch accounts

```gcloud auth activate-service-account --key-file credentials.json``` to assume a service account

### Project Management

```gcloud config list project``` list currently active project

```gcloud config set project $PROJECT_iD``` switch active project used in Cloud Shell

```$DEVSHELL_PROJECT_ID ``` always contains your project ID

Your project number is the prefix of your service account e.g ```{project-number}-compute@developer.gserviceaccount.com```



### Infrastructure regions and health status

```gcloud compute regions list``` to list available regions and view their health status

### Instances

 ```gcloud compute instances list ``` list VMs
 
 ```gcloud compute instances create privatenet-us-vm --zone=us-central1-c --machine-type=f1-micro --subnet=privatesubnet-us --image-family=debian-10 --image-project=debian-cloud --boot-disk-size=10GB --boot-disk-type=pd-standard --boot-disk-device-name=privatenet-us-vm``` launch VM in specific subnet.

## VPC Networks

```gcloud compute networks create privatenet --subnet-mode=custom``` to create a custom mode VPC network called privatenet 

```gcloud compute networks subnets create privatesubnet-eu --network=privatenet --region=europe-west1 --range=172.20.0.0/20``` to create a subnet in europe-west1 region and assigning it a range of internal IP address

```gcloud compute networks subnets list``` list available networks in current gcp project

```gcloud compute networks subnets list --sort-by=NETWORK``` list subnets and order by networks it belongs to

```gcloud compute firewall-rules create privatenet-allow-icmp-ssh-rdp --direction=INGRESS --priority=1000 --network=privatenet --action=ALLOW --rules=icmp,tcp:22,tcp:3389 --source-ranges=0.0.0.0/0``` create firewall rules that allows inbound tcp, and icmp traffic from anywhere


