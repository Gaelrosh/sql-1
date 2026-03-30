-- Delete a customer and all related records to maintain data integrity

DELETE FROM sales
WHERE customer_id = 3;

DELETE FROM orders
WHERE customer_id = 3;

DELETE FROM customers
WHERE customer_id = 3;