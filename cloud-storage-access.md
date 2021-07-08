# Cloud Storage: ACLs and Signed URLs

### Access control options
<img src="https://github.com/paulowe/gcp/blob/main/captures/Capture%209.PNG" />

All these options provide fine-grained control over access and operations happening within you bucket.

### Access Control Lists (ACLs)

Mechanism used to define 
- **who** (Scope) has access to your buckets and objects
- **level of access** (Permission) they have

**Maximum number of ACLs for a bucket = 100 entries**

**Each ACL** consists of one or more entries

Each entry consists of two pieces of information
- **Scope** - who can perfrom actions (allUsers [anyone on the internet with/without a google account], allAuthenticatedUsers[authenticated with a google account], collaborator@gmail.com)
- **Permission** -  what actions can be perfomred (Read/Write/List...) 

### Signed URLs
Use cases
- Grant **limited time-based access tokens** instead of using account based authentication for controlling resource access
- When you dont want to require users have a google account, signed URLs allow you to do this for Cloud Storage
    - Create a signed URL that grants specific read/write access to a resource and
    - Specify when access expires (Time limited)
    - Signed using a **private key associated with a service account**
    - Any user with URL can invoke permitted operations (such as HTTP GET, PUT, DELETE)
    
