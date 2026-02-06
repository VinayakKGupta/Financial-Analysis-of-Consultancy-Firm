SELECT
    (
        (SELECT SUM(actual_amount)
         FROM vw_finance_analysis
         WHERE transaction_type = 'Income')
        -
        (SELECT SUM(actual_amount)
         FROM vw_finance_analysis
         WHERE transaction_type = 'Expense')
    )
    -
    (
        (SELECT SUM(budgeted_amount)
         FROM vw_finance_analysis
         WHERE transaction_type = 'Income')
        -
        (SELECT SUM(budgeted_amount)
         FROM vw_finance_analysis
         WHERE transaction_type = 'Expense')
    ) AS net_variance;
