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



