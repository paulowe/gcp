[Overview](https://github.com/paulowe/gcp/blob/main/readme.md)

[Next](https://github.com/paulowe/gcp/blob/main/cloud-filestore.md)

## Cloud Storage is an object storage service

### Use Cases include:
- Hosting website content
- Storing data for archiving and disaster recovery
- Distributing large data object to users via direct download

### Features
- Scalable to Exabytes
- Time to first byte in milliseconds?
- Very high availability across all storage classes
- Single API across storage classes

Not a filesystem!

### Storage classes

Standard 
  - Best for Hot data and / or stored for only brief periods of time like data-intensive computations.
  - No minimum storage duration
  - No retrieval cost
  - 99.95% (multi/dual) ; 99.90% (region) ; Availability SLA
  - Durability (9 11's)

Nearline
  - Infrequently accessed data (like long-tail multimedia content).
  - 30 day minimum storage duration
  - $0.01 per GB retrieval cost
  - 99.95% (multi/dual) ; 99.90% (region) ; Availability SLA
  - Durability (9 11's)

Coldline
  - Infrequently accessed data that you read/modify **at most once a quarter**.
  - 90 day minimum storage duration
  - $0.02 per GB retrieval cost
  - 99.95% (multi/dual) ; 99.90% (region) ; Availability SLA
  - Durability (9 11's)


Archive
  - Data archiving, online backup, and disaster recovery.
  - 365 day minimum storage duration
  - $0.05 per GB retrieval cost
  - 99.95% (multi/dual) ; 99.90% (region) ; Availability SLA
  - Durability (9 11's)

### Choosing a storage class

<img src="https://github.com/paulowe/gcp/blob/main/captures/Capture%2010.PNG" />

### Location Types
Each of the storage classes provide **3 location types**

- Multi-region - Large geographic region (such as US) that contains two or more geographic places
- Dual region - Specific pair of regions (such as Finland and Netherlands)
- Region -  Specific geographic place (such as London)

Objects stored in a Multi-region or Dual region are **geo-redundant**

## Cloud Storage overview

### Buckets
- Globally unique name
- Buckets cannot be nested

### Objects
- Inherit storage class of bucket when created
- No minimum size; Unlimited storage

### Access
- gsutil command
- (RESTful) JSON / XML API

### Changing default storage classes
- **Default storage class** is applied to new objects
- **Location types**: Regional -> Multi/Dual region and vice-versa is not allowed
- Objects can be moved from bucket to bucket
- **Object Lifecycle Management** can manage the classes of objects


