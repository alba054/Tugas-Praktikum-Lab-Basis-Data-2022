-- Nomor 1
SELECT c.customerName AS 'Nama Pelanggan', SUM(p.amount) AS 'Total Belanja', c.creditLimit AS 'Batas Kredit', (SUM(p.amount) - c.creditLimit) AS 'Selisih' 
FROM customers AS c 
JOIN payments AS p
USING (customerNumber)
GROUP BY c.customerNumber
HAVING Selisih > 0
ORDER BY Selisih DESC

-- Nomor 2
SELECT CONCAT(c.customerName, ' : ' , c.contactFirstName, c.contactLastName, '@', c.addressLine1) AS Pelanggan,SUM(od.quantityOrdered) AS 'Jumlah Orderan' 
FROM customers AS c 
JOIN orders AS o
USING (customerNumber)
JOIN orderdetails AS od
USING (orderNumber)
GROUP BY c.customerNumber
ORDER BY SUM(od.quantityOrdered) DESC

-- nomor 3
SELECT CONCAT ((MONTHNAME(p.paymentDate)),' ', YEAR(p.paymentDate)) AS 'Hari Pembayaran',
COUNT(c.customerName) AS 'Jumlah Pelanggan',
GROUP_CONCAT(c.customerName ORDER BY c.customerName ASC SEPARATOR ',') AS 'List Pelanggan',
SUM(p.amount) AS 'Jumlah Pembayaran' 
FROM payments AS p
JOIN customers AS c
USING (customerNumber)
WHERE MONTH(p.paymentDate) = 2
GROUP BY `Hari Pembayaran`
ORDER BY SUM(p.amount) DESC

-- Nomor 4
SELECT UPPER(pr.productName) AS 'Nama Produk',
COUNT(od.priceEach) AS 'Jumlah di Order',
GROUP_CONCAT(o.orderDate SEPARATOR ',') AS 'Waktu Orderan', 
od.priceEach AS 'Harga Jual', 
pr.buyPrice AS 'Harga Beli', 
SUM(od.quantityOrdered) AS 'Total Jumlah Orderan',
CONCAT((od.priceEach * SUM(od.quantityOrdered)), ' - ' ,(pr.buyPrice * SUM(od.quantityOrdered)),' = ',((od.priceEach * SUM(od.quantityOrdered))-(pr.buyPrice * SUM(od.quantityOrdered)))) AS 'Pendapatan - Modal = Keuntungan'
FROM orders AS o
JOIN orderdetails AS od
USING (orderNumber)
JOIN products AS pr
USING (productCode)
WHERE pr.productName LIKE '%Ferrari Enzo%'
GROUP BY od.priceEach
HAVING ((od.priceEach * SUM(od.quantityOrdered)) - (pr.buyPrice * SUM(od.quantityOrdered))) > 5000
ORDER BY ((od.priceEach * SUM(od.quantityOrdered)) - (pr.buyPrice * SUM(od.quantityOrdered))) DESC

-- Nomor 5
SELECT o.addressLine1 AS 'Alamat', REPLACE(o.phone, RIGHT(o.phone,5 ), '*** **') AS 'Nomor Telepon', 
COUNT(DISTINCT e.employeeNumber) AS 'Jumlah Karyawan',
COUNT(DISTINCT c.customerName) AS 'Jumlah Pelanggan', ROUND(AVG(p.amount), 2) AS 'Rata-rata Penghasilan'
FROM customers AS c
JOIN employees AS e  
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN offices AS o
USING (officeCode)
JOIN payments AS p
USING (customerNumber)
GROUP BY alamat
