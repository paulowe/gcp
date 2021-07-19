## Configuring an HTTP Load Balancer with Autoscaling

- Create a health check firewall rule
    - Create target tags to assign your instances
    - Allow the following Source Ip ranges ```130.211.0.0/22``` and ```35.191.0.0/16```
    - open Port 80 (HTTP LB)
- Create a NAT configuration using Cloud Router
    - Implements Outbound NAT but not Inbound NAT 
- Create a custom image for a web server
    - Setup, start and test apache web server
    ```
    sudo apt-get update
    sudo apt-get install -y apache2
    sudo service apache2 start
    curl localhost 
    ```
    - Set the Apache service to start at boot for new VM instances (test this using reset). Reset performs a hard reset on the instance, which wipes the memory contents of the machine and resets the virtual machine to its initial state.
    ```
    sudo update-rc.d apache2 enable
    ```
    - After reset SSH and confirm Apache is running using ```sudo service apache2 status``` command
    - Make sure your prevent Boot disk deletion setting is enabled and delete VM
    - Create a custom image from your boot disk (now you can delete the disk)
 
- Create an instance template based on the custom image
        - Managed instance groups offer autoscaling capabilities that allow you to automatically add or remove instances from a managed instance group based on increases or decreases in load. Autoscaling helps your applications gracefully handle increases in traffic and reduces cost when the need for resources is lower. You just define the autoscaling policy, and the autoscaler performs automatic scaling based on the measured load.
     
- Create two managed instance groups
- Configure an HTTP load balancer with IPv4 and IPv6
- Stress test an HTTP load balancer
