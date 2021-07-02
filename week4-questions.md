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

Which one has highest priority Private Google Access enabled on subnet OR service account permission enabled on VM instance
            - Applications running on the VM use the service account to call Google Cloud APIs. Use Permissions on the console menu to create a service account or use the                   default service account if available.

Cloud NAT - The NAT mapping section allows you to choose the subnets to map to the NAT gateway. You can also manually assign static IP addresses that should be used when performing NAT. Do not change the NAT mapping configuration in this lab. **What is NAT mapping?**

## Storage
What is a Standard persistent disk? (I know SSD and HDD and Local SSD)

How do you make a persistent disk regional? (Arent all disks supposed to operate based on the zone instead?)

## VM Lifecycle and states

What is the difference between reset and reboot? in terms of changes in your running applications 
reset (remains running, no shutdown script time) - console, gcloud, API, OS
reboot (running -> running , ~90 sec shutdown time) - OS: sudo reboot

What is the difference between Machine type vs Image? (Why can you change MT but not Image when an instance is terminated?) 
