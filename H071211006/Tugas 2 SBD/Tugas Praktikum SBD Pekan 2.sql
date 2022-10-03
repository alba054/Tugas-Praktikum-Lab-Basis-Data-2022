SELECT * FROM offices WHERE city='san francisco'; -- Nomor 1
SELECT * FROM orderdetails WHERE quantityOrdered > 70 ORDER BY orderLineNumber; -- Nomor 2
SELECT DISTINCT productLine FROM products; -- Nomor 3
SELECT customerNumber AS nomorCustomer, customerName AS namaCustomer FROM customers WHERE customerNumber BETWEEN 100 AND 150; -- Nomor 4
SELECT * FROM customers WHERE country <> 'USA' AND creditLimit= 0.0 ORDER BY customerName LIMIT 10,10; -- Nomor 5