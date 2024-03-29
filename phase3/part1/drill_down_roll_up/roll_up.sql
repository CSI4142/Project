-- Roll-up query to analyze churn rates by grouping customers into different age groups
-- selecting age group, counting total customers, counting churned customers, and calculating churn rate
SELECT 
    -- grouping customers into different age groups
    CASE
        WHEN cp.age BETWEEN 18 AND 30 THEN '18-30'
        WHEN cp.age BETWEEN 31 AND 40 THEN '31-40'
        WHEN cp.age BETWEEN 41 AND 50 THEN '41-50'
        ELSE 'Above 50'
    END AS Age_Group,
    -- counting total customers in each age group
    COUNT(*) AS Total_Customers,
    -- counting churned customers in each age group
    SUM(CASE WHEN cf.churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    -- calculating churn rate as a percentage for each age group
    ROUND(SUM(CASE WHEN cf.churn = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Churn_Rate
-- joining the churn fact table with the customer profile dimension table
FROM churn_fact_table cf
JOIN customer_profile_dim cp ON cf.customer_key = cp.customer_id
-- grouping the results by age group
GROUP BY 
    CASE
        WHEN cp.age BETWEEN 18 AND 30 THEN '18-30'
        WHEN cp.age BETWEEN 31 AND 40 THEN '31-40'
        WHEN cp.age BETWEEN 41 AND 50 THEN '41-50'
        ELSE 'Above 50'
    END
-- ordering the results by age group
ORDER BY Age_Group;