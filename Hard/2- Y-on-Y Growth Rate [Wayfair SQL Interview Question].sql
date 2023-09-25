WITH year_to_year_spend AS
(
SELECT EXTRACT(YEAR FROM transaction_date) AS year, product_id,
       spend AS curr_year_spend, 
       LAG(spend,1) OVER(PARTITION BY product_id) AS prev_year_spend
FROM user_transactions
ORDER BY product_id, year
)

SELECT *, 
       ROUND((curr_year_spend-prev_year_spend)/prev_year_spend * 100,2) AS yoy_rate
FROM year_to_year_spend
