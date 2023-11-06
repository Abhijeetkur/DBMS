CREATE DATABASE temp;

USE temp;

CREATE TABLE Customer (
	id integer PRIMARY KEY,
	cname varchar(25),
	Address varchar(225),
	Gender char(1),
	City varchar(225),
	Pincode integer 
);

INSERT INTO Customer(id, cname, Address, Gender, City, Pincode) VALUES
					(1251, 'Ram Kumar', 'Dilbagh Nagar', 'M', 'Jalandhar', 144002),
                    (1300, 'Shayam Singh', 'Ludhiana H.O', 'M', 'Ludhiana', 1411001),
                    (245, 'Neelabh Shukla', 'Ashok Nagar', 'M', 'Jalandhar', 144003),
                    (210, 'Barkha Singh', 'Dilbagh Nagar', 'F', 'Jalandhar', 144002),
                    (500, 'Rohan Arora', 'Ludhiana H.O', 'M', 'Ludhiana', 141001);

CREATE TABLE Oder_Details (
			Order_id integer PRIMARY KEY,
            delivery_date DATE,
            cust_id int,
            FOREIGN KEY (cust_id) REFERENCES Customer(id)
            );

CREATE TABLE Account(
			id int PRIMARY KEY,
			name varchar(25) UNIQUE,
            balance INT,
            CONSTRAINT acc_balance_check CHECK(balance > 1000)
            );

INSERT INTO Account (id, name, balance) VALUES
					(1, 'A', 19939);
                    
INSERT INTO Account (id, name, balance) VALUES
					(2, 'B', 2000);
                    
-- ADD new column
ALTER TABLE account ADD interest DOUBLE NOT NULL DEFAULT 0;

-- MODIFY 
ALTER TABLE account MODIFY interest FLOAT NOT NULL DEFAULT 0;
-- Use --> DESC TABLE_NAME to describe table

-- RENAME COLUMN
ALTER TABLE Account CHANGE COLUMN interest saving_interest FLOAT NOT NULL DEFAULT 0;

-- DROP COLUMN
ALTER TABLE Account DROP COLUMN saving_interest;

-- Rename table
ALTER TABLE Account RENAME TO Account_details;

-- Data Manipulation Language(DML)
-- INSERT --> We have used it above

UPDATE Customer SET Address = 'Mumbai', Gender = 'M' WHERE id = 210;

-- UPDATE MULTIPLE ROWS
SET SQL_SAFE_UPDATES = 0;
UPDATE Customer SET Pincode = Pincode + 1;
select * from customer;