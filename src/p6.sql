-- Employees with salary > 50,000
SELECT 
    name,
    position
FROM employees
WHERE salary > 50000;

-- Top 3 highest-paid employees (Bonus)
SELECT 
    name,
    position,
    salary
FROM employees
ORDER BY salary DESC
LIMIT 3;