-- Combined OLAP Query 1
-- Compare the churn rate for between men in France versus men in Spain

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
    -- Dice: Filtering for male customers in France and Spain
    cp.gender = 'Male'
    AND (l.country = 'France' OR l.country = 'Spain') -- Slice: Filtering for France and Spain
GROUP BY
    -- Grouping by country and gender for analysis
    l.country, cp.gender
ORDER BY
    -- Ordering by country and gender for readability
    l.country, cp.gender;

