use classicmodels;

-- no1
select customers.customerName as pengguna, max(payments.amount) as 'pembayaran terbesar', min(payments.amount) as 'pembayaran terkecil'
from payments
join customers on customers.customerNumber = payments.customerNumber
where customers.customerName in(
	select customerName from customers)
    group by customerName;
    

-- no2
select * from employees
where officeCode = (
	select officeCode  from employees 
    group by officeCode
    having count(firstName) = (
		select max(jumlah) from (
			select count(firstName) as jumlah
            from employees group by officeCode
		) as a
	)
);

-- no3
select productName, productScale
from products
where productName in (
	select productName from products where productName like '%ford%');

-- no4
select customerName, concat(e.firstName, ' ', e.lastName) as 'employeeName', o.orderNumber, sum(ord.priceEach*ord.quantityOrdered) as 'Biaya Pesanan' 
from customers c
join employees e on c.salesRepEmployeeNumber = e.employeeNumber
join orders o on c.customerNumber = o.customerNumber
join orderdetails ord on o.orderNumber = ord.orderNumber 
group by o.orderNumber, customerName, employeeName
having sum(ord.priceEach*ord.quantityOrdered) = (
	select max(a) from (
		select sum(ord.priceEach*ord.quantityOrdered) as a 
		from orderdetails ord
		group by orderNumber) as b);

-- no5
select distinct country, length(country) as 'panjang karakter' from customers
where length(country) = (
	select min(length(country)) as 'terpendek' from customers )
    or
    length(country) =  (select max(length(country)) as 'terpanjang' from customers);