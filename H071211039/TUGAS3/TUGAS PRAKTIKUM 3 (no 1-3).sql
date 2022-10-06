#USE classicmodels;

-- No 1.Tambahkanlah 3 orang employee baru pada tabel employees dalam database Classic Models
-- dengan salah satu nama employee merupakan nama anda
-- INSERT INTO employees 
-- VALUES ( 4 ,'Sahriyuni', 'Besse', 'H123', 'Bessesahriyuni@gmail.com', '3', 1102, 'Sales Rep'),
--  ( 5 ,'Hamdayani', 'Isty', 'H234', 'istyhamdayani11@gmail.com', '3', 1102, 'Sales Rep'),
--  ( 6 ,'Puspita', 'Adelia', 'H456', 'Bessesahriyuni@gmail.com', '3', 1102, 'Sales Rep');

-- NO 2. Dalam database classic models, sebuah kantor baru didirikan untuk para karyawannya
-- (employee). Pihak pengelola database ingin memindahkan beberapa karyawan ke kantor
-- baru tersebut. Buatlah sebuah query untuk memindahkan karyawan berjabatan Sales Rep
-- dari kantor 4, ke kantor yang baru!
-- INSERT INTO offices
-- VALUES ( '8', 'Makassar', '085283599896', 'Perintis Kemerdekaan 7', 'Gedung Warna oren', 'ID', 'INDONESIA', '5432', 'MKSR');

-- UPDATE employees
-- SET officeCode = '8'
-- WHERE officeCode = '4' AND jobTitle = 'Sales Rep';


-- NO 3. Tambahkan data pada tabel mahasiswa dengan data nya adalah semua nama praktikan pada
-- gb asistensi anda ( Baris yang pertama merupakan nama anda) dengan menggunakan
-- perintah insert disertai nama kolomnya 
-- ALTER TABLE mahasiswa
-- MODIFY No_telp varchar (20) NOT NULL,
-- MODIFY Alamat varchar (100),
-- MODIFY Email varchar (50) not null,
-- MODIFY Keterangan varchar (20) ;

-- INSERT INTO mahasiswa ( nama, nim, jk, no_telp, email, alamat, keterangan)
-- values
-- ( 'Isty Hamdayani', 'H071211039', 'P', '0363889', 'istyhamdayani11@gmail.com', 'Perintis KEMERDEKAAN 7', 'Semester 3'),
-- ( 'Muhammad Kahfi M.S', 'H071211028', 'L', '081234567','kahfi@gmail.com', 'Jl. Tanjyng Raya', 'Semester 3'),
-- ( 'Muhammad Khaibar Akbar', 'H071211020', 'L', '09988765', 'khaibar@gmail.com', 'takalar', 'Semester 3'),
-- ( 'Aditya Erlangga Bagaskara', 'H071211053', 'L', '098766798', 'aditya@gmail.com', 'Jl. Perintis Kemerdekaan', 'Semester 3'),
-- ( 'Wirya Olivia', 'H071211033', 'p', '0990876555', 'muhalfudhail@gmail.com', 'Jl. Perintis Kemerdekaan', 'Semester 3'),
-- ( 'Muhammad Reza Hasan', 'H071211010', 'L', '009887766', 'rezahasan@gmail.com', 'Jl. Sultan Alauddin', 'Semester 3'),
-- ( 'Muhammad Arif', 'H071211004', 'L', '7452886482', 'muharif@gmail.com', 'Jl. Sultan Alauddin', 'Semester 3'),
-- ( 'Fitrah Ramadhan', 'H071211017', 'L', '083937464', 'fitrarmd@gmail.com', 'Jl. Andi Tonro', 'Semester 3'),
-- ( 'Asehpryanto Rari Parinding', 'H071211065', 'L', '7274918397', 'asehpryanto@gmail.com', 'Jl. Andi Tonro','Semester 3'),
-- ( 'Muhammad Raihan ARADHANA', 'H071211075', 'L', '137878489', 'Raihan@gmail.com', 'Jl. Urip Sumarjo', 'Semester 3'),
-- ( 'Andi Muh.Noval Fahresi B', 'H081211088', 'L', '67238344', 'andimuhnoval@gmail.com', 'Jl. UripSumarjo', 'Semester 3'),
-- ( 'Hafiedz Hasmy Hamid', 'H071211085', 'L', '66284992724', 'hafiedz@gmail.com', 'Jl. Pendidikam', 'Semester 3'),
-- ( 'Dewa Rescue Virgiawansyah', 'H071211072', 'L', '647872378317', 'dewa@gmail.com', 'Jl. Pendidikan', 'Semester 3');


