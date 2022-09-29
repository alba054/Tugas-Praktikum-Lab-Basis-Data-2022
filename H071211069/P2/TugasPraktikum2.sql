-- soal 1
SELECT * FROM offices WHERE city = "San Francisco";

-- soal 2
SELECT * FROM orderdetails WHERE quantityOrdered > 70 ORDER BY orderLineNumber;

-- soal 3
SELECT distinct productLine FROM products;

-- soal 4
SELECT customerNumber AS Nomor_Pelanggan, customerName AS Nama_Pelanggan FROM customers  WHERE customerNumber BETWEEN 100 AND 150;

-- soal 5
SELECT * FROM  customers WHERE country != "USA" AND creditLimit = 0 ORDER BY customerName LIMIT 10,10;

-- pelanggan yg customername awalan c  & credit limit 0 
SELECT * FROM customers WHERE customerName LIKE "C%" AND creditLimit = 0;
