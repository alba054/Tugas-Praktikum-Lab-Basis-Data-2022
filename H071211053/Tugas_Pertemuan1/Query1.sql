create database office;
use office;
create table offices
(
officeCode VARCHAR(50) NOT NULL,
city VARCHAR(50) NOT NULL, 
phone VARCHAR(50) NOT NULL, 
addresline1 VARCHAR(50) NOT NULL,
addressline2 VARCHAR(50),
state VARCHAR(50), 
country VARCHAR(50),
PRIMARY KEY(officeCode)
);
describe offices;
alter table offices modify phone int(20);
alter table offices drop addressline2;