-- SUB QUERIES
USE prac;

-- WHERE clause prac database
-- Employees with age > 30
SELECT * FROM employee WHERE age in (SELECT age FROM employee where age > 30);

-- WHERE clause different table
-- emp details working on more than one project

SELECT * FROM employee WHERE id in (
SELECT emp_id FROM project group by emp_id having count(emp_id) > 1
);

-- Single value subquery
-- emp details having age > avg(age)
SELECT * FROM employee WHERE age > (SELECT avg(age) FROM employee);

-- FROM clause - derived tables
-- select max age person whose first name contains 'a'
SELECT max(age) from (SELECT * FROM employee WHERE fname LIKE '%a%') AS prac; 

-- Corelated subquery
-- find 3rd oldest employee

SELECT * FROM employee e1 WHERE 3 = (
							SELECT COUNT(e2.age) FROM employee e2 WHERE e2.age >= e1.age
                            );

-- VIEW 
SELECT * FROM Employee;

-- Creating a view
CREATE VIEW custom_view AS SELECT fname, age FROM Employee;

-- Viewing from view
SELECT * FROM custom_view;

-- Altering the view
ALTER VIEW custom_view AS SELECT fname, lname, age FROM Employee;