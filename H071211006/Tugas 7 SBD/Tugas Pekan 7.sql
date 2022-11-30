USE classicmodels;

-- nomor 1
SELECT c.customerNumber, MAX(p.amount) AS 'Pembayaran Terbesar', 
MIN(p.amount) AS 'Pembayaran Terkecil'
FROM customers AS c
INNER JOIN payments AS p
ON c.customerNumber = p.customerNumber
WHERE p.amount IN 
	(SELECT amount FROM payments)
	GROUP BY customerNumber;

 -- nomor 2 
SELECT e.employeeNumber, CONCAT(e.firstName, " ", e.lastName) AS 'Nama Karyawan',
e.officeCode, e.jobTitle FROM employees AS e
WHERE officeCode = 
	(SELECT officeCode AS kodekantor
	FROM employees AS e
	GROUP BY officeCode
	HAVING COUNT(employeeNumber) =
		(SELECT MAX(counttable.kodekantor) AS maxcount
		FROM 
			(SELECT officeCode, COUNT(employeeNumber) AS kodekantor
			FROM employees AS e
			 GROUP BY officeCode
			 ) AS counttable
 		)
	);

 -- nomor 3
SELECT p.productName AS 'Nama Produk', p.productScale
FROM products AS p
WHERE p.productName IN
	(SELECT productName 
	FROM products 
	WHERE productName LIKE '%Ford%');
 
-- nomor 4
SELECT c.customerName AS 'Nama Pelanggan', CONCAT(firstName, " ", lastName) AS 'Nama Karyawan', 
od.orderNumber, SUM(priceEach * quantityOrdered) AS 'Biaya Pesanan'
FROM orderdetails AS od
JOIN orders AS o
ON o.orderNumber = od.orderNumber
JOIN customers AS c
ON c.customerNumber = o.customerNumber
JOIN employees AS e
ON c.salesRepEmployeeNumber = e.employeeNumber
GROUP BY orderNumber
HAVING SUM(priceEach * quantityOrdered) =
	(SELECT MAX(biayaPesanan.orderTotal)
	FROM 
		(SELECT SUM(priceEach * quantityOrdered) AS 'orderTotal'
 		FROM orderdetails
 		GROUP BY orderNumber
 		) AS biayaPesanan
	);

 -- nomor 5
SELECT DISTINCT country AS 'Negara', LENGTH(country) AS 'Panjang Karakter' 
FROM customers
WHERE LENGTH(country) = (
	SELECT MAX(LENGTH(country)) AS 'Terpanjang' FROM customers)
   OR 
	LENGTH(country) = (SELECT MIN(LENGTH(country)) AS 'Terpendek' FROM customers);