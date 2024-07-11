<?php
include 'koneksi.php'; // Pastikan file koneksi.php terhubung dengan benar

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Query untuk mengambil status selesai dari tugas
    $stmt = $pdo->prepare("SELECT completed FROM group_todo_list WHERE id = ?");
    $stmt->execute([$id]);
    $task = $stmt->fetch(PDO::FETCH_ASSOC);

    // Membalik status selesai
    $newStatus = !$task['completed'];

    // Query untuk memperbarui status selesai
    $stmt = $pdo->prepare("UPDATE group_todo_list SET completed = ? WHERE id = ?");
    $stmt->execute([$newStatus, $id]);

    // Redirect kembali ke halaman utama
    header('Location: index.php');
} else {
    echo "ID tugas tidak ditemukan.";
}
?>
