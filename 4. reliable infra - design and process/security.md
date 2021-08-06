# 1. Security concepts
**Security is a shared responsibility**

Principle of least privilege applies to **machines, people and proccesses**. Roles should be assigned to all these entities

Separation of duties
- No one person can change or delete data without bein detected
- No one person can steal sensitive data
- No one person is in charge of designing, implementing and reporting on sensitive systems

Use multiple projects to separate duties

#### Audit Logs regularly
- All services write to logs
  - Admin logs
  - Data access logs
  - VPC Flow logs
  - Firewall logs
  - System logs
 
 #### Google cloud meets many third party and government compliance standards worldwide
 - But this does not mean that your applications are also certified or runs with these standards
 - Focus on building your applications running on top of Google cloud 
 
 #### Security command center provides access to organizational and project security configuration
 - Provides a set of actionable recommendations

## 2. Securing people:
- To grant people access to your projects, **add them as members** and assign them one or more roles
- Members are identified by their login
- Add members to groups for easier management
- Roles a re simply a list of permissions
- Use the console to easily see what permissions are granted to roles

#### Use organizational policies and folder to simplify securing environments and managing resources
- Grant roles to Groups rather than individuals
- Groups can be more granular than job roles
- Use multiple groups for better control

Roles
- Prefer predefined roles over custom roles
- Grant roles at the smallest scope needed (least privilege)
- Limit use of "Owner" and "editor" roles
- Consider hierarchy inheritance when assigning roles

#### Identity-Aware Proxy simplifies auhorization to Google cloud applications and VMs
- Works with apps deployed BEHIND THE http(s) load balancer in on App Engine environments, Compute Engine and GKE
- When configured, it forces users to log in
- Admins control who can access to app
- Allows employees to securely access web based apps without needing a VPN

#### Identity platform provides authentication as a service
- Proides federated login that integrates with many common providers
- Use it to provide sign-up and sign-in for your end users' applications

## 3. Securing Machines:
Service accounts can be used for machine or application identities to make authorized API calls
- Create a service account and grant it one or more roles
- Can asign that service account to VMs, GKE node pools
- Those machines run with only the rights granted by the roles

Service accounts can be an identity and a resource
- **Identity** for your app/service to authenticate (a VM eg running as a service) it so it can make API callspermitted by IAM roles attached to the SA
- Control who can create VMs with the service account so random VMs cannot assume the identity. Here the SA is a **Resource** to be permisisoned and you assign the SA user role to users/members you trust to use the SA

Each SA is assigned a private and public keys with max usage period of 2 weeks

## 4. Network Security
- Remove external IPs to prevent access to machines outside their network
- Use a bastion host to provide access to private machines

![image](https://user-images.githubusercontent.com/40435982/128525684-c3838d3e-8328-40c2-a3bf-86f9393586c6.png)

- Can also SSH into internal machines using IAP from console and CLI
- Use Cloud NAT to provide egress to the internet from internal machines

**All internet traffic should terminate at a load balancer, third party firewall (proxy/WAF), API Gateway, or IAP. That way, internal services cannot be launched and get public IP addresses
- COnifgure firewall rules to allow access to VMs. By default ingress on all ports is denied
- Add fw rules to control which clients have access to which VMs on which ports.
- Application level security is the responisbility of the customer

#### Control access to APIs using Cloud Endpoints
- Protect and monitor your public APIs
- Xontrol who has access to your API (using e.g Auth0)
- Validate every call with **JSON web tokens** and **Google API keys**
- Integrates with Identity platform for authentication

#### Restrict access to your services to TLS Only
- All Google Cloud Service endpoints use HTTPS
- Up to you to configure serice endpoints
- In the load balancer setup, only create a secure frontend

#### Leverage Google cloud network services for DDoS protection
- Global load balancers detect attacks and drop them
- Enabling the CDN will protect backend resources


**Cloud features for preventing DDoS attacks**
**HTTP Load Balancing** mitigates and absorbs many Layer 4 and below attacks such as SYN flood, IP fragment floods, and port exhaustion. **Cloud CDN** caches cacheable content at points of presence close to users. In the event of a DDoS attack for cacheable content, the requests are sent to points of presence, not to your servers/infrastructure, thus increasing the likelihood of the attack being absorbed. **Google Cloud Armor** is built for DDoS mitigation, working with Cloud Load Balancing to detect DDoS attacks.

#### Use Google Cloud Armor to create network security policies
- Can allow or deny access to your resources using known Ip addresses or ranges
- In Addition to layer 3 and layer 4 security, **Cloud Armor supports layer 7 web applications firewall rules (WAF Rules)**
- predefined rules for preventing common attacks like SQL injections and cross-site scripting
- Flexible rules language allows you to allow or deny traffic using **request headers, geographic locations and Ip addresses, cookies**
![image](https://user-images.githubusercontent.com/40435982/128532993-d82fcf2d-b056-4e8c-acee-11f35e0bf355.png)

## 5. Encryption
Google cloud provides server-side encryption of data at rest by default

- Data Encryption Key uses AES-256 symmetric key
- The DEK Keys are encrypted by Google using Key Encryption Keys (KEK). This is done so that the DEK can be stored local to the encrypted data for fast decryption.
- **On the fly decryption** by authorized user access with no visible performance imapact
- To protect KEKs, Google controls root keys in Cloud KMS
- Keys are automatically rotated periodically

#### To manage your own keys (Customer Managed Encryption Keys)
- Customer managed encryption keys are created in the cloud using Cloud Key Management Service (KMS)
- Create the keys and specify the rotation frequency
- You can select your keys when creating storage resources like buckets and disks

#### Customer Supplied encryption keys are created On-prem and provided to Googlr Cloud
- Use your own keys with Google cloud services
- CSEK are supplied by the callung application per API-call
- Only cached in RAM by Google
- They decrypt a single payload (or column) or block of returned data
- Supported by Compute Engine (persistent disks) and Cloud Storage

#### The Data Loss Prevention API can be used to protect sensitive data by finding it and censoring/obscuring (redacting) it
- Scans data Cloud Storage BigQuery, or DataStore
- **Detects many different types of sensitive data** including
  - Emails
  - Credit cards
  - Tax IDs 
- You can add your own information types
- Can delete, mask, tokenize, or just identify the location of the sensitive data
