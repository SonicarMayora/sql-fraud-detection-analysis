-- =====================================
-- Credit Card Fraud SQL Analysis
-- =====================================

-- 1. Dataset overview
-- 2. Fraud rate analysis
-- 3. Transaction amount analysis
-- 4. Largest fraudulent transactions
-- 5. Feature comparison fraud vs non-fraud

-- ==========================================================
-- 1. Dataset Overview
-- ==========================================================

-- Total number of transactions in the dataset
SELECT COUNT(*) AS total_transactions
FROM creditcard_transactions;


-- ==========================================================
-- 2. Fraud Distribution
-- ==========================================================

-- Number of transactions by class (fraud vs legitimate)SELECT 
    class,
    COUNT(*) AS transaction_count
FROM creditcard_transactions
GROUP BY class;


-- Fraud rate
SELECT 
    class,
    COUNT(*) AS transactions,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        4
    ) AS percentage
FROM creditcard_transactions
GROUP BY class;

-- ==========================================================
-- 3. Transaction Amount Analysis
-- ==========================================================

-- Transaction amount statistics
SELECT
    class,
    COUNT(*) AS transactions,
    AVG(amount) AS avg_amount,
    MAX(amount) AS max_amount,
    MIN(amount) AS min_amount
FROM creditcard_transactions
GROUP BY class;


-- ==========================================================
-- 4. Largest Fraudulent Transactions
-- ==========================================================

-- Top 10 largest fraudulent transactions
SELECT
    time,
    amount
FROM creditcard_transactions
WHERE class = 1
ORDER BY amount DESC
LIMIT 10;


-- ==========================================================
-- 5. Zero-Amount Transactions
-- ==========================================================

-- Number of zero-amount transactions by class
SELECT
    class,
    COUNT(*)
FROM creditcard_transactions
WHERE amount = 0
GROUP BY class;

-- Percentage of zero-amount transactions by class
SELECT
    class,
    COUNT(*) AS zero_amount_transactions,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        3
    ) AS percentage_of_zero_transactions
FROM creditcard_transactions
WHERE amount = 0
GROUP BY class;

-- ==========================================================
-- 6. Transaction Amount Distribution (Percentile Analysis)
-- ==========================================================

-- Percentiles of transaction amounts by class
SELECT
    class,
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY amount) AS p25,
    PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY amount) AS median,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY amount) AS p75,
    PERCENTILE_CONT(0.90) WITHIN GROUP (ORDER BY amount) AS p90,
    PERCENTILE_CONT(0.99) WITHIN GROUP (ORDER BY amount) AS p99
FROM creditcard_transactions
GROUP BY class;


-- ==========================================================
-- 7. High-Value Transactions (Top 5%)
-- ==========================================================

-- Transactions above the 95th percentile
SELECT *
FROM creditcard_transactions
WHERE amount > (
    SELECT PERCENTILE_CONT(0.95)
    WITHIN GROUP (ORDER BY amount)
    FROM creditcard_transactions
);


-- ==========================================================
-- 8. Feature Correlation with Fraud
-- ==========================================================

-- Correlation between PCA features (V1–V28) and fraud indicator
SELECT
    feature,
    CORR(value, class) AS correlation_with_fraud
FROM (
    SELECT class, 'v1' AS feature, v1 AS value FROM creditcard_transactions
    UNION ALL
    SELECT class, 'v2', v2 FROM creditcard_transactions
    UNION ALL
    SELECT class, 'v3', v3 FROM creditcard_transactions
    UNION ALL
    SELECT class, 'v4', v4 FROM creditcard_transactions
    UNION ALL
    SELECT class, 'v5', v5 FROM creditcard_transactions
    UNION ALL
    SELECT class, 'v6', v6 FROM creditcard_transactions
    UNION ALL
    SELECT class, 'v7', v7 FROM creditcard_transactions
    UNION ALL
    SELECT class, 'v8', v8 FROM creditcard_transactions
    UNION ALL
    SELECT class, 'v9', v9 FROM creditcard_transactions
    UNION ALL
    SELECT class, 'v10', v10 FROM creditcard_transactions
    UNION ALL
    SELECT class, 'v11', v11 FROM creditcard_transactions
    UNION ALL
    SELECT class, 'v12', v12 FROM creditcard_transactions
    UNION ALL
    SELECT class, 'v13', v13 FROM creditcard_transactions
    UNION ALL
    SELECT class, 'v14', v14 FROM creditcard_transactions
    UNION ALL
    SELECT class, 'v15', v15 FROM creditcard_transactions
    UNION ALL
    SELECT class, 'v16', v16 FROM creditcard_transactions
    UNION ALL
    SELECT class, 'v17', v17 FROM creditcard_transactions
    UNION ALL
    SELECT class, 'v18', v18 FROM creditcard_transactions
    UNION ALL
    SELECT class, 'v19', v19 FROM creditcard_transactions
    UNION ALL
    SELECT class, 'v20', v20 FROM creditcard_transactions
    UNION ALL
    SELECT class, 'v21', v21 FROM creditcard_transactions
    UNION ALL
    SELECT class, 'v22', v22 FROM creditcard_transactions
    UNION ALL
    SELECT class, 'v23', v23 FROM creditcard_transactions
    UNION ALL
    SELECT class, 'v24', v24 FROM creditcard_transactions
    UNION ALL
    SELECT class, 'v25', v25 FROM creditcard_transactions
    UNION ALL
    SELECT class, 'v26', v26 FROM creditcard_transactions
    UNION ALL
    SELECT class, 'v27', v27 FROM creditcard_transactions
    UNION ALL
    SELECT class, 'v28', v28 FROM creditcard_transactions
) AS feature_data
GROUP BY feature
ORDER BY ABS(CORR(value, class)) DESC;
