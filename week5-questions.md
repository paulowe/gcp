Boot disk images contain - OS, File system, Boot loader, Preconfigured software 

Machine image contain - Stores all configuration metadata, permissions, from one or more disks 


<img src="https://github.com/paulowe/gcp/blob/main/captures/Capture%204.PNG"/>

**Whats the difference between these two types of images? Are boot disk images the same as Persistent disks?**


2. Is the metadata server an actual separate VM that gets created / or is it metadata service part of the machine image (consisting or Boot disk image, and potentially more network attached disks)

3. Clarification for Disk formatting and mounting commands on VMs.

4. Users/Groups can be assigned a Service Account role and whihc permits them to perform all actions granted to the Service account role. Are service accounts assigned to users only if the have access to a specific VM or can they be effectively assigned to users/groups independent of whether or not a VM (with that Service account attached on it) is provisioned ?

