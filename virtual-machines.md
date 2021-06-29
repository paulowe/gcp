[Overview](https://github.com/paulowe/gcp/blob/main/readme.md)

[Next](https://github.com/paulowe/gcp/blob/main/machine-types.md)

# Virtual Machines 
The focus is on traditional VMs (IaaS) because it provides the utmost flexibility

**Language Support :** Any

**Usage Model :** IaaS

**Scaling :** Server Autoscaling

**Primary use case :** General workloads - Especially enterprise infrastructure designed to run on servers. 
This makes those workloads portable and easy to run in the cloud

## Compute Engine
Physical servers running in GCP with a variety of configurations.

Predefined or custom machine types allow you to choose
- vCPUs (cores) and Memory (RAM)
- Persistent disks: HDD, SSD, and Local SSD
- Configure Networking interface
- Linux or Windows machines

**Important topics covered along with Compute Engine include**

- Machine rightsizing
    - Recommendation engine for optimum machine size
    - Stackdriver statistics
    - New recommendation 24hrs after VM create or resize
- Global Load balancing
    - Multiple regions for availability    
- Availability policies
    - Live migrate
    - Auto restart
- Instance metadata and startup scripts
- Pricing
    - Per second billing
    - Sustained use discounts
    - Committed use discounts
    - Preemptible VMs
    

