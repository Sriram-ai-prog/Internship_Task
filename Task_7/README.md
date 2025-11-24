# 📊 Task 7: Sales Summary Automation using SQL & Python

## 📝 Overview
This project demonstrates the integration of **Database Management (SQL)** with **Data Analysis (Python)**. Instead of manually exporting data from a database tool, I built an automated pipeline that generates a database, executes SQL aggregations, and visualizes the results programmatically.

The goal was to simulate a real-world scenario where an analyst needs to pull raw data from a database and report on sales performance without switching tools.

## 🛠️ Tech Stack
* **Python:** Core programming language.
* **SQLite3:** For creating and managing the relational database.
* **Pandas:** For loading SQL query results into a structured DataFrame.
* **Matplotlib:** For generating the revenue visualization.

## 🔄 Workflow & Methodology

### 1. Database Engineering (ETL)
* **Connection:** Established a connection to a local SQLite database (`sales_data.db`).
* **Schema Design:** Created a relational table `sales` with columns for Transaction ID, Product, Quantity, Price, and Date.
* **Data Injection:** Programmatically inserted dummy transaction records to simulate a sales environment.

### 2. SQL Analysis
Executed SQL queries directly from Python to perform server-side aggregations:
* Calculated **Total Revenue** (`Quantity * Price`).
* Grouped data by **Product Category**.
* Sorted results to identify top-performing items.

### 3. Data Visualization
* Converted the raw SQL output into a **Pandas DataFrame** for easy manipulation.
* Generated a **Bar Chart** using Matplotlib to visually compare revenue across different products.
* Added data labels and formatting to make the chart presentation-ready.

## 📂 Deliverables
* **`task_7_sales_script.ipynb`**: The complete Jupyter Notebook containing the database setup and analysis code.
* **`sales_chart.png`**: The generated bar chart showing "Laptop" as the highest revenue driver.
