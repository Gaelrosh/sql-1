-- Calculate total and average quantity sold per order
-- Include total and average sales amount 

SELECT 
    s.order_id,
    SUM(s.quantity) AS total_quantity_sold,
    ROUND(AVG(s.quantity), 2) AS avg_quantity_per_order,
    SUM(s.quantity * i.price) AS total_sales_amount,
    ROUND(AVG(s.quantity * i.price), 2) AS avg_sales_amount_per_order
FROM sales s
JOIN inventories i
    ON s.product_id = i.product_id
GROUP BY s.order_id;