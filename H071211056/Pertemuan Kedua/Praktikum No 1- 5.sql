Use Classicmodels;
-- Nomor 1
SELECT * FROM offices where City = 'san francisco';

-- Nomor 2
select * from orderdetails where quantityOrdered > 70 order by orderLineNumber Asc;


-- Nomor 3
select distinct productLine from products;

-- Nomor 4
select customerNumber as `Nomor Konsumen`, customerName as `Nama Konsumen` from customers 
where customerNumber > 100 and customerNumber < 150;

-- Nomor 5
select * from customers where country != "USA" and creditLimit = 0 order by customerName asc limit 10,10; 

