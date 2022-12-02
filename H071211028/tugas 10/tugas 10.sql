SELECT * FROM customers;
SELECT * FROM orderdetails;
SELECT * FROM orders;


SELECT c.customerName, 
CASE
WHEN (c.creditLimit - SUM(od.quantityOrdered * od.priceEach)) < 0 THEN "you are in debt"
WHEN (c.creditLimit - SUM(od.quantityOrdered * od.priceEach)) > 0 THEN "you are safe"
WHEN (c.creditLimit - SUM(od.quantityOrdered * od.priceEach)) = 0 THEN "you are running out of credits"
END
AS "are you safe?",
(c.creditLimit - SUM(od.quantityOrdered * od.priceEach)) AS 'total'
FROM customers AS c
JOIN orders as o USING (customerNumber)
JOIN orderdetails as od USING (orderNumber)
GROUP BY c.customerNumber;