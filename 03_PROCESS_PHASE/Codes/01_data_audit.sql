-- 1. Checking for Duplicate Ticket IDs
SELECT 
    ticket_id, 
    COUNT(*) as frequency
FROM customer-support-analytics.customer_support_tickets.raw_tickets
GROUP BY ticket_id
HAVING frequency > 1;

-- 2. Identifying Missing Core Metrics
-- We cannot analyze CSAT drops if the customer never left a score.
SELECT 
    COUNT(ticket_id) AS total_tickets,
    SUM(CASE WHEN customer_satisfaction_score IS NULL THEN 1 ELSE 0 END) AS missing_csat,
    SUM(CASE WHEN resolution_time_hours IS NULL THEN 1 ELSE 0 END) AS missing_resolution_time
FROM customer-support-analytics.customer_support_tickets.raw_tickets