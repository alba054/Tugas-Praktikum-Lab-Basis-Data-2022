-- Nomor 1
SELECT c.customerName AS Nama_Pelanggan, SUM(p.amount) AS Total_Belanja, c.creditLimit AS Batas_Kredit, SUM(p.amount) - c.creditLimit AS Selisih
FROM customers AS c
INNER JOIN payments AS p
ON c.customerNumber = p.customerNumber
GROUP BY Nama_Pelanggan
HAVING Total_Belanja > Batas_Kredit
ORDER BY Selisih DESC;


-- Nomor 2
-- SELECT * FROM customers WHERE customerName LIKE '%EURO+ SHOPPING%'
SELECT CONCAT (customerName, " ", ":", " ", c.contactFirstName, c.contactLastName, "@",  c.addressLine1 ) AS 'Pelanggan',
SUM(od.quantityOrdered) AS 'Jumlah_Orderan'
FROM customers AS c
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
GROUP BY c.customerName
ORDER BY Jumlah_Orderan DESC
LIMIT 1;


-- Nomor 3
SELECT CONCAT_WS(' ', MONTHNAME(p.paymentDate), YEAR(p.paymentDate)) AS 'Hari_Pembayaran', COUNT(c.customerName) AS 'Jumlah_Pelanggan', GROUP_CONCAT(c.customerName) AS 'List_Pelanggan', SUM(p.amount) AS 'Amount'
FROM customers AS c
INNER JOIN payments AS p
ON c.customerNumber = p.customerNumber
GROUP BY Hari_Pembayaran
HAVING Hari_Pembayaran LIKE 'Feb%'
ORDER BY Amount DESC;

-- Nomor 4
SELECT UPPER(productName) AS 'Nama Produk', COUNT(quantityOrdered) AS 'Jumlah Orderan', GROUP_CONCAT(orderdate SEPARATOR ' , ') AS 'Waktu Orderan', 
buyPrice AS 'Harga Beli', priceEach AS 'Harga Jual', SUM(quantityOrdered) AS 'Total Jumlah Orderan', 
CONCAT(priceEach * SUM(quantityOrdered), '-', buyPrice*SUM(quantityOrdered), '=', 
SUM(quantityOrdered)*(priceEach-buyPrice)) AS 'Pendapatan - Modal = Keuntungan'
FROM products AS p
INNER JOIN orderdetails AS od 
ON od.productCode = p.productCode
INNER JOIN orders AS o 
ON od.orderNumber = o.orderNumber
WHERE p.productName LIKE '%enzo%'
GROUP BY od.priceEach
HAVING SUM(od.quantityOrdered) * (od.priceEach - p.buyPrice) > 5000
ORDER BY SUM(od.quantityOrdered)*(od.priceEach-p.buyPrice) DESC;

-- Nomor 5
SELECT o.addressLine1 AS 'Alamat',
REPLACE(o.phone, RIGHT(o.phone, 5), '* ****') 'No Telp',
COUNT(DISTINCT e.employeeNumber) 'Jumlah Karyawan',
COUNT(DISTINCT c.customerNumber) 'Jumlah Pelanggan',
ROUND(AVG(p.amount), 2) AS 'Rata-Rata Penghasilan'
FROM offices AS o
INNER JOIN employees AS e
ON e.officeCode = o.officeCode
INNER JOIN customers AS c
ON c.salesRepEmployeeNumber = e.employeeNumber
INNER JOIN payments AS p
ON p.customerNumber = c.customerNumber
GROUP BY o.officeCode
ORDER BY o.phone ASC;

