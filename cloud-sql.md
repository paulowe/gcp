## Cloud SQL is a fully managed database service (MySQL, PostgreSQL, MS SQL Server)

**Features :**
- Updates and patches are automatically applied
- Cloud SQL support many clients
    - gcloud sql 
    - App Engine, 
    - Application Engine, Google Workspace scripts
    - Applications and tools
        - SQL Workbenchm Toad, and external apps using MySQL drivers

**Performance :**
 - 30TB storage
 - 40,000 iops
 - 416GB RAM
 - Scale out with read replicas

**Services :**
- HA configuration (with synchronos replication; automatic failover to your stand-by instance)
- Backup service (Automated backups)
- Import/export
- Scaling
    - up: Machine capacity
    - out: read-replicas

### Connecting to a Cloud SQL

<img src="https://github.com/paulowe/gcp/blob/main/captures/Capture%2011.PNG" />

## Cloud SQL proxy
Downloading and making the Cloud SQL proxy executable on a VM

```wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O cloud_sql_proxy && chmod +x cloud_sql_proxy```

```./cloud_sql_proxy -instances=$SQL_CONNECTION=tcp:3306 &``` to let the proxy start listening on port 3306 (default port for MySQL protocol)

## Query metadata service for external ip

```curl -H "Metadata-Flavor: Google" http://169.254.169.254/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip && echo```

## Startup script for Wordpress servers

```
#!/bin/bash
# Always a good idea to update things
apt-get update -y
# Install the Apache2 server, PHP, and MySQL client.  The rest of the install are modules for WordPress.
apt-get -y install apache2 php libapache2-mod-php php-common php-mysql php-gmp php-curl php-intl php-mbstring php-xmlrpc php-gd php-xml php-cli php-zip mysql-client
# Download, unpack and move, the latest WordPress release.
wget https://wordpress.org/latest.tar.gz
tar -zxf latest.tar.gz
cd wordpress
cp -r . /var/www/html
cd /var/www/html
rm index.html
# Allow apache2 to change the wp-config.php file
chgrp www-data .
chmod g+w .
```
