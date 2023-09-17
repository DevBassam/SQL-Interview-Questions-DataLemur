SELECT manufacturer,
      '$'||CAST(ROUND(SUM(total_sales),-6)/1000000 AS integer)||' million' as sales_mil
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY CAST(ROUND(SUM(total_sales),-6)/1000000 AS integer) DESC, manufacturer DESC