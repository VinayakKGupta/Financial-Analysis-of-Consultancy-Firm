SELECT
    category_name,
    subcategory_name,
    SUM(actual_amount) AS subcategory_expense,
    (
        SUM(actual_amount) /
        (SELECT SUM(actual_amount)
         FROM vw_finance_analysis
         WHERE transaction_type = 'Expense')
    ) * 100 AS expense_percentage
FROM vw_finance_analysis
WHERE transaction_type = 'Expense'
GROUP BY category_name, subcategory_name
ORDER BY expense_percentage DESC;
