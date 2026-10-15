
# PLG & Feature Engagement Dashboard

## Project Overview

The PLG (Product-Led Growth) & Feature Engagement Dashboard is a data analytics project designed to analyze user activity, product feature usage, session behavior, and subscription revenue for a SaaS-style product.

The project uses Python for data inspection and cleaning, PostgreSQL for data storage and SQL analysis, and Power BI for interactive data visualization.

The goal is to turn raw product data into meaningful insights that can help understand user engagement and subscription performance.

## Business Objectives

- Analyze the total number of users and sessions.
- Understand recorded feature usage across product features.
- Track active users over time.
- Analyze average session duration and device usage.
- Compare monthly recurring revenue (MRR) across subscription plans.
- Examine subscription records marked as churned.
- Prepare an analytical dashboard for business decision-making.

## Technology Stack

- Python 3.11
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Jupyter Notebook
- PostgreSQL
- SQL
- Power BI Desktop
- Git and GitHub

## Dataset Description

The project uses four CSV files:

| File | Description |
|---|---|
| users.csv | User profiles, signup dates, plans, countries, industries, and acquisition channels |
| sessions.csv | Session records, user IDs, dates, session duration, and device types |
| feature_usage.csv | Feature names, recorded usage counts, user IDs, and dates |
| subscriptions.csv | Subscription dates, churn status, and monthly recurring revenue |

### Important Data Note

The dataset contains session records and recorded feature usage counts. It does not provide complete event-level clickstream data. Therefore, recorded feature usage should not be interpreted as an exact number of clicks.

Daily active users are calculated as distinct users with a session record on a given date.

## Project Structure

```text
PLG_Feature_Engagement_Dashboard/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── notebooks/
│   ├── 01_data_inspection.ipynb
│   └── 02_data_cleaning.ipynb
│
├── sql/
│   ├── 01_data_quality_checks.sql
│   ├── 02_daily_active_users.sql
│   ├── 03_feature_engagement.sql
│   ├── 04_session_analysis.sql
│   ├── 05_subscription_analysis.sql
│   └── 06_user_segmentation.sql
│
├── powerbi/
│   └── PLG_Dashboard.pbix
│
├── screenshots/
│   └── dashboard.png
│
├── requirements.txt
├── .gitignore
└── README.md
```

## Project Workflow

1. Inspect the raw CSV files using Pandas.
2. Identify missing values, duplicates, invalid values, and inconsistent categories.
3. Clean the data and export processed CSV files.
4. Import the cleaned data into PostgreSQL.
5. Perform data quality checks and analytical queries using SQL.
6. Connect PostgreSQL to Power BI.
7. Create KPI cards and charts for user engagement, feature usage, sessions, and subscriptions.
8. Validate metrics and prepare the dashboard for interactive analysis.

## Dashboard Features

The Power BI dashboard includes:

- Total Users
- Total Sessions
- Active Users
- Recorded Feature Usage
- Average Session Duration
- Total Monthly Recurring Revenue (MRR)
- Session distribution by device type
- Active users over time
- MRR by subscription plan
- Churned subscription records by plan
- Feature usage by feature name

## Key Metrics

| Metric | Definition |
|---|---|
| Total Users | Number of distinct user IDs |
| Total Sessions | Number of session records |
| Active Users | Distinct users with session records in the selected period |
| Recorded Feature Usage | Sum of available feature usage counts |
| Average Session Duration | Average of available session duration values |
| Total MRR | Sum of recorded MRR values |
| Churned Subscription Records | Number of subscription records marked as churned |

Churned subscription records are not the same as a churn rate. A churn rate requires a clearly defined denominator and time period.

## Python Environment Setup

### 1. Create a virtual environment

```powershell
py -3.11 -m venv .venv
```

### 2. Activate the environment

```powershell
.\.venv\Scripts\Activate.ps1
```

### 3. Install dependencies

```powershell
python -m pip install --upgrade pip
pip install -r requirements.txt
```

### 4. Launch Jupyter Notebook

```powershell
jupyter notebook
```

Open the notebooks inside the `notebooks/` folder.

## PostgreSQL Setup

1. Install PostgreSQL and open pgAdmin.
2. Create a database named `plg_analytics`.
3. Import the cleaned CSV files into the corresponding tables.
4. Run the SQL files in the `sql/` directory.
5. Verify table names, column names, relationships, and query results.

The imported table names and date column names should match the SQL scripts. Adjust queries if your schema differs.

## Power BI Setup

1. Open Power BI Desktop.
2. Connect to the PostgreSQL database `plg_analytics`.
3. Load the users, sessions, feature_usage, and subscriptions tables.
4. Verify the relationships between the tables.
5. Create KPI measures and analytical visuals.
6. Save the report as `powerbi/PLG_Dashboard.pbix`.

## Data Quality and Limitations

- Missing values may affect calculated metrics.
- Unknown device types or acquisition channels should be identified clearly.
- Blank plan categories should be investigated before interpreting revenue by plan.
- The churn column's values must be validated before calculating churn metrics.
- The source currency for MRR should be confirmed before assigning a currency symbol.
- Date parsing should be checked for ambiguous date formats.
- The dataset should not be treated as production customer data unless its provenance confirms that.

## Future Improvements

- Add slicers for plan type, country, acquisition channel, and date.
- Add feature adoption metrics based on distinct users per feature.
- Improve data validation and automated quality checks.
- Add a date dimension to Power BI.
- Add a documented, reproducible database import process.
- Publish a screenshot of the dashboard.
- Add verified business insights after validating the data.

## Author

Created as a data analytics portfolio project using Python, SQL, PostgreSQL, and Power BI.

If reusing the dataset, acknowledge the original source and follow its license and redistribution terms.
