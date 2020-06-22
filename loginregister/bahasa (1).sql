-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 22 Jun 2020 pada 15.02
-- Versi Server: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bahasa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bahasaindo`
--

CREATE TABLE `bahasaindo` (
  `id` int(10) NOT NULL,
  `indonesia` varchar(50) NOT NULL,
  `english` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bahasaindo`
--

INSERT INTO `bahasaindo` (`id`, `indonesia`, `english`) VALUES
(1, 'apa', 'what'),
(2, 'siapa', 'who'),
(3, 'dia(laki laki)', 'he'),
(4, 'dosa', 'sin '),
(5, 'naga', 'dragon');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bahasaindo`
--
ALTER TABLE `bahasaindo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bahasaindo`
--
ALTER TABLE `bahasaindo`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
