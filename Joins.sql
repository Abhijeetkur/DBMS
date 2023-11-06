CREATE DATABASE PRAC;
USE prac;
CREATE TABLE Employee (
	id int PRIMARY KEY,
    fname VARCHAR(25),
    lname VARCHAR(25),
    age INT,
    email VARCHAR(255),
    phoneno int,
    city VARCHAR(255)
    );

INSERT INTO Employee (id, fname, lname, age, email, phoneno, city) VALUES
					(1, 'Aman', 'Proto', 32, 'aman@gmail.com', 898, 'DELHI'),
                    (2, 'Yagya', 'Narayan', 44, 'yagya@gamil.com', 222, 'Palam'),
                    (3, 'Rahul', 'BD', 22, 'Rahul@gmail.com', 444, 'Kolkata'),
                    (4, 'Jatin', 'Hermit', 31, 'jatin@gmail.com', 666, 'Raipur'),
                    (5, 'PK', 'Pandey', 21, 'pk@gmail.com', 555, 'Jaipur');

CREATE TABLE PROJECT (
					id INT PRIMARY KEY,
                    emp_id int,
					name VARCHAR(25),
                    start_date DATE,
                    client_id INT,
					FOREIGN KEY (emp_id) REFERENCES Employee(id)
                    );

INSERT INTO Project(id, emp_id, name, start_date, client_id) VALUES
					(1, 1, 'A', '2021-04-21', 3),
                    (2, 2, 'B', '2021-03-12', 1),
                    (3, 3, 'C', '2021-01-16', 5),
                    (4, 3, 'D', '2021-04-27', 2),
                    (5, 5, 'E', '2021-05-01', 4);

CREATE TABLE CLIENT (
					id INT,
                    first_name VARCHAR(25),
                    last_name VARCHAR(25),
                    age INT,
                    email_ID VARCHAR(25),
                    Phone_No INT,
                    City VARCHAR(25),
                    emp_id INT,
                    FOREIGN KEY (emp_id) REFERENCES Employee(id)
                    );

INSERT INTO CLIENT (id, first_name, last_name, age, email_ID, Phone_No, City, emp_id) VALUES
					(1, 'Mac', 'Rogers', 47, 'mac@gmail.com', 333, 'Kolkata', 3),
                    (2, 'Max', 'Poirier', 27, 'max@gmail.com', 222, 'Kolkata', 3),
                    (3, 'Peter', 'Jain', 24, 'peter@gmail.com', 111, 'Delhi', 1),
                    (4, 'Sushant', 'Aggarwal', 23, 'sushant@gmail.com',45454, 'Hyderabad', 5),
                    (5, 'Pratap', 'Singh', 36, 'p@gmail.com', 77767, 'Mumbai', 2);
                    
                    
-- INNER JOIN
-- Enlist all the employees ID's, names along with the Projects allocated to them
SELECT e.id, e.fname, e.lname, p.id, p.name FROM Employee as e
INNER JOIN Project as p ON e.id = p.emp_id;

-- Fetch out all the employee ID's and their contact detail who have been working 
-- from jaipur with the client name working in Hyderabad
SELECT e.id, e.email, e.phoneno, c.first_name, c.last_name FROM Employee as e
INNER JOIN CLIENT as c ON e.id = c.emp_id;

-- LEFT JOIN
-- Fetch out each project allocated to each employee
SELECT e.id, e.fname, e.lname, p.id, p.name FROM employee as e
LEFT JOIN Project as p ON e.id = p.emp_id; 

-- RIGHT JOIN
-- List out all the projects along with the employee's name and their respective allocated email id	
SELECT p.id, p.name, e.fname, e.lname, e.email FROM Employee as e
RIGHT JOIN Project as p ON e.id = p.emp_id;

-- CROSS JOIN 
-- List out all the combinations possible for the employee's name and projects that can exist.
SELECT e.fname, e.lname, p.id, p.name FROM Employee as e
CROSS JOIN Project as p;

-- JOIN WITHOUT USING JOIN KEYWORD
-- JUST REMOVE JOIN KEYWORD AND WRITE WHERE AT THE PLACE OF ON
SELECT e.id, e.fname, e.lname, p.id, p.name FROM Employee as e,
Project as p WHERE e.id = p.emp_id;