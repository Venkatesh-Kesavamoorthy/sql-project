CREATE TABLE jan_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) =  1

CREATE TABLE february_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE march_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

ALTER TABLE 
    february_jobs RENAME TO feb_jobs

ALTER TABLE 
    march_jobs RENAME TO mar_jobs

SELECT *
FROM jan_jobs;

SELECT *
FROM feb_jobs;

SELECT *
FROM mar_jobs;

--union

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    jan_jobs

UNION

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    feb_jobs

UNION

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    mar_jobs

-- union all

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    jan_jobs

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    feb_jobs

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    mar_jobs



