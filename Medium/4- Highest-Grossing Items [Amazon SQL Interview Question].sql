SELECT category, product, total_spend 
FROM (SELECT category,	product, SUM(spend) AS total_spend,
             RANK() OVER(PARTITION BY category ORDER BY SUM(spend) DESC) AS row_num
      FROM product_spend
      WHERE transaction_date >= '1/1/2022' AND transaction_date < '1/1/2023'
      GROUP BY category,	product
      ORDER BY category, total_spend DESC) AS rank
WHERE row_num < 3;
