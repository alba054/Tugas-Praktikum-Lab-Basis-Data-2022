-- Nomor 1
SELECT a.Nama, MIN(Jumlah) AS 'Pembayaran Terbanyak', MAX(Jumlah) AS 'Pembayaran Terkecil' FROM
(SELECT c.customerName AS 'Nama', p.amount AS 'Jumlah'
FROM customers AS c
INNER JOIN payments AS p
ON c.customerNumber = p.customerNumber) AS a
GROUP BY Nama;


-- Nomor 2
SELECT officeCode, employeeNumber AS 'Employee Number', CONCAT_WS(" ", firstName, lastName) AS 'Nama'
FROM employees 
WHERE officeCode =
	((SELECT MAX(Office_Code) AS Kode_Kantor
	FROM
    (SELECT COUNT(officeCode) AS Office_Code
    FROM employees
    GROUP BY employeeNumber) AS count));
    
-- Nomor 3
SELECT productName, productScale
FROM products
WHERE productName IN (
	SELECT productName 
    FROM products 
    WHERE productName LIKE '%ford%');

-- Nomor 4
select customerName, concat(e.firstName, ' ', e.lastName) as 'employeeName', o.orderNumber, sum(ord.priceEach*ord.quantityOrdered) as 'Biaya Pesanan' 
from customers c
join employees e on c.salesRepEmployeeNumber = e.employeeNumber
join orders o on c.customerNumber = o.customerNumber
join orderdetails ord on o.orderNumber = ord.orderNumber 
group by o.orderNumber, customerName, employeeName
having sum(ord.priceEach*ord.quantityOrdered) = (
	select max(a) from (
		select sum(ord.priceEach*ord.quantityOrdered) as a 
		from orderdetails ord
		group by orderNumber) as b);


-- Nomor 5
SELECT DISTINCT country, length(country) AS 'Panjang Karakter' 
FROM customers
WHERE LENGTH(country) = (
	SELECT MIN(LENGTH(country)) AS 'Terpendek' FROM customers )
    or
    LENGTH(country) =  (SELECT MAX(LENGTH(country)) as 'Terpanjang' from customers);

