-- nomor 1
SELECT customers.customerNumber, customers.customerName, customers.creditLimit, orders.status, orders.comments FROM customers
INNER JOIN orders
ON  customers.customerNumber = orders.customerNumber
WHERE orders.status = 'on hold' And orders.comments LIKE '%credit limit exceeded%';

-- nomor 2
SELECT customers.customerName, orders.status, orders.comments FROM customers
INNER JOIN orders
ON  customers.customerNumber = orders.customerNumber
WHERE orders.comments LIKE '%DHL%';

-- nomor 3
SELECT customers.customerName, products.productName , orders.status, orders.orderDate, orders.shippedDate FROM customers
INNER JOIN orders
ON  customers.customerNumber = orders.customerNumber
INNER JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
INNER JOIN products
ON orderdetails.productCode = products.productCode
WHERE  products.productName LIKE '%Ferrari%' AND orders.shippedDate is Not NULL ORDER BY orders.orderDate DESC;

-- nomor 4
-- memasukkan data baru pada kolom table orders
INSERT INTO orders(orderNumber,status,orderDate,requiredDate,customerNumber)
VALUES ('20000','In Process',current_date(),current_date() + INTERVAL 1 YEAR,'465');

SELECT * FROM orders WHERE customerNumber = "465";

-- memasukkan data baru pada table orderdetails

INSERT INTO orderdetails
VALUES ('20000','S18_2957','50','62.46','40');

SELECT * FROM orderdetails WHERE orderNumber = "20000" ;

-- Hasil
SELECT customers.customerNumber, customers.customerName, orders.status, orders.orderDate,orders.requiredDate,orderdetails.quantityOrdered,orderdetails.priceEach,products.MSRP,products.productName FROM customers
INNER JOIN orders
ON  customers.customerNumber = orders.customerNumber
INNER JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
INNER JOIN products
ON orderdetails.productCode = products.productCode
WHERE  customers.customerNumber = '465';





