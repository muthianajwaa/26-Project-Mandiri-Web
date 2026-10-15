-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 15, 2026 at 06:00 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecobank`
--

-- --------------------------------------------------------

--
-- Table structure for table `jenis_sampah`
--

CREATE TABLE `jenis_sampah` (
  `id_sampah` int NOT NULL,
  `nama_sampah` varchar(100) NOT NULL,
  `harga_per_kg` decimal(12,2) NOT NULL,
  `satuan` varchar(20) DEFAULT 'kg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jenis_sampah`
--

INSERT INTO `jenis_sampah` (`id_sampah`, `nama_sampah`, `harga_per_kg`, `satuan`) VALUES
(1, 'Botol Plastik', '4000.00', 'kg'),
(2, 'Kardus', '3000.00', 'kg'),
(3, 'Kertas', '2500.00', 'kg'),
(4, 'Kaleng', '5000.00', 'kg'),
(5, 'Botol Kaca', '2000.00', 'kg');

-- --------------------------------------------------------

--
-- Table structure for table `nasabah`
--

CREATE TABLE `nasabah` (
  `id_nasabah` int NOT NULL,
  `id_user` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text,
  `no_hp` varchar(20) DEFAULT NULL,
  `saldo` decimal(12,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nasabah`
--

INSERT INTO `nasabah` (`id_nasabah`, `id_user`, `nama`, `alamat`, `no_hp`, `saldo`) VALUES
(1, 2, 'Andi Pratama', 'Pedan', '081234567890', '0.00'),
(2, 3, 'Sinta Putri', 'Klaten', '081234567891', '0.00'),
(3, 4, 'Raka Adinata', 'Cawas', '081234567892', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `penarikan`
--

CREATE TABLE `penarikan` (
  `id_penarikan` int NOT NULL,
  `id_nasabah` int NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(12,2) NOT NULL,
  `status` enum('menunggu','disetujui','ditolak') DEFAULT 'menunggu',
  `keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `setoran`
--

CREATE TABLE `setoran` (
  `id_setoran` int NOT NULL,
  `id_nasabah` int NOT NULL,
  `id_sampah` int NOT NULL,
  `tanggal` date NOT NULL,
  `berat` decimal(8,2) NOT NULL,
  `total_harga` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','nasabah') NOT NULL DEFAULT 'nasabah',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `role`, `created_at`) VALUES
(1, 'admin muti', '$2y$10$hU8.g/zNfQgKaTSt1yok5uogMIhb6vEBsu9ifEWFEtUORCgqRjlYO', 'admin', '2026-10-01 01:27:04'),
(2, 'andi', '$2y$10$s98Dm3TJExxrQ9TyJdVOj.m1M8fHZejesY9vQmo.rDxPk5iVrY2tK', 'nasabah', '2026-10-01 03:06:06'),
(3, 'sinta', '$2y$10$RJmhinkUH84U4UQt7dfiUO8zzGN1aHPB2Gtqjoik7DE7x0y8cKOf6', 'nasabah', '2026-10-01 03:06:06'),
(4, 'raka', '$2y$10$Lpbj/J1oD.IwHMJ26IbRJ.ugATwpN5izrDXZSJHm3N705lgome7ZW', 'nasabah', '2026-10-01 03:06:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jenis_sampah`
--
ALTER TABLE `jenis_sampah`
  ADD PRIMARY KEY (`id_sampah`);

--
-- Indexes for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD PRIMARY KEY (`id_nasabah`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `penarikan`
--
ALTER TABLE `penarikan`
  ADD PRIMARY KEY (`id_penarikan`),
  ADD KEY `id_nasabah` (`id_nasabah`);

--
-- Indexes for table `setoran`
--
ALTER TABLE `setoran`
  ADD PRIMARY KEY (`id_setoran`),
  ADD KEY `id_nasabah` (`id_nasabah`),
  ADD KEY `id_sampah` (`id_sampah`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jenis_sampah`
--
ALTER TABLE `jenis_sampah`
  MODIFY `id_sampah` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nasabah`
--
ALTER TABLE `nasabah`
  MODIFY `id_nasabah` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `penarikan`
--
ALTER TABLE `penarikan`
  MODIFY `id_penarikan` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setoran`
--
ALTER TABLE `setoran`
  MODIFY `id_setoran` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD CONSTRAINT `nasabah_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penarikan`
--
ALTER TABLE `penarikan`
  ADD CONSTRAINT `penarikan_ibfk_1` FOREIGN KEY (`id_nasabah`) REFERENCES `nasabah` (`id_nasabah`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `setoran`
--
ALTER TABLE `setoran`
  ADD CONSTRAINT `setoran_ibfk_1` FOREIGN KEY (`id_nasabah`) REFERENCES `nasabah` (`id_nasabah`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `setoran_ibfk_2` FOREIGN KEY (`id_sampah`) REFERENCES `jenis_sampah` (`id_sampah`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
