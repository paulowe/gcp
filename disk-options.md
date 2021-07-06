## Disk options

After selecting your OS, you need to select some type of Disk where it will be installed.

Each VM comes with a **single root peristent disk** because you are choosing 

A base image is loaded onto root disk during first boot
  - Bootable: you can attach to a VM
  - Durable: can survive VM terminate

## Persistent Disks

Persistent disks are 
- Attached to the VM through the Network Interface. This is network storage appearing as a block device
- Durable: Can survive VM terminate
- Bootable
- Snapshots: incremental backups
- Performance: Scales with size
- HDD (magnetic) or SSD (faster; solid-state) 
