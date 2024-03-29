-- Iceberg query to check churn of the top 5 customers with the highest bank balance
-- selecting customer ID, bank balance, and churn status
SELECT cp.customer_id, bp.balance, cf.churn
FROM churn_fact_table cf
-- joining the fact table with the customer profile and banking profile dimensions
JOIN customer_profile_dim cp ON cf.customer_key = cp.customer_id
JOIN banking_profile_dim bp ON cf.bank_profile_key = bp.bank_profile_key
-- ordering the results by bank balance in descending order
ORDER BY bp.balance DESC
-- limiting the results to the top 5 customers
LIMIT 5;