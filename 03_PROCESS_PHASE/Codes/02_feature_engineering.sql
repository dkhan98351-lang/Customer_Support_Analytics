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
    
    -- Feature Engineering: Creating a strict 48-Hour SLA Flag
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

-- Data Cleaning: Filter out unresolved tickets and missing surveys
WHERE status = 'Closed' 
  AND customer_satisfaction_score IS NOT NULL
  AND resolution_time_hours IS NOT NULL;