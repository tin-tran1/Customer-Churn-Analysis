-- =====================================
-- Customer Churn Analysis (SQL)
-- =====================================

--------------------------------------------------
-- 1. Overall churn rate
--------------------------------------------------
/*
SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) AS churned,
    ROUND(SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers;
*/
--------------------------------------------------
-- 2. Behavior comparison (Spending & Transactions)
--------------------------------------------------
/*
SELECT 
    Attrition_Flag,
    AVG(Total_Trans_Amt) AS avg_spending,
    AVG(Total_Trans_Ct) AS avg_transactions
FROM customers
GROUP BY Attrition_Flag;

-- Insight:
-- Churned customers show lower spending and transaction activity
*/
--------------------------------------------------
-- 3. Income-based churn
--------------------------------------------------
/*
SELECT 
    Income_Category,
    COUNT(*) AS total,
    SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS churn_rate
FROM customers
GROUP BY Income_Category;
*/
--------------------------------------------------
-- 4. Card category churn
--------------------------------------------------
/*
SELECT 
    Card_Category,
    COUNT(*) AS total,
    SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS churn_rate
FROM customers
GROUP BY Card_Category;
*/
--------------------------------------------------
-- 5. Utilization churn
--------------------------------------------------
/*
SELECT 
    Attrition_Flag,
    AVG(Avg_Utilization_Ratio) AS avg_utilization
FROM customers
GROUP BY Attrition_Flag;
*/