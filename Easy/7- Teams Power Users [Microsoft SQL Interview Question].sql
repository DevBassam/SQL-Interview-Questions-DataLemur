SELECT sender_id,COUNT(message_id) AS message_count
FROM messages
WHERE sent_date >= '8/1/2022' AND sent_date < '9/1/2022'
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;