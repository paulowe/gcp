[Overview](https://github.com/paulowe/gcp/blob/main/readme.md)

[Next](https://github.com/paulowe/gcp/blob/main/gcp-core-infrastructure/storage.md)
## Comparing storage options: Technical details

### Cloud Datastore
- Type: NoSQL
- Transactions: Yes
- Complex queries: No
- Capacity: TB
- Unit size: 1MB/entity

### BigTable
- Type: NoSQL
- Transactions: No
- Complex queries: No
- Capacity: PB
- Unit size: 10MB/cell; 100MB/row

### Cloud Storage
- Type: Large Object store
- Transactions: No
- Complex queries: No
- Capacity: PB
- Unit size: 5TB/object

### Cloud SQL
- Type: Relational (OLTP)
- Transactions: Yes
- Complex queries: Yes
- Capacity: TB
- Unit size: Depends on DB engine

### Cloud Spanner
- Type: Relational (OLTP)
- Transactions: Yes
- Complex queries: Yes
- Capacity: PB
- Unit size: 10,240Mib/row

### BigQuery
- Type: Relational (OLAP)
- Transactions: Yes
- Complex queries: Yes
- Capacity: PB
- Unit size: 10MB/row
