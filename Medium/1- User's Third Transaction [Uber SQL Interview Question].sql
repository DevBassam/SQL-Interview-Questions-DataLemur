SELECT user_id, spend,	transaction_date
FROM (SELECT *,
      row_number() OVER(PARTITION BY user_id ORDER BY transaction_date) AS order_count
      FROM transactions
      ) AS ranking
WHERE order_count  = 3
