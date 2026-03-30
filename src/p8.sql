-- Create index to improve query performance
CREATE INDEX idx_department_salary 
ON employees (department, salary);

-- The query retrieves employees from the sales department with salary greater than 50,000.
-- Creating an index on (department, salary) allows the database to quickly filter by department
-- and then by salary, improving performance and reducing full table scans.
-- However, the index requires additional storage space and may slow down insert, update
-- and delete operations because the index also needs to be maintained.