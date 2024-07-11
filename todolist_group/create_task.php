<?php
include 'koneksi.php'; // Pastikan file koneksi.php terhubung dengan benar

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $project_id = $_POST['project_id'];
    $nama_tugas = $_POST['nama_tugas'];
    $deadline = $_POST['deadline'];
    $status = $_POST['status'];

    try {
        // Prepare the SQL statement
        $stmt = $pdo->prepare("INSERT INTO group_todo_list (project_id, nama_tugas, deadline, status) VALUES (?, ?, ?, ?)");
        if ($stmt->execute([$project_id, $nama_tugas, $deadline, $status])) {
            // Jika berhasil, arahkan kembali ke halaman index atau halaman lain
            header("Location: index.php"); // Ganti index.php dengan halaman yang sesuai
            exit();
        } else {
            echo "Error: Could not create record.";
        }
    } catch (PDOException $e) {
        die("Error: " . $e->getMessage());
    }
}
?>
