SELECT
    ticket_channel,
    COUNT(ticket_id) AS total_tickets,
    ROUND(AVG(resolution_time_hours),2) AS avg_resolution_time
FROM customer-support-analytics.customer_support_tickets.clean_tickets
GROUP BY ticket_channel
ORDER BY total_tickets DESC;