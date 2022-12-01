-- USE classicmodels
-- SELECT * FROM orders

	# nomor 1
-- SELECT p.productName, o.orderDate
-- FROM orderdetails AS od
-- INNER JOIN orders AS o
-- ON od.orderNumber = o.orderNumber
-- INNER JOIN products AS p
-- ON od.productCode = p.productCode
-- WHERE productName = '1940 Ford Pickup Truck' ORDER BY orderDate Desc
-- 
	# nomor 2
-- SELECT DISTINCT products.productName, products.MSRP, orderdetails.priceEach  
-- FROM products 
-- JOIN orderdetails
-- USING (productCode)
-- WHERE priceEach < 80% MSRP

	# nomor 3
-- USE appseminar;
--  	
-- SELECT d.nama AS "Pembimbing Utama", q.nama AS "Pembimbing pertama", w.nama AS "Pembimbing Kedua", m.nama AS "Mahasiswa"
-- FROM ss_mahasiswa AS m
-- JOIN ss_pembimbing AS p
-- USING (id_mahasiswa)
-- JOIN ss_dosen AS d
-- ON p.id_pembimbing_utama = d.id_dosen
-- LEFT JOIN ss_dosen AS q
-- ON p.id_pembimbing_pertama = q.id_dosen
-- LEFT JOIN ss_dosen AS w
-- ON p.id_pembimbing_kedua = w.id_dosen
-- WHERE m.nama = 'sulaeman';

	# nomor 4
--	use classicmodels
-- ALTER TABLE customers
-- ADD `status` VARCHAR(100) DEFAULT 'Regular';

-- UPDATE customers 
-- INNER JOIN payments
-- ON customers.customerNumber = payments.customerNumber
-- INNER JOIN orders
-- ON orders.customerNumber = customers.customerNumber
-- INNER JOIN orderdetails
-- ON orders.orderNumber = orderdetails.orderNumber
-- SET customers.status = 'VIP'
-- WHERE payments.amount > 100000 OR orderdetails.quantityOrdered > 50;

USE classicModels;
SELECT customers.customerNumber, orderdetails.quantityOrdered, payments.amount, customers.status
FROM customers
INNER JOIN payments
ON customers.customerNumber = payments.customerNumber
INNER JOIN orders
ON orders.customerNumber = customers.customerNumber
INNER JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber

-- 	# nomor 5
-- SELECT COLUMN_NAME, CONSTRAINT_NAME, referenced_column_name, referenced_table_name 
-- FROM information_schema. key_column_usage
-- WHERE TABLE_NAME = 'orders';

-- SELECT COLUMN_NAME, CONSTRAINT_NAME, referenced_column_name, referenced_table_name 
-- FROM information_schema. key_column_usage
-- WHERE TABLE_NAME = 'orderdetails';

-- SELECT COLUMN_NAME, CONSTRAINT_NAME, referenced_column_name, referenced_table_name 
-- FROM information_schema. key_column_usage
-- WHERE TABLE_NAME = 'customers';

-- ALTER TABLE orders DROP CONSTRAINT orders_ibfk_1;
-- ALTER TABLE orderdetails DROP CONSTRAINT orderdetails_ibfk_1;
-- ALTER TABLE payments DROP CONSTRAINT payments_ibfk_1; 

-- DELETE customers FROM customers
-- INNER JOIN orders 
-- ON customers.customerNumber = orders.customerNumber
-- WHERE orders.status = "cancelled"
