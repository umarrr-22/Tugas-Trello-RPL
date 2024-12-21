<?php
require '../../include/db_conn.php';
page_protect();

$memID = $_POST['m_id'];
$uname = $_POST['u_name'];
$stname = $_POST['street_name'];
$city = $_POST['city'];
$zipcode = $_POST['zipcode'];
$state = $_POST['state'];
$gender = $_POST['gender'];
$dob = $_POST['dob'];
$phn = $_POST['mobile'];
$email = $_POST['email'];
$jdate = $_POST['jdate'];
$plan = $_POST['plan'];

// Memulai transaksi
mysqli_begin_transaction($con);

try {
    // Menyisipkan data ke tabel users dengan prepared statement untuk keamanan
    $query = "INSERT INTO users(username, gender, mobile, email, dob, joining_date, userid) 
              VALUES(?, ?, ?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($con, $query);
    mysqli_stmt_bind_param($stmt, "sssssss", $uname, $gender, $phn, $email, $dob, $jdate, $memID);
    if (!mysqli_stmt_execute($stmt)) {
        throw new Exception("Error inserting into users: " . mysqli_error($con));
    }

    // Mendapatkan informasi plan yang dipilih
    $query1 = "SELECT * FROM plan WHERE pid = ?";
    $stmt1 = mysqli_prepare($con, $query1);
    mysqli_stmt_bind_param($stmt1, "i", $plan);
    mysqli_stmt_execute($stmt1);
    $result = mysqli_stmt_get_result($stmt1);
    if (mysqli_num_rows($result) == 0) {
        throw new Exception("Plan not found");
    }

    $value = mysqli_fetch_row($result);
    date_default_timezone_set("Asia/Calcutta");
    $d = strtotime("+" . $value[3] . " Months");
    $cdate = date("Y-m-d"); // tanggal saat ini
    $expiredate = date("Y-m-d", $d); // menambahkan masa berlaku sesuai plan

    // Menyisipkan data ke tabel enrolls_to dengan prepared statement
    $query2 = "INSERT INTO enrolls_to(pid, uid, paid_date, expire, renewal) 
               VALUES(?, ?, ?, ?, ?)";
    $stmt2 = mysqli_prepare($con, $query2);
    mysqli_stmt_bind_param($stmt2, "issss", $plan, $memID, $cdate, $expiredate, 'yes');
    if (!mysqli_stmt_execute($stmt2)) {
        throw new Exception("Error inserting into enrolls_to: " . mysqli_error($con));
    }

    // Menyisipkan data ke tabel health_status
    $query4 = "INSERT INTO health_status(uid) VALUES(?)";
    $stmt4 = mysqli_prepare($con, $query4);
    mysqli_stmt_bind_param($stmt4, "s", $memID);
    if (!mysqli_stmt_execute($stmt4)) {
        throw new Exception("Error inserting into health_status: " . mysqli_error($con));
    }

    // Menyisipkan data ke tabel address (kolom id auto-increment, jadi tidak perlu disertakan)
    $query5 = "INSERT INTO address(streetName, state, city, zipcode) 
               VALUES(?, ?, ?, ?)";
    $stmt5 = mysqli_prepare($con, $query5);
    mysqli_stmt_bind_param($stmt5, "ssss", $stname, $state, $city, $zipcode);
    if (!mysqli_stmt_execute($stmt5)) {
        throw new Exception("Error inserting into address: " . mysqli_error($con));
    }

    // Jika semua query berhasil, commit transaksi
    mysqli_commit($con);

    echo "<head><script>alert('Member Added');</script></head>";
    echo "<meta http-equiv='refresh' content='0; url=new_entry.php'>";

} catch (Exception $e) {
    // Jika ada error, rollback transaksi dan tampilkan pesan error
    mysqli_rollback($con);
    echo "<head><script>alert('Member Add Failed: " . $e->getMessage() . "');</script></head>";
    echo "Error: " . $e->getMessage();
}
?>
