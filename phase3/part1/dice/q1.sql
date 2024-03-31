-- Dice query to analyze churn rates based on gender and age group

SELECT
    CASE
        WHEN age < 30 THEN 'Young'
        WHEN age >= 30 AND age < 60 THEN 'Middle-aged'
        ELSE 'Senior'
    END AS age_group, -- Categorize customers into age groups
    gender, -- Gender of the customer
    COUNT(*) AS churn_count -- Count the number of churned customers
FROM
    churn_fact_table cft
JOIN
    customer_profile_dim cp ON cft.customer_key = cp.customer_id
WHERE
    churn = 1 -- Filter churned customers
GROUP BY
    age_group,
    gender -- Grouping by age group and gender
ORDER BY
    age_group, gender; -- Order the results by age group and then gender