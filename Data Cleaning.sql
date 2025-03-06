CREATE DATABASE PortProject;
USE PortProject;

# Basic Cleaning 
SELECT * from SalesData; -- Checking Data, same as the CSV file
SELECT count(*) from SalesData; -- Total Rows : 9426, same as CSV File

SELECT `Row ID`, COUNT(*) AS `Duplicate Count`
FROM SalesData
GROUP BY `Row ID`
HAVING COUNT(*) > 1; -- Checking Duplicate Entry. None found, so good to go...

SET SQL_SAFE_UPDATES = 0;

DELETE FROM SalesData
WHERE `Order Date` NOT REGEXP '^[0-9]+$'
   OR `Ship Date` NOT REGEXP '^[0-9]+$'; -- No Non-Numeric Value Found
   
SELECT 
	`Order Date`, 
    DATE_ADD('1899-12-30',INTERVAL `Order Date` DAY)
FROM SalesData
WHERE `Order Date` NOT BETWEEN 35000 AND 42000;
DELETE FROM SalesData
WHERE `Order Date` NOT BETWEEN 35000 AND 42000; -- No Extreme Value Found

SELECT COUNT(*) AS BlankFilter FROM SalesData
WHERE 
    `Row ID` IS NULL OR TRIM(`Row ID`) = '' OR
    `Order Priority` IS NULL OR TRIM(`Order Priority`) = '' OR
    `Discount` IS NULL OR TRIM(`Discount`) = '' OR
    `Unit Price` IS NULL OR TRIM(`Unit Price`) = '' OR
    `Shipping Cost` IS NULL OR TRIM(`Shipping Cost`) = '' OR
    `Customer ID` IS NULL OR TRIM(`Customer ID`) = '' OR
    `Customer Name` IS NULL OR TRIM(`Customer Name`) = '' OR
    `Ship Mode` IS NULL OR TRIM(`Ship Mode`) = '' OR
    `Customer Segment` IS NULL OR TRIM(`Customer Segment`) = '' OR
    `Product Category` IS NULL OR TRIM(`Product Category`) = '' OR
    `Product Sub-Category` IS NULL OR TRIM(`Product Sub-Category`) = '' OR
    `Product Container` IS NULL OR TRIM(`Product Container`) = '' OR
    `Product Name` IS NULL OR TRIM(`Product Name`) = '' OR
    `Product Base Margin` IS NULL OR TRIM(`Product Base Margin`) = '' OR
    `Region` IS NULL OR TRIM(`Region`) = '' OR
    `Manager` IS NULL OR TRIM(`Manager`) = '' OR
    `State or Province` IS NULL OR TRIM(`State or Province`) = '' OR
    `City` IS NULL OR TRIM(`City`) = '' OR
    `Postal Code` IS NULL OR TRIM(`Postal Code`) = '' OR
    `Order Date` IS NULL OR TRIM(`Order Date`) = '' OR
    `Ship Date` IS NULL OR TRIM(`Ship Date`) = '' OR
    `Profit` IS NULL OR TRIM(`Profit`) = '' OR
    `Quantity ordered new` IS NULL OR TRIM(`Quantity ordered new`) = '' OR
    `Sales` IS NULL OR TRIM(`Sales`) = '' OR
    `Order ID` IS NULL OR TRIM(`Order ID`) = '' OR
    `Return Status` IS NULL OR TRIM(`Return Status`) = ''; -- 72 Blank Rows Found


DELETE FROM SalesData
WHERE 
    `Row ID` IS NULL OR TRIM(`Row ID`) = '' OR
    `Order Priority` IS NULL OR TRIM(`Order Priority`) = '' OR
    `Discount` IS NULL OR TRIM(`Discount`) = '' OR
    `Unit Price` IS NULL OR TRIM(`Unit Price`) = '' OR
    `Shipping Cost` IS NULL OR TRIM(`Shipping Cost`) = '' OR
    `Customer ID` IS NULL OR TRIM(`Customer ID`) = '' OR
    `Customer Name` IS NULL OR TRIM(`Customer Name`) = '' OR
    `Ship Mode` IS NULL OR TRIM(`Ship Mode`) = '' OR
    `Customer Segment` IS NULL OR TRIM(`Customer Segment`) = '' OR
    `Product Category` IS NULL OR TRIM(`Product Category`) = '' OR
    `Product Sub-Category` IS NULL OR TRIM(`Product Sub-Category`) = '' OR
    `Product Container` IS NULL OR TRIM(`Product Container`) = '' OR
    `Product Name` IS NULL OR TRIM(`Product Name`) = '' OR
    `Product Base Margin` IS NULL OR TRIM(`Product Base Margin`) = '' OR
    `Region` IS NULL OR TRIM(`Region`) = '' OR
    `Manager` IS NULL OR TRIM(`Manager`) = '' OR
    `State or Province` IS NULL OR TRIM(`State or Province`) = '' OR
    `City` IS NULL OR TRIM(`City`) = '' OR
    `Postal Code` IS NULL OR TRIM(`Postal Code`) = '' OR
    `Order Date` IS NULL OR TRIM(`Order Date`) = '' OR
    `Ship Date` IS NULL OR TRIM(`Ship Date`) = '' OR
    `Profit` IS NULL OR TRIM(`Profit`) = '' OR
    `Quantity ordered new` IS NULL OR TRIM(`Quantity ordered new`) = '' OR
    `Sales` IS NULL OR TRIM(`Sales`) = '' OR
    `Order ID` IS NULL OR TRIM(`Order ID`) = '' OR
    `Return Status` IS NULL OR TRIM(`Return Status`) = '';  -- 72 Blank Rows deleted
    
SELECT count(*) from SalesData;    -- Total Rows Reduced to 9354 now

