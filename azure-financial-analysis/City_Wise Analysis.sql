SELECT
    c.city_name,

    -- Net Actual (Income - Expense)
    (
        (SELECT SUM(actual_amount)
         FROM vw_finance_analysis
         WHERE transaction_type = 'Income'
           AND city_name = c.city_name)
        -
        (SELECT SUM(actual_amount)
         FROM vw_finance_analysis
         WHERE transaction_type = 'Expense'
           AND city_name = c.city_name)
    ) AS net_actual,

    -- Net Budgeted (Income - Expense)
    (
        (SELECT SUM(budgeted_amount)
         FROM vw_finance_analysis
         WHERE transaction_type = 'Income'
           AND city_name = c.city_name)
        -
        (SELECT SUM(budgeted_amount)
         FROM vw_finance_analysis
         WHERE transaction_type = 'Expense'
           AND city_name = c.city_name)
    ) AS net_budgeted

FROM (
    SELECT DISTINCT city_name
    FROM vw_finance_analysis
) c
ORDER BY c.city_name;
