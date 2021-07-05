## Compute Options (vCPU and Memory)

**You have 3 options for configuring a VM. 1. Console 2. Cloud Shell 3. REST APIs**

To automate and process complex configuriations you would want to use REST APIs to configure.

Tip: Configure desired environment using GCP Console and request for equivalent REST code to avoid typos and you get guided drop downs of available options!!

### Available Machine Types

Machine types capture your systems virtual hardware resources including
- Memory 
- vCPU and
- Persistent disk size

GCP offers several machine types in **two categories**

1. Predefined machine types: Ratio of GB of memory per vCPU
    - Standard
    - High - memory
    - High CPU
    - Memory optimized
    - Compute optimized
    - Shared - core
2. Custom machine types: Specify the amount of memory and vCPUs.

### Standard machines
Balance available vCPU and Memory

**Machine names:**

n1 - standard - 1

n1 - standard - 2

n1 - standard - 4

n1 - standard - {# vCPU }

n1 - standard - 96

**Ratio:** 3.75 GB memory / vCPU

**Max # PD:** 128

**Max PD size:** 64TB

### High - memory machines
For workloads that require more Memory relative to vCPU

**Machine names:**

n1 - highmem - 1

n1 - highmem - 2

n1 - highmem - 4

n1 - highmem - {# vCPU }

n1 - highmem - 96

**Ratio:** 6.5 GB memory / vCPU

**Max # PD:** 128

**Max PD size:** 64TB

### High - CPU machines
Ideal for workloads that require more vCPU relative to Memory

**Machine names:**

n1 - highcpu - 1

n1 - highcpu - 2

n1 - highcpu - 4

n1 - highcpu - {# vCPU }

n1 - highcpu - 96

**Ratio:** 0.9 GB memory / vCPU

**Max # PD:** 128

**Max PD size:** 64TB

### Memory - optimized machines
Ideal for workloads that require **intensive Memory use** with *higher Memory to vCPU ratio than High Memory machine types*

Suited for :
- In-memory databases
- In-memory analytics (SAP HANA, DW workloads)

**Machine names:**

n1 - ultramem - **40**

n1 - ultramem - 80

n1 - megamem - 96 (only one that supports Local SSD)

n1 - ultramem - **160**

n1 - highcpu - {# vCPU }

**Ratio:** >14 GB memory / vCPU

**Max # PD:** 128

**Max PD size:** 64TB

### Compute - optimized machines
- Ideal for *compute-intensive workloads* and 
- **Offer highest performance per vCPU** on Compute Engine
- Built on **latest-gen** computing platforms ( intel scalable processors )
- Offer up to 3.8Ghz sustained all-core turbo
- **Full transparency of underlying architecture** enabling advanced performance tuning
- More robust for Compute intensive workloads compared to the n1 - highcpu (High CPU machines)

**Machine names:**

c2 - standard - **4**

c2 - standard - 8

c2 - standard - 16

c2 - standard - 30

c2 - standard - **60**

c2 - standard - {# vCPU }

**Ratio:** 4 GB memory / vCPU

**Max # PD:** 128

**Max PD size:** 64TB

### Shared - core machines

Provide **1 vCPU that is allowed to run for a portion of the time on a single hyperthread** in the host CPU running your instance

These instances are **cost effective** in running **small and non-resource intensive applications** than other machine types.

**Machine names:**

f1 - micro - 0.2 (offer bursting capabilities for a short period of time, by opportunitstically take advantage of available CPUs)

g1 - small - 0.5

{f/g 1} - {size} - {# vCPU }

**Max # PD:** 16

**Max PD size:** 3TB

## Custom Machine TYPE

When to use custom:
- No good fit in the available predefined machine types
- Way more memory than CPU / Way more CPU than Memory but dont require the upgrades provided when scaling predefined MTs

Custom VMs **Cost slightly more** than predfined ones

Limitations:
- Only **1 or even numbere of vCPUs** allowed
- Memory must be between **0.9 - 6.5GB per vCPU (default)**
- Total memory **must be a multiple of 256MB**
- At yet an **additonal cost you can get more memory per vCPU** beyond 6.5GB. This is called **Extended memory**

# Factors that influence choice of Region/Zones

1. Location where you want to run your resources / Where your users are 

2. Processor Microarchtectures supported

Each zone supports a combination of: 

a. Sandy Bridge Processor: (microarchitecture, 2nd gen, Intel core processor)
b. Ivy Bridge (microarchitecture, 3rd gen, Intel core processor)
c. Haswell : (microarchitecture, 4th gen, Intel core processor)
d. Broadwell : (microarchitecture, 5th gen, Intel core processor)
d. Skylake Processor: (microarchitecture, 6th gen, Intel core processor)
e. There are newer architectures than 2015's Skylake (Willow Cove '20 , Cypress Cove '21 but does Google Cloud Support these architectures?)
