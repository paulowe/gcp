## What is a (boot disk) image?

- Boot loader
- OS
- File system structure
- Preconfigured Software
- Any other Customizations

Image types

1. Public base images
   - Google, third party vendors, and community (Linux CentOS, Debian, Ubuntu; Windows Server 2019, 2016, SQL Server;)
   - Premium images (p) - Vary according to MT. But prices are global
2. Custom images
   - Create new image from VM; pre-configured and installed
   - Import images from On-prem, other cloud providers

## Machine iImages
Machine images store config, metadata, permissions and data from **one or more disks, required to create a VM.** 

Machine images can be used in many scenarios

**Use cases:**
- Single disk backup  (PD snapshots; Custom images; can achieve this as well)
- Multiple disk backup (Only Machine images)
- Differential backup (PD snapshots; can achieve this as well)
- Instance cloning and replication ( Custom image; Instance template; can achieve this as well)
- VM instance confiuration (Instance template; can achieve this as well)

<img src="https://github.com/paulowe/gcp/blob/main/captures/Capture%204.PNG" />
