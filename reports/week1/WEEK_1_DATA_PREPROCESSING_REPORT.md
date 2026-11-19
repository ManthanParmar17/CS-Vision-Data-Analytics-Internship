# CS Vision – Week 1 Data Collection & Preprocessing Report

**Period:** 12 September – 18 September 2026  
**Dataset:** Financial retail transactions  
**Organization:** CS Vision

## 1. Business objective

Prepare a reliable analytical dataset for simple financial-retail reporting. The cleaned data supports revenue, cost, gross-profit, net-profit, product, customer, regional, and time-based analysis.

The financial controls used were:

- `Gross_Profit = Revenue - Cost`
- `Net_Profit = Gross_Profit - Operating_Expense`

## 2. Source profiling

| Measure | Result |
|---|---:|
| Raw rows | 865 |
| Raw columns | 18 |
| Missing revenue values | 8 |
| Missing product values | 7 |
| Missing customer IDs | 19 |
| Missing city values | 10 |
| Missing order statuses | 8 |
| Exact duplicate rows | 13 |
| Initial net-profit mismatches | 10 |
| Date/month, quarter, and year mismatches | 0 |
| Date range | 1 January 2025 – 31 December 2025 |

The dataset contains inconsistent capitalization and whitespace, including product, category, customer-segment, city, and order-status variants.

## 3. Preprocessing performed

1. Imported the CSV with pandas and profiled shape, types, missingness, uniqueness, and duplicates.
2. Removed exact duplicate rows.
3. Trimmed text fields and standardized labels:
   - Product and city: title case.
   - Category and customer segment: title case.
   - Order status: title case; `Complete` mapped to `Completed`.
4. Converted `Date` to a datetime type and numeric business fields to numeric types.
5. Filled missing analytical labels with explicit values (`Unknown` or `UNKNOWN`) rather than inventing customer or product values.
6. Reconstructed missing `Revenue` using the auditable formula `Cost + Gross_Profit`.
7. Recalculated `Gross_Profit` and `Net_Profit` from the financial controls above, correcting the 10 inconsistent net-profit values.
8. Rebuilt month, quarter, and year from `Date`.
9. Added a simple `Profit_Status` label using a NumPy conditional calculation.
10. Removed one additional duplicate created when dirty text variants became identical after normalization.
11. Sorted the output chronologically and exported the clean dataset.

## 4. Output validation

| Check | Result |
|---|---:|
| Rows before final uniqueness cleaning | 851 |
| Rows removed | 1 |
| Clean rows | 850 |
| Clean columns | 19 |
| Duplicate `Transaction_ID` values before final cleaning | 1 |
| Duplicate `Transaction_ID` values after final cleaning | 0 |
| Missing cells | 0 |
| Exact duplicate rows | 0 |
| Gross-profit mismatches | 0 |
| Net-profit mismatches | 0 |
| Date-label mismatches | 0 |
| Negative financial values | 0 |

The two `TXN100505` records were compared across all transaction, financial, customer, location, date-label, and quantity columns. Every listed value matched except `Quantity`: one row contained `3` and the other contained `75`. The quantity-75 row was treated as the erroneous outlier and removed. The quantity-3 row was retained. No other non-exact record was removed during the final uniqueness check.

The reproducible pandas operation was:

```python
remove_mask = (
   df['Transaction_ID'].eq('TXN100505')
   & df['Quantity'].eq(75)
)
df = df.loc[~remove_mask].copy()
```

This removed exactly one row and preserved all other valid records.

## 5. Clean dataset summary

| Category | Transactions | Revenue | Net profit |
|---|---:|---:|---:|
| Accessories | 266 | 3,206,741.31 | 743,025.59 |
| Electronics | 485 | 52,680,285.38 | 12,065,201.32 |
| Furniture | 99 | 5,152,662.82 | 1,110,148.69 |
| **Total** | **850** | **61,039,689.51** | **13,918,375.60** |

## 6. Week 1 requirements covered

| Requirement | Where it is completed |
|---|---|
| Understand the financial business problem | Business objective and financial formulas in the notebook |
| Python environment setup | Notebook imports and configured Python kernel |
| Dataset collection and loading | CSV loaded with `pandas.read_csv` |
| Data structure analysis and profiling | Shape, data types, missing values, unique values, and duplicates |
| Missing-value treatment | Labels for missing text and formula-based revenue repair |
| Duplicate identification and removal | Duplicate count before cleaning, exact-duplicate removal, and final `Transaction_ID` validation |
| Data consistency validation | Financial formulas, dates, missing values, duplicates, and negative values |
| Data type conversion and date formatting | Numeric conversion, datetime conversion, month, quarter, and year |
| Financial data transformation | Gross profit, net profit, and profit-status calculations |
| Clean analytical dataset | Final validated CSV export to `financial_retail_clean.csv` |

The notebook also demonstrates the requested NumPy focus: numerical arrays, mathematical operations, statistical calculation, aggregation, and conditional calculation. Its pandas focus includes DataFrame creation, data import, filtering, sorting, missing-value handling, duplicate removal, transformation, and date operations.

## 7. Deliverables

- `financial_retail_clean.csv` – cleaned analytical dataset.
- `financial_retail_preprocessing.ipynb` – reproducible Python preprocessing notebook.
- `WEEK_1_DATA_PREPROCESSING_REPORT.md` – this report.

The final validation code prints the complete pairwise comparison for `TXN100505`, removes only the quantity-75 record, prints the requested cleaning summary, validates all quality checks, and exports the final CSV.

## 8. Recommended next step

The final dataset now has a unique `Transaction_ID` for every row and no reported data-quality issues. It can be used for downstream reporting, subject to normal business review.
