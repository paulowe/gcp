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
