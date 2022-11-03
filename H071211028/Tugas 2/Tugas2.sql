select * from offices where city="san francisCo";
select * from orderdetails where quantityOrdered > 70 order by orderLineNumber;
select distinct productLine from products;
select customerNumber as nomorkastomer, customerName as namakastomer from customers where customerNumber > 100 and customerName < 150;
SELECT customerNumber from customers order by customerNumber limit 99,51;
select * from customers where city !="USA" and creditLimit =0 order by customerName asc limit 9,10;

-- cari customers yang awal kotanya huruf M, tampilkan cutomers creditlimit top 5
select * from customers where creditlimit !=0 and city like 'M%' order by creditlimit limit 5;