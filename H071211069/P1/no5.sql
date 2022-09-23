Create Table buku(
buku varchar(225) not null,
tahun_terbit int not null,
pengarang varchar(225) not null,
id_buku int auto_increment,
Primary Key(id_buku)
);

Create table mahasiswa(
nama varchar(225) not null,
nim varchar(10) not null,
jk char(1) not null,
id_mahasiswa bigint unsigned  auto_increment,
UNIQUE(nim),
primary key(id_mahasiswa)
);

Create table pinjam(
tgl_pinjam datetime,
id_mahasiswa bigint unsigned ,
id_buku int,
status_pembelian tinyint(1) default'0',
id_pinjam int unsigned auto_increment,
primary key(id_pinjam),
CONSTRAINT fk_pinjam_buku FOREIGN KEY (id_buku) REFERENCES buku (id_buku),
CONSTRAINT fk_pinjam_mahasiswa FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa (id_mahasiswa)
);