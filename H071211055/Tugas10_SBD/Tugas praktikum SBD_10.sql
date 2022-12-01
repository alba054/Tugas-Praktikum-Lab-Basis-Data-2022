-- use classicmodels;
-- penjelasan :
-- ● kolom total adalah selisih customers.creditLimit dan banyak nya produk yang
-- dibeli oleh customer (jumlah barang * harga per satuan barang)
-- ● kolom “Are you safe ?” didapat dari mengecek nilai kolom total
-- - jika kolom total > 0 maka tampilkan “you are safe”
-- - jika kolom total < 0 maka tampilkan “you are in debt”
-- - jika kolom total = 0 maka tampilkan “you are running out of credits”

select* from customers;
select* from orderdetails;
select* from orders;

select c.customerName, (c.creditLimit - sum(od.quantityOrdered * od.priceEach)) as selisih,--  alias bagusnya ditaruh disini aja soalnya nda bisa kalau ditaruh dicasenya 
case 
	when (c.creditLimit - sum(od.quantityOrdered * od.priceEach))  > 0 then 'you are safe'
    when (c.creditLimit - sum(od.quantityOrdered * od.priceEach))  < 0 then 'you are in debt'
    else 'you are running out of credits'
end as 'Are you safe?'
from 
	customers as c
	inner join  orders as o
	on o.customerNumber = c.customerNumber
	inner join orderdetails as od
	on o.orderNumber = od.orderNumber
	group by o.customerNumber
    limit 16;


