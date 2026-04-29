SELECT
   customer_segment,
   COUNT(ticket_id) AS total_tickets,
   ROUND(AVG(resolution_time_hours),2) AS avg_resolution_time,
   ROUND(AVG(csat_score),2) AS avg_csat_score
FROM customer-support-analytics.customer_support_tickets.clean_tickets
GROUP BY customer_segment
ORDER BY avg_resolution_time;