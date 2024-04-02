-- Window Clause OLAP Query
-- Calculate the rank of customers based on their credit score and compare it with their churn status.

WITH RankedCustomers AS (
    -- Calculate the rank of customers based on their credit score within each country
    SELECT
        customer_id,
        country,
        credit_score,
        churn_status,
        -- Use the RANK() window function with the named window 'my_window' to assign a rank to each customer
        RANK() OVER my_window AS credit_score_rank
    FROM
        customer_credit_score_table
    JOIN
        customer_churn_table ON customer_credit_score_table.customer_id = customer_churn_table.customer_id
    -- Define a named window 'my_window' that partitions the data by country and orders it by credit score in descending order
    WINDOW my_window AS (PARTITION BY country ORDER BY credit_score DESC)
)
SELECT
    -- Select customer ID, country, credit score, churn status, and credit score rank from the 'RankedCustomers' CTE
    customer_id,
    country,
    credit_score,
    churn_status,
    credit_score_rank
FROM
    RankedCustomers;
