USE classicmodels;
USE appseminar;

-- No.1
SELECT * FROM products;
SELECT * FROM orders;

SELECT p.productName, od.orderNumber, o.orderNumber, o.orderDate
FROM products AS p
LEFT JOIN orderdetails AS od ON p.productCode = od.productCode
LEFT JOIN orders AS o ON o.orderNumber = od.orderNumber
WHERE p.productName = '1940 Ford Pickup Truck' ORDER BY o.orderDate;

-- No.2
SELECT * FROM products;
SELECT * FROM orderdetails;

SELECT p.productName, od.priceEach
FROM products AS p
INNER JOIN orderdetails AS od ON od.productCode = p.productCode
WHERE od.priceEach <80/100 * MSRP
ORDER BY od.priceEach;

;

-- No.3
SELECT * FROM ss_mahasiswa;
SELECT * FROM ss_pembimbing;
SELECT * FROM ss_dosen;

SELECT  ssm.nama AS `Nama Mahasiswa` , ssd.nama AS `Nama PEmbimbing Utama`, ssd2.nama AS `Nama Pembimbing Pertama`
FROM  ss_mahasiswa AS ssm
JOIN ss_pembimbing AS ssp ON ssm.id_mahasiswa = ssp.id_mahasiswa
JOIN ss_dosen AS ssd ON ssp.id_pembimbing_utama = ssd.id_dosen
JOIN ss_dosen  as ssd2 ON ssp.id_pembimbing_pertama = ssd2.id_dosen
WHERE ssm.nama = 'Sulaeman';