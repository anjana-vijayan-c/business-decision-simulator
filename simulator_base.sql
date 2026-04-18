create database Business_Stimulator;
use Business_Stimulator;
select * from ecommerce_sales;
SELECT * FROM ecommerce_sales LIMIT 10;
SELECT COUNT(*) FROM ecommerce_sales;

#1. Base Demand (Average Sales per Product)
SELECT 
    product_id,
    AVG(quantity) AS base_demand
FROM ecommerce_sales
GROUP BY product_id;

#2. Average Price & Profit
SELECT 
    product_id,
    AVG(price) AS avg_price,
    AVG(profit_margin) AS avg_profit_margin
FROM ecommerce_sales
GROUP BY product_id;

#3. Regional Performance
SELECT 
    region,
    SUM(total_amount) AS total_sales,
    SUM(quantity) AS total_quantity
FROM ecommerce_sales
GROUP BY region;

#4. Return Rate (Customer Behavior)
SELECT 
    product_id,
    COUNT(CASE WHEN returned = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS return_rate
FROM ecommerce_sales
GROUP BY product_id;

#CREATE A VIEW
CREATE VIEW simulation_base AS
SELECT 
    product_id,
    AVG(quantity) AS base_demand,
    AVG(price) AS base_price,
    AVG(profit_margin) AS profit_margin,
    SUM(total_amount) AS total_revenue
FROM ecommerce_sales
GROUP BY product_id;

SELECT * FROM simulation_base;

SELECT COUNT(DISTINCT product_id) FROM ecommerce_sales;
SELECT product_id, COUNT(*) 
FROM ecommerce_sales
GROUP BY product_id
ORDER BY COUNT(*) DESC;

