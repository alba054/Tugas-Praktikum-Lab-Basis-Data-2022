SELECT * FROM offices WHERE city='San Francisco';

SELECT * FROM orderDetails WHERE quantityOrdered > 70 ORDER BY orderLineNumber;

SELECT DISTINCT productLine FROM products;

SELECT customerNumber AS 'Nomor Pelanggan' ,customerName AS 'Nama Pelanggan' FROM customers WHERE customerNumber >= 100 AND customerNumber <= 150;

SELECT * FROM customers WHERE country != 'USA' AND creditLimit = 0 ORDER BY customerName LIMIT 10 , 10;