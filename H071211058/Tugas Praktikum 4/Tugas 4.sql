-- Nomor 1
-- Tanggal pemesanan produk (menurun) utk pesanan Ford Pickup Truck 1940
SELECT o.orderDate, p.productName
FROM orders AS o 
INNER JOIN orderdetails AS od 
ON o.orderNumber = od.orderNumber
INNER JOIN products AS p 
ON p.productCode = od.productCode 
WHERE p.productName = 'Ford Pickup Truck 1940';

USE classicmodels

-- Nomor 2
SELECT * FROM products WHERE buyPrice < (MSRP * 0.8);

-- Nomor 3
-- USE appseminar;
SELECT m.nama AS 'Nama Mahasiswa', d1.nama AS `Pembimbing Pertama`, d2.nama AS `Pembimbing Kedua`
FROM ss_mahasiswa AS m 
INNER JOIN ss_pembimbing AS p 
ON p.id_mahasiswa = m.id_mahasiswa 
INNER JOIN ss_dosen AS d1
ON p.id_pembimbing_utama = d1.id_dosen
INNER JOIN ss_dosen AS d2
ON  p.id_pembimbing_pertama = d2.id_dosen
WHERE m.nama="Sulaeman";

-- Nomor 4
-- USE classicmodels;
ALTER TABLE customers ADD status VARCHAR(255);

UPDATE customers AS c 
INNER JOIN payments AS p 
ON p.customerNumber = c.customerNumber 
INNER JOIN orders AS o 
ON o.customerNumber = c.customerNumber
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
SET c.status="VIP"
WHERE p.amount > 99999 OR od.quantityOrdered > 49;

UPDATE customers AS c 
INNER JOIN payments AS p 
ON p.customerNumber = c.customerNumber 
INNER JOIN orders AS o 
ON o.customerNumber = c.customerNumber
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
SET c.status="Regular"
WHERE c.status !="VIP";

-- Nomor 5
show create table payments;

alter table orders drop
constraint orders_ibfk_1;

alter table orders add constraint orders_ibfk_1 foreign key(customerNumber) REFERENCES customers(customerNumber)
on delete cascade;

alter table orderdetails drop
constraint orderdetails_ibfk_1;

alter table orderdetails add constraint orderdetails_ibfk_1
foreign key (orderNumber) references orders (orderNumber) on delete cascade;

alter table payments drop
constraint payments_ibfk_1;

alter table payments add constraint payments_ibfk_1
foreign key (customerNumber) references customers (customerNumber) on delete cascade

-- select c.customerNumber, o.status
-- from customers AS c
-- inner join orders AS o
-- on c.customerNumber = o.customerNumber
-- where o.status= 'cancelled';

-- select * from orders where status = 'cancelled'

delete customers from customers
inner join orders
on customers.customerNumber = orders.customerNumber
where orders.status= 'cancelled';