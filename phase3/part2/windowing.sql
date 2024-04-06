- Window Clause OLAP Query
-- Calculate the rank of customers based on their credit score and compare it with their churn status.

WITH RankedCustomers AS (
    -- Calculate the rank of customers based on their credit score within each country
    SELECT
        cp.customer_id,
        l.country,
        crd.credit_score,
        churn_fact_table churn,
        -- Use the RANK() window function with the named window 'my_window' to assign a rank to each customer
        RANK() OVER my_window AS credit_score_rank
    FROM
        customer_profile_dim cp
    JOIN
        churn_fact_table ON cp.customer_id = churn_fact_table.customer_key
	JOIN
		 location_dim l ON churn_fact_table.location_key = l.location_key -- Joining with location_dim to get country
	JOIN
        credit_profile_dim crd ON churn_fact_table.credit_profile_key = crd.credit_profile_key
    -- Define a named window 'my_window' that partitions the data by country and orders it by credit score in descending order
    WINDOW my_window AS (PARTITION BY l.country ORDER BY crd.credit_score DESC)
)
SELECT
    -- Select customer ID, country, credit score, churn status, and credit score rank from the 'RankedCustomers' CTE
    customer_id,
    country,
    credit_score,
    churn,
    credit_score_rank
FROM
    RankedCustomers;
