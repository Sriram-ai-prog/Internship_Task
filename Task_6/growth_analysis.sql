WITH monthly_data AS (
    SELECT 
        DATE_TRUNC('month', order_date) AS month_start,
        SUM(amount) AS revenue,
        COUNT(DISTINCT order_id) AS order_volume
    FROM online_sales
    GROUP BY 1
)
SELECT 
    TO_CHAR(month_start, 'Mon YYYY') AS "Month", 
    TO_CHAR(revenue, 'FM9,999,999.00') AS "Total Revenue", 
    order_volume AS "Order Volume", 
    
   
    COALESCE(
        ROUND((revenue - LAG(revenue) OVER (ORDER BY month_start)) / 
        NULLIF(LAG(revenue) OVER (ORDER BY month_start), 0) * 100, 2), 
    0) || '%' AS "Growth Rate"
FROM monthly_data
ORDER BY month_start;