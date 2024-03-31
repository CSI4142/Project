-- Slice query to analyze churn rates based on complaints, active membership, and location (France)

SELECT
    bp.complain, -- Whether the customer has lodged a complaint (1 for Yes, 0 for No)
    bp.active_member, -- Whether the customer is an active member (1 for Yes, 0 for No)
    COUNT(*) AS total_customers, -- Total number of customers in the group
    SUM(cft.churn) AS churned_customers, -- Total number of churned customers in the group
    (SUM(cft.churn)::decimal / COUNT(*)) * 100 AS churn_rate -- Churn rate calculated as a percentage
FROM
    churn_fact_table cft
JOIN
    banking_profile_dim bp ON cft.bank_profile_key = bp.bank_profile_key
JOIN
    location_dim loc ON cft.location_key = loc.location_key
WHERE
    loc.country = 'France' -- Filter by customers located in France
GROUP BY
    bp.complain, -- Grouping by complaints
    bp.active_member -- Grouping by active members
ORDER BY
    bp.complain, -- Then ordering by complaints
    bp.active_member; -- Ordering by active members