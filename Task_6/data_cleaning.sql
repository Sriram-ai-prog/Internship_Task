-- DROP the table if it exists so we can rerun this block safely
DROP TABLE IF EXISTS online_sales;

-- CREATE the Optimized Analysis Table
CREATE TABLE online_sales AS
SELECT 
    -- 1. Handle Date Extraction properly
    CAST(invoice_date AS DATE) as order_date,
    
    -- 2. Create the Required Columns
    invoice_no AS order_id,
    stock_code AS product_id,
    
    -- 3. The "New Column Creation" (Revenue Calculation)
    (quantity * unit_price) AS amount
    
FROM raw_retail_data
WHERE 
    quantity > 0       -- Filter out returns/cancellations
    AND unit_price > 0 -- Filter out system errors
    AND customer_id IS NOT NULL; -- Clean up anonymous transactions 

-- VALIDATION: Check the first 5 rows
SELECT * FROM online_sales LIMIT 5;