CREATE DATABASE sales_analysis;
USE sales_analysis;
CREATE TABLE sales (
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    state VARCHAR(50),
    region VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(4,2),
    profit DECIMAL(10,2),
    year INT,
    month VARCHAR(20),
    month_year VARCHAR(10)
);
USE sales_analysis;
TRUNCATE TABLE sales;

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE
'C:/Users/Satwik Walke/DOCS/Sales Performance Analysis/cleaned_superstore_sales.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) FROM sales;

SELECT 
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales;

SELECT 
    year,
    SUM(sales) AS yearly_sales,
    SUM(profit) AS yearly_profit
FROM sales
GROUP BY year
ORDER BY year;

SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales
GROUP BY region
ORDER BY total_sales DESC;

SELECT
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales
GROUP BY category
ORDER BY total_sales DESC;

SELECT
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales
GROUP BY sub_category
ORDER BY total_profit DESC;

SELECT
    month_year,
    SUM(sales) AS monthly_sales
FROM sales
GROUP BY month_year
ORDER BY month_year;

SELECT
    discount,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales
GROUP BY discount
ORDER BY discount;








