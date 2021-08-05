## App Engine deployment notes

```gcloud app deploy --version=two --no-promote --quiet```

The --no-promote parameter tells App Engine to continue serving requests with the old version. This allows you to test the new version before putting it into production.

## Kubernetes

1. Create cluster

2. ```gcloud container clusters get-credentials cluster-1 --zone us-central1-c --project qwiklabs-gcp-00-ddc41a696f76```  to connect to your Kubernetes cluster

3. ```kubectl get nodes``` to list nodes/VMs in your cluster

4. To use Kubernetes Engine, you need to build a Docker image. Enter the following commands to use Cloud Build to create the image and store it in Container Registry:

```
cd ~/gcp-course/training-data-analyst/courses/design-process/deploying-apps-to-gcp
gcloud builds submit --tag gcr.io/$DEVSHELL_PROJECT_ID/devops-image:v0.2 .
```
