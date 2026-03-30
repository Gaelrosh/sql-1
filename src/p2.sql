-- Retrieve customer orders from New York
-- Include average total amount per customer

SELECT 
    c.customer_name,
    o.order_date,
    o.total_amount,
    ROUND(AVG(o.total_amount) OVER (PARTITION BY c.customer_id), 2) AS avg_total_per_customer
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE c.city = 'New York';