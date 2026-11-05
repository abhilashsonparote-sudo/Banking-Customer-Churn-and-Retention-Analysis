SELECT *
FROM bank_churn;



--Advanced Segmentation, Risk Profiling & Financial Exposure



-- 1. HIGH-VALUE CUSTOMER RISK MATRIX (BALANCE & ACTIVITY STATUS)
-- Evaluates financial exposure by calculating exact capital lost to churn.

SELECT 
    CASE 
        WHEN balance > 100000 AND is_active = 0 THEN 'Critical Risk (High Balance, Inactive)'
        WHEN balance > 100000 AND is_active = 1 THEN 'High Value Active (Retained Asset)'
        WHEN balance <= 100000 AND is_active = 0 THEN 'Low Balance Inactive'
        ELSE 'Low Balance Active'
    END AS risk_segment,
    COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND(100.0 * AVG(exited), 2) AS churn_rate_pct,
    ROUND(AVG(balance), 2) AS avg_account_balance,
    ROUND(SUM(CASE WHEN exited = 1 THEN balance ELSE 0 END), 2) AS total_balance_lost
FROM bank_churn
GROUP BY 1
ORDER BY churn_rate_pct DESC;


-- 2. DEMOGRAPHIC SEGMENTATION & RANKING (WINDOW FUNCTION)
-- Uses CTE and DENSE_RANK() to rank sub-segments by churn severity.

WITH DemographicSegments AS (
    SELECT 
        geography,
        gender,
        age_group,
        COUNT(*) AS total_customers,
        SUM(exited) AS churned_customers,
        ROUND(100.0 * AVG(exited), 2) AS churn_rate_pct
    FROM bank_churn
    GROUP BY geography, gender, age_group
    HAVING COUNT(*) >= 50 -- Filter out tiny sample sizes
)
SELECT 
    geography,
    gender,
    age_group,
    total_customers,
    churned_customers,
    churn_rate_pct,
    DENSE_RANK() OVER (ORDER BY churn_rate_pct DESC) AS churn_risk_rank
FROM DemographicSegments
ORDER BY churn_risk_rank;



-- 3. PRODUCT-ENGAGEMENT CROSS TABULATION (PRODUCT CONCENTRATION)
-- Identifies churn rates across product portfolios and customer activity.

SELECT 
    num_of_products,
    CASE WHEN is_active = 1 THEN 'Active' ELSE 'Inactive' END AS member_status,
    COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND(100.0 * AVG(exited), 2) AS churn_rate_pct
FROM bank_churn
GROUP BY num_of_products, is_active
ORDER BY num_of_products, member_status;



-- 4. CREDIT RISK TIERS VS. CHURN RATE
-- Categorizes customers into standard financial credit rating tiers.

SELECT 
    CASE 
        WHEN credit_score < 580 THEN '1. Poor (<580)'
        WHEN credit_score BETWEEN 580 AND 669 THEN '2. Fair (580-669)'
        WHEN credit_score BETWEEN 670 AND 739 THEN '3. Good (670-739)'
        WHEN credit_score BETWEEN 740 AND 799 THEN '4. Very Good (740-799)'
        ELSE '5. Excellent (800+)'
    END AS credit_tier,
    COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND(100.0 * AVG(exited), 2) AS churn_rate_pct,
    ROUND(AVG(balance), 2) AS avg_balance
FROM bank_churn
GROUP BY 1
ORDER BY 1;