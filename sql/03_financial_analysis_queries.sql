USE financial_analytics_db;

-- SQL queries for Week 5 financial analysis.
-- The dataset uses a single analytical table, so JOIN is not required for this project.
-- A JOIN would only be introduced if a separate dimension table or fact table was created.

-- Query 1: Display selected records
SELECT *
FROM financial_transactions
ORDER BY Date
LIMIT 10;

-- Query 2: Filter completed orders
SELECT *
FROM financial_transactions
WHERE Order_Status = 'Completed'
ORDER BY Revenue DESC
LIMIT 10;

-- Query 3: Sort transactions by revenue descending
SELECT Transaction_ID, Date, Product, Region, Revenue
FROM financial_transactions
ORDER BY Revenue DESC
LIMIT 15;

-- Query 4: Transactions within a date range
SELECT Transaction_ID, Date, Revenue, Net_Profit, Region
FROM financial_transactions
WHERE Date BETWEEN '2025-01-01' AND '2025-03-31'
ORDER BY Date;

-- Query 5: High-value transactions
SELECT Transaction_ID, Product, Region, Revenue, Net_Profit
FROM financial_transactions
WHERE Revenue > 200000
ORDER BY Revenue DESC;

-- Query 6: Total revenue
SELECT ROUND(SUM(Revenue), 2) AS total_revenue
FROM financial_transactions;

-- Query 7: Total cost
SELECT ROUND(SUM(Cost), 2) AS total_cost
FROM financial_transactions;

-- Query 8: Total profit from the dataset definition
SELECT ROUND(SUM(Net_Profit), 2) AS total_net_profit
FROM financial_transactions;

-- Query 9: Average transaction revenue
SELECT ROUND(AVG(Revenue), 2) AS average_revenue_per_transaction
FROM financial_transactions;

-- Query 10: Count transactions
SELECT COUNT(*) AS transaction_count
FROM financial_transactions;

-- Query 11: Min and max revenue
SELECT MIN(Revenue) AS minimum_revenue,
       MAX(Revenue) AS maximum_revenue
FROM financial_transactions;

-- Query 12: Revenue by product
SELECT Product,
       ROUND(SUM(Revenue), 2) AS total_revenue
FROM financial_transactions
GROUP BY Product
ORDER BY total_revenue DESC;

-- Query 13: Revenue by region
SELECT Region,
       ROUND(SUM(Revenue), 2) AS total_revenue
FROM financial_transactions
GROUP BY Region
ORDER BY total_revenue DESC;

-- Query 14: Monthly revenue trend
SELECT Month,
       ROUND(SUM(Revenue), 2) AS monthly_revenue
FROM financial_transactions
GROUP BY Month
ORDER BY Month;

-- Query 15: Monthly cost and profit trend
SELECT Month,
       ROUND(SUM(Cost), 2) AS total_cost,
       ROUND(SUM(Net_Profit), 2) AS total_profit
FROM financial_transactions
GROUP BY Month
ORDER BY Month;

-- Query 16: Product-level financial performance
SELECT Product,
       ROUND(SUM(Revenue), 2) AS total_revenue,
       ROUND(SUM(Net_Profit), 2) AS total_net_profit,
       ROUND((SUM(Net_Profit) / SUM(Revenue)) * 100, 2) AS profit_margin_pct
FROM financial_transactions
GROUP BY Product
ORDER BY total_revenue DESC;

-- Query 17: Use HAVING to filter aggregate results
SELECT Product,
       ROUND(SUM(Revenue), 2) AS total_revenue,
       ROUND(SUM(Net_Profit), 2) AS total_profit
FROM financial_transactions
GROUP BY Product
HAVING total_revenue > 1000000
ORDER BY total_revenue DESC;

-- Query 18: Identify transactions above average revenue
SELECT Transaction_ID, Product, Region, Revenue
FROM financial_transactions
WHERE Revenue > (SELECT AVG(Revenue) FROM financial_transactions)
ORDER BY Revenue DESC;

-- Query 19: Highest revenue month using a subquery
SELECT Month,
       ROUND(SUM(Revenue), 2) AS total_revenue
FROM financial_transactions
GROUP BY Month
HAVING SUM(Revenue) = (
    SELECT MAX(month_revenue)
    FROM (
        SELECT SUM(Revenue) AS month_revenue
        FROM financial_transactions
        GROUP BY Month
    ) AS monthly_summary
);

-- Query 20: Rank products by revenue
SELECT Product,
       ROUND(SUM(Revenue), 2) AS total_revenue,
       ROW_NUMBER() OVER (ORDER BY SUM(Revenue) DESC) AS revenue_rank
FROM financial_transactions
GROUP BY Product
ORDER BY revenue_rank;

-- Query 21: Detect unusually low profitability products
SELECT Product,
       ROUND((SUM(Net_Profit) / SUM(Revenue)) * 100, 2) AS profit_margin_pct,
       ROUND(SUM(Revenue), 2) AS total_revenue
FROM financial_transactions
GROUP BY Product
ORDER BY profit_margin_pct ASC
LIMIT 10;

-- Query 22: Order status review
SELECT Order_Status,
       COUNT(*) AS order_count,
       ROUND((COUNT(*) / (SELECT COUNT(*) FROM financial_transactions)) * 100, 2) AS pct_of_total
FROM financial_transactions
GROUP BY Order_Status
ORDER BY order_count DESC;
