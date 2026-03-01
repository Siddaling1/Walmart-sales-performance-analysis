CREATE DATABASE Walmart;
 use Walmart;

CREATE TABLE sales (
    store INT,
    date DATE,
    weekly_sales FLOAT,
    holiday_flag INT,
    temperature FLOAT,
    fuel_price FLOAT,
    cpi FLOAT,
    unemployment FLOAT
);

-- 1. What is the total sales of Walmart across all stores? 
SELECT round(Sum(weekly_sales),2) as Total_Sales from sales;

-- 2. Which store generates the highest total sales?
SELECT store, ROUND(SUM(weekly_sales), 2) AS Total_Sales
FROM sales
GROUP BY store
ORDER BY Total_Sales DESC
LIMIT 5;

-- 3.Which store generates the lowest total sales?
SELECT store, ROUND(SUM(weekly_sales), 2) AS Total_Sales
FROM sales
GROUP BY store
ORDER BY Total_Sales 
LIMIT 5;

-- 4.How do sales change month by month?
ALTER TABLE sales
ADD month INT;

SET SQL_SAFE_UPDATES = 0;
UPDATE sales
SET month = MONTH(`date`);
SET SQL_SAFE_UPDATES = 1;

select month ,  ROUND(SUM(weekly_sales), 2) AS Total_Sales
FROM sales
group by month
order by Total_Sales desc;


-- 5. Do holiday weeks generate more sales than non-holiday weeks?
select holiday_flag ,  ROUND(SUM(weekly_sales), 2) AS Total_Sales
FROM sales
group by holiday_flag;

-- 6. Which stores perform best during holidays?
SELECT store, ROUND(SUM(weekly_sales), 2) AS Total_Sales
FROM sales
WHERE holiday_flag = 0
GROUP BY store 
order by Total_Sales desc ;


































