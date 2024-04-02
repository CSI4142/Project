-- Combined OLAP Query 4
-- Compare the churn rate for young males (18-30) between France and Germany. 

SELECT
    -- Dimensions for drill down/roll up: country
    l.country AS Country,
    cp.gender AS Gender,
    -- Measure for analysis: churn rate
    ROUND(SUM(CASE WHEN cf.churn = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM
    -- Fact table
    churn_fact_table cf
JOIN
    -- Dimension tables
    customer_profile_dim cp ON cf.customer_key = cp.customer_id
JOIN
    location_dim l ON cf.location_key = l.location_key
WHERE
    -- Dice: Filtering for young males (18-30)
    cp.gender = 'Male'
    AND cp.age BETWEEN 18 AND 30
    -- Slice: Filtering for France and Germany
    AND l.country IN ('France', 'Germany')
GROUP BY
    -- Grouping by country and gender for analysis
    l.country, cp.gender
ORDER BY
    -- Ordering by country and gender for readability
    l.country, cp.gender;
