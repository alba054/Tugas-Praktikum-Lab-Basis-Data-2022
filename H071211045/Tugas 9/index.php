<?php
include 'query.php';

// Konfigurasi koneksi database tergantung usernam dan servername
$serverName = 'localhost';
$username = 'root';
$password = '';
$dbName = 'classicmodels';

// Koneksi ke database
$conn = new mysqli($serverName, $username, $password, $dbName);

// Cek koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Memulai Fungsi
$query = new MyQuery($conn);
while (true) {
    echo "Tugas Praktikum 9 - Transaksi Database\n";
    echo "1. Tampilkan Data Pelanggan\n";
    echo "2. Ubah Nama Pelanggan\n";
    echo "0. Keluar\n";

    // Membaca Inputan
    $input = (int)readline("> ");

    // Meinjau inputan
    switch ($input) {
        case 0 :
            echo "Terima kasih telah menggunakan program ini\n";
            // exit();
            return;
        case 1 :
            $query->showData();
            echo "\n";
            break;

        case 2 :
            $query->updateName();
            echo "\n";
            break;

        default :
            echo "Inputan anda salah, silahkan coba lagi\n";
            break;
    }
}