USE classicmodels;
SET autocommit = 0; 

-- Nomor 1
SELECT * FROM orders

BEGIN;

SELECT @orderNumber:=max(orderNumber)+1 FROM orders;
INSERT INTO orders(orderNumber, orderDate, requiredDate, shippedDate, STATUS, customerNumber)
VALUES (@orderNumber, '2022-11-22', '2022-11-30', '2022-11-25', 'In Process', 382);
INSERT INTO orderdetails(orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
VALUES (@orderNumber, 'S10_1678', '20', '110.46', '15');

SELECT @orderNumber:=max(orderNumber)+1 FROM orders;
INSERT INTO orders(orderNumber, orderDate, requiredDate, shippedDate, STATUS, customerNumber)
VALUES (@orderNumber, '2022-10-21', '2022-11-27', '2022-11-23', 'In Process', 282);
INSERT INTO orderdetails(orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
VALUES (@orderNumber, 'S32_1374', '25', '150.55', '20');

SELECT @orderNumber:=max(orderNumber)+1 FROM orders;
INSERT INTO orders(orderNumber, orderDate, requiredDate, shippedDate, STATUS, customerNumber)
VALUES (@orderNumber, '2022-11-20', '2022-11-19', '2022-11-14', 'In Process', 124);
INSERT INTO orderdetails(orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
VALUES (@orderNumber, 'S50_4713', '22', '100.76', '10');

COMMIT;

-- 
-- Nomor 2
BEGIN;
DELETE FROM orderdetails;
ROLLBACK;
SELECT COUNT(*) FROM orderdetails;