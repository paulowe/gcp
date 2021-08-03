## Overview of Choosing Storage Solutions
- Choose the appropriate data storage service based on use case, durability, availability, scalability, and cost
- Store binary data with Cloud Storage
- Store relational data with Cloud SQL or Cloud Spanner
- Store NoSQL data using BigTable or Firestore

## Key storage characteristics
<img width="600" height="100" alt="storage-char" src="https://user-images.githubusercontent.com/40435982/128052494-e9398873-2fac-4e7d-afde-f412f12b6be9.PNG">

All these services are managed, and have industry standard SLAs.
#### Criteria for each service in you microservice architecture
- Type of data (structured/unstructured)
- SQL or NoSQL
- Strong/Eventual consistency
- Amount/Size of data (MB, GB, TB, PB, ExB)
- Read write patterns (Read only, Read/write)
- Requirements for Scaling and Availability

**1. Availability SLAs** (Cloud Storage, Spanner and Firestore)

Availability represents the service uptime

<img width="332" alt="gcs-slas" src="https://user-images.githubusercontent.com/40435982/128052777-89e7e1a3-a6ee-45a9-a026-d83b105a4277.PNG">

Requirements will guide you for storage choice

Availability SLAs are defined **per month**. 

```Monthly uptime % = (Total mins/mo - Downtime mins sufferred/mo ) / Total mins/mo```

**2. Durability represents the odds of losing data**

Preventing data loss is a shared responsibility. Google's responsibility is to ensure durability of data in the event of hardware failure, whereas customer responsibility is to perform backups

- Cloud Storage = 11 9's of durability. Customers need to turn versioning on
- Disk Cloud SQL - Provides **automated machine backups; point in time recovery; failover server**. Customers should run SQL database backups
- Spanner and Firestore - Google provides automatic replication; Customers should run export jobs to GCS

**3. The amount of data and number of reads/writes is important when selecting a data storage service**

- Horizontal scaling (Bigtable, Spanner)
- Vertical scaling (Cloud SQL, Memorystore)
- Automatic scaling (GCS, Bigquery, Firestore)

**4. Strong consistency**

Strongly consistent databases update all copies of data within a transaction. This ensures everyone gets the latest copy of the data on reads
- Storage
- Cloud SQL
- Spanner
- Firestore

Eventually consistent databases update one copy of the data and the rest asynchronously
- Bigtable
- Memorystore replicas

**5. Calculate total cost per GB when choosing a storage service**

- Bigtable and Spanner would be too expensive for storing smaller amounts of data
- Firestore is less expensive per GB, but you also pay for reads and writes
- Cloud Storage is relatively, cheap but you cant run a database in storage
- Bigquery storage is relatively cheap but doesnt provide fast access to records and you have to pay for running queries

<img width="800" height="400" alt="storage-portfolio" src="https://user-images.githubusercontent.com/40435982/128056356-812afabe-9f78-46da-8151-5ac67f701533.PNG">

- Cloud SQL - Fixed schema; Storage limit of 30TB ; 
- Cloud Spanner - scales infinitely; global accessibility for Supply chain mgt
- Firestore - Document datastore; Max document store of 1MB
- Bigtable - Good for heavy read/write events
- Biquery - OLAP
- Memorystore - fast access to state data in microservices

<img width="800" height="400" alt="storage-flow" src="https://user-images.githubusercontent.com/40435982/128057439-afb2a5a0-7be1-444f-a702-736946547160.PNG">

## Transferring data into Google Cloud

Criteria for consideration
- Size of data
- Time
- Cost of storage and network impact
- Offline/online (Appliance cost / no appliance?)
- Security

<img width="800" height="400" alt="transfer-times" src="https://user-images.githubusercontent.com/40435982/128058106-53901f1c-4056-489d-9135-19927dc44e47.PNG">

Colored cells represents unrealistic timelines and you should consider alternative solutions
