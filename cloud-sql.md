[Overview](https://github.com/paulowe/gcp/blob/main/readme.md)

[Next](https://github.com/paulowe/gcp/blob/main/cloud-datastore.md)
## Cloud SQL (Relational DB)

Cloud SQL is a fully managed relational DB that offers MySQL or PostgreSQL as a DB engine.

### Characteristics
- Has several replica services
- Can replicate data between zones
- Automatic failover
- Backup data with On demand or Scheduled backups
- Scales vertically and horizontally (read replicas only)
- Includes network firewalls and encryption

### Create a Cloud SQL connections

You need to add/authorize a network connection for your Database engine. 
You can do this by adding the public IP address of your web server followed by /32 , /24 , or whatever your network identifier is

