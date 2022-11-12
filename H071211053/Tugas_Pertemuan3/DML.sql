USE classicmodels;

SELECT * FROM employees;

-- NO 1 :
INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
VALUES (0030,'Zenin','Maki','x1111','makizenin@classicmodels.com','2',1002,'student'),
(0022,'Bagaskara','Aditya','x2222','aditya.erlangga0206@classicmodels.com','2',1002,'student'),
(0023,'De Vill', 'Estella', 'x3333','estdevill@classicmodels.com','3',1102,'student');
DESC employees;
-- NO 2 :
SELECT * FROM offices;

INSERT INTO offices -- (officeCode, city, phone, addressLine1, addressLine2, state, country, postalCode, territory)
VALUES ('8','Makassar','+62 11444 7121','Abdul Kadir Street','Blok 1Y/27','Makassar','Indonesia','90224','INA');

SELECT * FROM employees;
UPDATE employees
SET officeCode = '8'
WHERE officeCode = '4' AND jobTitle = 'Sales Rep';

-- NO 3 :
SELECT * FROM payments where amount < 10000.00;
DELETE FROM payments WHERE amount < 10000.00;
SELECT * FROM payments;