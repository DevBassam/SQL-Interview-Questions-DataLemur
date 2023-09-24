WITH monthly_active_user AS
(
SELECT EXTRACT(month FROM event_date) AS month,
       EXTRACT(year FROM event_date) AS year,
       CASE WHEN (EXTRACT(month from lag(event_date,1) OVER()) = EXTRACT(month from event_date) - 1) 
            AND user_id = lag(user_id,1) OVER() THEN 1 ELSE 0 END AS active_user
FROM (
      SELECT *
      FROM user_actions
      ORDER BY user_id, event_date
     )AS ordered
)

SELECT month, SUM(active_user) AS monthly_active_users
FROM monthly_active_user
WHERE month = 7 and year = 2022
GROUP BY month;
