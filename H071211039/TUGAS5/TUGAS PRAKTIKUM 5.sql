#USE classicmodels;
-- desc orderdetails;

-- select * from orders where customerNumber = 328;

-- select orderNumber, sum(priceEach * quantityOrdered)
-- from orderdetails
-- where orderNumber in (10112, 10320, 10326, 10334)
-- group by orderNumber;

-- select orderNumber, sum(priceEach * quantityOrdered)
-- from orderdetails
-- where orderNumber = 10334 or orderNumber = 10401
-- group by orderNumber;

-- select * from orders where status='on hold';
-- select * from customers where customerNumber = 144;
-- 1. Siapa saja customers yang status pesanannya tertahan karena melebihi batas kredit?
-- SELECT customers.customerName, orders.status, orders.comments
-- FROM customers
-- JOIN orders
-- ON customers.customerNumber = orders.customerNumber 
-- WHERE comments LIKE '%limit%' AND orders.status='on hold';

-- 2. Siapa saja customers yang berkomentar untuk menggunakan jasa pengantaran
-- DHL? Tampilkan nama mereka, status order mereka, serta komentar yang dimaksud.
-- SELECT c.customerName, o.status, o.comments
-- FROM customers AS c
-- JOIN orders AS o
-- ON c.customerNumber = o.customerNumber
-- WHERE o.comments LIKE '%dhl%';

# 3. Tampilkan semua order mobil bermerek ferarri pada database classicmodels! tampilkan pula nama customers, nama mobilnya, status order, serta tanggal pengiriman yang berturut terkini
-- SELECT c.customerName, p.productName, o.status, o.shippedDate
-- FROM customers AS c
-- JOIN orders AS o
-- ON c.customerNumber = o.customerNumber
-- JOIN orderdetails AS od
-- ON o.orderNumber = od.orderNumber
-- JOIN products AS p
-- ON od.productCode = p.productCode
-- WHERE productName LIKE '%ferrari%' and o.shippedDate IS NOT NULL
-- ORDER BY shippedDate DESC;

# 4. Memasukkan data pemesanan 
-- insert into orders (orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber)
-- values (99999, current_time(), date_add(now(), interval 1 year), null, 'in process', null, 465);
# - Mobil akan dijual kembali dengan harga yang sama dengan harga eceran resmi/Harga retail
-- insert into orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
-- value (99999, 'S18_2957', 50, 62.46, '5');
-- select * from customers
-- JOIN orders 
-- ON customers.customerNumber = orders.customerNumber
-- JOIN orderdetails
-- ON orders.orderNumber = orderdetails.orderNumber
-- JOIN products
-- ON orderdetails.productCode = products.productCode
-- WHERE customers.customerNumber = '465' AND productName = '1934 Ford V8 Coupe' ;