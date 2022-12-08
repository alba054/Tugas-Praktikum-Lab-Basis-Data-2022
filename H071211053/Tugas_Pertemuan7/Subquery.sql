USE classicmodels;

#No 1
SELECT CONCAT(c.contactFirstName,' ', c.contactLastName) 'Nama Lengkap', 
MAX(p.amount) 'Pembayaran Terbesar', 
MIN(p.amount) 'Pembayaran Terkecil'
FROM customers c
JOIN payments p ON p.customerNumber = c.customerNumber
WHERE p.amount IN (
SELECT amount
FROM payments p2
WHERE p2.customerNumber = c.customerNumber)
GROUP BY(c.customerNumber);

#No 2
SELECT *
FROM employees
WHERE officeCode = 
(SELECT o.officeCode
FROM offices o
INNER JOIN employees em ON o.officeCode = em.officeCode
GROUP BY (o.officeCode) ORDER BY COUNT(em.employeeNumber) DESC LIMIT 1);

#No 3
SELECT p.productName 'Nama Produk',
p.productScale 'Skala Produk'
FROM products p
WHERE productName IN (
SELECT productName
FROM products
WHERE productName LIKE '%Ford%')
GROUP BY(p.productCode);

#No 4
#Without subquery
SELECT CONCAT(emp.firstName, ' ', emp.lastName) AS 'Nama Karyawan',
c.customerName 'Nama Pelanggan',
o.orderNumber, 
SUM(od.quantityOrdered * od.priceEach) 'Jumlah'
FROM orderdetails od
JOIN orders o ON o.orderNumber = od.orderNumber
JOIN customers c ON c.customerNumber = o.customerNumber
JOIN employees emp ON emp.employeeNumber = c.salesRepEmployeeNumber
GROUP BY(od.orderNumber)
ORDER BY(Jumlah) DESC
LIMIT 1;

#With subquery
SELECT CONCAT(firstName, " ", lastName) AS 'Nama Karyawan',
customerName 'Nama Pelanggan', 
od.orderNumber, SUM(priceEach*quantityOrdered) AS 'Jumlah'
FROM orderdetails od
JOIN orders o ON o.orderNumber = od.orderNumber
JOIN customers c ON c.customerNumber = o.customerNumber
JOIN employees emp ON c.salesRepEmployeeNumber = emp.employeeNumber
GROUP BY orderNumber
HAVING SUM(priceEach*quantityOrdered) =
(
SELECT MAX(Total.Jumlah)
FROM 
(
SELECT SUM(priceEach*quantityOrdered) Jumlah
FROM OrderDetails
GROUP BY orderNumber
) Total
);

#No 5
SELECT DISTINCT country 'Negara', 
LENGTH(country) 'Panjang Nama'
FROM customers 
WHERE LENGTH(country) = (
SELECT MAX(LENGTH(country)) FROM customers) OR LENGTH(country) = (
SELECT MIN(LENGTH(country)) FROM customers);