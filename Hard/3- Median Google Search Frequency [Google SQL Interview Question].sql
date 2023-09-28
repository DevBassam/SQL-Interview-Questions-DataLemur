WITH series AS 
(
  SELECT GENERATE_SERIES(searches+0.1,num_users*0.1+searches,0.1)::integer AS list
  FROM search_frequency
)

SELECT ROUND(PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY list)::DECIMAL, 1) AS median
FROM series;
