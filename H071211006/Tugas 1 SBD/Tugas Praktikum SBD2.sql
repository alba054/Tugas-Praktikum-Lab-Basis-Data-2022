CREATE DATABASE db_praktikum;
CREATE TABLE buku (
judul VARCHAR (255),
`tahun terbit` INT,
pengarang VARCHAR (255),
id_buku INT AUTO_INCREMENT, -- AUTO_INCREMENT= agar bertambah sendiri apabila menambah data baru
PRIMARY KEY (id_buku));

CREATE TABLE mahasiswa(
nama VARCHAR (255),
nim VARCHAR (10) NOT NULL,
UNIQUE (nim),
jk CHAR (1),
id_mahasiswa BIGINT UNSIGNED AUTO_INCREMENT,
PRIMARY KEY (id_mahasiswa));
 
CREATE TABLE pinjam(
tgl_Pinjam DATETIME,
id_mahasiswa BIGINT UNSIGNED,
id_buku INT AUTO_INCREMENT,
status_pengembalian TINYINT(1),
id_pinjam INT UNSIGNED, -- tidak perlu menggunakan auto_increment karena pke foreign key jdi yg penting tipe datanya sama
PRIMARY KEY (id_pinjam),
FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa (id_mahasiswa), -- FOREIGN KEY=untuk menghubungkan suatu tabel ke tabel yg lainnnya
FOREIGN KEY (id_buku) REFERENCES buku (id_buku)
)

