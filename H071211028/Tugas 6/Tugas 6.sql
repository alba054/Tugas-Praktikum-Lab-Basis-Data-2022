#NO. 1
SELECT c.customerName AS 'Nama Pelanggan',
SUM(p.amount) AS 'Total Belanja',
c.creditLimit AS 'Batas Kredit',
(SUM(p.amount) - c.creditLimit) AS 'Selisih' 
FROM customers AS c INNER JOIN payments AS p
ON c.customerNumber = p.customerNumber
GROUP BY c.customerNumber
HAVING Selisih > 0
ORDER BY Selisih DESC;

#NO. 2
SELECT CONCAT(c.customerName, ' : ' , c.contactFirstName, c.contactLastName, '@', c.addressLine1) AS Pelanggan,
SUM(od.quantityOrdered) AS 'Jumlah Orderan' 
FROM customers AS c 
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
GROUP BY c.customerNumber
ORDER BY SUM(od.quantityOrdered) DESC
LIMIT 1

#NO. 3
SELECT CONCAT((MONTHNAME(paymentDate)), " ", YEAR(paymentDate)) AS 'Hari Pembayaran', COUNT(c.customerName) AS 'Jumlah Pelanggan', GROUP_CONCAT(customerName ORDER BY customerName ASC) AS 'List Pelanggan', SUM(p.amount) AS 'Jumlah Pembayaran'
FROM customers AS c
INNER JOIN payments AS p
ON c.customerNumber = p.customerNumber
WHERE MONTH(paymentDate) = 02
GROUP BY YEAR(paymentDate) 
ORDER BY SUM(p.amount) DESC;

#NO. 4
SELECT UPPER(p.productName) AS 'Nama Produk', COUNT(o.customerNumber) AS 'Jumlah di Order',
GROUP_CONCAT(orderDate) AS 'Waktu Orderan', p.buyPrice AS 'Harga Beli', od.priceEach AS 'Harga Jual',
SUM(od.quantityOrdered) AS 'Total Jumlah Orderan' , 
CONCAT((SUM(od.quantityOrdered * od.priceEach)), "-", SUM(od.quantityOrdered * p.buyPrice), "=",
(SUM(od.quantityOrdered * od.priceEach)) - SUM(od.quantityOrdered * p.buyPrice)) AS 'Pendapatan-Modal = Keuntungan'
FROM products AS p
INNER JOIN orderdetails AS od
ON p.productCode = od.productCode
INNER JOIN orders AS o
ON od.orderNumber = o.orderNumber
WHERE p.productName = '2001 Ferrari Enzo'
GROUP BY priceEach
HAVING (SUM(od.quantityOrdered * od.priceEach)) - SUM(od.quantityOrdered * p.buyPrice) > 5000
ORDER BY (SUM(od.quantityOrdered * od.priceEach)) - SUM(od.quantityOrdered * p.buyPrice) DESC;

#NO. 5
SELECT o.addressLine1 AS 'Alamat', concat(LEFT(o.phone, LENGTH(o.phone)-6), '* **') AS 'Nomor Telp',
COUNT(DISTINCT e.employeeNumber) AS 'jumlah karyawan' , COUNT(DISTINCT c.customerName) AS 'Jumlah Pelanggan', round(AVG(amount), 2) AS 'Rata-rata Penghasilan'
from offices AS o
INNER JOIN employees AS e
ON e.officeCode = o.officeCode
INNER JOIN customers AS c
ON c.salesRepEmployeeNumber = e.employeeNumber
INNER JOIN payments AS p
ON c.customerNumber = p.customerNumber
GROUP BY o.officeCode