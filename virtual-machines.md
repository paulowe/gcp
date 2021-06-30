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
    
### Machine Types

Compute Engine provides a variety of machine types; You may also create custom machine types that are tailored to fit you specific use case

**Predefined or custom machine types** allow you to choose
- vCPUs (cores) and Memory (RAM)
- Persistent disks: HDD, SSD, and Local SSD
- Configure Networking interface
- Linux or Windows machines

Your choice of CPU will affect your network throughput.
- Network throughput **scales 2Gbps per vCPU core**; **Except** for instances with 2 and 4 vCPUs which receive up to 10Gbps bandwidth.
- Theoretical **max of 32 Gbps with 16vCPUs** or 100Gbps with T4 or V100 GPUs
- 1 vCPU = 1 Hardware hyper-thread 

### Storage

All Disk types provide the same size options when choosing a persistent disk. So what makes them different? 

**Performance vs Cost**

- **Standard** - Sized up to 64TB/instance. 
                 Performance of disk scales with each GB of space allocated

- **SSD persistent disk** - Provide Higher iops/dollar spent
                            Sized up to 64TB/instance
                            Performance of disk scales with each GB of space allocated
                         
- **Local SSD (temporary)** - Provide even higher throughput and lower latecny because they are attached to the physical hardware. 
                              Persist data until you stop/delete the instance. Typically these disks are used as a swap disk
                              You can create instances with up to 8 separate 375GB local SSD partitions for a total of 3TB local SSD space for each instance
- **HDD** - Sized up to 64TB/instance
            Performance of disk scales with each GB of space allocated

