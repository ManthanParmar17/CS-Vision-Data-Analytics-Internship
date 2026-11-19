-- Week 5: MySQL data import script
-- This script is intended for MySQL Workbench or a MySQL CLI session.
-- Before running, confirm that the path below points to the cleaned CSV file on your machine.

USE financial_analytics_db;

SELECT COUNT(*) AS imported_row_count FROM financial_transactions;
SELECT MIN(Date) AS min_date, MAX(Date) AS max_date FROM financial_transactions;

SELECT *
FROM financial_transactions
LIMIT 10;
