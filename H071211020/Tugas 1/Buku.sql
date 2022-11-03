-- CREATE DATABASE db_praktikum
-- USE db_praktikum

-- CREATE TABLE Buku (
-- id_buku INT auto_increment,
-- Judul VARCHAR(255),
-- `tahun terbit` INT,
-- pengarang VARCHAR(255),
-- PRIMARY KEY (id_buku)
-- );
-- 
-- CREATE TABLE Mahasiswa(
-- id_mahasiswa bigint UNSIGNED auto_increment,
-- nama VARCHAR(255),
-- Nim VARCHAR(10) NOT NULL,
-- jk CHAR(1),
-- PRIMARY KEY (id_mahasiswa)
-- );

CREATE TABLE Pinjam(
id_pinjam INT UNSIGNED AUTO_INCREMENT,
tgl_pinjam DATETIME,
id_mahasiswa BIGINT unsigned,
id_buku int,
status_pengembalian TINYINT (1),
PRIMARY KEY (id_pinjam),
CONSTRAINT fk_mahasiswa FOREIGN KEY (id_mahasiswa) REFERENCES Mahasiswa(id_mahasiswa),
CONSTRAINT fk_buku FOREIGN KEY (id_buku) REFERENCES Buku (id_buku)
);

 