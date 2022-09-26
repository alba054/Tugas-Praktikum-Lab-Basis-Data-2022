Create table office(
officeCode varchar(10) not null,
city varchar(50) not null,
phone varchar(50) not null,
addresline1 varchar(50) not null,
addresline varchar(50),
state varchar(50),
country varchar(50),
primary key (officeCode)
);
desc office;


ALTER TABLE office
MODIFY COLUMN phone int(20) not null;

desc office;

ALTER TABLE office drop addresline;







