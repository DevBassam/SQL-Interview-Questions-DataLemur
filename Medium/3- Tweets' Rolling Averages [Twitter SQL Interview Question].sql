SELECT user_id,
       tweet_date,
       ROUND(AVG(tweet_count) OVER(PARTITION BY user_id
                                    ROWS BETWEEN 2 PRECEDING
                                    AND CURRENT ROW)
            ,2) AS round
FROM tweets
