USE classicmodels;

-- No 1
SELECT * FROM customers;
SELECT * FROM orders;

SELECT c.customerName, o.status
FROM orders AS o
JOIN customers AS c
ON c.customerNumber = o.customerNumber
WHERE o.status LIKE 'On Hold';

-- no 2
SELECT * FROM customers;
SELECT * FROM orders;

SELECT c.customerName, o.status, o.comments
FROM customers AS c
JOIN orders AS o
ON c.customerNumber = o.customerNumber
WHERE o.comments LIKE '%DHL%';

-- no 3
SELECT * FROM orders;
SELECT * FROM products;

SELECT c.customerName, p.productName, o.status, o.shippedDate
FROM customers AS c
JOIN orders AS o
ON c.customerNumber = o.customerNumber
JOIN products AS p
JOIN orderdetails AS od
ON p.productCode = od.productCode
WHERE p.productName LIKE '%Ferrari%'
ORDER BY o.shippedDate DESC;

-- no 4 
SELECT * FROM orderdetails;
SELECT * FROM products;

SELECT * FROM orderdetails WHERE orderNumber = 10426;

INSERT INTO orders (orderNumber, orderDate, requiredDate, status, customerNumber)
SELECT 10426, CURRENT_DATE, DATE_ADD(CURRENT_DATE, INTERVAL 1 YEAR), 'In Process', customerNumber FROM customers
WHERE customerName = 'Anton Designs, Ltd.'; 

INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
SELECT 10426, productCode, 50, MSRP * 0.75, 1 FROM products
WHERE productName = '1934 Ford V8 Coupe';

