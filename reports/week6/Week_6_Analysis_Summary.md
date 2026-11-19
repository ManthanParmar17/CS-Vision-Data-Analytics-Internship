# Week 6 Financial Analytics Summary

**Student:** Manthan Parmar  
**Organization:** CS Vision  
**Program:** Financial & Operational Analytics Internship Program  
**Week:** 6 - Advanced NumPy, Pandas & Visualization  

## Data scope
- Source: `Week-01_Data-Collection-Preprocessing/data/cleaned/financial_retail_clean.csv` (left unchanged)
- Records: 850; columns: 19
- Date range: 2025-01-01 through 2025-12-31 (326 distinct dates)
- Financial figures below cover all supplied order statuses and are not necessarily realized sales.

## Verified portfolio summary
- Revenue: $61,039,689.51
- Cost: $39,438,335.24
- Gross profit: $21,601,354.27
- Net profit: $13,918,375.60
- Weighted net margin: 22.80%
- Mean transaction-level net margin (unweighted): 22.55%

## Key findings
- **West is the largest regional revenue contributor.** $34,309,749.58 (56.21% of source revenue). Track the West region's contribution and margins alongside the other regions; avoid allocating resources on revenue alone.
- **Electronics leads category revenue.** $52,680,285.38 (86.30% of source revenue). Monitor category margin and concentration risk together, and validate the mix against completed transactions.
- **Laptop ranks first by revenue, while Laptop ranks first by net profit.** Revenue leader: $28,023,050.88; net-profit leader: $6,416,577.50. Use both revenue and net-profit rankings for product assortment, promotion, and procurement decisions.
- **2025-06 is the highest-revenue month in the observed period.** $6,296,528.44; the data spans 2025-01-01 to 2025-12-31. Use this as a planning signal only after validating with additional years and status-adjusted sales.
- **Corporate has the highest aggregate net margin among customer segments.** 23.12% net margin; Desk is the lowest-margin product at 20.70%. Review segment economics and low-margin product costs before changing pricing or incentive policies.
- **58 records (6.82%) carry a Cancelled status.** Source financial amounts are retained as supplied; they are not presumed to be realized revenue. Reconcile order-status definitions and report a separately validated completed-only measure before operational decisions.

## Validation
- Supplied gross and net profit formulas reconcile within $0.01 for every row.
- No missing values or duplicate transaction identifiers; original rows were retained.
- Outliers and explicit Unknown labels were documented, not removed or guessed.
- Monthly growth handles missing/zero prior periods as unavailable.

## Limitations
- Single-year coverage is not sufficient to establish seasonality.
- All order statuses are present; reconcile their accounting treatment before interpreting the totals as realized sales.
- Findings are descriptive, not causal.

## Deliverables
- Executed notebook: `notebooks/Week_6_Advanced_Financial_Analytics.ipynb`
- Charts: `visualizations/`
- CSVs: `outputs/`
- PDFs: `reports/`
