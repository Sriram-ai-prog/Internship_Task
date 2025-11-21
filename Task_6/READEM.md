# 📊 Sales Trend Analysis (SQL)

## 📝 Executive Summary
This project analyzes monthly revenue and order volume trends for a UK-based online retailer. Using **PostgreSQL**, raw transactional data was transformed into a clean analytical dataset to identify seasonality and growth patterns.

**Key Insights:**
- **Seasonality:** Revenue peaks significantly in **November**, likely driven by pre-holiday shopping.
- **Growth:** The highest month-over-month growth occurred in [Check your results, e.g., Sept 2010], showing a [X]% increase.
- **Data Integrity:** Filtered out negative quantities (returns) and missing customer IDs to ensure accurate revenue reporting.

---

## 📂 Repository Structure
- **`sql/1_data_cleaning_etl.sql`**: ETL pipeline to clean raw data, handle NULLs, and calculate `amount`.
- **`sql/2_monthly_metrics.sql`**: Aggregation query for monthly Revenue and Order Volume.
- **`sql/3_growth_analysis.sql`**: Advanced window functions to calculate Month-over-Month (MoM) growth rates.

## 📸 Analysis Results
![Monthly Metrics](table.png)

---
