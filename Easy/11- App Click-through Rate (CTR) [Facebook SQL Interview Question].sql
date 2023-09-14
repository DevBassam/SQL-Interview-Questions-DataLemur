SELECT app_id
      ,ROUND(100.0 *
        SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) /
        SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END), 2)  AS ctr
FROM events
WHERE timestamp > '12/31/2021' AND timestamp < '1/1/2023'
GROUP BY app_id