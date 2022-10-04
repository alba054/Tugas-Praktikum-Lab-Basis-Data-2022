-- use classicmodels;

select*from employees;

-- no 1 :
insert into employees
values(0001,'san','oreki','x1111','oree@classicmodels.com','1',0002,'husbuu'), (0002,'wasuu','peem','x2222','peem@classicmodels.com','2',0003,'student'), (0003,'adha putri', 'aulia', 'x3333','liaa@classicmodels.com','3',0004,'student');

-- no 2 :

select*from offices;

insert into offices -- (officeCode, city, phone, addressLine1,addressLine2,state,country,postalCode,territory)
value('8','makassar','+62 2728 3283 2222','','','daya','indonesian','92745','INA');

select*from employees;
update employees
set officeCode= 8
where officeCode = 4 and jobTitle='Sales Rep';

-- no 3 :

select*from payments;
delete from payments where amount < 10000
