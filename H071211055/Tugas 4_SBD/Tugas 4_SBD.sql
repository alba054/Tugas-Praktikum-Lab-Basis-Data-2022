-- use classicmodels;

-- no 1

select o.orderDate, p.productName -- kita pilih table dan kolom yang ditanyakan
from orders as o
inner join orderdetails as od
on o.orderNumber = od.orderNumber
inner join products as p
on p.productCode = od.productCode
where productName = '1940 ford pickup truck'
order by o.orderDate desc;

select*from orders;
select*from orderdetails;
select*from products;

-- no 2
select distinct p.productName
from orderdetails as od -- yang di from itu sesuai dengan where nya kondisinya yang akan ditampilkan
inner join products as p
on od.productCode = p.productCode
where od.priceEach < (0.8*p.MSRP); 

select*from orderdetails;


-- no 3
-- use appseminar;
select sm.nama as 'Nama Mahasiswa', sd1.nama as `Pembimbing pertama`, sd2.nama as `Pembimbing Kedua`
from ss_mahasiswa as sm 
inner join ss_pembimbing as sp 
on sp.id_mahasiswa = sm.id_mahasiswa 
inner join ss_dosen as sd1
on sp.id_pembimbing_utama = sd1.id_dosen
inner join ss_dosen as sd2
on sp.id_pembimbing_pertama = sd2.id_dosen
where sm.nama="Sulaeman";

select*from  ss_pembimbing;
select*from ss_dosen;
select*from ss_mahasiswa;



-- no 4
alter table customers add status varchar(125);

update customers as c
inner join payments as p 
on p.customerNumber = c.customerNumber 
inner join orders as o 
on o.customerNumber = c.customerNumber
inner join orderdetails as od
on o.orderNumber = od.orderNumber
set c.status ="VIP"
where p.amount > 100000 or od.quantityOrdered > 50;

update customers as c 
inner join payments as p 
on p.customerNumber = c.customerNumber 
inner join orders as o 
on o.customerNumber = c.customerNumber
inner join orderdetails as od
on o.orderNumber = od.orderNumber
set c. status="Regular"
where (p.amount < 100000 or od.quantityOrdered < 50) and c.status!="VIP";

select status from customers;
select*from orderdetails;

-- no 5
set foreign_key_checks = 0;
delete o,p,c 
from customers as c
inner join  orders as o
on c.customerNumber = o.customerNumber
inner join payments as p
on c.customerNumber = p.customerNumber
where o.`status`="Cancelled";
set foreign_key_checks = 1;

select*from products; 
select*from customers;
select*from orders;
select*from payments;
