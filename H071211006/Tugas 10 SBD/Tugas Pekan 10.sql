SELECT c.customerName,
case
	when c.creditLimit - SUM(d.quantityOrdered * d.priceEach) > 0 then 'you are safe'
	when c.creditLimit - SUM(d.quantityOrdered * d.priceEach) < 0 then 'you are in debt'
	ELSE 'you are running out of case'
END 
AS 'Are you safe', c.creditLimit - SUM(d.quantityOrdered * d.priceEach) AS 'total'
FROM customers c
JOIN orders o
USING (customerNumber)
JOIN orderdetails d
USING (orderNumber)
GROUP BY customerNumber;
