SELECT customers.customerName, 
case 
when (customers.creditLimit - SUM(orderdetails.quantityOrdered * orderdetails.priceEach)) > 0 then "you are safe"
when (customers.creditLimit - SUM(orderdetails.quantityOrdered * orderdetails.priceEach)) < 0 then "you are in dept"
ELSE "you are running out of credits"
END AS "are you safe ?",
(customers.creditLimit - SUM(orderdetails.quantityOrdered * orderdetails.priceEach)) AS "Total"
FROM customers
JOIN orders
USING (CustomerNumber)
JOIN orderdetails
USING (orderNumber)
GROUP BY customers.customerName
