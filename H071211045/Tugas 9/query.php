<?php
class MyQuery {
    public function __construct($conn) { // Konstruktor
        $this->conn = $conn;
    }
    
    public function showData() { // Menampilkan data pelanggan
        echo "\nDaftar Orderan :\n";
        echo "No.\tTanggal Order\t\t Nama Pelanggan \n";

        // TODO [1] : Buatkan query untuk menampilkan 5 data pelanggan terbaru berdasarkan waktu orderan
        $sql = "SELECT orderDate, customerNumber, customerName, phone, addressLine1, city, country, salesRepEmployeeNumber FROM customers 
        JOIN orders using (customerNumber) ORDER BY orderDate DESC
        LIMIT 5";

        // Jalankan Query dan Tampilkan
        $data = $this->conn->query($sql);
        $dataSet = array();
        
        if ($data->num_rows > 0) {
            $index = 1;
            while($row = $data->fetch_assoc()) {
                $dataSet[$index - 1] = $row['customerNumber'];
                printf("%d. \t%s \t\t %s\n", $index, $row['orderDate'], $row['customerName']);
                $index++;
            }
        
        } else {
            echo "Oops, tidak ada hasil yang ditemukan! :v";
        }

        return $dataSet;
    }

    public function updateName() { // Tampilkan nama dan pilih nama yang akan diubah
        $list = $this->showData();
        $input = -1;

        while ($input < 0 || $input > count($list)) {
            try {
                echo "\nPilih pelanggan yang ingin anda ubah (Sesuai Nomor)\n";
                $input = (int)readline("> ") - 1;
            } catch (Exception $e) {
                $input = -1;
                echo "Inputan anda salah, silahkan coba lagi\n";
            }
        }

        // debug check
        // foreach ($list as $key => $value) {
        //     echo $key . " => " . $value . "\n";
        // }
        
        echo "\nInput Nama Baru\n";
        $newName = readline("> ");

        // TODO [2] : Menonaktifkan autocommit
        $this->conn->autocommit(FALSE);

        // TODO [3] : Memulaikan sesi transaksi
        $this->conn->begin_transaction();

        // TODO [4] : Memasukkan query update nama berdasarkan id
        $sql = "UPDATE customers SET customerName = '$newName' WHERE customerNumber = $list[$input]";

        $this->conn->query($sql);
        $this->showData();

        while (true) {
            echo "Apakah anda yakin ingin mengubah nama tersebut? (Y/N)\n";
            $choice = readline("> ");
            $choice = strtolower($choice);

            if ($choice == 'y') {

                // TODO [5] : Melakukan commit transaksi
                $this->conn->commit();
                echo "Nama berhasil diubah\n";
                return;

            } else if ($choice == 'n') {

                // TODO [6] : Melakukan rollback transaksi
                $this->conn->rollback();
                echo "Nama tidak jadi diubah\n";
                return;

            } else {
                echo "Inputan anda salah, silahkan coba lagi\n";
                break;
            }
        }
    }
}