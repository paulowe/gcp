[Overview](https://github.com/paulowe/gcp/blob/main/readme.md)

[Next](https://github.com/paulowe/gcp/blob/main/week5-questions.md)

## Cloud Bigtable

- Petabyte scale
- High read write throughput at low latency
- Supports Apache HBASE API
- Processing is separated from storage 
- Data storage is massively scalable (scales up well)
- Minimum 3 nodes required
- Operational and Analytical apps because it supports high throughput and low latency
- Linear scaling throughput performance per Bigtable node added


## Cloud Bigtable storage model

- Massively scalble tables
- Key-value map 

## Processing is separated from storage
A Cloud Bigtable table is sharded in **block of contiguous rows called Tablets** to help balance the workload of queries

Tablets are stored in **Colossus file system** which is an **SS table**. 
An SS table provides *persistent; ordered; immutable* map from keys to values
