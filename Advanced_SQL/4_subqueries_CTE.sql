WITH company_job_count AS (
    SELECT
        company_id,
        COUNT(*) AS total_jobs
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
ORDER BY
    total_jobs DESC;

/*
Find the count of the number of remote job posings per skill
    - Display the top 5 skills by their demand in remote jobs
    - Include skill ID, name, and count of postings requiring the skill
*/


SELECT
    skills_dim.skill_id AS skill_id,
    skills_dim.skills AS skill,
    COUNT(job_postings_fact.job_id) AS number_of_remote_jobs
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_location = 'Anywhere' AND
    job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY
    skills_dim.skill_id, skills_dim.skills
ORDER BY
    number_of_remote_jobs DESC
LIMIT 5;

-- Didn't use CTE or subquery, I know, but still got the job done :)
-- I'm sorry, but this just feels more interesting to me
--Also, I filered it down to just Data analyst jobs