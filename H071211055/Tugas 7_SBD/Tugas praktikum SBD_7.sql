-- use classicmodels;

-- no 1 :
select max(p.amount) as 'Terbesar', min(p.amount) as 'Terkecil'
from customers as c
inner join payments as p
on c.customerNumber = p.customerNumber
where payments.amount in
(select amount from payments group by c.customerNumber);

-- no 2:
select e.employeeNumber,
concat(e.firstName, ' ', e.lastName) as 'Karyawan', 
e.officeCode, e.jobTitle
from employees as e
where officeCode =
(select officeCode KodeKantor from employees 
group by officeCode
having count(employeeNumber) = 
	(select max(Code.KodeKantor) as 'Banyaknya Karyawan' 
    from (select officeCode, count(employeeNumber) as KodeKantor
    from employees 
    group by officeCode) as Code));
 
select*from employees;
select*from offices;


-- no 3:
 select p.productName, p.productScale
 from products as p
 where p.productName in
 (select products.productName from products
 where products.productName like '%Ford%');
 
-- no 4:
select customerName as 'Nama Pelanggan',
concat(e.firstName, e.lastName) as 'Nama Karyawan', 
o.orderNumber, sum(priceEach * quantityOrdered) as Pesanan , od.priceEach as 'Biaya Pesanan'
from  orderdetails as od
inner join orders as o
on o.orderNumber = od.orderNumber
inner join customers as c
on c.customerNumber = o.customerNumber
inner join employees as e
on e.employeeNumber = c.salesRepEmployeeNumber
group by orderNumber 
having sum(priceEach * quantityOrdered) =
(select max(TotalOrder.Pesanan) 
from (select sum(priceEach * quantityOrdered) Pesanan
	  from orderDetails
      group by orderNumber) as TotalOrder);


select*from employees;
select*from customers;
select*from orderdetails;
select*from orders;

-- no 5:
select distinct country, length(country) as 'Panjang karakter'
from customers as c
where length(country)=
(select max(length(country)) as 'Karakkter Terbesar' 
from customers)
or length(country) = 
(select min(length(country)) as 'Karakter Terkecil' 
from customers);

