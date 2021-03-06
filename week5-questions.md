[Overview](https://github.com/paulowe/gcp/blob/main/readme.md)

[Start of Weekly learning](https://github.com/paulowe/gcp/blob/main/mc-server-lab.md)

[Week 6](https://github.com/paulowe/gcp/blob/main/week6-questions.md)

## Week 5 questions - Jul 9, 2021

Boot disk images contain - OS, File system, Boot loader, Preconfigured software 

Machine image contain - Stores all configuration metadata, permissions, from one or more disks 


<img src="https://github.com/paulowe/gcp/blob/main/captures/Capture%204.PNG"/>

**Whats the difference between these two types of images? Are boot disk images the same as Persistent disks?**


2. Is the metadata server an actual separate VM that gets created / or is it metadata service part of the machine image (consisting or Boot disk image, and potentially more network attached disks)

3. Clarification for Disk formatting and mounting commands on VMs.

4. Users/Groups can be assigned a Service Account role and whihc permits them to perform all actions granted to the Service account role. Are service accounts assigned to users only if the have access to a specific VM or can they be effectively assigned to users/groups independent of whether or not a VM (with that Service account attached on it) is provisioned ?

5. Feature of Cloud Storage: Time to first byte in milliseconds? What does that mean?

6. Access control for Cloud Storage: SignedURLs

7. When you configure a vm to run a proxy (for private cloud sql connections), what does that mean?
Are you charged for equivalently to provisioning two single region databases if you choose the multi-region Cloud sql setup ?


8. Why does network performance scale terribly on Cloud SQL instances compared to Compute engine?
CSQL : 250Mbps network throughput cap. Each additional core increases network cap up to a theoretical max of 2000 Mbps
CE : Scales at 2Gbps per vCPU provisioned

9. Difference between PGA and Private services access (Private services access is a private connection between your VPC network and a network owned by Google or a third party.)

10. Why is failover behavior not considered as High availability for Relational DBs (whereas Spanner and NoSql offerings are considered HA). Are stand-by instances restricted to one region / is there a max number of Stand by instances you can launch in Cloud SQL?

<img src="https://github.com/paulowe/gcp/blob/main/captures/Capture%2012.PNG" />

