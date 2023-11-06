CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;
CREATE TABLE Worker ( 
		Worker_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        FIRST_NAME VARCHAR(25),
        LAST_NAME VARCHAR(25),
        SALARY INT(15),
        JOINING_DATE DATETIME,
        DEPARTMENT VARCHAR(25)
        );
        
INSERT INTO Worker 
		(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
			 (001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
			 (002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
			 (003, 'Vishal', 'Sighal', 300000, '14-02-20 09.00.00', 'HR'),
			 (004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
			 (005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
			 (006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
			 (007, 'Satish', 'Kumar', 7500, '14-04-11 09.00.00', 'Account'),
			 (008, 'Geetika', 'Chauhan', 9000, '14-04-11 09.00.00', 'Admin');
SELECT * FROM Worker;

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
    BONUS_AMOUNT INT(10),
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
        (002, 3000, '16-08-11'),
        (003, 4000, '16-02-20'),
        (001, 4500, '16-02-20'),
        (002, 3500, '16-06-11');

CREATE TABLE Title
	(WORKER_REF_ID INT,
    WORKER_TITLE VARCHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE);
        
INSERT INTO Title
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
    (001, 'Manager', '2016-02-20 00.00.00'),
    (002, 'Executive', '2016-06-11 00.00.00'),
    (008, 'Executive', '2016-06-11 00.00.00'),
    (005, 'Manger', '2016-06-11 00.00.00'),
    (004, 'Ass. Manager', '2016-06-11 00.00.00'),
    (007, 'Executive', '2016-06-11 00.00.00'),
    (006, 'Lead', '2016-06-11 00.00.00'),
    (003, 'Lead', '2016-06-11 00.00.00');
    
SELECT * FROM Title
SELECT SALARY FROM Worker
SELECT FIRST_NAME, SALARY FROM Worker
-- Dual Table: Dual tables are dummy tables created by MySQL, help users to do certain obvious actions without referring to user defined tables.
SELECT 55 + 11;
SELECT now(); -- Gives current time
SELECT lcase("ABHIJEET"); -- convert upper case into lower case
SELECT ucase("abhijeet"); -- convert lower case into upper case
SELECT * FROM Worker WHERE SALARY > 80000;
SELECT * FROM Worker WHERE DEPARTMENT = "HR";
SELECT * FROM Worker WHERE SALARY BETWEEN 80000 AND 100000;
SELECT * FROM Worker WHERE DEPARTMENT = "HR" OR DEPARTMENT = "Admin";

-- Better way is using IN. It reduces OR statement
SELECT * FROM Worker WHERE DEPARTMENT IN('HR', 'Account');

SELECT * FROM Worker WHERE DEPARTMENT NOT IN('HR', 'Account');

INSERT INTO Worker VALUE (009, 'Monika', 'Arora', 100000, null, 'HR');
SELECT * FROM Worker WHERE Joining_Date is NULL;

-- Wildcard
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%O%';
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%i_%';

-- Sorting using ORDER BY Default ASC
SELECT * FROM worker ORDER BY salary;
-- In DESC
SELECT * FROM Worker ORDER BY salary DESC;

-- DISTINCT 
SELECT DISTINCT department FROM Worker;

-- Group by
SELECT department, COUNT(*) FROM Worker GROUP BY department;
SELECT department, SUM(salary) FROM Worker GROUP BY department;
SELECT department, AVG(salary) FROM Worker GROUP BY department;
SELECT department, MAX(salary) FROM Worker GROUP BY department;
SELECT 
    department, MIN(salary)
FROM
    Worker
GROUP BY department;

-- HAVING
SELECT department, COUNT(department) FROM Worker GROUP BY department HAVING COUNT(department) > 1 ORDER BY COUNT(department) ASC;






