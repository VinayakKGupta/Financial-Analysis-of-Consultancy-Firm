CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,        -- e.g. 20240131
    full_date DATE NOT NULL,         -- actual calendar date
    year INT NOT NULL,
    month_number INT NOT NULL,       -- 1 to 12
    month_name VARCHAR(20) NOT NULL, -- January, February, etc.
    quarter VARCHAR(2) NOT NULL      -- Q1, Q2, Q3, Q4
);

CREATE TABLE dim_city (
    city_id INT IDENTITY(1,1) PRIMARY KEY,
    city_name VARCHAR(50) NOT NULL
);

CREATE TABLE dim_category (
    category_id INT IDENTITY(1,1) PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    category_level INT NOT NULL,
    parent_category_id INT NULL,
    CONSTRAINT fk_parent_category
        FOREIGN KEY (parent_category_id) REFERENCES dim_category(category_id)
);

CREATE TABLE fact_finance (
    finance_id INT IDENTITY(1,1) PRIMARY KEY,
    date_id INT NOT NULL,
    city_id INT NOT NULL,
    category_id INT NOT NULL,
    transaction_type VARCHAR(10) NOT NULL, -- 'Income' or 'Expense'
    budgeted_amount DECIMAL(18,2) NULL,
    actual_amount DECIMAL(18,2) NULL,
    CONSTRAINT fk_fact_date FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    CONSTRAINT fk_fact_city FOREIGN KEY (city_id) REFERENCES dim_city(city_id),
    CONSTRAINT fk_fact_category FOREIGN KEY (category_id) REFERENCES dim_category(category_id)
);

