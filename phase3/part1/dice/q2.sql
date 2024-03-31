-- Dice query to analyze churn rates based on tenure and number of products

SELECT
    bp.tenure, -- Tenure with the bank
    bp.products_number, -- Number of products owned by the customer
    COUNT(*) AS total_customers, -- Total number of customers in the group
    SUM(cft.churn) AS churned_customers, -- Count of churned customers in the group
    (SUM(cft.churn)::decimal / COUNT(*)) * 100 AS churn_rate -- Churn rate calculated as a percentage
FROM
    churn_fact_table cft
JOIN
    banking_profile_dim bp ON cft.bank_profile_key = bp.bank_profile_key
GROUP BY
    bp.tenure, -- Grouping by tenure
    bp.products_number -- Grouping by number of products
ORDER BY
    bp.tenure, -- Ordering by tenure
    bp.products_number; -- Then ordering by number of products