USE classicmodels;
SET autocommit = 0; 
-- Nomor 1
SELECT * FROM orders
-- WHERE customerNumber = 382;
-- SELECT * FROM orderdetails;

-- Nomor 1
-- BEGIN;
-- INSERT INTO orders
-- VALUE (10426, '2022-11-10', '2022-11-20', '2022-11-20', 'In Process', NULL, 382), 
-- 		(10427, '2022-11-10', '2022-11-20', '2022-11-20', 'In Process', NULL, 282),
-- 		(10428, '2022-11-10', '2022-11-20', '2022-11-20', 'In Process', NULL, 124);
-- INSERT INTO orderdetails
-- VALUE (10426, 'S18_1749', '30', NULL, NULL),
-- 		(10427, 'S18_2248', '30', NULL, NULL),
-- 		(10428, 'S18_4409', '20', NULL, NULL);usersusers
-- COMMIT;

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