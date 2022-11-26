-- Active: 1663738801222@@127.0.0.1@3306@classicmodels
use classicmodels;

-- [NO.1] Dengan menggunakan database “classicmodels”, tambahkan 3 data ke 
-- dalam tabel orders dan orderdetails setelah itu lakukan perintah commit:
-- delete from orders where comments like '%Bruhh%'; -- debug
SELECT * FROM orders ORDER BY `orderNumber` desc;
set AUTOCOMMIT=0;
select orderDate + INTERVAL 100 DAY from orders ORDER BY orderDate desc limit 1;
begin;
INSERT INTO orders VALUES (
    (select max(orderNumber) + 1 FROM orders as t), -- orderNumbeer
    (select orderDate + INTERVAL 10 DAY from orders as t ORDER BY orderDate desc limit 1), -- orderDate
    (select orderDate + INTERVAL 100 DAY from orders as t ORDER BY orderDate desc limit 1), -- reqDate
    (select orderDate + INTERVAL 100 DAY from orders as t ORDER BY orderDate desc limit 1), -- shippedDate
    'Shipped', 
    'Bruh', 
    '125'    
), (
    (select max(orderNumber) + 2 FROM orders as t), -- orderNumbeer
    (select orderDate + INTERVAL 15 DAY from orders as t ORDER BY orderDate desc limit 1), -- orderDate
    (select orderDate + INTERVAL 150 DAY from orders as t ORDER BY orderDate desc limit 1), -- reqDate
    (select orderDate + INTERVAL 200 DAY from orders as t ORDER BY orderDate desc limit 1), -- shippedDate
    'Shipped', 
    'Breh', 
    '119'  
), (
    (select max(orderNumber) + 3 FROM orders as t), -- orderNumbeer
    (select orderDate + INTERVAL 20 DAY from orders as t ORDER BY orderDate desc limit 1), -- orderDate
    (select orderDate + INTERVAL 250 DAY from orders as t ORDER BY orderDate desc limit 1), -- reqDate
    (select orderDate + INTERVAL 300 DAY from orders as t ORDER BY orderDate desc limit 1), -- shippedDate
    'Shipped', 
    'Brohh', 
    '141'  
);
commit;

-- [NO.2] Hapus seluruh data dari tabel orders details dan gunakan perintah 
-- ROLLBACK untuk mengembalikan data tersebut
SELECT * FROM orderdetails;z
begin;
delete from orderdetails;
rollback;