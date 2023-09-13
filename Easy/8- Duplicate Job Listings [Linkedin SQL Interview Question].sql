-- Query one
SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM (SELECT g.company_id 
       FROM job_listings as g
        JOIN job_listings as gl
        ON g.company_id = gl.company_id
        AND g.job_id <> gl.job_id
        AND g.title = gl.title
        AND g.description = gl.description) AS dup_company


-- Query two
SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM (
  SELECT company_id, title, description, COUNT(job_id) AS job_count
  FROM job_listings
  GROUP BY company_id, title, description
) AS dub_company
WHERE job_count >= 2;