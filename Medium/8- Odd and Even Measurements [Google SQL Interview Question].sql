WITH measurements_numbered AS
(
SELECT measurement_id, 
       measurement_value, 
       measurement_time::Date AS measurement_date,
       ROW_NUMBER() OVER(PARTITION BY measurement_time::Date
                          ORDER BY measurement_time) AS ranking
FROM measurements
)

SELECT DISTINCT measurement_date,
      SUM(CASE WHEN ranking % 2 <> 0 THEN measurement_value ELSE 0 END) AS odd_sum,
      SUM(CASE WHEN ranking % 2 = 0 THEN measurement_value ELSE 0 END) AS even_sum
FROM measurements_numbered
GROUP BY measurement_date