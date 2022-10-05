-- USE classicmodels;

-- NOMOR 1
-- INSERT INTO employees (employeeNumber, firstName, lastName, extension, email, officeCode, reportsTo, jobTitle)
-- VALUE ("1212", "Nur", "Hikmah", "x1212", "hikmahnurrrrr@gmail.com", "1", "1102", "Sales Rep"),
-- ("1213", "Febriana", "Putri", "x101", "bianafeb@gmail.com", "1", "1102", "Sales Rep"),
-- ("1214", "Zatriani", "Adzkiya", "x1212", "zatzet@gmail.com", "2", "1102", "Sales Rep");

-- NOMOR 2
-- bikin office baru
-- INSERT INTO offices (officeCode, city, phone, addressLine1, addressLine2, country, postalCode, territory)
-- VALUE ("8", "London", "+44 20 7877 2091", "20 Old Broad Street", "Level 5", "UK", "EC2N 1HN", "EMEA");

-- UPDATE employees
-- SET officeCode= "8"
-- WHERE officeCode = "4" AND jobTitle = "sales rep";
-- 
-- 