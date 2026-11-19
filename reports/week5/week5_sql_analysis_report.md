# Week 5 SQL Financial Data Management Report

## 1. Student and project information
- Student Name: Manthan Parmar
- Organization: CS Vision
- Internship Program: Financial & Operational Analytics Internship Program
- Week: 5
- Week Title: SQL & Financial Data Management
- Duration: 10 October 2026 – 16 October 2026
- Primary Technology: MySQL / SQL
- Supporting Tools: Python, Pandas, SQLite validation, Jupyter Notebook, Markdown reporting

## 2. Objective
The objective of Week 5 was to create a database-ready structure for the existing cleaned financial dataset, prepare MySQL-compatible SQL scripts, validate the imported data, and produce meaningful financial analysis using SQL-based queries.

## 3. Dataset overview
The cleaned dataset used for this project is:
- `Week-01_Data-Collection-Preprocessing/data/cleaned/financial_retail_clean.csv`

This file contains 850 records with the following important columns:
- `Transaction_ID`
- `Date`
- `Revenue`
- `Cost`
- `Operating_Expense`
- `Gross_Profit`
- `Net_Profit`
- `Product`
- `Category`
- `Customer_ID`
- `Customer_Segment`
- `Region`
- `City`
- `Quantity`
- `Order_Status`
- `Month`
- `Quarter`
- `Year`
- `Profit_Status`

## 4. Dataset validation summary
| Metric | Value |
|---|---:|
| Rows | 850 |
| Missing values | 0 |
| Duplicate transaction IDs | 0 |
| Total Revenue | 61,039,689.51 |
| Total Cost | 39,438,335.24 |
| Total Net Profit | 13,918,375.60 |
| Average Revenue per transaction | 71,811.40 |
| Date range | 2025-01-01 to 2025-09-09 |

## 5. Database design
A single-table design was chosen because the cleaned dataset is already a flat analytical table and does not require separate dimension tables for the current scope. This keeps the schema clear, reduces unnecessary complexity, and aligns with the instruction to avoid overengineering.

### Table name
`financial_transactions`

### Key fields
- `Transaction_ID` — primary key
- `Date` — DATE
- `Revenue`, `Cost`, `Operating_Expense`, `Gross_Profit`, `Net_Profit` — DECIMAL(18,2)
- `Quantity` — INT
- `Region`, `Product`, `Category`, `Customer_ID`, `City`, `Order_Status`, `Profit_Status` — VARCHAR

## 6. SQL deliverables created
- `Week-05_SQL-Financial-Data-Management/sql/Create Database.sql`
- `Week-05_SQL-Financial-Data-Management/sql/Import Data.sql`
- `Week-05_SQL-Financial-Data-Management/sql/Financial_Analysis.sql`
- `Week-05_SQL-Financial-Data-Management/database/financial_analytics_db.sqlite`

## 7. Data import methodology
A MySQL-compatible import script was created to map the cleaned CSV into the target schema. Because this environment did not contain a MySQL server/client, the database was validated locally through SQLite using the same schema and source file. This ensures the dataset and table structure were checked before execution in MySQL Workbench or a MySQL CLI.

## 8. SQL concepts demonstrated
The query file implements the required concepts:
- `SELECT`
- `WHERE`
- `ORDER BY`
- `GROUP BY`
- `HAVING`
- `SUM()`
- `AVG()`
- `COUNT()`
- `MIN()` / `MAX()`
- Date filtering
- Conditional financial analysis
- Subqueries
- Window function ranking

A JOIN was not used because the database design intentionally uses a single table rather than creating artificial related tables.

## 9. Query summary
A total of 22 analysis queries were created in `sql/03_financial_analysis_queries.sql` covering:
- Basic record review
- Filtering by status and date
- Sorting by transaction value
- Revenue, cost, and profit totals
- Average and range analysis
- Product and regional performance
- Monthly revenue and expense review
- HAVING filter usage
- Subquery-based analysis
- Ranking and unusual transaction identification

## 10. Key verified analytical results
| Analysis area | Result |
|---|---:|
| Total Revenue | 61,039,689.51 |
| Total Cost | 39,438,335.24 |
| Total Net Profit | 13,918,375.60 |
| Average Revenue | 71,811.40 |
| Top Region by Revenue | West — 34,309,749.58 |
| Top Product by Revenue | Laptop — 28,023,050.88 |
| Top Category by Revenue | Electronics — 52,680,285.38 |
| Highest Revenue Month | June — 6,296,528.44 |
| Average Net Margin | 22.55% |
| Cancellation Rate | 6.82% |

## 11. Main business insights
The business insights generated from the validated data are documented in `Week-05_SQL-Financial-Data-Management/reports/business_insights.md`. The strongest themes are:
1. West region is the dominant revenue contributor.
2. Laptops drive the majority of sales value.
3. Electronics is the most important category.
4. Product profitability varies materially by item.
5. Some products such as Desk and Mouse have lower margin performance.
6. A moderate level of cancelled orders requires operational review.

## 12. Data validation result
The source dataset and the imported local database matched on row count and financial totals. There were no missing values and no duplicate transaction IDs. The validation results are fully documented in `Week-05_SQL-Financial-Data-Management/reports/data_validation_report.md`.

## 13. Challenges and limitations
- MySQL was not installed or exposed in this environment, so a live MySQL import could not be executed here.
- The project therefore created MySQL-compatible SQL scripts and performed validation on a SQLite database using the same table structure and source file.
- The business analysis remains valid because the underlying cleaned dataset is the same real dataset used in weeks 1–4.

## 14. Conclusion
Week 5 was completed with a valid database schema, a full SQL query set, validated source-to-database consistency checks, and a set of analytical findings grounded in the actual retail-finance dataset. The project is ready to run on a MySQL-enabled environment by following the provided scripts and the instructions in the README.
