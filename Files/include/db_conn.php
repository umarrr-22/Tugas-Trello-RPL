<?php
// Menampilkan semua error untuk debugging
error_reporting(E_ALL); 
ini_set('display_errors', 1); 

$host     = "localhost"; // Host name
$username = "root";      // MySQL username
$password = "";          // MySQL password
$db_name  = "sports_club"; // Nama database

// Connect ke server dan pilih database
$con = mysqli_connect($host, $username, $password, $db_name);

// Periksa koneksi
if (mysqli_connect_errno()) {
    // Jika gagal, tampilkan pesan error dan berhenti
    die("Gagal terhubung ke MySQL: " . mysqli_connect_error());
}

// Fungsi untuk melindungi halaman (cek apakah session valid)
function page_protect()
{
    session_start();
    
    global $con; // Pastikan menggunakan koneksi database global
    
    /* Mengamankan terhadap Session Hijacking dengan memeriksa user agent */
    if (isset($_SESSION['HTTP_USER_AGENT'])) {
        if ($_SESSION['HTTP_USER_AGENT'] != md5($_SERVER['HTTP_USER_AGENT'])) {
            session_destroy();
            echo "<meta http-equiv='refresh' content='0; url=../login/'>";
            exit();
        }
    }
    
    // Cek apakah ada session yang valid
    if (!isset($_SESSION['user_data']) && !isset($_SESSION['logged']) && !isset($_SESSION['auth_level'])) {
        session_destroy();
        echo "<meta http-equiv='refresh' content='0; url=../login/'>";
        exit();
    }
}
?>
