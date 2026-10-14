-- 1. Total Customers and Overall Churn Rate
SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND((SUM(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0 END) / COUNT(*)) * 100, 2) AS churn_rate_percent
FROM customer_churn;

-- 2. Churn Rate by Contract Type
SELECT 
    Contract,
    COUNT(*) AS total_users,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_users,
    ROUND((SUM(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0 END) / COUNT(*)) * 100, 2) AS churn_percentage
FROM customer_churn
GROUP BY Contract
ORDER BY churn_percentage DESC;

-- 3. Top High-Value At-Risk Customers (Window Function)
WITH HighRiskCustomers AS (
    SELECT 
        customerID,
        MonthlyCharges,
        TotalCharges,
        Tenure,
        Contract,
        DENSE_RANK() OVER (ORDER BY MonthlyCharges DESC) AS spending_rank
    FROM customer_churn
    WHERE Churn = 'Yes'
)
SELECT * FROM HighRiskCustomers
WHERE spending_rank <= 10;