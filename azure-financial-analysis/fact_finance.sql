INSERT INTO fact_finance (date_id, city_id, category_id, budgeted_amount, actual_amount, transaction_type)
SELECT 
    d.date_id,
    c.city_id,
    cat.category_id,
    s.budgeted_amount,
    s.actual_amount,
    s.transaction_type
FROM stg_finance s
JOIN dim_date d
    ON s.full_date = d.full_date
JOIN dim_city c
    ON s.city_name = c.city_name
JOIN dim_category cat
    ON s.subcategory_name = cat.category_name;


