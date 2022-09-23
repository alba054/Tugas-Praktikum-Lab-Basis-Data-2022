CREATE TABLE offices(
officeCode varchar(10) not null,
city varchar(50) not null,
phone varchar(50) not null,
addresline1 varchar(50) not null,
addresline2 varchar(50),
state varchar(50),
country varchar(50) not null,
primary key(officeCode)
);

describe offices;
Alter table offices
modify column phone int(20) not null,
drop column addresline2;
describe offices;