WITH recent_date_user AS
(
SELECT user_id, MAX(transaction_date) AS recent_date
FROM user_transactions
GROUP BY user_id
)

SELECT  recent_date, user_id, COUNT(user_transactions.product_id)
FROM recent_date_user
JOIN user_transactions
USING(user_id)
WHERE recent_date = transaction_date
GROUP BY recent_date, user_id
ORDER BY recent_date
