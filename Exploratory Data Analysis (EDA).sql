USE PortProject;

DESCRIBE SalesData; -- Coloumn Names & Data Types 

# Detecting Missing Values
SELECT 
    SUM(CASE WHEN `Order Priority` IS NULL OR TRIM(`Order Priority`) = '' THEN 1 ELSE 0 END) AS missing_order_priority,
    SUM(CASE WHEN `Discount` IS NULL OR TRIM(`Discount`) = '' THEN 1 ELSE 0 END) AS missing_discount,
    SUM(CASE WHEN `Unit Price` IS NULL OR TRIM(`Unit Price`) = '' THEN 1 ELSE 0 END) AS missing_unit_price,
    SUM(CASE WHEN `Customer ID` IS NULL OR TRIM(`Customer ID`) = '' THEN 1 ELSE 0 END) AS missing_customer_id
FROM SalesData; -- No Missing Values

#Customers with multiple orders
SELECT `Order ID`, COUNT(*) AS duplicate_count
FROM SalesData
GROUP BY `Order ID`
HAVING COUNT(*) > 1;  -- Multiple Orders

# Basic Stat
SELECT 
    MIN(`Sales`) AS min_sales, MAX(`Sales`) AS max_sales, AVG(`Sales`) AS avg_sales,
    MIN(`Profit`) AS min_profit, MAX(`Profit`) AS max_profit, AVG(`Profit`) AS avg_profit,
    MIN(`Discount`) AS min_discount, MAX(`Discount`) AS max_discount, AVG(`Discount`) AS avg_discount
FROM SalesData;


# BASIC INSIGHTS
SELECT
    COUNT(DISTINCT `Customer ID`) AS CUSTOMER,
    CONCAT(ROUND(AVG(DISCOUNT) * 100, 0), '%') AS AVERAGE_DISCOUNT,
    CONCAT('$ ', ROUND(AVG(`SHIPPING COST`), 0)) AS AVERAGE_SHIPPING_COST,
    ROUND(AVG(`Product Base Margin`), 2) AS AVERAGE_Product_Base_Margin,
    CONCAT('$ ', ROUND(ABS(SUM(PROFIT)), 0)) AS TOTAL_PROFIT,
    CONCAT('$ ', ROUND(SUM(SALES), 0)) AS TOTAL_SALES,
    CONCAT(ROUND(ABS((SUM(PROFIT)) / SUM(SALES)) * 100, 2), '%') AS PROFIT_MARGIN,
    COUNT(DISTINCT `Order ID`) AS PLACED_ORDER,
    SUM(ABS(`Quantity ordered new`)) AS TOTAL_QUANTITY_ORDERED
FROM SalesData;


# TOP REGION CATEGORY
SELECT 
    Region,
    SUM(SALES) AS SALES,
    ABS(SUM(PROFIT)) AS PROFIT,
    CONCAT(ROUND(ABS(SUM(PROFIT)) / SUM(SALES) * 100, 2), '%') AS PROFIT_MARGIN
FROM SalesData
WHERE `RETURN STATUS` NOT REGEXP '^[0-9]+$'
GROUP BY Region;  -- Central Top, Other 3 respectively West, East and South


# Detecting outliers in respect of Sales values
SELECT * FROM SalesData
WHERE `Sales` > (SELECT AVG(`Sales`) + 3 * STDDEV(`Sales`) FROM SalesData); -- Extreme Sales Values


# Top 10 Profit-generating Customers
SELECT `Customer Name`, SUM(`Profit`) AS total_profit
FROM SalesData
GROUP BY `Customer Name`
ORDER BY total_profit DESC
LIMIT 10;  -- Most Profitable Customer is Andrea Shaw with Total Profit of 17536.85 units


# Sales Distribution by Product Category
SELECT `Product Category`, SUM(`Sales`) AS total_sales
FROM SalesData
GROUP BY `Product Category`
ORDER BY total_sales DESC; -- Technology, Furniture and Office Supplies respectively generate the most revenue

# Monthly Sales Trend
SELECT 
    DATE_FORMAT(`Order Date`, '%Y-%m') AS month, 
    SUM(`Sales`) AS total_sales
FROM SalesData
GROUP BY month
ORDER BY month;


# Return Status
SELECT 
    `RETURN STATUS`,
    COUNT(*) AS STATUS_COUNT,
    CONCAT(ROUND((COUNT(*) * 100.0) / SUM(COUNT(*)) OVER (), 2), '%') AS RATIO_PERCENT
FROM SalesData
WHERE `RETURN STATUS` NOT REGEXP '^[0-9]+$'
GROUP BY `RETURN STATUS`; -- Not Returned : 9258 & Returned : 96


# RFM Segmentation Calculation
-- Recency: Days since last purchase
SELECT `Customer ID`, DATEDIFF(CURDATE(), MAX(`Order Date`)) AS recency
FROM SalesData
GROUP BY `Customer ID`;
-- Frequency: Number of purchases
SELECT `Customer ID`, COUNT(`Order ID`) AS frequency
FROM SalesData
GROUP BY `Customer ID`;
-- Monetary: Total spend per customer
SELECT `Customer ID`, SUM(`Sales`) AS monetary_value
FROM SalesData
GROUP BY `Customer ID`;




