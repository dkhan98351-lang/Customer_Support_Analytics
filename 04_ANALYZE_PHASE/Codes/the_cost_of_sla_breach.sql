SELECT
    custom_sla_status,
    COUNT(ticket_id) AS ticket_volume,
    ROUND(AVG(csat_score),2) AS average_csat_score
FROM customer-support-analytics.customer_support_tickets.clean_tickets
GROUP BY custom_sla_status
ORDER by custom_sla_status DESC


