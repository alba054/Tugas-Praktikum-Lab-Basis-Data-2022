use classicmodels;

-- nomor 1
insert into employees
values ('1042','Fikri','Muhammad','x2000','fikri202@gmail.com','2','1143','Mahasiswa'),
('1044','razka','Muhammad','x3000', 'azka123@gmail.com','2','1143','Mahasiswa'),
('1045','raffasya','Muhammad','x4000','aca505@gmail.com','2','1143','Mahasiswa');

select * from employees;

-- nomor 2
select * from offices;
insert into offices (officeCode,city,phone,addressLine1,addressLine2,state,country,postalCode,territory)
values ('8','Luwu Timur','+62 21 9878 3987','202 Malili','apt. 6A','lutim','indonesia','20210','SEAN');

update employees set officeCode = '8'
where officeCode = '4' and jobTitle = 'Sales Rep';

-- nomor 3
select * from payments where amount < 10000;
delete from payments
where amount < 10000;































