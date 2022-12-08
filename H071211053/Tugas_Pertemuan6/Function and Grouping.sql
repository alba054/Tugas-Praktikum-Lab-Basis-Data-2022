USE classicmodels;

#No 1
SELECT c.customerName AS 'Nama Pelanggan',
SUM(p.amount) AS 'Total Pengeluaran',
c.creditLimit AS 'Batas Kredit',
(SUM(p.amount) - c.creditLimit) AS 'Selisih'
FROM customers c 
INNER JOIN payments p
ON p.customerNumber = c.customerNumber
GROUP BY c.customerName
HAVING SUM(p.amount) > c.creditLimit
ORDER BY `Selisih` DESC;

#No 2
SELECT CONCAT(c.customerName, ' : ', c.contactFirstName, ' ', c.contactLastName, '@', c.addressLine1) AS 'Pelanggan',
SUM(od.quantityOrdered) AS 'Jumlah Orderan'
FROM orderdetails od
INNER JOIN orders o
ON o.orderNumber = od.orderNumber
INNER JOIN customers c
ON c.customerNumber = o.customerNumber
GROUP BY c.customerNumber
ORDER BY `Jumlah Orderan` DESC LIMIT 1;

#No 3
SELECT CONCAT(MONTHNAME(p.paymentDate),' ', YEAR(p.paymentDate)) 'Waktu Pembayaran',
GROUP_CONCAT(DISTINCT c.customerName SEPARATOR ', ') 'List Pelanggan',
COUNT(DISTINCT c.customerName) 'Jumlah Pelanggan',
SUM(p.amount) 'Jumlah Pembayaran'
FROM payments p
INNER JOIN customers c
ON p.customerNumber = c.customerNumber
WHERE MONTH(p.paymentDate) = 02
GROUP BY YEAR(p.paymentDate)
ORDER BY SUM(p.amount) DESC;

#No 4
SELECT UPPER(productName) 'Nama Product',
COUNT(o.orderDate) 'Jumlah di Order',
GROUP_CONCAT(DISTINCT o.orderDate SEPARATOR ', ') 'Waktu Orderan',
buyPrice 'Harga Beli',
od.priceEach 'Harga Jual',
SUM(od.quantityOrdered) 'Total Jumlah Orderan',
CONCAT((priceEach * SUM(od.quantityOrdered)), ' - ', (buyPrice * SUM(od.quantityOrdered)), ' = ', (priceEach * SUM(od.quantityOrdered)) - (buyPrice * SUM(od.quantityOrdered))) 'Pendapatan - Modal = Keuntungan' 
FROM products AS pr
INNER JOIN orderdetails od
ON pr.productCode = od.productCode
INNER JOIN orders o
ON o.orderNumber = od.orderNumber
WHERE productName = '2001 Ferrari Enzo'
GROUP BY priceEach
ORDER BY `Pendapatan - Modal = Keuntungan` DESC;

#No 5
SELECT ofc.addressLine1 'Alamat',
REPLACE(ofc.phone, RIGHT(ofc.phone, 6), '* ****') 'No Telp',
COUNT(DISTINCT em.employeeNumber) 'Jumlah Karyawan',
COUNT(DISTINCT c.customerNumber) 'Jumlah Pelanggan',
ROUND(AVG(p.amount), 2) 'Rata-rata Penghasilan'
FROM offices ofc
INNER JOIN employees em
ON em.officeCode = ofc.officeCode
INNER JOIN customers c
ON c.salesRepEmployeeNumber = em.employeeNumber
INNER JOIN payments p
ON p.customerNumber = c.customerNumber
GROUP BY ofc.officeCode
ORDER BY ofc.phone ASC;