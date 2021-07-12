## Analyzing Billing Data

Learn how to perform the following tasks quickly:

1. Export JSON/CSV billing data to Cloud Storage

2. Sign in to BigQuery from the Cloud Console

3. Create a dataset

4. Create a table

5. Import data from a billing CSV file stored in a bucket

6. Run complex queries on a larger dataset To find the latest 100 records where there were charges (cost > 0)

```
SELECT
  product,
  resource_type,
  start_time,
  end_time,
  cost,
  project_id,
  project_name,
  project_labels_key,
  currency,
  currency_conversion_rate,
  usage_amount,
  usage_unit
FROM
  `cloud-training-prod-bucket.arch_infra.billing_data`
WHERE
  Cost > 0
ORDER BY end_time DESC
LIMIT
  100
  ```
