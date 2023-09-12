SELECT user_id,
      DATE_PART('day', MAX(post_date) - MIN(post_date)) AS days_between
FROM posts
WHERE post_date > '12/31/2020' AND post_date < '1/1/2022'
GROUP BY user_id
HAVING DATE_PART('day', MAX(post_date) - MIN(post_date)) > 0