USE PortProject;
   
# New date Coloumns with proper Date Format
SET SQL_SAFE_UPDATES = 0;
ALTER TABLE SalesData
ADD COLUMN order_date DATE;
UPDATE SalesData
SET order_date = DATE_ADD('1899-12-30', INTERVAL `ORDER DATE` DAY);
UPDATE SalesData
SET ORDER_DATE = str_to_date(ORDER_DATE, '%Y-%m-%d');

SELECT max(ORDER_DATE) 
from SalesData;  -- Last Date

-- Create or replace view for RFM Score Calculation
CREATE OR REPLACE VIEW customer_rfm_scores AS
SELECT 
    t.`Customer Name`,
    DATEDIFF((SELECT MAX(Order_Date) FROM PortProject.SalesData), MAX(t.Order_Date)) AS Recency_Value,
    COUNT(DISTINCT t.`Order ID`) AS Frequency_Value,
    ROUND(SUM(t.Sales), 2) AS Monetary_Value,
    NTILE(4) OVER (ORDER BY DATEDIFF((SELECT MAX(Order_Date) FROM PortProject.SalesData), MAX(t.Order_Date)) DESC) AS R_Score,
    NTILE(4) OVER (ORDER BY COUNT(DISTINCT t.`Order ID`) ASC) AS F_Score,
    NTILE(4) OVER (ORDER BY ROUND(SUM(t.Sales), 2) ASC) AS M_Score
FROM PortProject.SalesData t
WHERE t.`Customer Name` IS NOT NULL 
GROUP BY t.`Customer Name`;


-- Create or replace view for RFM Segmentation
CREATE OR REPLACE VIEW RFM_ANALYSIS AS
SELECT 
    c.*, 
    CONCAT_WS('', c.M_Score, c.F_Score, c.R_Score) AS RFM_Score_Combination,
    CASE 
        WHEN CONCAT_WS('', c.M_Score, c.F_Score, c.R_Score) IN ('111', '112', '121', '132', '211', '212', '114', '141') THEN 'CHURNED CUSTOMER'
        WHEN CONCAT_WS('', c.M_Score, c.F_Score, c.R_Score) IN ('133', '134', '143', '224', '334', '343', '344', '144') THEN 'SLIPPING AWAY, CANNOT LOSE'
        WHEN CONCAT_WS('', c.M_Score, c.F_Score, c.R_Score) IN ('311', '411', '331') THEN 'NEW CUSTOMERS'
        WHEN CONCAT_WS('', c.M_Score, c.F_Score, c.R_Score) IN ('222', '231', '221', '223', '233', '322') THEN 'POTENTIAL CHURNERS'
        WHEN CONCAT_WS('', c.M_Score, c.F_Score, c.R_Score) IN ('323', '333', '321', '341', '422', '332', '432') THEN 'ACTIVE'
        WHEN CONCAT_WS('', c.M_Score, c.F_Score, c.R_Score) IN ('433', '434', '443', '444') THEN 'LOYAL'
        ELSE 'Other'
    END AS Customer_Segment
FROM customer_rfm_scores c;

-- Count Customers per Segment with Average Monetary Value
SELECT 
    Customer_Segment, 
    COUNT(*) AS Number_of_Customers, 
    ROUND(AVG(Monetary_Value), 0) AS Average_Monetary_Value
FROM RFM_ANALYSIS
GROUP BY Customer_Segment;



