select * from offices;
select * from employees;
select * from payments;

#NO.1
insert into employees
values(2002,'Kahfi','Muhammad','x32','muhkahfims@gmail.com',4,1102,'Web Developer'),
(2003,'Wulan','Astrina','x64','astrinawulanputri@gmail.com',3,1102,'Seles Rep'),
(2004,'Aska','Kenzo','x102','kenzo0202@gmail.com',4,1102,'Sales Rep');

#NO.2
insert into offices
values(8,'Makassar','085212191271','BTP JL.Kerukunan Timur 18 Blok H NO.547',NULL,'Sulsel','Indonesia','90245','Sulawesi');

update employees
set officeCode = 8
where officeCode ='4' and jobTitle='Sales Rep';

#NO.3
delete from payments
where amount <10000;