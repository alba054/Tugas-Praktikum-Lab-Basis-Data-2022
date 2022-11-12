USE classicmodels;
SELECT*FROM orders;
SELECT*FROM products;
SELECT*FROM orderdetails;

#NO1 
#tampilkan kolom tanggal pemesanan product dalam urutan menurun untuk pesanan Ford Pickup Truck 1940
SELECT products.productName,products.productCode,orders.orderDate
FROM products
JOIN orderdetails
ON products.productCode=orderdetails.productCode
JOIN orders
ON orderdetails.orderNumber=orders.orderNumber
WHERE productName='1940 ford pickup truck'
ORDER BY orderdate DESC;

#NO2
#tampilkan daftar nama produk yang dijual dengan harga kurang dari 80% dari MSRP
SELECT p.productName, p.MSRP, od.priceEach
FROM products AS p
JOIN orderdetails AS od
ON p.productCode=od.productCode
WHERE priceEach < 0.8 * MSRP;

#NO3
USE appseminar;
SELECT ss_dosen.nama, ss_mahasiswa.nama 
FROM ss_pembimbing
INNER JOIN ss_dosen
ON ss_pembimbing.id_pembimbing_utama = ss_dosen.id_dosen
INNER JOIN ss_mahasiswa
ON ss_pembimbing.id_mahasiswa = ss_mahasiswa.id_mahasiswa
WHERE ss_mahasiswa.nama = "Sulaeman";

#NO4
USE classicmodels;
ALTER TABLE customers
ADD `status` VARCHAR(10) DEFAULT 'reguler';

SELECT*FROM customers;
SELECT*FROM orderdetails;
UPDATE customers
JOIN payments
ON customers.customerNumber=payments.customerNumber
JOIN orders
ON customers.customerNumber=orders.customerNumber
JOIN orderdetails
ON orders.orderNumber=orderdetails.orderNumber
SET customers.`status`='VIP'
WHERE orderdetails.quantityOrdered>=50 OR payments.amount>100000;

#NO5
-- SELECT*FROM orders
-- SELECT *
-- FROM customers
-- JOIN orders
-- ON customers.customerNumber=orders.customerNumber
-- WHERE orders.`status` = 'cancelled'
ALTER TABLE orders DROP CONSTRAINT orders_ibfk_1;
ALTER TABLE payments DROP CONSTRAINT payments_ibfk_1;

DELETE c from customers c
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber
WHERE o.`status`= 'cancelled';

