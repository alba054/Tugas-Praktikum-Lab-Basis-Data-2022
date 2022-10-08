USE db_praktikum;
ALTER TABLE mahasiswa
MODIFY no_telp VARCHAR(20) NOT NULL,
MODIFY alamat VARCHAR(100),
MODIFY email VARCHAR(50) NOT NULL,
MODIFY keterangan VARCHAR(20);

-- Nomor 3
INSERT INTO mahasiswa (nama, nim, jk, no_telp, email, alamat, keterangan)
VALUES
('Eka Hanny Oktavia', 'H071211058', 'P', '089695453002', 'ekahnny@gmail.com', 'Jln. Makkio Baji IV', 'Semester 3'),
('Wirya Olivia', 'H071211048', 'P', '081258851575', 'wiryaolivia@gmail.com', 'Jln. Urip', 'Semester 3'),
('Aulia Adha Putri', 'H071211055', 'P', '085387663152', 'auliaadha07@gmail.com', 'Jln. BTP', 'Semester 3'),
('Muhammad Faiz F. Syarifuddin', 'H071211069', 'L', '085342291413', 'faizfatwa@gmail.com', 'Jln. Nuri No. 121 Kota Palopo', 'Semester 3'),
('Muhammad Fikri', 'H071211056', 'L', '082292432995', 'muhfikri@gmail.com', 'Luwu Timur', 'Semester 3'),
('Aditya Erlangga Bagaskara', 'H071211053', 'L', '08114447121', 'adityaerlangga@gmail.com', 'Jl. Abdur Kadir', 'Semester 3'),
('Nur Hikmah', 'H071211006', 'P', '083131422710', 'nurhikmah@gmail.com', 'Aluppang, Kab. Pinrang', 'Semester 3'),
('Muhammad Kahfi MS', 'H071211028', 'L', '085212191271', 'kahfims@gmail.com', 'BTP Jl. Kerukunan Timur', 'Semester 3'),
('Muhammad Khaibar Akbar', 'H071211020', 'L', '082193121763', 'khaibar02@gmail.com', 'Kab. Takalar', 'Semester 3'),
('Muhammad Sofyan Daud Pujas', 'H071211045', 'L'  '085215702573', 'sofyanpujas@gmail.com', 'Jl. Sahabat', 'Semester 3');

-- Nomor 4
INSERT INTO buku
VALUES  ('Laut Bercerita', 2017, 'Leila S. Chudori', 1),
        ('Cantik Itu Luka', 2002, 'Eka Kurniawan', 2),
        ('Pagi Di Amerika', 2004, 'Hikmat Darmawan', 3),
        ('Bumi', 2014, 'Tere Liye', 4),
        ('1Q84', 2009, 'Haruki Murakami', 5);

INSERT INTO pinjam
VALUES ('2022-01-10', 1, 1, 0, NULL),
       ('2022-02-10', 2, 5, 0, NULL),
       ('2022-03-10', 5, 3, 1, NULL),
       ('2022-04-10', 4, 2, 0, NULL),
       ('2022-05-10', 2, 4, 1, NULL);
       
-- Nomor 5
INSERT INTO  mahasiswa (NIM, Nama, No_telp, Alamat, Email, Keterangan)
VALUES  ('H071211099', 'Andi', '081234567891', '', 'andi@gmail.com', 'SEMESTER 9'),
        ('H071211088', 'Ratu', '08974036521', NULL, 'ratu@gmail.com', 'SEMESTER 11');





