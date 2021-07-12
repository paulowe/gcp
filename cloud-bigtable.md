[Overview](https://github.com/paulowe/gcp/blob/main/readme.md)

[Next](https://github.com/paulowe/gcp/blob/main/week5-questions.md)

## Cloud Bigtable (NoSQL; Wide-table DB)

- Petabyte scale
- High read write throughput at low latency
- Supports Apache HBASE API
- Processing is separated from storage 
- Data storage is massively scalable (scales up well)
- Operational and Analytical apps because it supports high throughput and low latency
- Learns to **adjust to frequent access patterns** and evenly distribute workloads among nodes
- Big Table **scales up** well. Linear scaling throughput performance per Bigtable node added.
- Smallest Bigtable cluster has **Minimum of 3 nodes** (can handle 30,000 operations/s). You pay for 3 nodes whether in use or not.

## Cloud Bigtable storage model

- Massively scalble tables
- Key-value map 

## Processing is separated from storage
A Cloud Bigtable table is sharded in **block of contiguous rows called Tablets** to help balance the workload of queries

Tablets are stored in **Colossus file system** which is an **SS table**. 
An SS table provides *persistent; ordered; immutable* map from keys to values where both key and value are arbitrary byte strings
