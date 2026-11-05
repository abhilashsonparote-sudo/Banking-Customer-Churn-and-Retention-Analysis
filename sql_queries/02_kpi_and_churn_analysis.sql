SELECT *
FROM  bank_churn;
-- 1. OVERALL PORTFOLIO KPIs

SELECT 
    COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    COUNT(*) - SUM(exited) AS retained_customers,
    ROUND(100.0 * AVG(exited), 2) AS churn_rate_pct,
    ROUND(AVG(balance), 2) AS avg_balance_overall,
    ROUND(AVG(estimated_salary), 2) AS avg_salary_overall
FROM bank_churn;



-- 2. CHURN BREAKDOWN BY GEOGRAPHY

SELECT 
    geography,
    COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND(100.0 * AVG(exited), 2) AS churn_rate_pct,
    ROUND(AVG(balance), 2) AS avg_balance
FROM bank_churn
GROUP BY geography
ORDER BY churn_rate_pct DESC;



-- 3. CHURN BREAKDOWN BY GENDER

SELECT 
    gender,
    COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND(100.0 * AVG(exited), 2) AS churn_rate_pct
FROM bank_churn
GROUP BY gender
ORDER BY churn_rate_pct DESC;



-- 4. CHURN BY ENGAGEMENT (ACTIVITY STATUS)

SELECT 
   (CASE 
        WHEN is_active = 1 THEN 'Active Member'
        ELSE 'Inactive Member'
    END) AS activity_status,
    COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND(100.0 * AVG(exited), 2) AS churn_rate_pct
FROM bank_churn
GROUP BY is_active
ORDER BY churn_rate_pct DESC;



-- 5. CHURN BY NUMBER OF PRODUCTS

SELECT 
    num_of_products,
    COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND(100.0 * AVG(exited), 2) AS churn_rate_pct
FROM bank_churn
GROUP BY num_of_products
ORDER BY num_of_products;