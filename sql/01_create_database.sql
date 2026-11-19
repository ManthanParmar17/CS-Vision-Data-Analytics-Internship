DROP DATABASE IF EXISTS financial_analytics_db;

CREATE DATABASE financial_analytics_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE financial_analytics_db;

CREATE TABLE financial_transactions (
    Transaction_ID VARCHAR(30) NOT NULL PRIMARY KEY,
    Date DATE NOT NULL,
    Revenue DECIMAL(18,2) NOT NULL,

    Cost DECIMAL(18,2) NOT NULL,
    Operating_Expense DECIMAL(18,2) NOT NULL,
    Gross_Profit DECIMAL(18,2) NOT NULL,
    Net_Profit DECIMAL(18,2) NOT NULL,
    Product VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Customer_ID VARCHAR(30) NOT NULL,
    Customer_Segment VARCHAR(30) NOT NULL,
    Region VARCHAR(30) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Quantity INT NOT NULL,
    Order_Status VARCHAR(30) NOT NULL,
    Month VARCHAR(20) NOT NULL,
    Quarter VARCHAR(5) NOT NULL,
    Year INT NOT NULL,
    Profit_Status VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

SHOW TABLES;