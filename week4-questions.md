**VPC Networking Lab**
Default (implied) Firewall rules

Block all incoming connections and
Allow all outgoing connections.

YET the default ingress rules for the default network show

default-allow-icmp
default-allow-rdp 
default-allow-ssh 
default-allow-internal 

These firewall rules allow ICMP, RDP, and SSH ingress traffic from anywhere (0.0.0.0/0)

and all TCP, UDP and ICMP traffic within the network (10.128.0.0/9)

**Why is there this contradiction??**


How is traffic routed between VMs and Google services when using Private Google Access

**Compute Engine Config**
Which one has highest priority Private Google Access enabled on subnet OR service account permission enabled on VM instance.
What if PGA is not enabled on a subnet. Does the Service Account setting (when configuring a Compute Engine VM still hold?

       - Applications running on the VM use the service account to call Google Cloud APIs. 
         Use Permissions on the console menu to create a service account or use the 
         default service account if available.
         
        - Allow scopes : Select the type and level of API access to grant the VM.
        
          Default: read-only access to Storage and Service Management, write access to Stackdriver Logging and Monitoring, read/write access to Service Control

**Traffic Flow in and out of your VPC**
Can HTTP/HTTPS traffic be allowed at the subnet level but denied at the instance level? Maybe because certain VMs in the region are private whereas others need to be public?

Does the Firewall setting (when configuring instance VMs) affect/alter any firewall configurations made at the subnet level?

Is one type of firewall or two types

Do they have state/stateless? 

Why would Compute Engine such a firewall rule - Allow HTTP traffic to flow into your instance that does not have an External IP assigned? Does this operation alter Firewall rules for that particular VM you are creating or for the entire subnet?

**Communication for Instances without an external IP**
Cloud NAT - The NAT mapping section allows you to choose the subnets to map to the NAT gateway. You can also manually assign static IP addresses that should be used when performing NAT. Do not change the NAT mapping configuration in this lab. **What is NAT mapping?**

## Storage
What is a Standard persistent disk? (I know SSD and HDD and Local SSD)

How do you make a persistent disk regional? (Arent all disks supposed to operate based on the zone instead?)

## VM Lifecycle and states

What is the difference between reset and reboot? in terms of changes in your running applications 
reset (remains running, no shutdown script time) - console, gcloud, API, OS
reboot (running -> running , ~90 sec shutdown time) - OS: sudo reboot

What is the difference between Machine type vs Image? (Why can you change MT but not Image when an instance is terminated?) Theres even a conflicting case where lab says and shows you cannot change MT but Lecture says you can 
