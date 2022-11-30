USE classicmodels;

SELECT customers.customerName,
	CASE 
WHEN  (customers.creditLimit - sum(orderdetails.quantityOrdered * orderdetails.priceEach)) > 0 THEN "you are safe"
WHEN  (customers.creditLimit - sum(orderdetails.quantityOrdered * orderdetails.priceEach)) < 0 THEN "you are in debt"
WHEN  (customers.creditLimit - sum(orderdetails.quantityOrdered * orderdetails.priceEach)) = 0 THEN  "you are running out of credits"
END 
AS "are you safe?",
       (customers.creditLimit - sum(orderdetails.quantityOrdered * orderdetails.priceEach)) as 'total'
FROM customers
join orders using (customerNumber)
join orderdetails on orderdetails.orderNumber = orders.orderNumber
group by customers.customerNumber;