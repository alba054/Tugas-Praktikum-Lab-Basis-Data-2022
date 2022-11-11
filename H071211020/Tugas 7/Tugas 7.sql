-- Nomor 1
SELECT DISTINCT customerNumber,
(SELECT MAX(amount) FROM payments WHERE customers.customerNumber =
payments.customerNumber) AS "Pembayaran Terbesar", (SELECT MIN(amount) FROM payments WHERE customers.customerNumber =
payments.customerNumber) AS "Pembayaran Terkecil"
FROM payments
RIGHT JOIN customers
USING (CustomerNumber)

-- Nomor 2
SELECT  CONCAT (employees.firstName," ",employees.lastName) AS `Employee`, offices.city, offices.officeCode
FROM offices
JOIN employees
USING (officeCode)
WHERE offices.officeCode =  
	(SELECT offices.officeCode
	FROM offices
	JOIN employees
	USING (officeCode)
	GROUP BY officeCode 
	order by count(employees.officeCode) DESC LIMIT 1)

-- Nomor 3
SELECT productName, productscale
FROM products
WHERE productName IN 
	(SELECT productName FROM products WHERE productName LIKE "%Ford%") 

-- Nomor 4
SELECT cName AS `Nama Pelanggan`, CONCAT(fName, ' ', lName) AS `Nama Karyawan`, oNumber AS `Nomor Pesanan`, 
pAmount AS `Biaya Pesanan`
FROM (SELECT customers.customerName AS cName, employees.firstName AS fName, employees.lastName AS lName,
orderdetails.orderNumber AS oNumber, SUM(orderdetails.quantityOrdered * orderdetails.priceEach) AS pAmount
FROM orderdetails
INNER JOIN orders
ON orderdetails.orderNumber = orders.orderNumber
INNER JOIN customers
ON orders.customerNumber = customers.customerNumber
INNER JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber
GROUP BY orderdetails.orderNumber
ORDER BY SUM(orderdetails.quantityOrdered * orderdetails.priceEach) DESC
LIMIT 1) AS b
	
-- Nomor 5
SELECT DISTINCT  LENGTH(country) AS `karakter`, country
FROM customers
WHERE LENGTH(country) IN 
	((SELECT MAX(LENGTH(country)) FROM customers),(SELECT MIN(LENGTH(country)) FROM customers))
ORDER BY `karakter` DESC 
 

