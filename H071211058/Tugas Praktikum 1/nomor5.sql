CREATE DATABASE perpus;

USE perpus;

CREATE TABLE buku
(
judul VARCHAR(255),
tahunterbit int,
pengarang VARCHAR(255),
id_buku int,
PRIMARY KEY(id_buku)
);

CREATE TABLE mahasiswa
(
nama VARCHAR(255),
nim VARCHAR(10),
jk CHAR(1),
id_mahasiswa bigint unsigned,
PRIMARY KEY(id_mahasiswa)
);

CREATE TABLE pinjam
(
tgl_pinjam datetime,
id_mahasiswa bigint unsigned,
id_buku int,
status_pengembalian tinyint(1),
id_pinjam int unsigned
);
