--query one
SELECT page_id
FROM pages
WHERE page_id NOT IN(
          SELECT DISTINCT page_id FROM page_likes
)


--query two (Anthor Accepted Solution)
SELECT pages.page_id
FROM pages
LEFT JOIN page_likes
ON pages.page_id = page_likes.page_id
GROUP BY pages.page_id
HAVING COUNT(user_id) = 0;
