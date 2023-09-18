WITH total_time AS
(
SELECT age_bucket,
        SUM(CASE WHEN activity_type = 'send' THEN time_spent ELSE 0 END) AS ttl_send,
        SUM(CASE WHEN activity_type = 'open' THEN time_spent ELSE 0 END) AS ttl_open
FROM activities
JOIN age_breakdown
ON activities.user_id = age_breakdown.user_id
GROUP BY age_bucket
)

SELECT age_bucket, 
       ROUND(ttl_send / (ttl_send+ttl_open) * 100,2) AS send_perc,
       ROUND(ttl_open / (ttl_send+ttl_open) * 100,2) AS open_perc
FROM total_time
