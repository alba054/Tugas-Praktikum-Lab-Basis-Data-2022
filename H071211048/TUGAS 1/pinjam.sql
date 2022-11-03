create table buku(
id_buku int not null auto_increment,
judul varchar (255) not null,
tahun int not null,
pengarang varchar (255) not null,
primary key (id_buku));

create table mahasiswa (
id_mahasiswa bigint unsigned auto_increment,
nama varchar (255) not null,
nim varchar (10) not null,
UNIQUE(nim),
jk char (1) not null,
primary key (id_mahasiswa));

create table pinjam (
id_pinjam int unsigned auto_increment,
tgl_pinjam datetime,
id_mahasiswa bigint unsigned ,
id_buku int ,
status_pengembalian tinyint(1) default 0,
primary key (id_pinjam),

foreign key (id_mahasiswa) references mahasiswa (id_mahasiswa),
foreign key (id_buku) references buku (id_buku)
);
 desc pinjam;
 
show create table pinjam;

