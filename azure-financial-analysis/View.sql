CREATE VIEW vw_finance_analysis AS
SELECT
    d.full_date,
    d.month_name,
    d.month_number,
    d.quarter,
    c.city_name,
    parent.category_name AS category_name,
    child.category_name AS subcategory_name,
    f.budgeted_amount,
    f.actual_amount
FROM fact_finance f
JOIN dim_date d
    ON f.date_id = d.date_id
JOIN dim_city c
    ON f.city_id = c.city_id
JOIN dim_category child
    ON f.category_id = child.category_id
LEFT JOIN dim_category parent
    ON child.parent_category_id = parent.category_id;



