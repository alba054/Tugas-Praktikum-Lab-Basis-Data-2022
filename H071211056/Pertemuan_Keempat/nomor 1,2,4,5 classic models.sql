use classicmodels;

-- nomor 1
SELECT p.productName, p.productcode, o.orderDate From products as p
INNER JOIN orderdetails as od
ON p.productCode = od.productCode 
INNER JOIN orders as o
on  od.orderNumber = o.orderNumber
WHERE p.productCode = "S18_1097" order by o.orderDate desc;

-- nomor 2
SELECT p.productName, p.productcode, od.priceEach, p.MSRP From products as p
INNER JOIN orderdetails as od
ON p.productCode = od.productCode 
WHERE od.priceEach < 80/100*(P.MSRP);

-- nomor 4
ALTER TABLE customers
ADD COLUMN `Status` varchar(10);

update customers as c
INNER JOIN payments as p
ON c.customerNumber = p.customerNumber
INNER JOIN orders as o
ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails as od
ON o.orderNumber = od.orderNumber
Set c.Status = 'VIP'
WHERE p.amount >= 100000 or od.quantityOrdered >= 50;

-- melihat daftar customer VIP
SELECT c.customerName, p.amount, od.quantityOrdered, c.status FROM customers as c
INNER JOIN payments as p
ON c.customerNumber = p.customerNumber
INNER JOIN orders as o
ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails as od
ON o.orderNumber = od.orderNumber
WHERE p.amount >= 100000 or od.quantityOrdered >= 50;

-- Mengubah yang selain VIP menjadi Regular
Update customers
SET customers.Status = 'Regular'
WHERE customers.Status is NULL;

select * from customers;

-- nomor 5
ALTER TABLE orderdetails
DROP CONSTRAINT orderdetails_ibfk_1;

ALTER TABLE orderdetails
ADD CONSTRAINT orderdetails_ibfk_1 FOREIGN KEY(OrderNumber) REFERENCES orders(orderNumber)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE orders
DROP CONSTRAINT orders_ibfk_1;

ALTER TABLE orders
ADD CONSTRAINT orders_ibfk_1 FOREIGN KEY(customerNumber) REFERENCES customers(customerNumber)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE payments
DROP CONSTRAINT payments_ibfk_1;

ALTER TABLE Payments
ADD CONSTRAINT payments_ibfk_1 FOREIGN KEY(customerNumber) REFERENCES customers(customerNumber)
ON DELETE CASCADE ON UPDATE CASCADE;

DELETE customers,orders,orderdetails
FROM customers
INNER JOIN Orders
ON customers.customerNumber = orders.customerNumber
INNER JOIN Orderdetails
ON orders.orderNumber = orderdetails.orderNumber
INNER JOIN payments
ON customers.customerNumber = payments.customerNumber
WHERE orders.status = 'Cancelled';

select * from orders;