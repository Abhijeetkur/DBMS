CREATE DATABASE temp1;
USE temp1;
CREATE TABLE dept1 (
			emp_id INT,
            name VARCHAR(25),
            role VARCHAR(25)
            );

INSERT INTO dept1(emp_id, name, role) VALUES
				 (1, 'A', 'engineer'),
                 (2, 'B', 'salesman'),
                 (3, 'C', 'manager'),
                 (4, 'D', 'salesman'),
                 (5, 'E', 'engineer');
CREATE TABLE dept2 (
			emp_id INT,
            name VARCHAR(25),
            role VARCHAR(25)
            );
INSERT INTO dept2(emp_id, name, role) VALUES
                 (3, 'C', 'manager'),
                 (6, 'F', 'marketing'),
                 (7, 'G', 'salesman');
                 
-- SET OPERATIONS

-- List out all the employees int the company
SELECT * FROM dept1
UNION
SELECT * FROM dept2;

-- List out all the employees in all departments who work as salesman
SELECT * FROM dept1 WHERE role = 'salesman'
UNION
SELECT * FROM dept2 WHERE role = 'salesman';

-- List out all the employees who work for both the departments
SELECT dept1.* FROM dept1 INNER JOIN dept2 using(emp_id);

-- List all the employees working in dept1 but not in dept2
-- MINUS
SELECT dept1.* from dept1 LEFT JOIN dept2 using(emp_id)
WHERE dept2.emp_id is null;