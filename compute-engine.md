[Overview](https://github.com/paulowe/gcp/blob/main/readme.md)

[Next](https://github.com/paulowe/gcp/blob/main/kubernetes-engine.md)
## Compute Engine
Lets you create and run VMs in the cloud
- No upfront investment
- Fast and consistent performance
- Run images from Google or third party
- Machine type: Determine Memory and VCPUs or
- Create **custom VM types** to meet your compute needs perfectly

**Storage for VMs**
- Standard SSD (Persistent, Low performance)
- Local SSD (Temporary - OnVMTerminate, High perfromance)

**Boot Image**

Linux or Windows

**Startup Script**

Pass startup scripts and other metadata

**Snapshots**

Create durable snapshot of disks for backups or migration

**Preemptible VMs**
- For interruptible workloads e.g. Batch jobs
- Ensure you have a mechanism for start/stop jobs

**How big can you create a VM?**

Welll 96 vCPUs, 624GB RAM - **Big VMs** are great for in-memory DBs and CPU intensive analytics (Vertical scaling)

Horizontal Scaling - Typically what you would try first 

Compute Engine also supports **Autoscaling and Load balancers**

### Important Compute Engine commands to remember

#### Configure default zones
```gcloud config set compute/zone northamerica-northeast1-a```

#### Create compute engine

##### Basic
```
gcloud compute instances create "my-vm" \
--machine-type "n1-standard-1" \
--image-project "debian-cloud" \
--image "debian-9-stretch-v2" \
--subnet "default" 
```

##### Intermediate 
``` 
gcloud beta compute --project=projectName \
instances create my-vm-1 --zone=northamerica-northeast1-a --machine-type=e2-medium \
--subnet=default --network-tier=PREMIUM --maintenance-policy=MIGRATE \
--service-account=XXXXXX-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
--tags=http-server --image=debian-10-buster-v20210609 --image-project=debian-cloud \
--boot-disk-size=10GB --boot-disk-type=pd-balanced \
--boot-disk-device-name=my-vm-1 --no-shielded-secure-boot --shielded-vtpm \
--shielded-integrity-monitoring --reservation-affinity=any && \

gcloud compute --project=projectName firewall-rules create default-allow-http --direction=INGRESS --priority=1000 --network=default --action=ALLOW 
--rules=tcp:80 --source-ranges=0.0.0.0/0 --target-tags=http-server 
```

