Create table buku(
id_buku int(10) not null,
judul varchar(255)not null,
tahun_terbit int(10)not null,
pengarang varchar(255) not null,
primary key (id_buku)
);
desc buku;

ALTER TABLE buku
MODIFY COLUMN id_buku INT auto_increment;

Create table mahasiswa(
id_mahasiswa varchar(255) not null,
nama varchar(255)not null,
nim varchar(10)not null,
jk char(1) not null,
primary key (id_mahasiswa)
);

ALTER TABLE mahasiswa
MODIFY COLUMN id_mahasiswa bigint auto_increment;


create table pinjam (
id_pinjam int not null,
tanggal datetime,
status_pengembalian tinyint(1) default'0',
primary key (id_pinjam)
);
ALTER TABLE pinjam
MODIFY COLUMN id_pinjam bigint auto_increment;


ALTER TABLE pinjam
ADD COLUMN id_buku int auto_increment,
Add column id_mahasiswa bigint auto_increment,
ADD CONSTRAINT id_mahasiswa FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa (id_mahasiswa),
ADD CONSTRAINT id_buku FOREIGN KEY (id_buku) REFERENCES buku (id_buku);




