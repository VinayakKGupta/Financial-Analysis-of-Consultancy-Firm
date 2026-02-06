SELECT
    category_name,
    subcategory_name,
    SUM(actual_amount) AS subcategory_income,
    (
        SUM(actual_amount) /
        (SELECT SUM(actual_amount)
         FROM vw_finance_analysis
         WHERE transaction_type = 'Income')
    ) * 100 AS income_percentage
FROM vw_finance_analysis
WHERE transaction_type = 'Income'
GROUP BY category_name, subcategory_name
ORDER BY income_percentage DESC;
