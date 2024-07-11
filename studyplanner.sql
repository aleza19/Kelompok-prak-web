-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Jul 2024 pada 03.32
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `studyplanner1`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `catatan_topik`
--

CREATE TABLE `catatan_topik` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `original_file_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `catatan_topik`
--

INSERT INTO `catatan_topik` (`id`, `course_id`, `file_name`, `original_file_name`, `created_at`) VALUES
(1, 2, 'Web Programming (pengenalan HTML dan PHP)', 'PemrogramandanBahasaPemrograman.pdf', '2024-07-08 06:05:29'),
(2, 2, 'Web Programing Materi 6 - Javascript ', 'Materi 6 - Javascript[Part 1] (1).pdf', '2024-07-08 14:47:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `feedback_text` text NOT NULL,
  `anonim` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `grade_tracker`
--

CREATE TABLE `grade_tracker` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `nilai` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `group_projects`
--

CREATE TABLE `group_projects` (
  `id` int(11) NOT NULL,
  `nama_project` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `group_project_members`
--

CREATE TABLE `group_project_members` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `group_todo_list`
--

CREATE TABLE `group_todo_list` (
  `id` int(11) NOT NULL,
  `project_id` varchar(11) NOT NULL,
  `nama_tugas` varchar(100) NOT NULL,
  `deadline` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `completed` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `group_todo_list`
--

INSERT INTO `group_todo_list` (`id`, `project_id`, `nama_tugas`, `deadline`, `status`, `completed`) VALUES
(3, 'RJCT001', 'web programming', '2024-07-10 00:00:00', 'high', 0),
(4, 'RJPCT001', 'membuat aplikasi', '2024-07-10 00:00:00', 'easy', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `habit_tracker`
--

CREATE TABLE `habit_tracker` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `habit_name` varchar(100) NOT NULL,
  `frekuensi` varchar(50) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_mata_kuliah`
--

CREATE TABLE `jadwal_mata_kuliah` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `hari` varchar(10) NOT NULL,
  `waktu_mulai` time NOT NULL,
  `waktu_selesai` time NOT NULL,
  `ruangan` varchar(50) NOT NULL,
  `dosen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_ujian`
--

CREATE TABLE `jadwal_ujian` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `tanggal_ujian` date NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `durasi` time DEFAULT NULL,
  `nama_ujian` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jadwal_ujian`
--

INSERT INTO `jadwal_ujian` (`id`, `course_id`, `tanggal_ujian`, `location`, `durasi`, `nama_ujian`) VALUES
(1, 1, '2024-07-11', '304', '20:30:00', 'Matematika Diskrit'),
(2, 2, '2024-07-13', '400', '20:00:00', 'Web Pro');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kalender_aktivitas`
--

CREATE TABLE `kalender_aktivitas` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity_name` varchar(100) NOT NULL,
  `activity_date` date NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kursus`
--

