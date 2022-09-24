create database db_praktikum;
use db_praktikum;
create table buku
(
id_buku INT auto_increment PRIMARY KEY,
judul varchar(255),
`tahun terbit` int,
pengarang varchar(255)
);

create table mahasiswa
(
id_mahasiswa bigint unsigned auto_increment PRIMARY KEY,
nama varchar(255),
nim varchar(10) not null,
jk char(1),
unique (nim)
);

create table pinjam
(
id_pinjam int unsigned auto_increment PRIMARY KEY,
tgl_pinjam datetime,
id_mahasiswa bigint unsigned,
id_buku int,
status_pengembalian tinyint(1) default 0,
foreign key (id_buku) references buku (id_buku),
foreign key (id_mahasiswa) references mahasiswa (id_mahasiswa)
);