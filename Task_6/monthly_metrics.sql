SELECT 
    -- Extract Year and Month as requested 
    EXTRACT(YEAR FROM order_date) AS sales_year,
    EXTRACT(MONTH FROM order_date) AS sales_month,
    
    -- Calculate Total Revenue 
    TO_CHAR(SUM(amount), 'FM9,999,999.00') AS total_revenue, 
    
    -- Calculate Order Volume (Unique orders, not just items) 
    COUNT(DISTINCT order_id) AS total_orders
    
FROM online_sales
GROUP BY 1, 2  -- Group by Year (1) and Month (2) 
ORDER BY 1, 2; -- Sort Chronologically