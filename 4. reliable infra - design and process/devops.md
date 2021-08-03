# Overvew of DevOps Automation
- Automate service deployment using CI/CD pipelines
- Leverage **Cloud Source repositories** for source and version control
- Automate builds with **Cloud Build and Build triggers**
- Manage container images with **Container registry**
- Investigate infrastructure with code using **Cloud Deployment manager and Terraform**

## CI pipelines and IaC

Each microservice should have its own repository. Now, heres an example of a simple CI pipeline
<img width="454" alt="CI pipeline" src="https://user-images.githubusercontent.com/40435982/128040355-f8e1696d-c3f5-4e83-9ac9-409af7f99e4e.PNG">

Tools for CI pipelines
- Cloud Source repositories - Github integrated on Google cloud. Control access to repos using IAM within you Projects
- Build Triggers - Watches a repository for changes in the Git repo and starts the build container (you can configure it to build on any change **or specific changes that match a criteria**)
- Cloud Build (alternative to Docker build) - Build system executes the steps required to make a deployment package of Docker image. 
- Container registry (Cloud hosted Docker registry) -  A central location to Manage docker images, deployment packages and perform vulnerability analysis

**Binary authorization allows you to enforce deploying only trusted containers into GKE**
- Step one is to enable binary authorization on GKE cluster
- Add a policy that requires signed images
- When image is built, an "attestor" verifies that it was from a trusted repository 
- Container registry includes a vulnerability scanner that scans containers
<img width="400" height="400" alt="binary-auth" src="https://user-images.githubusercontent.com/40435982/128042228-e77fe917-9845-463b-95c2-5cf1becdceae.PNG">
