-- Combined OLAP Query 3
-- Compare the churn rate for different credit card type holders in Germany
SELECT
    -- Dimension for drill down/roll up: credit_card_type
    cpd.credit_card_type AS Credit_Card_Type,
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
JOIN
    credit_profile_dim cpd ON cf.credit_profile_key = cpd.credit_profile_key
WHERE
    -- Slice: Filtering for Germany
    l.country = 'Germany'
    -- Dice: Filtering for specific credit card types
    AND cpd.credit_card_type IN ('SILVER', 'GOLD', 'DIAMOND', 'PLATINUM')
GROUP BY
    -- Grouping by credit card type for analysis
    cpd.credit_card_type
ORDER BY
    -- Ordering by credit card type for readability
    cpd.credit_card_type;
