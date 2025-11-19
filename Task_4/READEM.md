# Task 4: Dashboard Design - Adidas Sales Analysis

## Objective
To design an interactive Power BI dashboard that analyzes Adidas sales data to identify profitable regions, product categories, and sales channels.

## Tool Used
**Power BI , Microsoft office 365**

## Dataset
**Adidas Sales Dataset** containing details on Retailers, Products, Price, Units Sold, and Profitability across US regions.

## Dashboard Insights & Features
The dashboard provides a 360-degree view of sales performance:
1.  **Executive KPIs:** Real-time tracking of Total Revenue, Operating Profit, and Margins.
2.  **Regional Heatmap:** A geographic view identifying high-revenue States and Cities.
3.  **Product Performance:** A deep dive into Men's vs. Women's Apparel and Footwear trends.
4.  **Channel Strategy:** Analysis of "In-store" vs. "Online" vs. "Outlet" profitability, revealing that Online sales offer superior margins.
5.  **Interactivity:** Dynamic slicers for Region, Retailer, and Date allow for granular performance reviews.

## Data Engineering
- **Date Table:** Created a dedicated date hierarchy for accurate time-series analysis.
- **DAX Measures:** Calculated weighted `Profit Margin %` and `Average Price` to ensure accuracy at aggregate levels (avoiding averages of averages).

## Deliverables
- **`Adidas_Sales_Dashboard.pbix`**: The source Power BI file.
- **`Dashboard_Screenshot.png`**: A static view of the final report.
- **`Adidas_Sales_Summary.pptx`**: A power point presentation of the findings (Generated with the help of Gamma).
