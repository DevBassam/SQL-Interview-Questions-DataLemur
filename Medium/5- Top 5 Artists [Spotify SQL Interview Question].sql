WITH ranking_sub AS
(
SELECT a.artist_name, 
       DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS rank
FROM artists AS a
JOIN songs as s
USING(artist_id)
JOIN global_song_rank AS g
USING(song_id)
WHERE g.rank < 11
GROUP BY a.artist_name
)

SELECT *
FROM ranking_sub
WHERE rank < 6