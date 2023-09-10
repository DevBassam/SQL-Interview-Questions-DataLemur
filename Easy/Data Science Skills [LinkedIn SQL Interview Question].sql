WITH skill_count AS
(
SELECT candidate_id,
      SUM(CASE WHEN skill IN ('Python','PostgreSQL','Tableau') THEN 1
          ELSE 0 END) as skill_sum
FROM candidates
GROUP BY candidate_id
)

SELECT candidate_id 
FROM skill_count
WHERE skill_sum = 3
ORDER BY candidate_id


--Anthor Solution
--SELECT candidate_id
--FROM candidates
-- WHERE skill = 'Python' OR skill = 'PostgreSQL' OR skill = 'Tableau'
-- GROUP BY candidate_id
-- HAVING COUNT(skill) >= 3
