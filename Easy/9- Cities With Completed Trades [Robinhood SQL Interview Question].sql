SELECT  u.city,COUNT(t.user_id) AS total_orders
FROM trades AS t
JOIN users as u
ON t.user_id = u.user_id
WHERE t.status = 'Completed'
GROUP BY u.city
ORDER BY total_orders DESC
LIMIT 3