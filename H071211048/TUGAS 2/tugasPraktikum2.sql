 select * from offices where city = "san francisco";

select * from orderdetails
where quantityOrdered > 70 order by  quantityOrdered asc;

select distinct productLine from products;

select customerNumber as keluaran, customerName from customers
where customerNumber between 100 and 150;

select * from customers
where country !=("USA") and creditLimit = 0
order by customerName desc
limit 10,10;
