CREATE TABLE offices (
officeCode VARCHAR (10) NOT NULL,
city VARCHAR (50) NOT NULL,
phone VARCHAR (50) NOT NULL,
adressline1 VARCHAR (50) NOT NULL,
addresline2 VARCHAR (50),
state VARCHAR (50),
country VARCHAR (50) NOT NULL,
PRIMARY KEY (officeCode));

DESCRIBE offices;
 
ALTER TABLE offices
MODIFY COLUMN phone INT(20); 

ALTER TABLE offices
DROP COLUMN addresline2; 
