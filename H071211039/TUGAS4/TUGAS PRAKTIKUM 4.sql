USE classicmodels;

#1. Tampilkan kolom tanggal pemesanan product dalam urutan menurun untuk pesanan ford pickup truck
-- SELECT orders.orderDate, products.productName 
-- FROM orders
-- JOIN orderdetails
-- ON orders.orderNumber = orderdetails.orderNumber
-- JOIN products
-- ON orderdetails.productCode = products.productCode
-- WHERE products.productName like "%truck%" ORDER BY orders.orderDate DESC
 
#2. Tampilkan daftar nama produk yang dijual dengan harga kurang dari 80%
-- select p.productName, P.MSRP  * 0.8 as '80% dari MRSP', od.priceEach
-- from products as p
-- inner join orderdetails as od
-- on p.productCode = od.productCode
-- where priceEach < 0.8 * MSRP;

-- USE appseminar;
#3. Tampilkan pembimbing  utama dan mahasiswa bernama sulaeman
-- select ss_mahasiswa.nama as NamaMahasiswa, ss_dosen.nama as PembimbingUtama
-- from ss_mahasiswa
-- inner join ss_pembimbing
-- on ss_mahasiswa.id_mahasiswa = ss_pembimbing.id_mahasiswa
-- inner join ss_dosen
-- on ss_pembimbing.id_pembimbing_utama = ss_dosen.id_dosen
-- where ss_mahasiswa.nama = 'Sulaeman';

#4.
#-Buat kolom baru dengan nama status yang bertipe data varchar pada tabel customer
-- ALTER TABLE customers
-- DROP column status
-- ALTER TABLE customers
-- ADD status Varchar (200) DEFAULT 'Reguler';

#-isi dengan nilai 'VIP' untuk pelanggan yang jumlah pembayarannya pernah diatas 100.000 atau yang pernah mengorder barang dengan kuantitas 50 keatas
-- update customers
-- inner join  payments
-- on customers.customerNumber = payments.customerNumber
-- inner join orders
-- on payments.customerNumber = orders.customerNumber
-- inner join orderdetails
-- on orders.orderNumber = orderdetails.orderNumber
-- set customers.status = 'VIP'
-- where payments.amount > 100000 or orderdetails.quantityOrdered > 50

-- select payments.amount, orderdetails.quantityOrdered, customers.status
-- from customers
-- inner join  payments
-- on customers.customerNumber = payments.customerNumber
-- inner join orders
-- on payments.customerNumber = orders.customerNumber
-- inner join orderdetails on orders.orderNumber = orderdetails.orderNumber

# - sisanya isi dengan nilai 'Regular' 
-- update customers
-- set status = 'Reguler'
-- where status is null

-- 5.Hapuslah semua data pelanggan yang pernah membatalkan pesanan
-- DELETE FROM orders WHERE status = 'cancelled';

-- ALTER TABLE orders 
-- DROP foreign key orders_ibfk_1;

-- ALTER TABLE orderdetails
-- DROP foreign key orderdetails_ibfk_1;

-- SELECT customers.customerName, orders.status
-- FROM customers
-- JOIN orders
-- ON customers.customerNumber = orders.customerNumber
-- WHERE orders.status = "cancelled";






 
 

