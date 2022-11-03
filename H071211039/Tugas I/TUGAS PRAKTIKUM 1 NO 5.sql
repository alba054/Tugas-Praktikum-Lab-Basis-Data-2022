-- CREATE DATABASE db_praktikum ;
-- USE db_praktikum ;


-- CREATE TABLE buku (
-- id_buku int auto_increment,
-- judul varchar(225),
-- tahun_terbit int,
-- Pengarang varchar (225),
-- primary key (id_buku)
-- );

-- DESC buku;

-- CREATE TABLE mahasiswa (
-- id_mahasiswa bigint unsigned auto_increment,
-- nama varchar (225),
-- nim varchar (10),
-- jk char (1),
-- primary key (id_mahasiswa)
-- );

-- DESC mahasiswa;

-- CREATE TABLE pinjam (
-- id_pinjam int unsigned auto_increment,
-- tgl_pinjam datetime,
-- id_mahasiswa bigint unsigned,
-- id_buku int,
-- status_pengembalian tinyint(1),
-- primary key (id_pinjam),
-- foreign key (id_mahasiswa) references mahasiswa (id_mahasiswa),
-- foreign key (id_buku) references buku (id_buku)
-- );

-- DESC pinjam;

#insert into mahasiswa (nama, nim, jk) values ("Budi", "H071191000", "L");
#insert into mahasiswa (nama, nim, jk) values ("Joko", "H071201000", "L");
#insert into mahasiswa (nama, nim, jk) values ("Budi", "H071191000", "");
#insert into mahasiswa (nama, nim, jk) values ("Budi", "H071191000", "P");

#select * from mahasiswa;