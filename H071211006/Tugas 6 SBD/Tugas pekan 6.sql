USE classicmodels;

-- nomor 1
SELECT customerName AS 'Nama Pelanggan', SUM(amount) AS 'Total Belanja',
c.creditLimit AS 'Batas Kredit', SUM(amount) - c.creditLimit AS 'Selisih'
FROM customers AS c
INNER JOIN payments AS p
ON p.customerNumber = c.customerNumber
GROUP BY c.customerNumber
HAVING `Total Belanja` > c.creditLimit 
ORDER BY `Selisih` DESC;

-- nomor 2
SELECT CONCAT(customerName, " : ", contactFirstName, " ", contactLastName, "@", addressLine1) AS 'Pelanggan', 
SUM(od.quantityOrdered) AS 'Jumlah Orderan'
FROM orderdetails AS od
INNER JOIN orders AS o
ON od.orderNumber = o.orderNumber
INNER JOIN customers AS c
ON o.customerNumber = c.customerNumber
GROUP BY c.customerNumber 
LIMIT 1;

-- nomor 3
SELECT CONCAT(MONTHNAME(p.paymentDate), " ", YEAR(p.paymentDate)) AS 'Hari Pembayaran', COUNT(customerName) 
AS 'Jumlah Pelanggan', GROUP_CONCAT(DISTINCT c.customerName) AS 'List Pelanggan', 
SUM(p.amount) AS 'Jumlah Pembayaran'
FROM customers AS c
INNER JOIN payments AS p
ON c.customerNumber = p.customerNumber 
WHERE MONTH(paymentDate) = 2
GROUP BY `Hari Pembayaran`
ORDER BY `Jumlah Pembayaran` DESC;

-- nomor 4
SELECT UPPER(pr.productName) AS 'Nama Produk', COUNT(o.orderNumber) AS 'Jumlah diorder', GROUP_CONCAT(o.orderDate) AS 'Waktu Orderan', 
pr.buyPrice AS 'Harga Beli', od.priceEach AS 'Harga Jual', SUM(od.quantityOrdered) AS 'Total Jumlah Orderan', 
CONCAT(SUM(od.priceEach * od.quantityOrdered), " - ", SUM(pr.buyPrice * od.quantityOrdered), " = ", 
(SUM(od.priceEach * od.quantityOrdered)) - (SUM(pr.buyPrice * od.quantityOrdered))) AS 'Pendapatan - Modal = Keuntungan'
FROM products AS pr
JOIN orderdetails AS od
ON pr.productCode = od.productCode
JOIN orders AS o
ON od.orderNumber = o.orderNumber
WHERE pr.productName LIKE '%2001%'
GROUP BY `Harga Jual`
HAVING (SUM(od.priceEach * od.quantityOrdered)) - (SUM(pr.buyPrice * od.quantityOrdered)) > 5000
ORDER BY (SUM(od.priceEach * od.quantityOrdered)) - (SUM(pr.buyPrice * od.quantityOrdered)) DESC;

-- nomor 5
SELECT o.addressLine1 AS 'Alamat', REPLACE(o.phone, RIGHT(o.phone, 6), '* ****') AS 'Nomor Telepon', COUNT(DISTINCT e.employeeNumber)
AS 'Jumlah Karyawan', COUNT(DISTINCT c.customerName) AS 'Jumlah Pelanggan', ROUND(AVG(p.amount), 2) AS 'Rata-rata Penghasilan'
FROM offices AS o
LEFT JOIN employees AS e
ON o.officeCode = e.officeCode
LEFT JOIN customers AS c
ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments AS p
ON c.customerNumber = p.customerNumber
GROUP BY `Alamat`
ORDER BY `Nomor Telepon`;