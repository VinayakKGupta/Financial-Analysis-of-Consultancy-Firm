SELECT
    category_name,
    transaction_type,
    SUM(actual_amount) AS total_actual,
    SUM(budgeted_amount) AS total_budgeted,
    SUM(actual_amount) - SUM(budgeted_amount) AS variance
FROM vw_finance_analysis
GROUP BY category_name, transaction_type
ORDER BY transaction_type, variance DESC;
