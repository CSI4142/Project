-- Combined OLAP Query 4
-- Compare the churn rate for young males (18-30) and females (18-30) between France and Germany.

SELECT
    -- Dimensions for drill down/roll up: country and gender
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
    -- Dice: Filtering for young males (18-30) and females (18-30)
    (cp.gender = 'Male' OR cp.gender = 'Female')
    AND cp.age BETWEEN 18 AND 30
    -- Slice: Filtering for France and Germany
    AND l.country IN ('France', 'Germany')
GROUP BY
    -- Grouping by country and gender for analysis
    GROUPING SETS ((l.country, cp.gender), (l.country))
ORDER BY
    -- Ordering by country and gender for readability
    l.country, cp.gender;
