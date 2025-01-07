
SELECT 
    job_title_short,
    job_location,
    job_via,
    job_posted_date::DATE
FROM(
    SELECT *
    FROM jan_jobs
    UNION ALL
    SELECT *
    FROM feb_jobs
    UNION ALL
    SELECT *
    FROM mar_jobs
) AS quarter1_job_postings
WHERE 
    salary_year_avg > 70000 AND
    job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg DESC