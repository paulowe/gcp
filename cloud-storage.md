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

Each of the storage classes provide **3 location types**

- Multi-region - Large geographic region (such as US) that contains two or more geographic places
- Dual region - Specific pair of regions (such as Finland and Netherlands)
- Region -  Specific geographic place (such as London)

Objects stored in a Multi-region or Dual region are **geo-redundant**
