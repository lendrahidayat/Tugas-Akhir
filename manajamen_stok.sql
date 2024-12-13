-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2024 at 11:40 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `manajamen_stok`
--

-- --------------------------------------------------------

--
-- Table structure for table `casher_user`
--

CREATE TABLE `casher_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `casher_user`
--

INSERT INTO `casher_user` (`id`, `nama`, `username`, `password`) VALUES
(1, 'Grenia', 'grn567', '56789');

-- --------------------------------------------------------

--
-- Table structure for table `data_barang`
--

CREATE TABLE `data_barang` (
  `nama_item` varchar(100) NOT NULL,
  `kode_item` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `jenis_barang` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `total_harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data_barang`
--

INSERT INTO `data_barang` (`nama_item`, `kode_item`, `harga`, `jenis_barang`, `stock`, `total_harga`) VALUES
('lanyard', '235656', 10000, 'merchandise', 1, 10000),
('Tepak', '25352662', 5000, 'atk', 2, 10000),
('Sticky Note', '3562536', 5000, 'atk', 8, 40000),
('Klip', '361263', 12000, 'atk', 0, 0),
('Isi Stapler', '72362', 7000, 'atk', 4, 28000),
('buku tulis', '7247924', 3000, 'atk', 4, 12000),
('Pulpen', '732487', 2500, 'atk', 2, 5000),
('Aqua', '74737363', 3500, 'minuman', 0, 0),
('Amplop', '75194703', 15000, 'atk', 0, 0),
('Kertas Folio', '8842792', 15000, 'atk', 15, 225000),
('Penghapus', '932792', 1000, 'atk', 3, 3000);

--
-- Triggers `data_barang`
--
DELIMITER $$
CREATE TRIGGER `log_produk_delete` AFTER DELETE ON `data_barang` FOR EACH ROW BEGIN
  INSERT INTO log_barang (kode_item,keterangan,waktu ,nama_item, harga, jenis_barang, stock) VALUES (old.kode_item,'Penghapusan data', now(), old.nama_item, old.harga, old.jenis_barang, old.stock);
  END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_produk_insert` AFTER INSERT ON `data_barang` FOR EACH ROW BEGIN
  INSERT INTO log_barang (kode_item,keterangan,waktu ,nama_item, harga, jenis_barang, stock) VALUES (new.kode_item,'Penambahan data', now(), new.nama_item, new.harga, new.jenis_barang, new.stock);
  END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_harian`
--

CREATE TABLE `laporan_harian` (
  `id_laporan` int(11) NOT NULL,
  `tanggal` varchar(50) NOT NULL,
  `nama_casheer` varchar(50) NOT NULL,
  `pendapatan` varchar(50) NOT NULL,
  `jml_barang_terjual` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laporan_harian`
--

INSERT INTO `laporan_harian` (`id_laporan`, `tanggal`, `nama_casheer`, `pendapatan`, `jml_barang_terjual`) VALUES
(2, '2024-01-09 17:06:47', 'Grenia', 'Rp. 10000', 2);

-- --------------------------------------------------------

--
-- Table structure for table `log_barang`
--

CREATE TABLE `log_barang` (
  `id` int(11) NOT NULL,
  `kode_item` varchar(50) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `waktu` datetime NOT NULL,
  `nama_item` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `jenis_barang` varchar(50) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log_barang`
--

INSERT INTO `log_barang` (`id`, `kode_item`, `keterangan`, `waktu`, `nama_item`, `harga`, `jenis_barang`, `stock`) VALUES
(39, '235656', 'Penambahan data', '2024-01-04 00:00:00', 'lanyard', 10000, 'merchandise', 3),
(40, '683628', 'Penghapusan data', '2024-01-04 00:00:00', 'Mika', 1500, 'atk', 3),
(41, '3562536', 'Penambahan data', '2024-01-08 14:07:53', 'Sticky Note', 5000, 'atk', 10),
(42, '8842792', 'Penambahan data', '2024-01-09 17:34:35', 'Kertas Folio', 15000, 'atk', 15);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `kode_item` varchar(100) NOT NULL,
  `jumlah` int(20) NOT NULL,
  `total` int(20) NOT NULL,
  `tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `kode_item`, `jumlah`, `total`, `tanggal`) VALUES
