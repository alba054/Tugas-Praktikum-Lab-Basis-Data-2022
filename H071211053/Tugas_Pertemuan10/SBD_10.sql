USE classicmodels;
-- penjelasan :
-- ● kolom total adalah selisih customers.creditLimit dan banyak nya produk yang
-- dibeli oleh customer (jumlah barang * harga per satuan barang)
-- ● kolom “Are you safe ?” didapat dari mengecek nilai kolom total
-- - jika kolom total > 0 maka tampilkan “you are safe”
-- - jika kolom total < 0 maka tampilkan “you are in debt”
-- - jika kolom total = 0 maka tampilkan “you are running out of credits”

SELECT * FROM customers;
SELECT * FROM orderdetails;
SELECT * FROM orders;

SELECT c.customerName, (c.creditLimit - SUM(od.quantityOrdered * od.priceEach)) AS total,
CASE 
	WHEN (c.creditLimit - SUM(od.quantityOrdered * od.priceEach))  > 0 THEN 'you are safe'
    WHEN (c.creditLimit - SUM(od.quantityOrdered * od.priceEach))  < 0 THEN 'you are in debt'
    ELSE 'you are running out of credits'
END 'Are you safe?'
FROM 
	customers AS c
	JOIN  orders AS o
	ON o.customerNumber = c.customerNumber
	JOIN orderdetails AS od
	ON o.orderNumber = od.orderNumber
	GROUP BY o.customerNumber;