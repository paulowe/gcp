[Overview](https://github.com/paulowe/gcp/blob/main/readme.md)

[Next](https://github.com/paulowe/gcp/blob/main/compute-engine-actions.md)

## Disk options

After selecting your OS, you need to select some type of Disk where it will be installed.

Each VM comes with a **single root peristent disk** because you are choosing 

A base image is loaded onto root disk during first boot
  - Bootable: you can attach to a VM
  - Durable: can survive VM terminate

## Persistent Disks

Persistent disks are 
- Attached to the VM **through the Network Interface**. This is network storage appearing as a block device
- Durable: Can survive VM terminate
- Bootable: You can attach to a VM
- Snapshots: incremental backups
- Performance: Scales with size
- HDD (cheaper; magnetic;) or SSD (faster; solid-state) 
- Dynamically resize
- Can be attached in read-only mode to multiple VMs (allows you to share static data between instances, which is cheaper than replicating data to unique disks)
- Zonal PD or Regional (synchronously replicated; active-active disk replication across 2 zones; high-availability;)
      - pd-standard (backed by HDD)
      - pd-balanced (backed by SSD; Balance performance and cost)
      - pd-ssd (backed by SSD) 

- All data at rest is encrypted

## Local SSD disks 
- Physically attached to the VM
- Ephemeral
- High iops and low latency
- Attach up to 8 Local SSD with 375GB max per disk for a total of 3TB
- Data doesnt survive an instance stop / terminate, but can survive instance reset.
- Cannot be reattached to a different VM

## RAM Disk
- Highest performance
- Use tmpfs for in memory data storage of small data structures. It's recommended to use high memory VM if you need to take advantage of such features Along with a PD to backup the RAM data
- Volatile/ Ephemeral: erase on stop/restart
- Low latency and Low risk of data loss
- Faster than Local disk; Slower than memory
    - Use when your application expects a file system structure and cannot directly store its data in memory
    - Fast cache / scratch disk  


Shared core: Max 16 disk

Standard, High mem, High CPU, Memory optimized, Compute optimized - 128 disk

Note : All your disk share the same network throughput as the rest of your egress / ingress traffic. If you attach a lot of disks because of higher iops keep this in mind

## Traditional Hardware disks vs Cloud Persistent Disk
<img src="https://github.com/paulowe/gcp/blob/main/captures/Capture%205.PNG" />
