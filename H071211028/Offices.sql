create database offices1
use offices1
create table offices(
officeCode varchar (10) not null,
city varchar (50) not null,
phone varchar (50) not null,
addressline1 varchar (50) not null,
adddressline2 varchar (50),
state varchar (50),
country varchar(50) not null,
primary key (officeCode)
);

desc offices

alter table offices
modify phone int (20);

desc offices

alter table offices
drop adddressline2;

desc offices