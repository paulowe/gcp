[Overview](https://github.com/paulowe/gcp/blob/main/readme.md)

[Next](https://github.com/paulowe/gcp/blob/main/gcp-core-infrastructure/gcloud.md) 

## BigQuery is a fully managed data warehouse

- Supports ad hoc queries on PB-scale data
- Use SQL
- Pay as you go
- OLAP
- Supports various ingestion options
- 99.9% SLA

## Use Cases

Startups: Free monthly quotas

Large organization: Seamless scaling

##  BigQuery runs on Google's gloabl infrastructure
- Compute and storage are separated with a terabit network in between
- You only pay for storage and processing used
- Automatic discount for long term data storage (90+ days)

## bq CLI

**Querying data**
``` 
bq query "select fieldA, count(*) as counts \
from dataset.tablename \
group by fieldA counts \
order by counts desc"
```