(74, '74737363', 2, 7000, '2024-01-05 23:50:31'),
(75, '235656', 1, 10000, '2024-01-05 23:54:38'),
(76, '361263', 1, 12000, '2024-01-05 23:56:30'),
(77, '72362', 5, 35000, '2024-01-06 01:19:04'),
(80, '732487', 4, 10000, '2024-01-06 01:56:55'),
(87, '25352662', 2, 10000, '2024-01-06 13:16:24'),
(88, '7247924', 3, 9000, '2024-01-06 13:16:26'),
(89, '75194703', 1, 15000, '2024-01-06 13:58:44'),
(90, '732487', 1, 2500, '2024-01-06 13:59:24'),
(91, '7247924', 1, 3000, '2024-01-06 13:59:25'),
(92, '7247924', 2, 6000, '2024-01-06 18:13:28'),
(93, '732487', 3, 7500, '2024-01-06 18:13:30'),
(94, '235656', 1, 10000, '2024-01-07 15:15:21'),
(95, '25352662', 1, 5000, '2024-01-07 15:15:22'),
(96, '361263', 1, 12000, '2024-01-07 19:19:48'),
(97, '72362', 1, 7000, '2024-01-07 19:19:49'),
(98, '732487', 1, 2500, '2024-01-07 19:24:52'),
(99, '932792', 1, 1000, '2024-01-07 19:24:53'),
(100, '361263', 1, 12000, '2024-01-07 19:57:14'),
(101, '732487', 1, 2500, '2024-01-07 19:57:17'),
(102, '361263', 1, 12000, '2024-01-07 20:30:40'),
(103, '732487', 1, 2500, '2024-01-07 20:30:42'),
(104, '732487', 3, 7500, '2024-01-07 20:34:05'),
(105, '732487', 2, 5000, '2024-01-07 20:34:49'),
(106, '732487', 1, 2500, '2024-01-07 20:50:31'),
(107, '732487', 1, 2500, '2024-01-07 20:51:45'),
(108, '732487', 1, 2500, '2024-01-07 20:54:45'),
(109, '732487', 1, 2500, '2024-01-07 20:59:32'),
(110, '732487', 1, 2500, '2024-01-07 21:07:44'),
(111, '932792', 1, 1000, '2024-01-07 21:07:45'),
(112, '732487', 1, 2500, '2024-01-07 21:20:02'),
(113, '932792', 1, 1000, '2024-01-07 21:20:03'),
(114, '732487', 1, 2500, '2024-01-07 21:26:33'),
(115, '932792', 1, 1000, '2024-01-07 21:26:34'),
(116, '732487', 1, 2500, '2024-01-07 21:27:57'),
(117, '732487', 1, 2500, '2024-01-07 21:32:37'),
(118, '732487', 1, 2500, '2024-01-07 21:35:55'),
(119, '932792', 2, 2000, '2024-01-07 21:37:34'),
(120, '932792', 2, 2000, '2024-01-07 21:45:30'),
(121, '932792', 2, 2000, '2024-01-07 21:49:35'),
(122, '932792', 2, 2000, '2024-01-07 21:55:37'),
(123, '932792', 2, 2000, '2024-01-07 21:57:49'),
(124, '932792', 1, 1000, '2024-01-07 22:00:22'),
(125, '932792', 1, 1000, '2024-01-07 22:11:12'),
(126, '932792', 1, 1000, '2024-01-07 22:12:48'),
(127, '732487', 2, 5000, '2024-01-08 12:01:35'),
(128, '361263', 1, 12000, '2024-01-08 12:01:36'),
(129, '3562536', 2, 10000, '2024-01-09 14:47:15');

--
-- Triggers `transaksi`
--
DELIMITER $$
CREATE TRIGGER `delete_trigger_update_jumlah` AFTER DELETE ON `transaksi` FOR EACH ROW BEGIN
	UPDATE data_barang SET total_harga = total_harga + old.total
    WHERE kode_item = old.kode_item;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_trigger_update_jumlah` AFTER INSERT ON `transaksi` FOR EACH ROW BEGIN
	UPDATE data_barang SET total_harga = total_harga - NEW.total
    WHERE kode_item = new.kode_item;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_update_stock_barang` AFTER INSERT ON `transaksi` FOR EACH ROW BEGIN
	UPDATE data_barang SET stock = stock - new.jumlah
    WHERE kode_item = new.kode_item;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_update_stock_barang_delete` AFTER DELETE ON `transaksi` FOR EACH ROW BEGIN
	UPDATE data_barang SET stock = stock+old.jumlah
    WHERE kode_item = old.kode_item;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_update_stock_barang_update` AFTER UPDATE ON `transaksi` FOR EACH ROW BEGIN
	UPDATE data_barang SET stock = (stock+old.jumlah)-NEW.jumlah
    WHERE kode_item = new.kode_item;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`) VALUES
(1, 'Lendra Hidayat', 'Lendra', '11223344'),
(5, 'Dimas', 'dmg', '3678'),
(7, 'Dhanu', 'dhnu154', '47890'),
(8, 'rizaldi', 'rzdk', '12333');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `casher_user`
--
ALTER TABLE `casher_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_barang`
--
ALTER TABLE `data_barang`
  ADD PRIMARY KEY (`kode_item`);

--
-- Indexes for table `laporan_harian`
--
ALTER TABLE `laporan_harian`
  ADD PRIMARY KEY (`id_laporan`);

--
-- Indexes for table `log_barang`
--
ALTER TABLE `log_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `kode_item` (`kode_item`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `casher_user`
--
ALTER TABLE `casher_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `laporan_harian`
--
ALTER TABLE `laporan_harian`
  MODIFY `id_laporan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `log_barang`
--
ALTER TABLE `log_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`kode_item`) REFERENCES `data_barang` (`kode_item`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
