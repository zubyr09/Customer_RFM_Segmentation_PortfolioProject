# Exploratory Data Analysis (EDA) Summary

## Dataset Overview
- **Database Name:** `PortProject`
- **Table Name:** `SalesData`
- **Total Records:** 9426
- **Columns & Data Types:** (Described using `DESCRIBE SalesData;`)

## Missing Values Check
- No missing values detected in key columns (`Order Priority`, `Discount`, `Unit Price`, `Customer ID`).

## Customer Insights
- **Unique Customers:** 2,694
- **Customers with Multiple Orders:** Found via duplicate `Order ID` detection.

## Basic Statistics
- **Sales:**
  - Minimum: $1.32
  - Maximum: $100,119
  - Average: $939.65
- **Profit:**
  - Minimum: -$16,476.8 (Loss)
  - Maximum: $16,332.4
  - Average: $136.89
- **Discount:**
  - Minimum: 0%
  - Maximum: 25%
  - Average: 4.95%

## Business Performance Summary
- **Average Discount:** 5%
- **Average Shipping Cost:** $13
- **Average Product Base Margin:** 0.51
- **Total Profit:** $1,280,491
- **Total Sales:** $8,789,476
- **Profit Margin:** 14.57%
- **Total Orders Placed:** 6,428
- **Total Quantity Ordered:** 128,996

## Regional Sales & Profitability
- **Top Region by Sales:** Central
- **Other Regions in Order:** West, East, South

## Outlier Detection
- **Extreme Sales Values:** Identified based on 3 standard deviations above the mean.

## Customer Segmentation (RFM Analysis)
- **Recency:** Days since last purchase calculated.
- **Frequency:** Number of purchases per customer.
- **Monetary:** Total spend per customer.

## Sales Analysis
- **Top 10 Most Profitable Customers:**
  - Highest Profit Generating Customer: *Andrea Shaw ($17,536.85 total profit)*
- **Sales Distribution by Product Category:**
  - **Most Revenue Generating Categories:**
    1. Technology
    2. Furniture
    3. Office Supplies

## Monthly Sales Trend
- Sales aggregated and analyzed based on `Order Date`.

## Return Status
- **Not Returned:** 9,258 (99%)
- **Returned:** 96 (1%)

---
### Notes:
- This report summarizes key insights from the EDA.
- For a complete SQL breakdown, refer to the queries used.

