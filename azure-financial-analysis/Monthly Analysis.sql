SELECT
    m.month_name,
    m.month_number,

    -- Net Actual (Income - Expense)
    (
        (SELECT SUM(actual_amount)
         FROM vw_finance_analysis
         WHERE transaction_type = 'Income'
           AND month_number = m.month_number)
        -
        (SELECT SUM(actual_amount)
         FROM vw_finance_analysis
         WHERE transaction_type = 'Expense'
           AND month_number = m.month_number)
    ) AS net_actual,

    -- Net Budgeted (Income - Expense)
    (
        (SELECT SUM(budgeted_amount)
         FROM vw_finance_analysis
         WHERE transaction_type = 'Income'
           AND month_number = m.month_number)
        -
        (SELECT SUM(budgeted_amount)
         FROM vw_finance_analysis
         WHERE transaction_type = 'Expense'
           AND month_number = m.month_number)
    ) AS net_budgeted

FROM (
    SELECT DISTINCT month_name, month_number
    FROM vw_finance_analysis
) m
ORDER BY m.month_number;
