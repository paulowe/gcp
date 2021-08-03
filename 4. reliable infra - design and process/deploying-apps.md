# Choosing a Google Cloud deployment platform
<img width="600" height="400" alt="app-deployment-flow" src="https://user-images.githubusercontent.com/40435982/128083027-f402d5fe-6694-4d17-984b-1ab465b277ad.PNG">

## Use Compute Engine when
- Complete control over your OS
- You have app thats not containerized
- Your app is a self-hosted DB

**Managed instance groups** create VMs based on instance templates
- Define the VMs: Image, Machine types, Startup scripts
- Machines are Created by the IG manager
- Set up auto scaling to optimize cost and meet varying user workloads
- Add a health check to enable auto healing
- Use multiple zones for high availability

**Use one or more instance groups as the backend for load balancers**

- Use global lb for instance groups in multiple regions
- Enable CDN to cache static content
- For external services, set up SSL
- For internal services, dont provide a public IP address

## GKE automates the creation and management of compute infrastructure
- Kubernetes clusters have a collection of nodes
- In GKE, **nodes are Compute Engine VMs**
- Services are deployed into pods. **Pods** represent a single instance of a runnning process in a cluster and can contain **one or more containers that run the services being deployed**
- Optimize resource utilization by deploying multiple services to the same cluster

**As mentioned above, You can deploy multiple services to the same cluster**, therefore your cluster is a group of nodes that run your entire microservice architecture. How you group each service such that resource utilization is maximized is not discussed here... Wait until Architecting with GKE course :)

## Cloud Run allows you to deploy containers to Google managed Kubernetes cluster
- Allows you to use Kubernetes without the cluster management or configuration Code
- Services/Apps must be **stateless**
- Need to deploy apps using Docker images in Container registry
- Can also use Cloud Run to automate deployment to your own GKE/Anthos cluster

## App Engine is designed for microservices
- Each project can contain 1 App Engine application
- An application has 1 or more services
- Each service has one or more versions
- Versions have 1 or more instances
- Automatic traffic splitting for switching versions
<img width="209" alt="app-engine" src="https://user-images.githubusercontent.com/40435982/128086577-d341359d-efa5-4a3e-ba06-b998b587b493.PNG">



Cloud Functions
