WITH merged_col AS(
SELECT *
FROM (SELECT user_id
       FROM daily_pay
       UNION
       SELECT user_id
       FROM advertiser) AS new_user_id 
LEFT JOIN daily_pay
USING(user_id)
LEFT JOIN advertiser 
USING(user_id)
)

SELECT user_id,
       CASE WHEN paid IS NULL THEN 'CHURN'
       WHEN paid IS NOT NULL AND status IS NULL THEN 'NEW'
       WHEN paid IS NOT NULL AND status IN ('NEW','EXISTING','RESURRECT') THEN 'EXISTING'
       WHEN paid IS NOT NULL AND status = 'CHURN' THEN 'RESURRECT' END AS new_status
FROM merged_col
ORDER BY user_id


    -- website solution:
SELECT 
  COALESCE(advertiser.user_id, daily_pay.user_id) AS user_id,
  CASE 
    WHEN paid IS NULL THEN 'CHURN' 
    WHEN paid IS NOT NULL AND advertiser.status IN ('NEW','EXISTING','RESURRECT') THEN 'EXISTING'
    WHEN paid IS NOT NULL AND advertiser.status = 'CHURN' THEN 'RESURRECT'
    WHEN paid IS NOT NULL AND advertiser.status IS NULL THEN 'NEW'
  END AS new_status
FROM advertiser
FULL OUTER JOIN daily_pay
  ON advertiser.user_id = daily_pay.user_id
ORDER BY user_id;
