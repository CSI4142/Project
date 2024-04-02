-- Window query to analyze and rank average salary by country and gender

SELECT
    gender,
    country,
    AVG(estimated_salary) AS average_salary, -- Average salary per country
    RANK() OVER (PARTITION BY country ORDER BY AVG(estimated_salary) DESC) AS gender_rank -- Rank the genders (female, male) per country based on average salary
FROM
    churn_fact_table cft
JOIN
    customer_profile_dim cp ON cft.customer_key = cp.customer_id
JOIN
    location_dim loc ON cft.location_key = loc.location_key
GROUP BY
    gender, country;