# Data Validation Report

## Project context
- Student: Manthan Parmar
- Organization: CS Vision
- Internship: Financial & Operational Analytics Internship Program
- Week: 5 — SQL & Financial Data Management
- Source file: `Week-01_Data-Collection-Preprocessing/data/cleaned/financial_retail_clean.csv`
- Validation database: `Week-05_SQL-Financial-Data-Management/database/financial_analytics_db.sqlite`

## Validation status summary

| Check | Status | Result |
|---|---|---|
| Source file accessible | Passed | CSV file located and read successfully |
| Source row count | Passed | 850 rows |
| Imported database row count | Passed | 850 rows |
| Revenue total comparison | Passed | Source and imported totals match: 61,039,689.51 |
| Cost total comparison | Passed | Source and imported totals match: 39,438,335.24 |
| Net profit total comparison | Passed | Source and imported totals match: 13,918,375.60 |
| Missing-value check | Passed | No missing values in source dataset |
| Duplicate transaction identifier check | Passed | 0 duplicate Transaction_ID values |
| Date range check | Passed | 2025-01-01 to 2025-09-09 |
| MySQL import execution | Could not be performed | No MySQL server/client was available in this environment |
| Native MySQL validation in Workbench | Could not be performed | Scripts prepared; execution required on a MySQL-enabled machine |

## Checks that passed

1. Data file accessibility and schema inspection
   - The cleaned CSV was found under `Week-01_Data-Collection-Preprocessing/data/cleaned/financial_retail_clean.csv`.
   - Columns were inspected and mapped to the target schema.

2. Row count validation
   - Source dataset row count: 850
   - Imported SQLite row count: 850

3. Financial totals validation
   - Total Revenue: 61,039,689.51
   - Total Cost: 39,438,335.24
   - Total Net Profit: 13,918,375.60
   - Average Revenue per transaction: 71,811.40

4. Data quality checks
   - Missing values: 0 across all columns
   - Duplicate transaction IDs: 0
   - Date range: 2025-01-01 to 2025-09-09

## Checks that failed

No validation checks failed during the local SQLite validation.

## Checks that could not be performed

| Check | Limitation |
|---|---|
| Native MySQL database creation | MySQL server/client not installed in this environment |
| `LOAD DATA INFILE` execution in MySQL | Not possible without a reachable local MySQL instance |
| MySQL Workbench execution | Requires a machine with MySQL Workbench and server access |

## Issues requiring manual review

- The database design and import scripts are fully prepared for MySQL, but the actual MySQL execution still needs to be run on a machine with MySQL installed.
- If the user later connects to a MySQL server with password credentials, run the relevant script from `Week-05_SQL-Financial-Data-Management/sql/` after confirming the file path and database privileges.

## Final validation conclusion

The cleaned retail dataset was successfully validated and imported into a local SQLite database using the same table structure defined for the MySQL version. The dataset quality is high and consistent with the original cleaned source file. The only outstanding item is the live execution of the MySQL scripts on a machine with an installed MySQL server.
