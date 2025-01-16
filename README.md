# Introduction
📊 Dive into the data job market! Focusing on data Scientist roles in Singapore, this project explores 💰 top-paying jobs, 🔥 in-demand skills, and 📈 where high demand meets high salary in data analytics.

🔍 SQL queries? Check them out here: [2_project_sql](2_Project_sql)

# Background
Motivated by a desire to navigate the data scientist job market more effectively, this project was created to identify the highest-paid and most in-demand skills, helping others streamline their search for optimal jobs

Data hails from my SQL Course. It's packed with insights on job titles, salaries, locations, and essential skills.

### The questions I wanted to answer through my SQL queries were:
    1. What are the top-paying data analyst jobs?
    2. What skills are required for these top-paying jobs?
    3. What skills are most in demand for data analysts?

# Tools I Used
For my deep dive into the data Scientist job market, I harnessed the power of several key tools:

- SQL: The backbone of my analysis, allowing me to query the database and unearth critical insights.
- PostgreSQL: The chosen database management system, ideal for handling the job posting data.
- Visual Studio Code: My go-to for database management and executing SQL queries.
- Git & GitHub: Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis 
Each query for this project aimed to investigate specific aspects of the data scientist job market. Here’s how I approached each question:

## 1. Top-Paying Data Analyst Jobs  
To identify the highest-paying roles, I filtered data scientist positions based on average yearly salary and location, with a particular focus on remote jobs. This query highlights the lucrative opportunities available in the field.

```sql 
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Scientist' AND
    job_location = 'Singapore' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
```
Here's the breakdown of the top data scientist jobs in 2023:

### Wide Salary Range
The top 10 high-paying data science roles have salaries ranging from $157,500 to $183,320 per year, showcasing a consistent demand for high-level expertise in data-driven roles.

### Diverse Employers
Prominent companies such as Airwallex, Gojek, Riot Games, and Visa are among the top-paying employers, highlighting the demand for data science talent across fintech, gaming, and global financial services industries.

### Job Title Variety
The roles span from Data Science Manager to specialized positions like Data Scientist [NLP] and Staff/Senior Risk Data Scientist, emphasizing the varied opportunities within the data science field, including management, algorithm development, and niche domains like NLP.
 
### Specialized Skills in Demand
Key areas of expertise include:

- **Risk Analysis**: Roles like Staff/Senior Risk Data Scientist demonstrate the critical need for mitigating risks in financial transactions.

- **NLP and Algorithms**: Positions such as Data Scientist [NLP] and Data Scientist, Algorithms (Marketing) reflect the importance of advanced AI and machine learning skills.

### 2. Skills for Top Paying Jobs

To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.

```sql 
WITH top_paying_jobs AS(
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Scientist' AND
        job_location = 'Singapore' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC
```

**Python** - Frequently mentioned across various job titles, indicating its importance in data science roles.

**SQL** - A critical skill for data management and analysis, appearing in multiple job listings.

**R** - Another essential programming language for statistical analysis and data visualization.

**SAS** - Noted for its use in advanced analytics and business intelligence.

**MATLAB** - Utilized for numerical computing and algorithm development.

**SPSS**- Important for statistical analysis in social science research.

**TensorFlow** - A key framework for machine learning and deep learning applications.

**PyTorch** - Gaining popularity for its flexibility in building neural networks.

**Java** - Mentioned in the context of data processing and software development.

**Spark** - Recognized for big data processing capabilities.

### 3. In-Demand Skills for Data Analysts

This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demand.

```sql 
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist' AND
    job_work_from_home = True
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5
```
### Insights

From the analysis, several key insights emerged:

**Top-Paying Data Scientist Jobs:** The highest-paying jobs for data scientists that allow remote work offer a wide salary range, with the top salary reaching $183320!

**Skills for Top-Paying Jobs:** High-paying data analyst positions require advanced proficiency in SQL, indicating that it is a critical skill for achieving a top salary.

**Most In-Demand Skills:** SQL is not only crucial for high-paying jobs but also the most sought-after skill in the data analyst job market, making it essential for job seekers.

**Skills with Higher Salaries:** Specialized skills, such as SVN and Solidity, are associated with the highest average salaries, suggesting a premium on niche expertise.

**Optimal Skills for Job Market Value:** SQL leads in demand and also offers a high average wage, positioning it as one of the best skills for data analysts and data scientists to learn in order to maximize their market value.

### Closing Thoughts

This project enhanced my SQL skills and provided valuable insights into the data scientist job market. The findings serve as a guide for prioritizing skill development and job search efforts. By focusing on high-demand and high-salary skills, aspiring data scientists can better position themselves in a competitive job market. This exploration underscores the importance of continuous learning and adapting to emerging trends in the field of data science.