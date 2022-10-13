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


-- no 2
select * from products where buyPrice < (MSRP * 0.8);

-- no 3
-- use appseminar;
select*from ss_mahasiswa  as sm
inner join ss_pembimbing as sp
on sm.id_mahasiswa = sp.id_mahasiswa
inner join ss_dosen as sd
on sp.id_pembimbing_utama = sd.id_dosen
where sm.nama = 'sulaeman';
-- select*from ss_pembimbing;

-- no 4
-- use classicmodels;
-- alter table customers 
-- add status varchar(50);

-- select status from customers;

-- update customers as c
-- inner join payments as p
-- on c.customerNumber = p.customerNumber
-- inner join orders as o
-- on c.customerNumber = o.customerNumber
-- inner join orderdetails as od
-- on od.orderNumber = o.orderNumber;
-- select *from orderdetails;

alter table customers add status varchar(125);

update customers as c 
inner join payments as p 
on p.customerNumber = c.customerNumber 
inner join orders as o 
on o.customerNumber = c.customerNumber
inner join orderdetails as od
on o.orderNumber = od.orderNumber
set c.status="VIP"
where p.amount > 99999 or od.quantityOrdered > 49;

update customers as c 
inner join payments as p 
on p.customerNumber = c.customerNumber 
inner join orders as o 
on o.customerNumber = c.customerNumber
inner join orderdetails as od
on o.orderNumber = od.orderNumber
set c.status="Regular"
where (p.amount < 100000 or od.quantityOrdered < 50) and c.status!="VIP";

select*from customers;
select*from orderdetails

-- no 5
set foreign_key_checks = 0;
delete o,p,c from customers as c
inner join  orders as o
on c.customerNumber = o.customerNumber
inner join payments as p
on c.customerNumber = p.customerNumber
where o.`status`="Cancelled";
set foreign_key_checks = 1;

select*from customers;
select*from orders;
select*from payments;
