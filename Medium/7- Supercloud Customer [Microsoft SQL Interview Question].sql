WITH super_cloud AS
(
SELECT customer_id, COUNT(DISTINCT product_category) AS customer_prod
FROM customer_contracts
JOIN products 
ON products.product_id	= customer_contracts.product_id	
GROUP BY customer_id
)

SELECT customer_id
FROM super_cloud
WHERE customer_prod = (SELECT COUNT(DISTINCT product_category) FROM products)