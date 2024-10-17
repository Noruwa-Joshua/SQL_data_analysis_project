SELECT
    job_title_short,
    job_location
FROM job_postings_fact;

/*
Label new column as follows:
- 'Anywhere' jobs as 'Remote'
- 'New York, NY' jobs as 'Local'
- Otherwise 'Onsite
*/

SELECT
    job_title_short,
    job_location,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact;


SELECT
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category;


SELECT
    COUNT(job_id) AS number_of_jobs,
    AVG(salary_year_avg) AS average_salary,
    job_location
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    job_location
HAVING
    AVG(salary_year_avg) IS NOT NULL
ORDER BY
    average_salary DESC
LIMIT 10;


SELECT
    COUNT(job_id) AS number_of_jobs,
    AVG(salary_year_avg) AS average_salary,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category
HAVING
    AVG(salary_year_avg) IS NOT NULL
ORDER BY
    average_salary DESC;


SELECT
    COUNT(job_id) AS number_of_jobs,
    AVG(salary_year_avg) AS average_salary,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category
ORDER BY
    average_salary DESC;