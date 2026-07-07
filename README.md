Superstore Sales Analysis using MySQL

Project Overview

This project focuses on cleaning and analyzing the Sample Superstore dataset using MySQL. The objective is to clean raw data and generate meaningful business insights using SQL queries and analytical techniques.

---

Tools Used

- MySQL
- SQL
- GitHub

---

Dataset

- Dataset: Sample Superstore
- Total Records: 9,994
- Total Columns: 21

---

Data Cleaning

The following data cleaning steps were performed:

- Created a staging table to preserve the raw dataset.
- Checked duplicate records using ROW_NUMBER().
- Converted Order_Date and Ship_Date to DATE format.
- Validated text columns using TRIM().
- Checked for NULL and blank values.
- Removed the unnecessary Row_ID column.

---

Exploratory Data Analysis

The following business questions were answered:

- Total Sales, Total Profit, and Profit Margin
- Top 5 Most Profitable Cities
- Top 5 Loss-Making Products
- Yearly Sales Analysis
- Monthly Profit Trend
- Rolling Profit Analysis
- Customer Segment Analysis
- Shipping Mode Analysis
- Product Sub-Category Ranking
- Category-wise Performance
- Top and Bottom Performing States
- Discount vs Profit Analysis
- Top Customers
- Monthly Sales Analysis
- Average Order Value
- Orders per Customer
- Top Performing Products

---

Key Insights

- The Consumer segment generated the highest profit.
- The Technology category generated the highest sales.
- Some products consistently generated negative profit.
- Higher discounts generally reduced profitability.
- Different shipping modes resulted in different average delivery times.
- Sales and profit showed clear trends over time.

---

SQL Concepts Used

- Aggregate Functions
- GROUP BY
- HAVING
- ORDER BY
- LIMIT
- Common Table Expressions (CTEs)
- Window Functions
- DENSE_RANK()
- ROW_NUMBER()
- COUNT(DISTINCT)
- DATEDIFF()
- YEAR()
- SUBSTRING()
- STR_TO_DATE()

---

Repository Structure

```
Superstore-SQL-Data-Analysis/
│
├── Data_Cleaning.sql
├── EDA.sql
└── README.md
```

---

Author

Muhammad Furqan

Aspiring Data Analyst

Skills

- SQL
- MySQL
- Data Cleaning
- Exploratory Data Analysis (EDA)
- Window Functions
- Common Table Expressions (CTEs)
