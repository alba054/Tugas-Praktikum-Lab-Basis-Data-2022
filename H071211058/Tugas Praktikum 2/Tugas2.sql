USE classicmodels;

-- nomor 1 --
SELECT * FROM offices WHERE city='San Francisco'

-- nomor 2 --
SELECT * FROM orderDetails WHERE quantityOrdered > 70 ORDER BY orderLineNumber

-- nomor 3 --
SELECT DISTINCT productLine FROM products

-- nomor 4 --
SELECT customerNumber as `Nomor Customer`, customerName as `Nama Customer` FROM customers WHERE customerNumber > 100 and customerNumber < 150

-- nomor 5 --
SELECT * FROM customers WHERE country!="USA" and creditLimit = 0 ORDER BY customerName ASC Limit 10,10