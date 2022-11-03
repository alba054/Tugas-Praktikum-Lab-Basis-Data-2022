-- USE classicmodels;
-- 
-- -- Nomor 1 -- 
-- INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
-- VALUES
-- (1003, 'Akbar', 'Khaibar', 'x1234', 'Khaibar@classicmodelcars.com', '4', 1003, 'Sales Rep'),
-- (1004, 'Hidayah', 'Ihsan', 'x6754', 'Hidayah@classicmodelcars.com', '7', 1004, 'Sales Rep'),
-- (1005, 'Nugraha', 'Rama', 'x1344', 'Rama@classicmodelcars.com', '2', 1005, 'Sales Rep');
 
-- -- Nomor 2 -- 
-- SELECT * FROM offices;
-- INSERT INTO offices
-- VALUES ('8', 'Makassar', '+6284124122122', 'Takalar', NULL, 'South Sulawesi', 'Indonesia', '90221', 'ID');

-- UPDATE employees
-- SET officeCode = 8
-- WHERE officeCode = 4 AND jobTitle = 'Sales Rep';

-- -- Nomor 3 --  
-- SELECT * FROM payments WHERE amount < 10000;
-- DELETE FROM payments WHERE amount < 10000;
-- SELECT * FROM payments