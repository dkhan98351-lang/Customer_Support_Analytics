# PROCESS PHASE: Data Cleaning & Transformation Log

## Objective
To transform the raw Kaggle customer support dataset into a clean, query-optimized table by auditing data integrity, verifying completeness, and engineering new operational metrics (SLA flags and resolution buckets) tailored to the business task.

## Environment & Tools
* **Database:** Google BigQuery Sandbox
* **Language:** Standard SQL
* **Dataset Name:** `customer_support_tickets`
* **Raw Table:** `raw_tickets`

---

## Step 1: Data Integrity Audit (`01_data_audit.sql`)
Before transformation, the raw dataset was audited to ensure no duplicate tickets inflated the volume metrics and to verify that all necessary KPI data was present.

### Query A: Duplicate Check
```sql
SELECT 
    ticket_id, 
    COUNT(*) as frequency
FROM customer-support-analytics.customer_support_tickets.raw_tickets
GROUP BY ticket_id
HAVING frequency > 1;

```

* Audit Result: Query returned 0 rows. No duplicate records were found. Data volume integrity is intact.


### Query B: Missing Core Metrics Check
```sql
SELECT 
    COUNT(ticket_id) AS total_tickets,
    SUM(CASE WHEN customer_satisfaction_score IS NULL THEN 1 ELSE 0 END) AS missing_csat,
    SUM(CASE WHEN resolution_time_hours IS NULL THEN 1 ELSE 0 END) AS missing_resolution_time
FROM `customer-support-analytics.customer_support_tickets.raw_tickets`;

```

* Audit Result: Query confirmed 0 missing CSAT scores and 0 missing resolution timestamps. No missing data found. The dataset is completely populated for the core business parameters.


---

## Step 2: Feature Engineering & Cleaning ('02_feature_engineering.sql')
To directly answer the key business questions, unnecessary columns were stripped out to optimize performance. A CASE WHEN statement was utilized to engineer a custom 48-hour SLA breach flag, allowing for direct correlation testing between resolution times and CSAT drops.


```sql
-- Creating the final clean dataset tailored for the Business Task
SELECT 
    ticket_id,
    channel AS ticket_channel,
    priority AS ticket_priority,
    product,
    customer_segment,
    first_response_time_hours,
    resolution_time_hours,
    customer_satisfaction_score AS csat_score,
    
    -- Feature Engineering: Create a strict 48-Hour SLA Flag
    CASE 
        WHEN resolution_time_hours > 48.0 THEN 'Breached SLA (>48h)'
        ELSE 'Met SLA (<48h)'
    END AS custom_sla_status,

    -- Feature Engineering: Categorize resolution time for Tableau filtering
    CASE
        WHEN resolution_time_hours <= 12.0 THEN 'Same Day Resolution'
        WHEN resolution_time_hours > 12.0 AND resolution_time_hours <= 24.0 THEN '24 Hour Resolution'
        WHEN resolution_time_hours > 24.0 AND resolution_time_hours <= 48.0 THEN '48 Hour Resolution'
        ELSE 'Over 48 Hours'
    END AS resolution_bucket

FROM customer-support-analytics.customer_support_tickets.raw_tickets

-- Data Cleaning: Filter out unresolved tickets
WHERE status = 'Closed' 
  AND customer_satisfaction_score IS NOT NULL
  AND resolution_time_hours IS NOT NULL;

```

### Output

The final query successfully generated the transformed table. The results were exported from the BigQuery UI as clean_tickets_data.csv and securely stored in the /02_Converted_Data/ directory. This clean, engineered dataset will serve as the single source of truth for the upcoming Tableau dashboard and Analyze phase.


