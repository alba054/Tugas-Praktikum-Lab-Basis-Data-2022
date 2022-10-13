-- no1
select o.orderDate, products.productName
from orders as o
inner join orderdetails on o.orderNumber = orderdetails.orderNumber
inner join products on orderdetails.productCode = products.productCode
where productName = ('1940 Ford Pickup Truck')
order by orderDate desc;

-- no 2
select products.productName, orderdetails.priceEach, products.MSRP, 0.8 * products.MSRP
from products
inner join orderdetails on products.productCode = orderdetails.productCode
WHERE orderdetails.priceEach < 0.8 * products.MSRP;

-- no 3
select x.nama as pembimbingUtama , ss_mahasiswa.nama, y.nama as pembimbingPertama
from ss_mahasiswa
inner join ss_pembimbing on ss_mahasiswa.id_mahasiswa = ss_pembimbing.id_mahasiswa
inner join ss_dosen as x on x.id_dosen = ss_pembimbing.id_pembimbing_utama
inner join ss_dosen as y on y.id_dosen =ss_pembimbing.id_pembimbing_pertama
where ss_mahasiswa.nama = ('Sulaeman');

-- no 4 
alter table customers
add status varchar(50) default 'reguler' ;

update customers 
inner join payments on payments.customerNumber = customers.customerNumber
inner join orders on customer.customerNumber = orders.customerNumber
inner join orderdetails on orders.orderNumber = orderdetails.orderNumber
set customers.status = 'VIP'
where payments.amount > 99999 or orderdetails.quantityOrdered > 49;

 -- no 5
alter table orders drop
constraint orders_ibfk_1;
 
alter table orders 
add constraint orders_ibfk_1
foreign key (customerNumber) references customers (customerNumber)
on delete cascade;
 
alter table orderdetails drop
constraint orderdetails_ibfk_1;
 
alter table orderdetails 
add constraint orderdetails_ibfk_1
foreign key (orderNumber) references orders (orderNumber)
on delete cascade; 
 
alter table payments drop
constraint payments_ibfk_1;
 
alter table payments
add constraint payments_ibfk_1
foreign key (customerNumber) references customers (customerNumber)
on delete cascade;

delete customers from customers
join orders on customers.customerNumber = orders.customerNumber
where orders.status = 'cancelled';