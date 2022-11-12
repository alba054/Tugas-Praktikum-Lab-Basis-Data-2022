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
select ofc.addressLine1 as 'alamat', concat(left(ofc.phone,char_length(ofc.phone)-6), "* **") as 'no.telp', count(distinct e.employeeNumber) as 'Jumlah Karyawan', count(distinct c.customerNumber) as 'Jumlah Pelanggan', round(avg(p.amount),2) as 'rata-rata penghasilan'
from offices as ofc
left join employees as e
on e.officeCode = ofc.officeCode
left join customers as c
on c.salesRepEmployeeNumber = e.employeeNumber
left join payments as p 
on c.customerNumber = p.customerNumber
group by ofc.addressLine1 order by `rata-rata penghasilan` asc;




