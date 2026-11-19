# CS Vision Financial & Operational Analytics Internship

An eight-week portfolio of financial and operational analysis completed for the CS Vision Financial & Operational Analytics Internship.

## Internship

- **Organization:** CS Vision
- **Program:** Financial & Operational Analytics Internship Program
- **Student:** Manthan Parmar
- **Project:** Financial & Operational Performance Analytics System
- **Duration:** 8 weeks

## Objectives

- Clean and validate a retail financial dataset.
- Explore performance over time and by product, category, region, and customer segment.
- Calculate profitability and business KPIs.
- Demonstrate SQL-based database design, validation, and analysis.
- Communicate findings using reports, visualizations, and Power BI dashboards.

## Technologies

Python, pandas, NumPy, Matplotlib, Seaborn, Jupyter, SQLite, MySQL-compatible SQL, and Microsoft Power BI. Python dependencies are listed in [`requirements.txt`](requirements.txt).

## Dataset

The project contains the original raw CSV, two existing cleaned/date-normalized CSV variants, and analysis outputs. The principal cleaned dataset has 850 transactions and 19 columns, including transaction date and ID, revenue, cost, operating expense, gross and net profit, product, category, customer segment, region, quantity, and order status.

The raw dataset is retained unchanged. Derived analysis outputs and the Week 8 validation results are kept separately from the source datasets. The supplied source does not identify a currency; monetary amounts should not be attributed to a specific currency without external confirmation.

## Workflow

1. Profile and preprocess the raw data (Week 1).
2. Explore financial patterns and distributions (Week 2).
3. Calculate financial KPIs and profitability measures (Week 3).
4. Build a Power BI dashboard (Week 4).
5. Create SQL schema, validation queries, and financial analyses (Week 5).
6. Perform advanced Python analysis and export charts and tables (Week 6).
7. Deliver the final Power BI dashboard and reporting (Week 7).
8. Validate the final dataset and dashboard deliverables (Week 8).

## Repository structure

```text
CS Vision/
├── data/
│   ├── raw/
│   ├── cleaned/
│   ├── derived/week6/
│   └── validation/week8/
├── notebooks/
│   ├── week1_preprocessing/
│   ├── week2_eda/
│   ├── week3_kpi_analysis/
│   ├── week6_advanced_analysis/
│   └── week8_validation/
├── sql/
│   ├── 01_create_database.sql
│   ├── 02_import_and_validate.sql
│   ├── 03_financial_analysis_queries.sql
│   └── database/
├── scripts/
├── dashboard/
│   ├── archive/
│   └── screenshots/
├── reports/
│   ├── week1/ ... week8/
├── visualizations/
│   ├── week2/
│   ├── week3/
│   └── week6/
├── needs_review/
├── requirements.txt
└── README.md
```

`needs_review/` holds an exact duplicate SQL file and two artifacts that cover both Weeks 2 and 3, so they are retained without assigning them to a single week. The two internship source PDFs are kept locally in `docs/internship_overview/` and are excluded from Git because one contains personal information. A local `.venv/`, if present, is also ignored and is not part of the portfolio deliverables.

## Weekly work overview

| Week | Focus | Main materials |
|---|---|---|
| 1 | Data collection and preprocessing | Raw and cleaned CSVs, preprocessing notebook, date-fixing script, and report |
| 2 | Exploratory data analysis | EDA notebook, report, and 14 charts |
| 3 | KPI and profitability analysis | KPI notebook, report, and 10 charts |
| 4 | Dashboard visualization | Earlier Power BI dashboard and internship report |
| 5 | SQL financial data management | SQL scripts, SQLite database, validation, documentation, and business insights |
| 6 | Advanced Python analytics | Analysis notebook, derived CSVs, report, and visualizations |
| 7 | Power BI dashboard and data storytelling | Final dashboard, screenshot, and report |
| 8 | Final project and validation | Final internship report, validation notebook, results, and validation report |

## Run the Python notebooks

From the repository root, install the listed dependencies and launch Jupyter:

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install -r requirements.txt
jupyter lab
```

Open a notebook under `notebooks/` and run its cells from top to bottom. The Week 2, 3, 6, and 8 notebooks use the shared data paths in this repository. Week 1 reads the raw CSV and writes the cleaned CSV; only run it when you intend to regenerate that output.

## SQL database setup

The SQL scripts target MySQL. Review `sql/01_create_database.sql` before running: it starts with `DROP DATABASE IF EXISTS financial_analytics_db`, which removes an existing database of that name. Back up any database you need to keep.

Create the schema, then import the cleaned CSV into `financial_transactions` using MySQL Workbench's import tools or another configured CSV loader. `sql/02_import_and_validate.sql` checks row count, date range, and sample rows; it does **not** load the CSV itself. Run `sql/03_financial_analysis_queries.sql` for the analysis queries. A local SQLite database is included as a separate validation artifact; the MySQL scripts have not been verified against a live MySQL server in this project environment.

## Power BI dashboard

Open `dashboard/PowerBI_Dashboard.pbix` in Power BI Desktop. The Week 4 dashboard is retained under `dashboard/archive/`. If Power BI prompts for a missing data source, reconnect it to the cleaned dataset and refresh before interpreting visuals. The available exported image is in `dashboard/screenshots/`.

## Data validation

The Week 5 SQL validation report documents an 850-row import, no missing values, no duplicate transaction IDs, and matching source/database financial totals in the local SQLite validation. The Week 8 validation notebook and report provide additional checks; its CSV results are under `data/validation/week8/`. MySQL server execution was not available during the project.

## Assumptions and limitations

- The dataset includes multiple order statuses. Financial amounts for Cancelled, Returned, Pending, or Unknown statuses are retained as supplied and are not necessarily realized sales.
- The source currency is unspecified. Confirm accounting definitions and currency before using reported amounts externally.
- The reported financial relationships are `Gross_Profit = Revenue - Cost` and `Net_Profit = Gross_Profit - Operating_Expense`; confirm these definitions for any downstream use.
- Reports describe a single-year dataset and use different stated date ranges in places. Reconcile the date coverage against the CSVs before making time-period comparisons; one year alone does not establish recurring seasonality.
- Findings are descriptive and do not establish causation. Outliers and Unknown labels are not treated as proof of error.
- The included MySQL scripts are prepared for execution but were not run against a live MySQL server.