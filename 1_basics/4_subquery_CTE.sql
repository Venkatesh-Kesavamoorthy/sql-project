-- subqueries and CTEs

-- subquery

SELECT *
FROM(
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;

-- CTE - common table expression

WITH february_jobs AS (
        SELECT *
        FROM job_postings_fact
        WHERE EXTRACT(MONTH FROM job_posted_date) = 2
)

SELECT *
FROM february_jobs;

-- 1 quest

SELECT
    company_id,
    job_no_degree_mention
FROM 
    job_postings_fact
WHERE
    job_no_degree_mention = true;

-- 2 quest - use the primary key value ('company_id') to get values from the foreign key table ('company_dim')

SELECT 
    company_id,
    name AS company_name
FROM 
    company_dim
WHERE 
    company_id IN (
    SELECT
        company_id
    FROM 
        job_postings_fact
    WHERE
        job_no_degree_mention = true
    ORDER BY
        company_id
)

-- 3 quest CTEs - Temporary result set

WITH company_job_count AS(
    SELECT
        company_id,
        count(*) AS total_jobs
    FROM
        job_postings_fact
    GROUP BY
        company_id
)

SELECT 
    company_dim.name AS company_name,
    company_job_count.total_jobs
FROM company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY total_jobs DESC;