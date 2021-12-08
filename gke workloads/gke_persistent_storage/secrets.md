# A) About Secrets
- Secrets passsensitive information to Pods (passwords, tokens, and SSH keys)
- Secrets let you manage sensitive information in their own control plane
- Help to ensure Kubernetes doesn't accidentally output this data to logs

**Cloud KMS is a comprehensive service for full secret management. If your application is
managing high-value assets, or if you face stringent regulatory requirements, you
should consider key management systems like Cloud Key Management Service
(Cloud KMS) for full secret management**

## Types of secrets 

### 1. Generic
Used when creating Secrets from 
- files, 
- directories, or 
- literal values

![image](https://user-images.githubusercontent.com/40435982/145131962-617181b2-6e48-4f54-bc23-0605198f90d5.png)

Generic-type Secrets are stored in key-value pairs (like configMaps). However, in
Secrets, **you supply values as base-64–encoded strings.**

##### Creating generic secrets
![image](https://user-images.githubusercontent.com/40435982/145132195-2c8c3940-0851-4424-a347-73be81dd7a6f.png)

### 2. TLS 
Uses **an existing public/private encryption key pair**

- You supply Kubernetes **the public key certificate**, encoded in PEM format, and 
- You must also supply **the private key of that certificate**

### 3. Docker registry
Used to pass credentials **for an image
registry to a Kubelet so it can pull a private image** from the Docker Registry on behalf
of your Pod.

In GKE, Container Registry integrates with Cloud Identity and Access Management,
so you may not need to use this Secret type.

![image](https://user-images.githubusercontent.com/40435982/145131245-3bcf753c-5212-45ad-a249-1a369c852fd0.png)

# B) Consuming a Secret
Secrets can be consumed in a Pod by its containers in 2 ways

### 1. By Environment variables
Here’s an example where two environment variables (SECRET_USERNAME and
SECRET_PASSWORD) are created. 

![image](https://user-images.githubusercontent.com/40435982/145132925-2ddc744c-df0d-4d2f-ae70-226787875032.png)

- These variables are referenced to a Secret named demo-secret, along with their keys. 
- These variables are automatically decoded

### 2. By creating a Secret Volume in a Pod
Here, a Secret Volume named storagesecrets is created and refers to a Secret
named demo-secret.

![image](https://user-images.githubusercontent.com/40435982/145133894-05d92505-161b-4882-a2af-e22a2412ffbf.png)

This Volume is 
- Mounted to the container with **read-only access**, and
- **Can be used by multiple containers** within the Pod

And this Volume restricts the scope to only accessing username key-value pair, but not password
![image](https://user-images.githubusercontent.com/40435982/145134438-36c42b0c-3e7f-408f-8223-e76a6b5e7844.png)

If a password key is required, it must also be listed under the items field.

# C) Kubelet periodically syncs with Secrets to keep a Secret Volume updated

If a Secret that is already attached as a Volume is changed, the keys and
values are **eventually updated.**

# D) Control planes and Backing stores (Secrets and COnfigMaps)

There are separate control planes (and backing stores) for configmaps and secrets.

For Secrets: 
- These provide a mechanism for providers to **create a more secure backing store for Secrets** that can be used to store and protect your secrets.
- GKE has a beta feature that **integrates Secrets with Cloud HSM** using this technique.
