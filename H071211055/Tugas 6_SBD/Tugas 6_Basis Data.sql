-- use classicmodels

-- no 1 :
select c.customerName as `Nama Pelanggan`,
sum(p.amount) as `Total belanja`,
c.creditLimit as `Batas Kredit`,
sum(p.amount) - c.creditLimit as 'Selisih'
from customers as c
inner join payments as p
on c.customerNumber = p.customerNumber
group by c.customerName
having `Total belanja` > c.creditLimit
order by `Selisih` desc;

select*from customers;
select*from payments;

-- no 2 :

select  concat(customerName,':', contactFirstName, contactLastName,'@', addressLine1) as 'Pelanggan',
sum(od.quantityOrdered) as 'Jumlah Orderan'
from customers as c
inner join orders as o
on c.customerNumber = o.customerNumber
inner join orderdetails as od
on o.orderNumber = od.orderNumber
group by c.customerName order by sum(od.quantityOrdered) desc
limit 1;

select*from orderdetails;
select*from customers;

-- no 3 :
select date_format(paymentDate, '%M %Y') as 'Hari pembayaran', count(c.customerName) as 'Jumlah Pelanggan', group_concat(customerName) as ' List Pelanggan', sum(p.amount) as 'Jumlah Pembayaran'
from customers as c
inner join payments as p
on c.customerNumber = p.customerNumber
where month(paymentDate) = 2
group by `Hari Pembayaran` order by sum(p.amount) desc;


select*from customers;
select*from orders;
select*from payments;


-- no 4 :

select upper(p.productName) as 'Nama Produk', count(o.customerNumber) as 'Jumlah di Order', group_concat(o.orderDate) as 'Waktu Orderan',
p.buyPrice as 'Harga Beli', od.priceEach as 'Harga Jual',  sum(od.quantityOrdered) as 'Total Jumlah Orderan',
concat((sum(od.quantityOrdered * od.priceEach)), '-', sum(od.quantityOrdered * p.buyPrice), '=', sum(od.quantityOrdered * od.priceEach) - sum(od.quantityOrdered * p.buyPrice  )) as ' Pendapatan - Modal = keuntungan'
from products as p
inner join orderdetails as od
on p.productCode = od.productCode
inner join orders as o
on o.orderNumber = od.orderNumber
where p.productCode = 'S12_1108'
group by priceEach
having `pendapatan - modal = keuntungan` > 500
order by sum(od.quantityOrdered * od.priceEach) - sum(od.quantityOrdered * p.buyPrice) desc;

-- no  5 :
-- select o.addressLine1 as 'Alamat', right(o.phone) as ' Nomor Telp', sum(e.employeeNumber) as 'Jumlah Karyawan', 
-- sum(c.customerNumber) as 'Jumlah Pelanggan', avg(amount)
-- from offices as o




