-- Drill down, slice, and dice query for customer banking churn analysis
-- Focuses on young females from France

-- Drill down query to display the 
SELECT 
    cp.gender,
    l.country,
    SUM(CASE WHEN cp.age <= 30 THEN 1 ELSE 0 END) AS Young_Customers,
    SUM(CASE WHEN cp.age > 30 AND cp.age <= 60 THEN 1 ELSE 0 END) AS Middle_Aged_Customers,
    SUM(CASE WHEN cp.age > 60 THEN 1 ELSE 0 END) AS Senior_Customers,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN cf.churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(SUM(CASE WHEN cf.churn = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM 
    churn_fact_table cf
JOIN 
    customer_profile_dim cp ON cf.customer_key = cp.customer_id
JOIN 
    location_dim l ON cf.location_key = l.location_key
WHERE 
    l.country = 'France' -- Slice: focusing on customers from France
    AND cp.gender = 'Female' -- Dice: further filter by gender
    AND cp.age <= 30 -- Dice: further filter by age group (Young)
GROUP BY 
    cp.gender, l.country
ORDER BY 
    cp.gender, l.country;
