# PREPARE PHASE: Data Source & Schema Documentation

## 1. Data Origin & Storage
* **Primary Source:** Kaggle (Customer Support Tickets Dataset)
* **File Format:** `.csv`
* **Local Storage:** The raw data file (`customer_support_tickets_200k.csv`) is securely stored in the local `02_PREPARE` directory for backup purposes.
* **Cloud Database Environment:** The data has been ingested into a Google BigQuery Sandbox environment to handle high-volume SQL processing.
  * **Dataset Name:** `bpo_analytics`
  * **Raw Table Name:** `raw_tickets`

## 2. Data Ingestion Protocol
The raw CSV was uploaded directly to Google BigQuery using the BigQuery UI. The schema was auto-detected upon ingestion. A preliminary `SELECT COUNT(*)` query confirmed the successful transfer of all rows with no data loss during the upload process.

## 3. Data Dictionary (Core Schema)
To optimize query performance, only the variables directly related to the Business Task (identifying bottlenecks and SLA failures) will be utilized. Below is the schema for the primary columns queried in this analysis:

| Column Name | Data Type (BigQuery) | Description / Usage |
| :--- | :--- | :--- |
| `ticket_id` | STRING | Unique alphanumeric identifier for each customer interaction. Used to track volume and check for duplicates. |
| `customer_name` | STRING | Anonymized customer name. |
| `ticket_channel` | STRING | The medium used for contact (Email, Chat, Social Media). Core metric for bottleneck identification. |
| `ticket_priority` | STRING | The assigned urgency (Critical, High, Normal, Low). Used to audit routing integrity. |
| `first_response_time` | TIMESTAMP | The exact date and time the first agent replied to the customer. |
| `time_to_resolution` | TIMESTAMP | The exact date and time the ticket was marked closed/resolved. |
| `customer_satisfaction_rating`| INTEGER | The CSAT score (1-5 scale) provided by the customer post-resolution. |
| `product` | STRING | The specific product/service the customer is inquiring about. |

## 4. Security & Access
As this is a portfolio project utilizing public, anonymized data, it is currently hosted in an open GitHub repository. However, the Google BigQuery environment requires authenticated Google Cloud credentials to execute queries or modify the `bpo_analytics` dataset.