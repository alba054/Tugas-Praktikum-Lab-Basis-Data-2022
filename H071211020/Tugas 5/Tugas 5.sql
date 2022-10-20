# Nomor 1
-- SELECT c.customerName, o.status, o.comments
-- FROM `orders` AS o
-- JOIN customers AS c
-- USING (customerNumber)
-- WHERE o.`status` = 'On Hold' AND o.`comments` LIKE 'Customer credit limit exceeded%';

#Nomor 2
-- SELECT c.customerName, o.status, o.comments
-- FROM orders AS o
-- JOIN customers AS c
-- USING (customerNumber)
-- WHERE o.comments LIKE 'customer requested that DHL is used for this shipping'

#Nomor 3
-- SELECT p.productName, c.customerName, o.status, o.shippedDate
-- FROM products AS p
-- JOIN  orderdetails
-- USING (productCode)
-- JOIN orders AS o
-- USING (orderNumber)
-- JOIN customers AS c
-- USING (customerNumber)
-- WHERE productName LIKE '%ferrari%' AND shippedDate IS NOT NULL ORDER BY shippedDate desc 
-- 
#Nomor 4
-- (insert menggunakan nama kolom, jadi kolomnya didefinisikan satu-satu dan valuesnya disesuaikan) 
-- INSERT INTO orders (orderNumber,status,orderDate,requiredDate,customerNumber)
-- VALUES ('10426','In Process',current_date(),current_date() + INTERVAL 1 YEAR,'465');
-- 
-- (insert tanpa menggunakan nama kolom, jadi values datanya harus sesuai dengan kolom-kolom pada tabel) 
-- INSERT INTO orderdetails
-- VALUES ('10426','S18_2957','50','62.46','40');
-- 
-- SELECT * FROM orderdetails WHERE orderNumber = "10426";
-- SELECT * FROM orders WHERE customerNumber = '465';
-- SELECT * FROM products WHERE productName LIKE "%v8 coupe%";
-- 
-- SELECT customers.customerNumber, customers.customerName, orders.status,
-- orders.orderDate,orders.requiredDate,orderdetails.quantityOrdered, products.productName 
-- FROM customers
-- INNER JOIN orders
-- USING (customerNumber)
-- INNER JOIN orderdetails
-- USING (OrderNumber)
-- INNER JOIN products
-- USING (ProductCode)
-- WHERE  customers.customerNumber = '465';