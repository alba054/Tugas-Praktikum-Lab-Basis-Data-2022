create database db_praktikum
use db_praktikum

create table buku (
id_buku int auto_increment primary key,
judul varchar (255),
tahun_terbit int,
pengarang varchar (255)
);

create table mahasiswa (
id_mahasiswa bigint unsigned auto_increment,
nama varchar (255),
nim varchar (10) not null,
jk char (1),
primary key (id_mahasiswa, nim)
);

create table pinjam(
id_pinjam int unsigned auto_increment primary key,
tgl_pinjam date,
id_mahasiswa bigint unsigned,
id_buku int,
status_pengembalian tinyint (1) default 0,
foreign key (id_mahasiswa) references mahasiswa (id_mahasiswa),
foreign key (id_buku) references buku (id_buku)
);

desc pinjam