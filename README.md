# Customer RFM Segmentation Portfolio Project

This is a Data Science project for customer segmentation using RFM (Recency, Frequency, Monetary) analysis. The project uses the "Superstore Sales Data.csv" dataset to segment customers based on their purchasing behavior. The dataset contains 9426 records, and the analysis is carried out using MySQL Workbench.

## Project Overview

The goal of this project is to perform Exploratory Data Analysis (EDA) and RFM Segmentation on the "Superstore Sales Data.csv" dataset and generate actionable insights for customer segmentation.

### Tools Used:
- **MySQL Workbench**: For data manipulation and analysis.
- **Excel to DB Data Import Tool**: For importing the dataset into the MySQL database.
- **SQL**: For data cleaning, exploratory analysis, and RFM segmentation.
- **Matplotlib/Seaborn**: For generating graphical representations (in the form of `.png` files).

### Database Information:
- **Database Name**: `PortProject`
- **Table Name**: `SalesData`
- **Dataset File**: `Superstore Sales Data.csv`

## File Structure

- **[Data Cleaning.sql](Data%20Cleaning.sql)**: SQL script for cleaning and preparing the data for analysis.
- **[Exploratory Data Analysis (EDA).sql](Exploratory%20Data%20Analysis%20(EDA).sql)**: SQL script for performing EDA on the dataset, which includes analyzing distributions, trends, and correlations.
- **[RFM Segmentation.sql](RFM%20Segmentation.sql)**: SQL script for performing the RFM segmentation analysis.
- **README.md**: Project documentation.
- **[Customer Data Folder](Customer%20Data)**:
  - **[Superstore Sales Data.csv](Customer%20Data/Superstore%20Sales%20Data.csv)**: The original dataset used in the project.
- **[Results & Findings Folder](Results%20&%20Findings)**:
  - **[Average Monetary Value.png](Results%20&%20Findings/Average%20Monetary%20Value.png)**: Visual representation of the average monetary value of customers.
  - **[EDA Summary.md](Results%20&%20Findings/EDA%20Summary.md)**: Summary of the findings from the Exploratory Data Analysis (EDA).
  - **[RFM Customer Segmentation.png](Results%20&%20Findings/RFM%20Customer%20Segmentation.png)**: Graphical representation of the RFM segmentation results.
  - **[RFM_Table.csv](Results%20&%20Findings/RFM_Table.csv)**: The final table containing customer segments based on RFM analysis.

## Project Steps

### 1. Data Import
The dataset was imported into MySQL using the **Excel to DB Data Import Tool**. The data was then inserted into the `SalesData` table in the `PortProject` database.

### 2. Data Cleaning
The **[Data Cleaning.sql](Data%20Cleaning.sql)** file was used to clean the dataset by handling missing values, correcting data types, and removing outliers or duplicates.

### 3. Exploratory Data Analysis (EDA)
The **[Exploratory Data Analysis (EDA).sql](Exploratory%20Data%20Analysis%20(EDA).sql)** file performs an in-depth analysis of the dataset, including:
- Summary statistics
- Distribution of key features (e.g., Sales, Quantity, Profit)
- Correlations and trends between variables
- Identifying key insights for further analysis

### 4. RFM Segmentation
The **[RFM Segmentation.sql](RFM%20Segmentation.sql)** file performs the RFM analysis by calculating:
- **Recency**: How recently a customer has made a purchase.
- **Frequency**: How often a customer makes a purchase.
- **Monetary**: How much a customer spends.

Customers are then segmented into different groups based on their RFM scores. The segmentation results are stored in the **[RFM_Table.csv](Results%20&%20Findings/RFM_Table.csv)** and visualized in the **[RFM Customer Segmentation.png](Results%20&%20Findings/RFM%20Customer%20Segmentation.png)**.

## Results & Findings

### EDA Summary
- Insights and conclusions drawn from the exploratory analysis can be found in the **[EDA Summary.md](Results%20&%20Findings/EDA%20Summary.md)** file. The EDA highlights important trends and anomalies in the data.

### RFM Segmentation
- Customers were segmented into different groups based on their Recency, Frequency, and Monetary scores. The segmentation results can be viewed in the **[RFM_Table.csv](Results%20&%20Findings/RFM_Table.csv)** and visualized in the **[RFM Customer Segmentation.png](Results%20&%20Findings/RFM%20Customer%20Segmentation.png)**.
- The **[Average Monetary Value.png](Results%20&%20Findings/Average%20Monetary%20Value.png)** shows the average amount spent by customers in each segment.

## Conclusion
This project provides insights into customer behavior through RFM segmentation. The findings can be used to target specific customer segments for personalized marketing strategies, improving customer retention, and optimizing sales.



