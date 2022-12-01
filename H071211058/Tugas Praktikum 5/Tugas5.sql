USE classicmodels;

-- Nomor 1
SELECT c.customerName, o.status, o.comments
FROM customers AS c
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber
WHERE o.comments LIKE  '%Credit Limit%' AND o.status = 'On Hold';

SELECT * FROM orders WHERE status = 'on hold';

-- Nomor 2
SELECT c.customerName, o.status, o.comments
FROM customers as c
INNER JOIN orders as o
ON c.customerNumber = o.customerNumber
WHERE o.comments LIKE '%DHL%';

-- Nomor 3
SELECT c.customerName, o.status, o.shippedDate, p.productName
FROM customers AS c
INNER JOIN orders as o
ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
INNER JOIN products AS p
ON od.productCode = p.productCode
WHERE productName LIKE '%Ferrari%' AND o.shippedDate IS NOT NULL
ORDER BY o.shippedDate DESC;

-- Nomor 4
SELECT customerNumber FROM customers 
WHERE customerName LIKE '%Anton Design%';

SELECT productName, productCode, MSRP FROM products
WHERE productName LIKE '1934%Ford%Coupe';

-- select * from orders 
-- order by orderNumber desc

INSERT INTO orders (orderNumber, orderDate, requiredDate, shippedDate, STATUS, comments, customerNumber)
VALUES (14028, CURRENT_TIMESTAMP(), DATE_ADD(NOW(), INTERVAL 1 YEAR), NULL, 'In Process', NULL, 465);

INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
VALUES (14028, 'S18_2957', 50, 62.46, 3);

SELECT * 
FROM customers AS c
INNER JOIN orders AS o
ON  c.customerNumber = o.customerNumber
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
INNER JOIN products AS p
ON od.productCode = p.productCode
WHERE customerName LIKE '%Anton Design%' AND productName LIKE '1934%Ford%Coupe';

-- delete from orders where orderNumber = '14028';
-- delete from orderdetails where productCode = 'S18_2957';

