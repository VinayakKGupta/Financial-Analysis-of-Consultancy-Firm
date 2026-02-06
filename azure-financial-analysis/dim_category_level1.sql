-- Expenses main categories
INSERT INTO dim_category (category_name, category_level, parent_category_id)
SELECT DISTINCT category_name, 1, NULL
FROM stg_finance
WHERE transaction_type = 'Expense';

-- Income main categories
INSERT INTO dim_category (category_name, category_level, parent_category_id)
SELECT DISTINCT category_name, 1, NULL
FROM stg_finance
WHERE transaction_type = 'Income';
