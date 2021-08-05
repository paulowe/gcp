## App Engine deployment notes

```gcloud app deploy --version=two --no-promote --quiet```

The --no-promote parameter tells App Engine to continue serving requests with the old version. This allows you to test the new version before putting it into production.

## Kubernetes

1. Create cluster

2. ```gcloud container clusters get-credentials cluster-1 --zone us-central1-c --project qwiklabs-gcp-00-ddc41a696f76```  to connect to your Kubernetes cluster

3. ```kubectl get nodes``` to list nodes/VMs in your cluster


