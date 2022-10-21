-- nomor 1
SELECT c.customerNumber, c.customerName, c.creditLimit, o.status, o.comments FROM customers as c
INNER JOIN orders as o
ON  c.customerNumber = o.customerNumber
WHERE o.status = 'on hold' And o.comments LIKE '%credit limit%';

-- nomor 2
SELECT c.customerName, o.status, o.comments FROM customers as c
INNER JOIN orders as o
ON  c.customerNumber = o.customerNumber
WHERE o.comments LIKE '%DHL%';

-- nomor 3
SELECT c.customerName, p.productName , o.`status`, o.orderDate FROM customers as c
INNER JOIN orders as o
ON  c.customerNumber = o.customerNumber
INNER JOIN orderdetails as od
ON o.orderNumber = od.orderNumber
INNER JOIN products as p
ON od.productCode = p.productCode
WHERE  p.productName LIKE '%Ferrari%' ORDER BY o.orderDate DESC;

-- NOMOR 4
-- karena memudahkan mencari sebuah data 
INSERT  INTO orders(orderNumber,orderDate,requiredDate,shippedDate,`status`, comments, customerNumber)
SELECT 4500, CURRENT_DATE(), CURRENT_DATE() + INTERVAL 1 YEAR, NULL, 'In Process', NULL, customerNumber FROM customers
WHERE customerName = 'Anton Designs, Ltd.';
-- karena tanggal pengiriman belum pasti kapan dikirim 
SELECT * FROM orders
WHERE orderNumber = '4500';

-- nialai dari data itu sendiri otomatis karena nda perlu mi diinput karena adami datanya sesuai soal
INSERT INTO orderdetails(orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
SELECT 4500, productCode, '50', MSRP,'20' FROM products
WHERE productName = '1934 Ford V8 Coupe';

SELECT * FROM orderdetails
WHERE orderNumber = '4500';