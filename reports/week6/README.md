# Week 6 - Advanced NumPy, Pandas & Visualization

**Student:** Manthan Parmar  
**Organization:** CS Vision  
**Program:** Financial & Operational Analytics Internship Program  
**Week:** 6 (17 October 2026–23 October 2026)

## Project overview

The main Week 6 deliverable is a beginner-friendly Jupyter notebook for financial analysis with pandas, NumPy, and Matplotlib. It uses the shared cleaned retail dataset and creates five charts.

## Dataset and assumptions

The notebook reads `Week-01_Data-Collection-Preprocessing/data/cleaned/financial_retail_clean.csv`, shared with the earlier project work and left unchanged. It checks the actual columns, dimensions, data types, missing values, duplicate rows, and existing financial calculations. No rows are removed and no missing values are filled.

All source order statuses are included in headline totals. Amounts supplied for Cancelled, Returned, Pending, and Unknown records are not presumed to be realized sales. Reconcile status and accounting definitions before using these totals as booked results. Outliers and explicit `Unknown` labels are documented but retained. A single calendar year is not sufficient evidence of recurring seasonality.

## Installation

From the repository root, create or activate a Python environment and install the project dependencies:

```powershell
python -m pip install -r requirements.txt
```

## Run the analysis

Open `Week-06_Advanced-Python-Analytics/notebooks/Week_6_Advanced_Financial_Analytics.ipynb` in Jupyter or VS Code and run the cells from top to bottom. The notebook searches for the shared cleaned dataset from the current folder and its parent folders, then saves five PNG charts in `Week-06_Advanced-Python-Analytics/visualizations/`.

## Deliverables

- Main notebook: `notebooks/Week_6_Advanced_Financial_Analytics.ipynb`
- Five charts: `visualizations/`

## Interpretation

The analysis is descriptive and does not establish causation. Revenue growth is unavailable when the previous month's revenue is missing or zero. Financial formulas are checked within one cent, and source records are not silently removed, imputed, or recalculated in place.
