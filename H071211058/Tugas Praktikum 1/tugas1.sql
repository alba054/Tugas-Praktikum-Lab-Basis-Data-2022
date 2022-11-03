CREATE DATABASE kantor;

USE kantor;

CREATE TABLE offices
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

DESCRIBE OFFICES;

ALTER TABLE offices MODIFY phone INT(20);

ALTER TABLE offices DROP COLUMN addressline2;







