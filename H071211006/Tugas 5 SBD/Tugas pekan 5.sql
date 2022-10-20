USE classicmodels;

-- nomor 1
SELECT c.customerName, o.`status`, o.comments 
FROM customers AS c
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber
WHERE o.`status` = 'on hold' AND o.comments LIKE '%credit limit%';

-- nomor 2
SELECT c.customerName, o.`status`, o.comments
FROM customers AS c
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber
WHERE o.comments LIKE '%DHL%';

-- nomor 3
SELECT c.customerName, p.productName, o.`status`, o.shippedDate
FROM customers AS c
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
INNER JOIN products AS p
ON od.productCode = p.productCode
WHERE p.productName LIKE '%Ferrari%' AND o.shippedDate IS NOT NULL ORDER BY o.shippedDate DESC;

-- nomor 4
-- SELECT * FROM customers
-- WHERE customerName LIKE '%anton%';
-- INSERT INTO orders (orderNumber, orderDate, requiredDate, shippedDate, `status`, comments, customerNumber)
-- VALUE (999, CURRENT_DATE, DATE_ADD(CURRENT_DATE, INTERVAL 1 YEAR), '2004-11-13', 'in process', NULL, 465);

-- SELECT * FROM products
-- WHERE productName LIKE '%Ford V8%';
-- INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
-- VALUE (999, 'S18_2957' ,50, 62.46 ,2);

SELECT c.customerName, p.productName, o.orderDate, o.requiredDate, o.`status`, od.quantityOrdered, od.priceEach
FROM customers AS c
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
INNER JOIN products AS p
ON od.productCode = p.productCode
WHERE customerName LIKE '%anton%';