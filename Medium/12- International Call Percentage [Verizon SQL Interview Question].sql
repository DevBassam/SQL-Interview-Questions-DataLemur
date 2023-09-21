-- My Solution
WITH caller AS 
(
SELECT pc.caller_id, pi.country_id, pc.call_time, pc.receiver_id+pc.caller_id AS call_id
FROM phone_calls AS pc 
JOIN phone_info AS pi
ON pi.caller_id = pc.caller_id
)
,reciever AS
(
SELECT pc.receiver_id, pi.country_id, pc.receiver_id+pc.caller_id AS call_id
FROM phone_calls AS pc 
JOIN phone_info AS pi
ON pi.caller_id = pc.receiver_id
)

SELECT ROUND(100.0 * COUNT(CASE WHEN c.country_id <> r.country_id 
                           THEN 1 ELSE NULL END) / COUNT(*), 1)
FROM caller AS c 
JOIN reciever AS r
USING(call_id)



-- Website Solution
WITH international_calls AS (
SELECT 
  caller.caller_id, 
  caller.country_id,
  receiver.caller_id, 
  receiver.country_id
FROM phone_calls AS calls
LEFT JOIN phone_info AS caller
  ON calls.caller_id = caller.caller_id
LEFT JOIN phone_info AS receiver
  ON calls.receiver_id = receiver.caller_id
WHERE caller.country_id <> receiver.country_id
)

SELECT 
  ROUND(
    100.0 * COUNT(*)
  / (SELECT COUNT(*) FROM phone_calls),1) AS international_call_pct
FROM international_calls;
