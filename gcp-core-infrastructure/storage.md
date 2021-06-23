[Overview](https://github.com/paulowe/gcp/blob/main/readme.md)

[Next](https://github.com/paulowe/gcp/blob/main/gcp-core-infrastructure/cloud-sql.md)
## Cloud Storage

### Cloud Storage summary:
- Cloud Storage is binary large object storage with high performance
- Does not require capacity management
- Immutable storage files
- Default server side encryption of data at rest and in-transit encryption using HTTPS
- Access can be controlled through IAM
- Finer grained control using ACL rules
    - ACL: Scope (who can perform certain actions), and Permission (What actions can be performed, read/write, etc)

### gsutil to create a bucket
In Cloud Shell, the DEVSHELL_PROJECT_ID environment variable contains your project ID. Enter this command to make a bucket named after your project ID:

```gsutil mb -l $LOCATION gs://$DEVSHELL_PROJECT_ID```

DEVSHELL_PROJECT_ID environment variable contains your project ID so, we are essentially creating a bucket with the user-defined, globally unique project ID.

### Copy file from remote Cloud Storage location

```gsutil cp gs://cloud-training/gcpfci/my-excellent-blog.png my-excellent-blog.png```

### Modify ACL
Modify the Access Control List of the object you just created so that it is readable by everyone:
```gsutil acl ch -u allUsers:R gs://$DEVSHELL_PROJECT_ID/my-excellent-blog.png```

