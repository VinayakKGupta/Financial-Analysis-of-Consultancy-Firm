INSERT INTO dim_date (full_date, month_number, month_name, quarter)
SELECT DISTINCT
       full_date,
       MONTH(full_date) AS month_number,
       FORMAT(full_date,'MMMM') AS month_name,
       'Q' + CAST(CEILING(MONTH(full_date)/3.0) AS varchar) AS quarter
FROM stg_finance;
