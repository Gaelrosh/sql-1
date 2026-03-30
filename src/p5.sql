-- Average salary per department
SELECT 
    department,
    ROUND(AVG(salary), 2) AS avg_salary
FROM employees
GROUP BY department;

-- Highest salary and employee(s) per department (Bonus)
SELECT 
    e.department,
    e.name,
    e.salary AS highest_salary
FROM employees e
JOIN (
    SELECT 
        department,
        MAX(salary) AS max_salary
    FROM employees
    GROUP BY department
) max_table
ON e.department = max_table.department
AND e.salary = max_table.max_salary;