<?php
include 'koneksi.php'; // Make sure the koneksi.php file is properly connected

// Query to fetch all data from the group_todo_list table
$stmt = $pdo->query("SELECT * FROM group_todo_list");
$tasks = $stmt->fetchAll(PDO::FETCH_ASSOC); // Fetch all rows as an associative array

// Separate the completed and incomplete tasks
$incompleteTasks = array_filter($tasks, function ($task) {
    return !$task['completed'];
});
$completedTasks = array_filter($tasks, function ($task) {
    return $task['completed'];
});
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>To Do List Group</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            background-color: #f9f9f9;
            display: flex;
        }
        .sidebar {
            width: 260px;
            background-color: #007BFF;
            color: #fff;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            display: flex;
            flex-direction: column;
            padding-top: 20px;
            overflow-y: auto; /* Enable scrolling */
        }
        .sidebar a {
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            display: block;
        }
        .sidebar a:hover {
            background-color: white;
            color: black;
        }
        .submenu a {
            padding-left: 40px;
        }
        .container {
            margin-left: 260px;
            margin-top: 20px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            position: relative;
            flex-grow: 1;
        }
        .week-header {
            color: #ff0066;
            margin-bottom: 10px;
        }
        .day-header {
            color: #ff0066;
            margin-bottom: 10px;
        }
        .task {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 10px;
            margin-bottom: 10px;
            background-color: #fff;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .task-title {
            font-size: 1.1em;
        }
        .task-priority {
            font-size: 0.9em;
            color: #fff;
            padding: 2px 8px;
            border-radius: 4px;
            display: inline-block;
        }
        .task-priority.high {
            background-color: #ff3333; /* Red for high priority */
        }
        .task-priority.medium {
            background-color: #ffff66; /* Yellow for medium priority */
            color: #8b0000;
        }
        .task-priority.easy {
            background-color: #66ff66; /* Green for easy priority */
            color: #8b0000;
        }
        .task-actions i {
            font-size: 1.2em;
            margin-left: 10px;
            color: #007bff;
            cursor: pointer;
        }
        .add-task-button {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            position: absolute;
            top: 20px;
            right: 20px;
        }
        .add-task-button i {
            font-size: 1.5em;
        }
        .completed-task .task-title {
            text-decoration: line-through;
        }
        .history-header {
            color: #ff0066;
            margin-top: 30px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="sidebar">
    <h3 class="nav-item">
    <a class="nav-link sub-link" href="../menu utama/satu.php">Daily Habit</a>
  </h3>
        <ul class="nav flex-column">
            <li class="nav-item">
                <i class="fas fa-user mr-2"></i> Person
                <ul class="nav flex-column ml-3">
                    <li class="nav-item"><a class="nav-link sub-link" href="../data mata kuliah semester/index.php">Mata Kuliah Semester</a></li>
                    <li class="nav-item"><a class="nav-link sub-link" href="../catatan topik mata kuliah/index.php">Catatan Kuliah</a></li>
                    <li class="nav-item"><a class="nav-link sub-link" href="../jadwal_ujian/index.php">Jadwal Ujian</a></li>
                    <li class="nav-item"><a class="nav-link sub-link" href="../data tugas/index.php">Tugas</a></li>
                    <li class="nav-item"><a class="nav-link sub-link" href="../timeline tugas/index.php">Timeline tugas</a></li>
                    <li class="nav-item"><a class="nav-link sub-link" href="#">Todolist Belajar</a></li>
                </ul>
            </li>
            <li class="nav-item">
                <i class="fas fa-users mr-2"></i> Group Project
                <ul class="nav flex-column ml-3">
                    <li class="nav-item"><a class="nav-link sub-link" href="#">Pembagian tugas</a></li>
                    <li class="nav-item"><a class="nav-link sub-link" href="../todolist_group/index.php">To-Do-List Group Project</a></li>
                    <li class="nav-item"><a class="nav-link sub-link" href="#">Meeting Notes</a></li>
                    <li class="nav-item"><a class="nav-link sub-link" href="#">Meeting Schedules</a></li>
                </ul>
            </li>
            <li class="nav-item"><a class="nav-link d-flex align-items-center" href="../kalender/index.php"><i class="fas fa-calendar-alt mr-2"></i> Calendar</a></li>
             <li class="nav-item"><a class="nav-link d-flex align-items-center" href="../Note_Taking/isi_notes.php"><i class="fas fa-sticky-note mr-2"></i> Note Taking</a></li>
            <li class="nav-item"><a class="nav-link d-flex align-items-center" href="#"><i class="fas fa-graduation-cap mr-2"></i> Grade Tracker</a></li>
            <li class="nav-item"><a class="nav-link d-flex align-items-center" href="#"><i class="fas fa-check-circle mr-2"></i> Habit Tracker</a></li>
            <li class="nav-item"><a class="nav-link d-flex align-items-center" href="#"><i class="fas fa-sign-out-alt mr-2"></i> Log Out</a></li>
        </ul>
    </div>
    <div class="container">
        <h1>To Do List Group</h1>
        
        <a href="create.php" class="btn btn-primary add-task-button">
            <i class="fas fa-plus"></i>
        </a>
        
        <!-- Display incomplete tasks -->
        <?php foreach ($incompleteTasks as $task): ?>
            <div class="day-section">
                <div class="day-header">
                    <?php
                    $deadline = new DateTime($task['deadline']);
                    echo $deadline->format('l, d F Y');
                    ?>
                </div>
                <div class="task">
                    <div class="task-info">
                        <div class="task-title"><?php echo $task['nama_tugas']; ?></div>
                        <div class="task-priority <?php echo strtolower($task['status']); ?>">
                            <?php echo ucfirst($task['status']); ?>
                        </div>
                    </div>
                    <div class="task-actions">
                        <a href="update.php?id=<?php echo $task['id']; ?>"><i class="fas fa-edit"></i></a>
                        <a href="delete.php?id=<?php echo $task['id']; ?>" onclick="return confirm('Are you sure you want to delete this task?');"><i class="fas fa-trash-alt"></i></a>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
        
        <!-- Display completed tasks -->
        <div class="history-header">History</div>
        <?php foreach ($completedTasks as $task): ?>
            <div class="day-section">
                <div class="day-header">
                    <?php
                    $deadline = new DateTime($task['deadline']);
                    echo $deadline->format('l, d F Y');
                    ?>
                </div>
                <div class="task completed-task">
                    <div class="task-info">
                        <div class="task-title"><?php echo $task['nama_tugas']; ?></div>
                        <div class="task-priority <?php echo strtolower($task['status']); ?>">
                            <?php echo ucfirst($task['status']); ?>
                        </div>
                    </div>
                    <div class="task-actions">
                        <a href="update.php?id=<?php echo $task['id']; ?>"><i class="fas fa-edit"></i></a>
                        <a href="delete.php?id=<?php echo $task['id']; ?>" onclick="return confirm('Are you sure you want to delete this task?');"><i class="fas fa-trash-alt"></i></a>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</body>
</html>
