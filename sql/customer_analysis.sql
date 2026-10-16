
-- 1. Monthly sales performance
SELECT
    Month,
    ROUND(Sales_Line_Value, 2) AS Sales_Line_Value,
    Invoice_Count,
    Units_Sold,
    Unique_Customers,
    ROUND(Average_Order_Value, 2) AS Average_Order_Value
FROM monthly_sales_kpis
ORDER BY Month;


-- 2. Customer segment performance
SELECT
    Segment,
    Customers,
    ROUND(Customer_Percentage, 2) AS Customer_Percentage,
    ROUND(Median_Recency, 1) AS Median_Recency,
    ROUND(Median_Frequency, 1) AS Median_Frequency,
    ROUND(Median_Monetary, 2) AS Median_Monetary,
    ROUND(Average_Monetary, 2) AS Average_Monetary
FROM customer_segment_summary
ORDER BY Average_Monetary DESC;



-- 3. Top 10 Customers by Spending
SELECT
    "Customer ID",
    Recency,
    Frequency,
    ROUND(Monetary, 2) AS Monetary
FROM customer_rfm_segments
ORDER BY Monetary DESC
LIMIT 10;



-- 4. Rank customer segments by average monetary value
SELECT
    Segment,
    Customers,
    ROUND(Average_Monetary, 2) AS Average_Monetary,
    ROUND(Customer_Percentage, 2) AS Customer_Percentage,
    RANK() OVER (
        ORDER BY Average_Monetary DESC
    ) AS Segment_Rank
FROM customer_segment_summary
ORDER BY Segment_Rank;



-- 5. Month-over-month sales change
WITH monthly_comparison AS (
    SELECT
        Month,
        Sales_Line_Value,
        LAG(Sales_Line_Value) OVER (
            ORDER BY Month
        ) AS Previous_Month_Sales
    FROM monthly_sales_kpis
)
SELECT
    Month,
    ROUND(Sales_Line_Value, 2) AS Sales_Line_Value,
    ROUND(Previous_Month_Sales, 2) AS Previous_Month_Sales,
    ROUND(
        Sales_Line_Value - Previous_Month_Sales,
        2
    ) AS Sales_Change,
    ROUND(
        100.0 * (Sales_Line_Value - Previous_Month_Sales)
        / NULLIF(Previous_Month_Sales, 0),
        2
    ) AS Sales_Change_Percent
FROM monthly_comparison
ORDER BY Month;



-- 6. Customer recency classification
SELECT
    CASE
        WHEN Recency <= 30 THEN 'Recent (0-30 days)'
        WHEN Recency <= 90 THEN 'Fairly Recent (31-90 days)'
        WHEN Recency <= 180 THEN 'At Risk (91-180 days)'
        ELSE 'Dormant (Over 180 days)'
    END AS Recency_Group,
    COUNT(*) AS Customer_Count,
    ROUND(AVG(Recency), 1) AS Average_Recency,
    ROUND(AVG(Monetary), 2) AS Average_Monetary
FROM customer_rfm_segments
GROUP BY
    CASE
        WHEN Recency <= 30 THEN 'Recent (0-30 days)'
        WHEN Recency <= 90 THEN 'Fairly Recent (31-90 days)'
        WHEN Recency <= 180 THEN 'At Risk (91-180 days)'
        ELSE 'Dormant (Over 180 days)'
    END
ORDER BY Average_Recency;



-- 7. High-value, frequent customers
SELECT
    "Customer ID",
    Recency,
    Frequency,
    ROUND(Monetary, 2) AS Monetary
FROM customer_rfm_segments
WHERE Monetary >= 5000
  AND Frequency >= 10
ORDER BY Monetary DESC;



-- 8. Segment contribution to total customer monetary value
WITH segment_values AS (
    SELECT
        Segment,
        COUNT(*) AS Customers,
        SUM(Monetary) AS Total_Monetary
    FROM customer_rfm_segments
    GROUP BY Segment
)
SELECT
    Segment,
    Customers,
    ROUND(Total_Monetary, 2) AS Total_Monetary,
    ROUND(
        100.0 * Total_Monetary
        / SUM(Total_Monetary) OVER (),
        2
    ) AS Monetary_Share_Percent
FROM segment_values
ORDER BY Total_Monetary DESC;
