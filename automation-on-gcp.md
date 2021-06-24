
F3

## This document demonstrates the power of Automation on GCP through the Marketplace

### Task 
- Configure a Jenkins CI environment using GCP marketplace
- Verify you can manage the service through Jenkins UI, and 
- Administer the service from VM through SSH


Compared to manual configuration this automation drastically **reduces your setup time from a couple of hours/days to a few minutes**

## Launching an Automation Server
Jenkins is an **open source automation server** that helps you automate the 
- building, 
- testing, and 
- deployment of any project across multiple platforms. 

Jenkins helps to avoid breaking changes so that you can **save time and ensure the delivery of high-quality software**. 

Its web interface provides an easy way to manage and test your applications before taking them to production. 

## Jenkins Certified by Bitnami
This image bundles the latest versions of community-recommended plugins, including pipelines and Git integration. This open source solution is packaged by Bitnami. Learn how to install, configure, and manage it at docs.bitnami.com. For deployment issues, reach out our support team at community.bitnami.com.

## Managing Jenkins
Running on the deployed Jenkins VM (controller node), you can
- Configure system - global settings and paths
- Configure tools and their location 
- Manage plugins - add, remove, enable or disable plugins that extend Jenkins
- **Manage Nodes and Clouds** - add, remove, control and monitor the various nodes that Jenkins runs jobs on

Note, building on the controller node can be a security issue. You should set up distributed builds

- Confifgure security
- Manage users adn credentials
- System log and information
- Load statistics, and more!


**Why use Bitnami Certified Apps?**

Bitnami certifies that our images are secure, up-to-date, and packaged using industry best practices.

With Bitnami, you can trust what is in the app you're launching. We monitor all the applications we package for vulnerabilities, outdated components and libraries, and application updates. When any of these are identified, we patch and release every affected listing within a couple of days.

**Pricing**

Bitnami **does not charge usage fees**.

You only pay for the infrastructure costs and you have the flexibility of editing the configurations after deployment
