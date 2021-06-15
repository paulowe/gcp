## Important Compute Engine commands to remember

### Configure default zones
```gcloud config set compute/zone northamerica-northeast1-a```

### Create compute engine
```gcloud compute instances create "my-vm" \
--machine-type "n1-standard-1" \
--image-project "debian-cloud" \
--image "debian-9-stretch-v2" \
--subnet "default" ```

