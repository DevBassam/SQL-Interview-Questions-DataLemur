SELECT COUNT(CASE WHEN device_type = 'laptop' THEN 1 ELSE NULL END) AS laptop_views
      ,COUNT(CASE WHEN device_type <> 'laptop' THEN 1 ELSE NULL END) AS mobile_views
FROM viewership;