<?php
include 'koneksi.php'; // Make sure the koneksi.php file is properly connected

// Get task ID from GET parameter
if (!isset($_GET['id'])) {
    die("Error: ID tugas tidak ditemukan.");
}

$id_tugas = $_GET['id'];

// Query to fetch task data by ID
$stmt = $pdo->prepare("SELECT * FROM group_todo_list WHERE id = ?");
$stmt->execute([$id_tugas]);
$task = $stmt->fetch(PDO::FETCH_ASSOC); // Fetch data as associative array

// Check if data is found
if (!$task) {
    die("Error: Tugas tidak ditemukan.");
}

// Process update if form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get data from form
    $nama_tugas = $_POST['nama_tugas'];
    $status = $_POST['status'];
    $deadline = $_POST['deadline'];
    $completed = isset($_POST['completed']) ? 1 : 0;

    // Update query to the database
    $stmt = $pdo->prepare("UPDATE group_todo_list SET nama_tugas = ?, status = ?, deadline = ?, completed = ? WHERE id = ?");
    $stmt->execute([$nama_tugas, $status, $deadline, $completed, $id_tugas]);

    // Redirect back to the main page after update
    header("Location: index.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update To-Do List Item</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* CSS styling */
        body {
            background-color: #f9f9f9;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-group input[type="text"],
        .form-group select,
        .form-group input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
            color: #fff;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update To-Do List Item</h2>
        <form method="POST">
            <div class="form-group">
                <label for="nama_tugas">Nama Tugas:</label>
                <input type="text" id="nama_tugas" name="nama_tugas" value="<?php echo htmlspecialchars($task['nama_tugas']); ?>" required>
            </div>
            <div class="form-group">
                <label for="status">Status:</label>
                <select id="status" name="status" required>
                    <option value="high" <?php if ($task['status'] === 'high') echo 'selected'; ?>>High</option>
                    <option value="medium" <?php if ($task['status'] === 'medium') echo 'selected'; ?>>Medium</option>
                    <option value="easy" <?php if ($task['status'] === 'easy') echo 'selected'; ?>>Easy</option>
                </select>
            </div>
            <div class="form-group">
                <label for="deadline">Deadline:</label>
                <input type="date" id="deadline" name="deadline" value="<?php echo htmlspecialchars($task['deadline']); ?>" required>
            </div>
            <div class="form-group form-check">
                <input type="checkbox" class="form-check-input" id="completed" name="completed" <?php if ($task['completed']) echo 'checked'; ?>>
                <label class="form-check-label" for="completed">Completed</label>
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
            <a href="index.php" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</body>
</html>
