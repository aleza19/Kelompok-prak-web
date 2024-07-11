<?php
include 'koneksi.php'; // Pastikan file koneksi.php terhubung dengan benar

if (isset($_GET['id']) && is_numeric($_GET['id'])) {
    $id = $_GET['id'];

    // Query untuk menghapus data tugas berdasarkan ID
    $stmt = $pdo->prepare("DELETE FROM group_todo_list WHERE id = ?");
    $stmt->execute([$id]);

    // Redirect kembali ke halaman index.php setelah menghapus
    header("Location: index.php");
    exit();
} else {
    // Jika tidak ada ID yang diterima atau ID tidak valid
    echo "Invalid request.";
}
?>
