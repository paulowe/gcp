14 July 2021 

**Project description :** Client has been using BigQuery and wants to analyze the cost associated with BQ to reduce their BQ spending.  Visualization of the cost incurred is needed.  Client should be able to group and filter data by cost, who ran the queries, query’s similarity and datetime.  

**Consideration:** GCP resources are organized hierarchically. Services such as BigQuery are organized by projects. Projects can be contained in folders, all the way up to the organization node at the root. One consideration to make is whether the client would like to analyze the cost associated with BQ in a specific project or, across two or more projects. 

This solution will cover the analysis and visualization of BQ spending for one project. 

**Billing data :** The first step is to source the relevant billing data for our project. We can export the client’s billing data from the GCP console as a CSV file and prepare it for analysis by placing it into a Cloud storage bucket or sending it directly to BQ for analysis. 

In this case, I will use sample billing data from this Cloud storage bucket: gs://cloud-training/archinfra/export-billing-example.csv 

**Approach 1:** The easiest approach would be to directly use the Reports tab (under Billing) to filter and visualize spending cost by  

- Specific Project (or across all projects) associated with a billing account 
- Specific service to visualize (e.g BigQuery) 

**Limitation of Approach 1:** The limitation of this approach is that it covers “Visualization of the cost incurred is needed. Client should be able to group and filter data by cost”, but the tool is not expressive enough to answer who ran the queries, query’s similarity and datetime. 

**Approach 2:** The second approach is to create a table in BQ from the sample billing data bucket. 

This is a more robust approach because it provides more flexibility to run all queries the client is asking for against our billing data. 

Query 1: Group and filter data by cost 
```
# Group and filter billing data for BQ by cost 
SELECT * FROM `cloud-training-prod-bucket.arch_infra.billing_data`  
WHERE product = 'BigQuery' and cost = 0 
```
Query 2: Identify who ran the BQ queries 

 

Query 3: Identify query’s similarity and datetime 


**BigQuery pricing** is broken down into 

1. Storage - storage is charged based on amount of data stored in your tables per second 

- Active - 
- Long term storage (after 90 days, unedited partitions of a table are charged 50% less) 
- Streaming inserts (streaming inserts are charged more than batch loading. Only use if you need data to be loaded in realtime) 

2. Query processing 

- On demand (charged by number of bytes processed. SELECT * is the most expensive way to query because it performs a full scan across all columns) 
- Flat rate (recommended for bills north of 10K/mo to be charged based on a flat ; fixed rate and unlimited number of queries instead of number of bytes processed) 

Free operations in BQ include 

- Batch loading into BQ 
- Exporting data operation 
- Deleting table, views, funcitons, datasets 
- Metadata operations 
- **Cached queries**  - Caching can boost your query performance and wont be charged for results retrieved from cache 
- Storage for first 10 GB of data per month 
- Query data processed for first 1TB/month (advantageous for users on on-demand pricing) 

Next step is to visualize this information to the client 