CREATE TABLE `kursus` (
  `id` int(255) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `semester` varchar(10) DEFAULT NULL,
  `sks` int(11) DEFAULT NULL,
  `kode_kursus` int(255) NOT NULL,
  `jadwal` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kursus`
--

INSERT INTO `kursus` (`id`, `course_name`, `deskripsi`, `semester`, `sks`, `kode_kursus`, `jadwal`) VALUES
(1, 'Diskrit', 'Biner', '4', 2, 101, 'senin'),
(102, 'Matematika Diskrit', NULL, NULL, NULL, 0, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `id` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `sks` int(11) NOT NULL,
  `kode_kursus` varchar(50) NOT NULL,
  `jadwal` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`id`, `semester`, `course_name`, `deskripsi`, `sks`, `kode_kursus`, `jadwal`) VALUES
(1, 2, 'Web programming', 'mengenal HTML,PHP,CSS dan JS', 4, 'WEBPROG', 'selasa'),
(2, 2, 'cloud computing', 'Mengenal Linux', 3, 'CLOUD', 'selasa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `meeting_notes`
--

CREATE TABLE `meeting_notes` (
  `id` int(11) NOT NULL,
  `meeting_id` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `nama_anggota` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `meeting_schedules`
--

CREATE TABLE `meeting_schedules` (
  `id` int(11) NOT NULL,
  `meeting_name` varchar(100) NOT NULL,
  `meeting_date` date NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `agenda` text DEFAULT NULL,
  `nama_anggota` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `note_taking`
--

CREATE TABLE `note_taking` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `judul_catatan` varchar(100) NOT NULL,
  `content` text DEFAULT NULL,
  `tanggal_dibuat` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `notification_text` text NOT NULL,
  `reminder_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `reminder`
--

CREATE TABLE `reminder` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reminder_text` varchar(255) NOT NULL,
  `reminder_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `to_do_list`
--

CREATE TABLE `to_do_list` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama tugas` varchar(100) NOT NULL,
  `deadline` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tugas`
--

CREATE TABLE `tugas` (
  `id` int(11) NOT NULL,
  `nama_tugas` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `deadline` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tugas`
--

INSERT INTO `tugas` (`id`, `nama_tugas`, `deskripsi`, `deadline`) VALUES
(1, 'web programming', 'HTML', '2024-07-10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `upload_materi`
--

CREATE TABLE `upload_materi` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `upload` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`) VALUES
(1, 'anindya', '1234', 'anindya@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `catatan_topik`
--
ALTER TABLE `catatan_topik`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `grade_tracker`
--
ALTER TABLE `grade_tracker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indeks untuk tabel `group_projects`
--
ALTER TABLE `group_projects`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `group_project_members`
--
ALTER TABLE `group_project_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `group_todo_list`
--
ALTER TABLE `group_todo_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `project_id` (`project_id`);

--
-- Indeks untuk tabel `habit_tracker`
--
ALTER TABLE `habit_tracker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `jadwal_mata_kuliah`
--
ALTER TABLE `jadwal_mata_kuliah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indeks untuk tabel `jadwal_ujian`
--
ALTER TABLE `jadwal_ujian`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kalender_aktivitas`
--
ALTER TABLE `kalender_aktivitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `kursus`
--
ALTER TABLE `kursus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_kursus` (`kode_kursus`);

--
-- Indeks untuk tabel `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `meeting_notes`
--
ALTER TABLE `meeting_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meeting_id` (`meeting_id`);

--
-- Indeks untuk tabel `meeting_schedules`
--
ALTER TABLE `meeting_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `note_taking`
--
ALTER TABLE `note_taking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `reminder`
--
ALTER TABLE `reminder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `to_do_list`
--
ALTER TABLE `to_do_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `upload_materi`
--
ALTER TABLE `upload_materi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `catatan_topik`
--
ALTER TABLE `catatan_topik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `grade_tracker`
--
ALTER TABLE `grade_tracker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `group_projects`
--
ALTER TABLE `group_projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `group_project_members`
--
ALTER TABLE `group_project_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `group_todo_list`
--
ALTER TABLE `group_todo_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `habit_tracker`
--
ALTER TABLE `habit_tracker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jadwal_mata_kuliah`
--
ALTER TABLE `jadwal_mata_kuliah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jadwal_ujian`
--
ALTER TABLE `jadwal_ujian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `kalender_aktivitas`
--
ALTER TABLE `kalender_aktivitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kursus`
--
ALTER TABLE `kursus`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT untuk tabel `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `meeting_notes`
--
ALTER TABLE `meeting_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `meeting_schedules`
--
ALTER TABLE `meeting_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `note_taking`
--
ALTER TABLE `note_taking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `reminder`
--
ALTER TABLE `reminder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `to_do_list`
--
ALTER TABLE `to_do_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tugas`
--
ALTER TABLE `tugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `upload_materi`
--
ALTER TABLE `upload_materi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ketidakleluasaan untuk tabel `grade_tracker`
--
ALTER TABLE `grade_tracker`
  ADD CONSTRAINT `grade_tracker_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `grade_tracker_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `kursus` (`id`);

--
-- Ketidakleluasaan untuk tabel `habit_tracker`
--
ALTER TABLE `habit_tracker`
  ADD CONSTRAINT `habit_tracker_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ketidakleluasaan untuk tabel `kalender_aktivitas`
--
ALTER TABLE `kalender_aktivitas`
  ADD CONSTRAINT `kalender_aktivitas_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
