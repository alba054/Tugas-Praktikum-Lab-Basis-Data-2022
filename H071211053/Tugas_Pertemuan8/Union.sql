USE appseminar;
#No 1
SELECT ssd.nama 'Nama',nip 'NIP/NIM',ssp.nama
FROM ss_dosen ssd
JOIN ss_prodi ssp ON ssp.id_prodi = ssd.id_prodi
WHERE ssd.id_prodi = 'H07'
UNION
SELECT ssm.nama 'Nama',ssm.nim 'NIP/NIM',ssp.nama
FROM ss_mahasiswa ssm
JOIN ss_prodi ssp ON ssp.id_prodi = ssm.id_prodi
WHERE ssm.id_prodi = 'H07';

#No 2
USE appseminar;
SELECT `Nama Dosen`,`Prodi`,GROUP_CONCAT(`Status`) 'Riwayat' FROM (
SELECT ss_dosen.nama 'Nama Dosen',ss_prodi.nama 'Prodi',(
SELECT 'Penguji 1' WHERE ss_penguji.id_penguji_1 = ss_dosen.id_dosen)  'Status'
FROM ss_dosen INNER JOIN ss_prodi ON ss_prodi.id_prodi = ss_dosen.id_prodi
,ss_penguji
WHERE (
SELECT 'Penguji 1' WHERE ss_penguji.id_penguji_1 = ss_dosen.id_dosen) IS NOT NULL
UNION
SELECT ss_dosen.nama 'Nama Dosen',ss_prodi.nama 'Prodi',(
SELECT 'Penguji 2' WHERE ss_penguji.id_penguji_2 = ss_dosen.id_dosen)  'Status'
FROM ss_dosen INNER JOIN ss_prodi ON ss_prodi.id_prodi = ss_dosen.id_prodi
,ss_penguji
WHERE (
SELECT 'Penguji 2' WHERE ss_penguji.id_penguji_2 = ss_dosen.id_dosen) IS NOT NULL
UNION
SELECT ss_dosen.nama 'Nama Dosen',ss_prodi.nama 'Prodi',(
SELECT 'Pembimbing Pertama' WHERE ss_pembimbing.id_pembimbing_pertama = ss_dosen.id_dosen)  'Status'
FROM ss_dosen INNER JOIN ss_prodi ON ss_prodi.id_prodi = ss_dosen.id_prodi
,ss_pembimbing
WHERE (
SELECT 'Pembimbing Pertama' WHERE ss_pembimbing.id_pembimbing_pertama = ss_dosen.id_dosen) IS NOT NULL
UNION
SELECT ss_dosen.nama 'Nama Dosen',ss_prodi.nama 'Prodi',(
SELECT 'Pembimbing Utama' WHERE ss_pembimbing.id_pembimbing_utama = ss_dosen.id_dosen) 'Status'
FROM ss_dosen INNER JOIN ss_prodi ON ss_prodi.id_prodi = ss_dosen.id_prodi
,ss_pembimbing
WHERE (
SELECT 'Pembimbing Utama' WHERE ss_pembimbing.id_pembimbing_utama = ss_dosen.id_dosen) IS NOT NULL) Riwayat
GROUP BY(`Nama Dosen`)
ORDER BY(`Nama Dosen`) DESC;

#No 3
USE classicmodels;

SELECT city FROM (SELECT c.customerName,c.city
FROM customers c
WHERE c.customerName LIKE 'L%'
UNION ALL
SELECT CONCAT(emp.firstName,' ',emp.lastName) 'Nama',o.city
FROM employees emp
INNER JOIN offices o ON o.officeCode = emp.officeCode
WHERE emp.firstName LIKE 'L%') AS IDK
GROUP BY (city)
ORDER BY (COUNT(city)) DESC LIMIT 1;