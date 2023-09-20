SELECT ROUND(1.0 * COUNT(CASE WHEN signup_action = 'Confirmed' 
              THEN 1 ELSE NULL END) /COUNT(signup_action) , 2)
FROM texts