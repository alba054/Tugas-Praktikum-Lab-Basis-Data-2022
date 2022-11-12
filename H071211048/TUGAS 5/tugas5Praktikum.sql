use classicmodels;
-- no1
select customers.customerName , comments, b.status
from customers
join orders as b on customers.customerNumber = b.customerNumber
where status = 'on hold' and comments like '%credit limit%';

-- no2
select customers.customerName, status, comments
from orders
join customers on customers.customerNumber = orders.customerNumber
where comments like '%DHL%';

-- no3
select customerName, productName, shippedDate, status
from products as a
join orderdetails as b on a.productCode = b.productCode
join orders as c on b.orderNumber = c.orderNumber
join customers as d on c.customerNumber = d.customerNumber
where productName like '%fer%' 
order by shippedDate desc;

-- no4
select customerNumber from customers
where customerName like '%anton%';
select productCode, productName, MSRP from products
where productName like '%ford%coupe';

insert into orders (customerNumber, orderNumber, orderDate, requiredDate, status)
values (465, 909, current_timestamp(), date_add(current_timestamp(), interval 1 year), 'in process') ;

insert into orderdetails (orderNumber, priceEach, productCode, quantityOrdered, orderLineNumber)
values (909, 62.46, 'S18_2957', 50, 99);
desc orderdetails;

select * from customers
join orders as a on customers.customerNumber = a.customerNumber
join orderdetails as b on a.orderNumber = b.orderNumber
join products as c on b.productCode = c.productCode
where customerName like '%anton%' and productName like '%ford%';