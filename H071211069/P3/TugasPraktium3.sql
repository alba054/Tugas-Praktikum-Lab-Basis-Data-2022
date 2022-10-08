-- no 1
Describe employees;
select * from employees;
insert into employees
values ('1032', 'Fatwa','Faiz','x1000','faizfatwa030206@gmail.com','1','1002','VP Marketing'),
	   ('1033', 'Fikri','Muhammad','x1005','fikri@gmail.com','2','1002','VP Marketing'),
       ('1034', 'gabriel','michael','x1010','mgabriel@gmail.com','3','1002','VP Marketing');
       

-- no 2
select * from offices;
insert into offices
values ('8', 'Makassar','+62 00 1111 2222','01 tamalanrea','floor #1','sulsel','IDN','01234','SEAN');

UPDATE employees
SET officeCode = "8"
where officeCode = "4" AND jobTitle = "Sales Rep";

-- no 3
DELETE FROM payments 
WHERE amount < 10000 ;

