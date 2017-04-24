-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 24, 2017 at 02:05 
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `akuntan`
--

-- --------------------------------------------------------

--
-- Table structure for table `kas_in`
--

CREATE TABLE `kas_in` (
  `no_km` varchar(15) NOT NULL,
  `akun_debit` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `akun_kas` varchar(10) NOT NULL,
  `nominal` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kas_in`
--

INSERT INTO `kas_in` (`no_km`, `akun_debit`, `tanggal`, `keterangan`, `akun_kas`, `nominal`) VALUES
('KM000001', '11101', '2017-04-07', 'test keterangan', '11101', 1000000),
('KM000002', '11103', '2017-04-07', 'test keterangan', '11103', 1000000),
('KM000003', '11103', '2017-04-10', 'test tambah', '11103', 700000);

-- --------------------------------------------------------

--
-- Table structure for table `kas_out`
--

CREATE TABLE `kas_out` (
  `no_kk` varchar(15) NOT NULL,
  `akun_kas` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `akun_debit` varchar(10) NOT NULL,
  `nominal` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kas_out`
--

INSERT INTO `kas_out` (`no_kk`, `akun_kas`, `tanggal`, `keterangan`, `akun_debit`, `nominal`) VALUES
('KK000001', '11101', '2017-04-17', 'test input', '11101', 500000),
('KK000002', '11102', '2017-04-17', 'test input', '11102', 100000),
('KK000003', '11103', '2017-03-27', 'test tambah', '11103', 5000000);

-- --------------------------------------------------------

--
-- Table structure for table `periode`
--

CREATE TABLE `periode` (
  `id` int(11) NOT NULL,
  `tahun` varchar(5) NOT NULL,
  `awal` varchar(10) NOT NULL,
  `akhir` varchar(10) NOT NULL,
  `status` enum('Aktif','Nonaktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `periode`
--

INSERT INTO `periode` (`id`, `tahun`, `awal`, `akhir`, `status`) VALUES
(1, '2012', 'Agustus', 'Desember', 'Aktif'),
(2, '2012', 'April', 'Desember', 'Aktif'),
(4, '2013', 'Maret', 'November', 'Aktif'),
(5, '2011', 'Januari', 'Desember', 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `t_user`
--

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `nama_lengkap` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `hak_akses` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_user`
--

INSERT INTO `t_user` (`id`, `user_name`, `nama_lengkap`, `password`, `hak_akses`) VALUES
(6, '11150001', 'user 1', '12345', 'Admin'),
(7, '11150002', 'user 2', '12345', 'User'),
(8, '11150003', 'user 3', '12345', 'User'),
(9, '11150004', 'user 4', '12345', 'User'),
(10, '11150005', 'user 5', '12345', 'Admin'),
(11, '11150006', 'user 6', '12345', 'Admin'),
(12, '11150007', 'user 7', '12345', 'User'),
(13, '11150008', 'user 8', '12345', 'User'),
(14, '11150009', 'user 9', '12345', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kas_in`
--
ALTER TABLE `kas_in`
  ADD PRIMARY KEY (`no_km`);

--
-- Indexes for table `kas_out`
--
ALTER TABLE `kas_out`
  ADD PRIMARY KEY (`no_kk`);

--
-- Indexes for table `periode`
--
ALTER TABLE `periode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `periode`
--
ALTER TABLE `periode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `t_user`
--
ALTER TABLE `t_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
