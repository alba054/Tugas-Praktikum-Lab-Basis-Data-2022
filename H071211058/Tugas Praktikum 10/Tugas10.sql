-- Nomor 1
USE classicmodels; 

SELECT c.customerName, (c.creditLimit-SUM(od.quantityOrdered * od.priceEach)) AS 'Total',
CASE 
	WHEN (c.creditLimit-SUM(od.quantityOrdered * od.priceEach)) > 0 then 'you are safe'
    WHEN (c.creditLimit-SUM(od.quantityOrdered * od.priceEach)) < 0 then 'you are in debt'
    ELSE 'you are running out of credits'
END AS 'Are You Safe?'
FROM customers c
INNER JOIN orders o
ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails od
ON o.orderNumber = od.orderNumber
GROUP BY c.customerName;
