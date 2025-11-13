# Task 1: Data Cleaning - Netflix Dataset

## Objective
To clean and preprocess the raw Netflix Movies & TV Shows dataset to make it ready for analysis.

## Changes Made
1. **Handling Missing Values:**
   - Imputed 'Unknown' for missing `director` and `cast` columns to preserve data volume.
   - Imputed 'Not Given' for missing `country` values.
   - Dropped a small number of rows (approx 10) where `date_added` was null, as time-based analysis is impossible without it.
   
2. **Duplicate Removal:**
   - Verified uniqueness of `show_id`. Removed any duplicate records to ensure data integrity.

3. **Data Formatting:**
   - Converted `date_added` from string format to standard ISO 8601 DateTime objects.
   - Standardized all column headers to lowercase snake_case for consistency.

4. **Tools Used:**
   - Python (Pandas Library)
