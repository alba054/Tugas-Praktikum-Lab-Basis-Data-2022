SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM orderdetails;
SELECT * FROM products;

#NO1.MENCARI NAMA CUSTOMMERRS YANG STATUS PESANANNYA TERTAHAN KARENA MELEBIHI BATAS KREDIT
SELECT c.customerName,o.`status`,o.comments
FROM customers AS c
JOIN orders AS o
ON c.customerNumber = o.customerNumber
WHERE o.`status`='on hold' AND o.comments LIKE "%exceeded%";

#NO2.MENAMPILKAN CUSTOMER YG BERKOMENTAR UNTUK MENGGUNAKAN JASA PENGGANTARAN DHL
SELECT c.customerName,o.`status`,o.comments
FROM customers AS c
JOIN orders AS o
ON c.customerNumber = o.customerNumber
WHERE o.comments LIKE "%DHL%";

#NO3.MENAMPILKAN SEMUA ORDER MOOBIL BERMEREK FERRARI
SELECT c.customerName,p.productName,o.`status`,o.orderDate
FROM customers AS c
JOIN orders AS o
ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od
ON od.orderNumber = o.orderNumber
JOIN products AS p
ON p.productCode = od.productCode
WHERE p.productName LIKE "%Ferrari%" ORDER BY o.orderDate DESC;

#NO4
INSERT INTO orders(orderNumber,orderDate,requiredDate,`status`,customerNumber)
VALUES (10426,CURRENT_DATE,ADDDATE(CURRENT_DATE,INTERVAL 1 YEAR),'In Process',465);

INSERT INTO orderdetails
VALUES(10426,'S18_2957',50,62.46,10);

SELECT c.customerName,c.customerNumber,o.orderDate,o.requiredDate,p.productCode,od.quantityOrdered
FROM customers AS c
JOIN orders AS o
ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od
ON od.orderNumber = o.orderNumber
JOIN products AS p
ON p.productCode = od.productCode
WHERE c.customerNumber = '465'; 
