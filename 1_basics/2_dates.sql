SELECT job_posted_date
FROM job_postings_fact
LIMIT 10;

-- date 

SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date::DATE AS date
FROM
    job_postings_fact;

-- at time zone

SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AS date_time
FROM
    job_postings_fact
LIMIT 5;

-- timestamps with timezone

SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time
FROM
    job_postings_fact
LIMIT 5;

-- extract

SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT(MONTH FROM job_posted_date) AS date_month,
    EXTRACT(YEAR FROM job_posted_date) AS date_year
FROM
    job_postings_fact
LIMIT 5;

-- simple query

SELECT 
    job_id,
    EXTRACT(MONTH FROM job_posted_date) AS month 
FROM
    job_postings_fact
LIMIT 5;

-- count

SELECT
    COUNT(job_id) AS job_posted_count,
    EXTRACT(MONTH FROM job_posted_date) AS month 
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    month 
ORDER BY
    job_posted_count DESC;
