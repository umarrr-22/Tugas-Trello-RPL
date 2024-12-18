<?php
// Menampilkan semua error untuk debugging
error_reporting(E_ALL); 
ini_set('display_errors', 1);

// Koneksi ke MySQL menggunakan mysqli
$link = mysqli_connect("localhost", "root", "", "sports_club") or die("Can't Connect...");

// Pastikan koneksi berhasil
if (!$link) {
    die("Koneksi gagal: " . mysqli_connect_error());
} else {
    // Koneksi berhasil
    // echo "Koneksi berhasil"; // Hanya untuk debugging
}
?>
