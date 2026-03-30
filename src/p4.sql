-- Update specific product price
UPDATE inventories
SET price = 3000.00
WHERE product_id = 201;

-- Increase all product prices by 10% (Bonus)
UPDATE inventories
SET price = price * 1.10;