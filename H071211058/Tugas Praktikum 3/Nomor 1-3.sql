USE classicmodels;

-- Nomor 1 -- 
INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
VALUES
(1002, 'Hanny', 'Eka', 'x1234', 'ekahnny@classicmodelcars.com', '4', 1002, 'Sales Rep'),
(1076, 'Minji', 'Kim', 'x6754', 'minjiww@classicmodelcars.com', '7', 1076, 'Sales Rep'),
(1472, 'Unnisa', 'Dhiyaa', 'x1344', 'dhiyaa@classicmodelcars.com', '2', 1472, 'Sales Rep');

-- Nomor 2 -- 
SELECT * FROM offices;
INSERT INTO offices
VALUES ('8', 'Makassar', '+6289695453002', 'Alauddin', NULL, 'South Sulawesi', 'Indonesia', '90221', 'ID');

UPDATE employees
SET officeCode = 8
WHERE officeCode = 4 AND jobTitle = 'Sales Rep';

-- Nomor 3 --  
SELECT * FROM payments WHERE amount < 10000;
DELETE FROM payments WHERE amount < 10000;