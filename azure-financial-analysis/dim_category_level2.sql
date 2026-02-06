-- Expenses subcategories
INSERT INTO dim_category (category_name, category_level, parent_category_id)
SELECT DISTINCT s.subcategory_name, 2, c.category_id
FROM stg_finance s
JOIN dim_category c
     ON s.category_name = c.category_name
WHERE s.transaction_type = 'Expense';

-- Income subcategories
INSERT INTO dim_category (category_name, category_level, parent_category_id)
SELECT DISTINCT s.subcategory_name, 2, c.category_id
FROM stg_finance s
JOIN dim_category c
     ON s.category_name = c.category_name
WHERE s.transaction_type = 'Income';
