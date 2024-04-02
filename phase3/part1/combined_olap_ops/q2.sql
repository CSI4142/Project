-- Combined OLAP Query 2
-- Compare the churn rate relative to Estimated salary for France and Spain
SELECT
    -- Dimension for drill down/roll up: country
    l.country AS Country,
    -- Measure for analysis: average estimated salary
    AVG(cp.estimated_salary) AS Avg_EstimatedSalary,
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
    -- Slice: Filtering for France and Spain
    l.country IN ('France', 'Spain')
GROUP BY
    -- Grouping by country for analysis
    l.country
ORDER BY
    -- Ordering by country for readability
    l.country;
