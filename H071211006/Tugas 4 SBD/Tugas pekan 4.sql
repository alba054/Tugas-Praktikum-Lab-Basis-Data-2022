-- nomor 1
USE classicmodels;
SELECT o.orderDate, p.productName
FROM orderdetails AS od
INNER JOIN orders AS o 
ON od.orderNumber = o.orderNumber
INNER JOIN products AS p
ON od.productCode = p.productCode
WHERE p.productName = "1940 Ford Pickup Truck" ORDER BY o.orderDate DESC;

-- nomor 2
SELECT products.productName, products.MSRP, 0.8 * products.MSRP
FROM products
INNER JOIN orderdetails
ON products.productCode = orderdetails.productCode
WHERE orderdetails.priceEach < 0.8 * products.MSRP;

-- nomor 3
USE appseminar;
SELECT d.nama, m.nama
FROM ss_mahasiswa AS m
INNER JOIN ss_pembimbing AS p
ON m.id_mahasiswa = p.id_mahasiswa
INNER JOIN ss_dosen AS d
ON p.id_pembimbing_utama = d.id_dosen
WHERE m.nama = "sulaeman";

-- nomor 4
USE classicmodels;
-- ALTER TABLE customers
-- ADD COLUMN status VARCHAR(255);
-- 
UPDATE customers
INNER JOIN payments 
ON customers.customerNumber = payments.customerNumber
INNER JOIN orders
ON payments.customerNumber = orders.customerNumber
INNER JOIN orderdetails 
ON orders.orderNumber = orderdetails.orderNumber
SET customers.status = 'VIP'
WHERE payments.amount > 100000 OR orderdetails.quantityOrdered > 50;

UPDATE customers
SET customers.status = 'Reguler'
WHERE STATUS IS NULL;

SELECT * FROM customers;

-- nomor 5
ALTER TABLE orders DROP
CONSTRAINT `orders_ibfk_1`;

ALTER TABLE orders 
ADD CONSTRAINT orders_ibfk_1
FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber)
ON DELETE CASCADE; 

ALTER TABLE orderdetails DROP
CONSTRAINT `orderdetails_ibfk_1`;

ALTER TABLE orderdetails 
ADD CONSTRAINT `orderdetails_ibfk_1`
FOREIGN KEY (orderNumber) REFERENCES orders(orderNumber)
ON DELETE CASCADE; 

ALTER TABLE payments DROP
CONSTRAINT `payments_ibfk_1`; 

ALTER TABLE payments 
ADD CONSTRAINT `payments_ibfk_1`
FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber)
ON DELETE CASCADE;

DELETE customers FROM customers
INNER JOIN orders ON customers.customerNumber = orders.customerNumber
WHERE orders.`status` = "Cancelled";

SELECT * FROM customers 
INNER JOIN orders ON orders.customerNumber = customers.customerNumber
WHERE orders.`status` = "Cancelled";

SELECT * FROM orders
WHERE orders.`status` ="Cancelled";