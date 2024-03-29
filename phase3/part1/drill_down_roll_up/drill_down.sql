-- Drill down query to display the total number of customers, churned customer and churn rate by gender for each country
SELECT l.country, cp.gender, COUNT(*) AS Total_Customers, 
       SUM(CASE WHEN cf.churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
       ROUND(SUM(CASE WHEN cf.churn = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM churn_fact_table cf
-- join churn table with customer profile table to get gender
JOIN customer_profile_dim cp ON cf.customer_key = cp.customer_id
-- join churn table with location table to get country
JOIN location_dim l ON cf.location_key = l.location_key
-- group by country and gender to get the appropriate counts
GROUP BY l.country, cp.gender
-- order by country and gender
ORDER BY l.country, cp.gender; 