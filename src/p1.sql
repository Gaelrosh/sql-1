-- p1.sql
-- Problem 1: Table Creation (DDL) + Dummy Data
-- Dialect: MySQL / MariaDB

-- Notes:
-- - Added PRIMARY KEY constraint on id
-- - Added NOT NULL constraints for core fields
-- - Used VARCHAR instead of TEXT for better practical table design in MySQL
-- - Used DECIMAL for salary to store money-like values safely

DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS inventories;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE customers (
    customer_id INT NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    PRIMARY KEY (customer_id)
);

CREATE TABLE orders (
    order_id INT NOT NULL,
    order_date DATE NOT NULL,
    customer_id INT NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (order_id),

    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE inventories (
    product_id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (product_id)
);

CREATE TABLE sales (
    order_id INT NOT NULL,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    sale_date DATE NOT NULL,

    PRIMARY KEY (order_id, product_id),

    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES inventories(product_id)
);

INSERT INTO employees (id, name, position, department, salary) VALUES
(1, 'Alice Tan', 'Software Engineer', 'IT', 6000.00),
(2, 'Bob Lim', 'Data Analyst', 'IT', 5500.00),
(3, 'Charlie Ng', 'HR Manager', 'HR', 7000.00),
(4, 'Diana Lee', 'Accountant', 'Finance', 5000.00),
(5, 'Ethan Wong', 'Software Engineer', 'IT', 6200.00),
(6, 'Fiona Goh', 'Marketing Executive', 'Marketing', 4800.00),
(7, 'George Tan', 'Finance Manager', 'Finance', 7500.00),
(8, 'Hannah Koh', 'HR Executive', 'HR', 4500.00);

INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Ahmad Rizal', 'Kuala Lumpur'),
(2, 'Siti Aisyah', 'Shah Alam'),
(3, 'Jason Ong', 'Johor Bahru'),
(4, 'Nurul Huda', 'Penang'),
(5, 'Daniel Lee', 'Ipoh');

INSERT INTO orders (order_id, order_date, customer_id, total_amount) VALUES
(101, '2024-01-10', 1, 2500.00),
(102, '2024-01-12', 2, 1800.00),
(103, '2024-01-15', 3, 3200.00),
(104, '2024-01-18', 4, 900.00),
(105, '2024-01-20', 5, 1500.00);

INSERT INTO inventories (product_id, product_name, quantity, price) VALUES
(201, 'Laptop', 10, 2500.00),
(202, 'Mouse', 50, 50.00),
(203, 'Keyboard', 40, 120.00),
(204, 'Monitor', 20, 900.00),
(205, 'Printer', 15, 1500.00);

INSERT INTO sales (order_id, customer_id, product_id, quantity, sale_date) VALUES
(101, 1, 201, 1, '2024-01-10'),
(102, 2, 204, 2, '2024-01-12'),
(103, 3, 205, 2, '2024-01-15'),
(104, 4, 203, 3, '2024-01-18'),
(105, 5, 202, 10, '2024-01-20');

SELECT * FROM employees;
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM inventories;
SELECT * FROM sales;