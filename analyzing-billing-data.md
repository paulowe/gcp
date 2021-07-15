[Overview](https://github.com/paulowe/gcp/blob/main/readme.md)

[Next](https://github.com/paulowe/gcp/blob/main/resource-monitoring.md)

## Analyzing Billing Data

[Sample billing dataset](gs://cloud-training/archinfra/export-billing-example.csv) can be found on that gcp bucket

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

7. To find the product with the most records in the billing data  
```  
SELECT
  product,
  COUNT(*) AS billing_records
FROM
  `cloud-training-prod-bucket.arch_infra.billing_data`
GROUP BY
  product
ORDER BY billing_records DESC
```

8. To find the most frequently used product costing more than 1 dollar 
 ```
 SELECT
  product,
  COUNT(*) AS billing_records
FROM
  `cloud-training-prod-bucket.arch_infra.billing_data`
WHERE
  cost > 1
GROUP BY
  product
ORDER BY
  billing_records DESC
  ```
9. To find the most commonly charged unit of measure

```
SELECT
  usage_unit,
  COUNT(*) AS billing_records
FROM
  `cloud-training-prod-bucket.arch_infra.billing_data`
WHERE cost > 0
GROUP BY
  usage_unit
ORDER BY
  billing_records DESC
```
10. To find the product with the highest aggregate cost
```
SELECT
  product,
  ROUND(SUM(cost),2) AS total_cost
FROM
  `cloud-training-prod-bucket.arch_infra.billing_data`
GROUP BY
  product
ORDER BY
  total_cost DESC
  ```
