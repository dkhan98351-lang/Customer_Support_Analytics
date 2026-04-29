# ANALYZE PHASE: Summary of Operations

## Objective
To aggregate the cleaned BigQuery dataset (`clean_tickets_data`) and extract actionable insights regarding SLA performance, channel efficiency, and routing integrity. 

## Methodology
Four distinct SQL queries were executed to aggregate the data by different operational dimensions. The queries are stored in the `/02_Codes/` directory, and the resulting data exports are stored in the `/01_Analyzed_Data/` directory.

## Datasets Generated
1. **`the_cost_of_sla_breach.csv`**: Measures the total volume of SLA failures and correlates them to the average CSAT score.
2. **`routing_and_prioritization_integrity.csv`**: Audits the IT routing system by comparing average resolution times across ticket priority levels.
3. **`channel_Efficiency_and_bottlenecks.csv`**: Identifies volume and handling time disparities across communication mediums (Email, Phone, Chat, etc.).
4. **`product_and_customer_segmentation.csv`**: Evaluates whether high-value client tiers (Corporate) receive faster resolution times than standard tiers.

## Next Steps
The statistical findings from these datasets reveal severe systemic issues within the BPO's operations. These metrics will now be ingested into Tableau for the Share phase to visualize the scale of the bottlenecks.