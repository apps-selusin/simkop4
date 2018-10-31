-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Oct 31, 2018 at 05:35 PM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_simkop4`
--

-- --------------------------------------------------------

--
-- Table structure for table `t01_nasabah`
--

CREATE TABLE `t01_nasabah` (
  `id` int(11) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Alamat` text NOT NULL,
  `No_Telp_Hp` varchar(100) NOT NULL,
  `Pekerjaan` varchar(50) NOT NULL,
  `Pekerjaan_Alamat` text NOT NULL,
  `Pekerjaan_No_Telp_Hp` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t01_nasabah`
--

INSERT INTO `t01_nasabah` (`id`, `Nama`, `Alamat`, `No_Telp_Hp`, `Pekerjaan`, `Pekerjaan_Alamat`, `Pekerjaan_No_Telp_Hp`) VALUES
(1, 'Andoko', '-', '-', '-', '-', '-'),
(2, 'Dodo', '-', '-', '-', '-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `t02_jaminan`
--

CREATE TABLE `t02_jaminan` (
  `id` int(11) NOT NULL,
  `nasabah_id` int(11) NOT NULL,
  `Merk_Type` varchar(25) NOT NULL,
  `No_Rangka` varchar(50) DEFAULT NULL,
  `No_Mesin` varchar(50) DEFAULT NULL,
  `Warna` varchar(15) DEFAULT NULL,
  `No_Pol` varchar(15) DEFAULT NULL,
  `Keterangan` text,
  `Atas_Nama` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t02_jaminan`
--

INSERT INTO `t02_jaminan` (`id`, `nasabah_id`, `Merk_Type`, `No_Rangka`, `No_Mesin`, `Warna`, `No_Pol`, `Keterangan`, `Atas_Nama`) VALUES
(1, 1, 'ATM', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 'ATM', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 2, 'Ijasah', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t03_pinjaman`
--

CREATE TABLE `t03_pinjaman` (
  `id` int(11) NOT NULL,
  `Kontrak_No` varchar(25) NOT NULL,
  `Kontrak_Tgl` date NOT NULL,
  `nasabah_id` int(11) NOT NULL,
  `Pinjaman` float(14,2) NOT NULL,
  `Angsuran_Lama` tinyint(4) NOT NULL,
  `Angsuran_Bunga_Prosen` decimal(5,2) NOT NULL DEFAULT '2.25',
  `Angsuran_Denda` decimal(5,2) NOT NULL DEFAULT '0.40',
  `Dispensasi_Denda` tinyint(4) NOT NULL DEFAULT '3',
  `Angsuran_Pokok` float(14,2) NOT NULL,
  `Angsuran_Bunga` float(14,2) NOT NULL,
  `Angsuran_Total` float(14,2) NOT NULL,
  `No_Ref` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t03_pinjaman`
--

INSERT INTO `t03_pinjaman` (`id`, `Kontrak_No`, `Kontrak_Tgl`, `nasabah_id`, `Pinjaman`, `Angsuran_Lama`, `Angsuran_Bunga_Prosen`, `Angsuran_Denda`, `Dispensasi_Denda`, `Angsuran_Pokok`, `Angsuran_Bunga`, `Angsuran_Total`, `No_Ref`) VALUES
(1, '1', '2018-10-31', 1, 10400000.00, 12, '2.24', '0.40', 3, 867000.00, 233000.00, 1100000.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t04_pinjamanangsuran`
--

CREATE TABLE `t04_pinjamanangsuran` (
  `id` int(11) NOT NULL,
  `pinjaman_id` int(11) NOT NULL,
  `Angsuran_Ke` tinyint(4) NOT NULL,
  `Angsuran_Tanggal` date NOT NULL,
  `Angsuran_Pokok` float(14,2) NOT NULL,
  `Angsuran_Bunga` float(14,2) NOT NULL,
  `Angsuran_Total` float(14,2) NOT NULL,
  `Sisa_Hutang` float(14,2) NOT NULL,
  `Tanggal_Bayar` date DEFAULT NULL,
  `Terlambat` smallint(6) DEFAULT NULL,
  `Total_Denda` float(14,2) DEFAULT NULL,
  `Bayar_Titipan` float(14,2) DEFAULT NULL,
  `Bayar_Non_Titipan` float(14,2) DEFAULT NULL,
  `Bayar_Total` float(14,2) DEFAULT NULL,
  `Keterangan` text,
  `Flag_Edit` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t04_pinjamanangsuran`
--

INSERT INTO `t04_pinjamanangsuran` (`id`, `pinjaman_id`, `Angsuran_Ke`, `Angsuran_Tanggal`, `Angsuran_Pokok`, `Angsuran_Bunga`, `Angsuran_Total`, `Sisa_Hutang`, `Tanggal_Bayar`, `Terlambat`, `Total_Denda`, `Bayar_Titipan`, `Bayar_Non_Titipan`, `Bayar_Total`, `Keterangan`, `Flag_Edit`) VALUES
(1, 1, 1, '2018-11-30', 867000.00, 233000.00, 1100000.00, 9533000.00, '2018-10-31', -30, 0.00, 200000.00, 900000.00, 1100000.00, NULL, 1),
(2, 1, 2, '2018-12-31', 867000.00, 233000.00, 1100000.00, 8666000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(3, 1, 3, '2019-01-31', 867000.00, 233000.00, 1100000.00, 7799000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(4, 1, 4, '2019-02-28', 867000.00, 233000.00, 1100000.00, 6932000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(5, 1, 5, '2019-03-31', 867000.00, 233000.00, 1100000.00, 6065000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(6, 1, 6, '2019-04-30', 867000.00, 233000.00, 1100000.00, 5198000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(7, 1, 7, '2019-05-31', 867000.00, 233000.00, 1100000.00, 4331000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(8, 1, 8, '2019-06-30', 867000.00, 233000.00, 1100000.00, 3464000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(9, 1, 9, '2019-07-31', 867000.00, 233000.00, 1100000.00, 2597000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(10, 1, 10, '2019-08-31', 867000.00, 233000.00, 1100000.00, 1730000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(11, 1, 11, '2019-09-30', 867000.00, 233000.00, 1100000.00, 863000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(12, 1, 12, '2019-10-31', 863000.00, 237000.00, 1100000.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t05_pinjamanjaminan`
--

CREATE TABLE `t05_pinjamanjaminan` (
  `id` int(11) NOT NULL,
  `pinjaman_id` int(11) NOT NULL,
  `jaminan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t06_pinjamantitipan`
--

CREATE TABLE `t06_pinjamantitipan` (
  `id` int(11) NOT NULL,
  `pinjaman_id` int(11) NOT NULL,
  `Tanggal` date NOT NULL,
  `Keterangan` text,
  `Masuk` float(14,2) NOT NULL DEFAULT '0.00',
  `Keluar` float(14,2) NOT NULL DEFAULT '0.00',
  `Sisa` float(14,2) NOT NULL DEFAULT '0.00',
  `Angsuran_Ke` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t06_pinjamantitipan`
--

INSERT INTO `t06_pinjamantitipan` (`id`, `pinjaman_id`, `Tanggal`, `Keterangan`, `Masuk`, `Keluar`, `Sisa`, `Angsuran_Ke`) VALUES
(1, 1, '2018-10-31', '1', 200000.00, 0.00, 200000.00, 0),
(2, 1, '2018-10-31', 'Pembayaran Angsuran Ke-1', 0.00, 200000.00, 0.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `t93_periode`
--

CREATE TABLE `t93_periode` (
  `id` int(11) NOT NULL,
  `Bulan` tinyint(4) NOT NULL,
  `Tahun` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t93_periode`
--

INSERT INTO `t93_periode` (`id`, `Bulan`, `Tahun`) VALUES
(1, 10, 2018);

-- --------------------------------------------------------

--
-- Table structure for table `t94_log`
--

CREATE TABLE `t94_log` (
  `id` int(11) NOT NULL,
  `index_` tinyint(4) NOT NULL,
  `subj_` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t94_log`
--

INSERT INTO `t94_log` (`id`, `index_`, `subj_`) VALUES
(1, 1, 'application'),
(2, 2, 'pinjaman - master'),
(4, 3, 'pinjaman - angsuran'),
(6, 5, 'pinjaman - titipan'),
(7, 4, 'pinjaman - jaminan'),
(8, 0, 'last update');

-- --------------------------------------------------------

--
-- Table structure for table `t95_logdesc`
--

CREATE TABLE `t95_logdesc` (
  `id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
  `date_issued` date NOT NULL,
  `desc_` text NOT NULL,
  `date_solved` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t95_logdesc`
--

INSERT INTO `t95_logdesc` (`id`, `log_id`, `date_issued`, `desc_`, `date_solved`) VALUES
(1, 1, '2018-10-04', 'hilangkan menu SETUP - NASABAH', '2018-10-04'),
(2, 1, '2018-10-04', 'buat modul CHECK FOR UPDATE; aplikasi yang harus ada :: github desktop & gitscm', '2018-10-04'),
(3, 2, '2018-10-04', 'tipe data NOMOR REFERENSI diubah dari integer menjadi varchar', '2018-10-17'),
(5, 4, '2018-10-04', 'check :: jumlah TOTAL PEMBAYARAN harus sama dengan jumlah TOTAL ANGSURAN', '2018-10-04'),
(7, 6, '2018-10-04', 'setelah input setoran TITIPAN :: harus save dulu agar jumlah saldo TITIPAN terupdate', NULL),
(8, 4, '2018-10-18', 'otomatis tampil JUMLAH di semua kolom, JUMLAH : TERLAMBAT, DENDA, BAYAR TITIPAN, dan seterusnya', NULL),
(9, 4, '2018-10-18', 'jumlah TITIPAN langsung tampil bila nasabah memiliki SALDO TITIPAN', NULL),
(10, 4, '2018-10-18', 'nilai TERLAMBAT dan DENDA otomatis rumus, TANGGAL BAYAR dikurangi TANGGAL JATUH TEMPO', NULL),
(11, 4, '2018-10-18', 'read only baris record ANGSURAN, hanya dibuka 1 record saja, yg mana yg akan diproses datanya', '2018-10-29'),
(12, 1, '2018-10-29', 'buat modul SETUP - PERIODE', '2018-10-29'),
(13, 1, '2018-10-29', 'buat modul TUTUP BUKU (BULANAN)', NULL),
(14, 8, '2018-10-29', 'sampai dengan ss 8; lengkapi record di pinjaman - angsuran', NULL),
(15, 8, '2018-10-30', 'sampai dengan ss 9; lengkapi record di pinjaman - angsuran - lengkapi input titipan', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t96_employees`
--

CREATE TABLE `t96_employees` (
  `EmployeeID` int(11) NOT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `FirstName` varchar(10) DEFAULT NULL,
  `Title` varchar(30) DEFAULT NULL,
  `TitleOfCourtesy` varchar(25) DEFAULT NULL,
  `BirthDate` datetime DEFAULT NULL,
  `HireDate` datetime DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `Region` varchar(15) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `HomePhone` varchar(24) DEFAULT NULL,
  `Extension` varchar(4) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Photo` varchar(255) DEFAULT NULL,
  `Notes` longtext,
  `ReportsTo` int(11) DEFAULT NULL,
  `Password` varchar(50) NOT NULL DEFAULT '',
  `UserLevel` int(11) DEFAULT NULL,
  `Username` varchar(20) NOT NULL DEFAULT '',
  `Activated` enum('Y','N') NOT NULL DEFAULT 'N',
  `Profile` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t96_employees`
--

INSERT INTO `t96_employees` (`EmployeeID`, `LastName`, `FirstName`, `Title`, `TitleOfCourtesy`, `BirthDate`, `HireDate`, `Address`, `City`, `Region`, `PostalCode`, `Country`, `HomePhone`, `Extension`, `Email`, `Photo`, `Notes`, `ReportsTo`, `Password`, `UserLevel`, `Username`, `Activated`, `Profile`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '21232f297a57a5a743894a0e4a801fc3', -1, 'admin', 'N', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t97_userlevels`
--

CREATE TABLE `t97_userlevels` (
  `userlevelid` int(11) NOT NULL,
  `userlevelname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t97_userlevels`
--

INSERT INTO `t97_userlevels` (`userlevelid`, `userlevelname`) VALUES
(-2, 'Anonymous'),
(-1, 'Administrator'),
(0, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `t98_userlevelpermissions`
--

CREATE TABLE `t98_userlevelpermissions` (
  `userlevelid` int(11) NOT NULL,
  `tablename` varchar(255) NOT NULL,
  `permission` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t98_userlevelpermissions`
--

INSERT INTO `t98_userlevelpermissions` (`userlevelid`, `tablename`, `permission`) VALUES
(-2, '{1F4EE816-E057-4A7E-9024-5EA4446B7598}cf01_home.php', 8),
(-2, '{1F4EE816-E057-4A7E-9024-5EA4446B7598}t01_nasabah', 0),
(-2, '{1F4EE816-E057-4A7E-9024-5EA4446B7598}t02_jaminan', 0),
(-2, '{1F4EE816-E057-4A7E-9024-5EA4446B7598}t03_pinjaman', 0),
(-2, '{1F4EE816-E057-4A7E-9024-5EA4446B7598}t04_pinjamanangsuran', 0),
(-2, '{1F4EE816-E057-4A7E-9024-5EA4446B7598}t05_pinjamanjaminan', 0),
(-2, '{1F4EE816-E057-4A7E-9024-5EA4446B7598}t06_pinjamantitipan', 0),
(-2, '{1F4EE816-E057-4A7E-9024-5EA4446B7598}t94_log', 0),
(-2, '{1F4EE816-E057-4A7E-9024-5EA4446B7598}t95_logdesc', 0),
(-2, '{1F4EE816-E057-4A7E-9024-5EA4446B7598}t96_employees', 0),
(-2, '{1F4EE816-E057-4A7E-9024-5EA4446B7598}t97_userlevels', 0),
(-2, '{1F4EE816-E057-4A7E-9024-5EA4446B7598}t98_userlevelpermissions', 0),
(-2, '{1F4EE816-E057-4A7E-9024-5EA4446B7598}t99_audittrail', 0),
(0, '{1F4EE816-E057-4A7E-9024-5EA4446B7598}cf01_home.php', 0),
(0, '{1F4EE816-E057-4A7E-9024-5EA4446B7598}t01_nasabah', 0),
(0, '{1F4EE816-E057-4A7E-9024-5EA4446B7598}t02_jaminan', 0),
(0, '{1F4EE816-E057-4A7E-9024-5EA4446B7598}t03_pinjaman', 0),
(0, '{1F4EE816-E057-4A7E-9024-5EA4446B7598}t04_pinjamanangsuran', 0),
(0, '{1F4EE816-E057-4A7E-9024-5EA4446B7598}t05_pinjamanjaminan', 0),
(0, '{1F4EE816-E057-4A7E-9024-5EA4446B7598}t06_pinjamantitipan', 0),
(0, '{1F4EE816-E057-4A7E-9024-5EA4446B7598}t94_log', 0),
(0, '{1F4EE816-E057-4A7E-9024-5EA4446B7598}t95_logdesc', 0),
(0, '{1F4EE816-E057-4A7E-9024-5EA4446B7598}t96_employees', 0),
(0, '{1F4EE816-E057-4A7E-9024-5EA4446B7598}t97_userlevels', 0),
(0, '{1F4EE816-E057-4A7E-9024-5EA4446B7598}t98_userlevelpermissions', 0),
(0, '{1F4EE816-E057-4A7E-9024-5EA4446B7598}t99_audittrail', 0);

-- --------------------------------------------------------

--
-- Table structure for table `t99_audittrail`
--

CREATE TABLE `t99_audittrail` (
  `id` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `script` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `table` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `keyvalue` longtext,
  `oldvalue` longtext,
  `newvalue` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t99_audittrail`
--

INSERT INTO `t99_audittrail` (`id`, `datetime`, `script`, `user`, `action`, `table`, `field`, `keyvalue`, `oldvalue`, `newvalue`) VALUES
(1, '2018-10-26 22:05:36', '/simkop4/login.php', 'admin', 'login', '::1', '', '', '', ''),
(2, '2018-10-26 22:11:20', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'Nama', '13', '', 'Andoko'),
(3, '2018-10-26 22:11:20', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'Alamat', '13', '', 'Sda'),
(4, '2018-10-26 22:11:20', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'No_Telp_Hp', '13', '', '081'),
(5, '2018-10-26 22:11:20', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'Pekerjaan', '13', '', 'Swasta'),
(6, '2018-10-26 22:11:20', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'Pekerjaan_Alamat', '13', '', 'Perak'),
(7, '2018-10-26 22:11:20', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'Pekerjaan_No_Telp_Hp', '13', '', '031'),
(8, '2018-10-26 22:11:20', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'id', '13', '', '13'),
(9, '2018-10-26 22:11:20', '/simkop4/t01_nasabahadd.php', '1', '*** Batch insert begin ***', 't02_jaminan', '', '', '', ''),
(10, '2018-10-26 22:14:20', '/simkop4/t01_nasabahedit.php', '1', '*** Batch update begin ***', 't02_jaminan', '', '', '', ''),
(11, '2018-10-26 22:14:20', '/simkop4/t01_nasabahedit.php', '1', 'A', 't02_jaminan', 'nasabah_id', '1', '', '13'),
(12, '2018-10-26 22:14:20', '/simkop4/t01_nasabahedit.php', '1', 'A', 't02_jaminan', 'Merk_Type', '1', '', 'ATM'),
(13, '2018-10-26 22:14:20', '/simkop4/t01_nasabahedit.php', '1', 'A', 't02_jaminan', 'No_Rangka', '1', '', NULL),
(14, '2018-10-26 22:14:20', '/simkop4/t01_nasabahedit.php', '1', 'A', 't02_jaminan', 'No_Mesin', '1', '', NULL),
(15, '2018-10-26 22:14:20', '/simkop4/t01_nasabahedit.php', '1', 'A', 't02_jaminan', 'Warna', '1', '', NULL),
(16, '2018-10-26 22:14:20', '/simkop4/t01_nasabahedit.php', '1', 'A', 't02_jaminan', 'No_Pol', '1', '', NULL),
(17, '2018-10-26 22:14:20', '/simkop4/t01_nasabahedit.php', '1', 'A', 't02_jaminan', 'Keterangan', '1', '', NULL),
(18, '2018-10-26 22:14:20', '/simkop4/t01_nasabahedit.php', '1', 'A', 't02_jaminan', 'Atas_Nama', '1', '', NULL),
(19, '2018-10-26 22:14:20', '/simkop4/t01_nasabahedit.php', '1', 'A', 't02_jaminan', 'id', '1', '', '1'),
(20, '2018-10-26 22:14:20', '/simkop4/t01_nasabahedit.php', '1', '*** Batch update successful ***', 't02_jaminan', '', '', '', ''),
(21, '2018-10-26 22:28:56', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'Nama', '14', '', 'Dodo'),
(22, '2018-10-26 22:28:56', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'Alamat', '14', '', 'Krian'),
(23, '2018-10-26 22:28:56', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'No_Telp_Hp', '14', '', '081'),
(24, '2018-10-26 22:28:56', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'Pekerjaan', '14', '', 'Swasta'),
(25, '2018-10-26 22:28:56', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'Pekerjaan_Alamat', '14', '', 'Krian'),
(26, '2018-10-26 22:28:56', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'Pekerjaan_No_Telp_Hp', '14', '', '031'),
(27, '2018-10-26 22:28:56', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'id', '14', '', '14'),
(28, '2018-10-26 22:28:56', '/simkop4/t01_nasabahadd.php', '1', '*** Batch insert begin ***', 't02_jaminan', '', '', '', ''),
(29, '2018-10-26 22:28:57', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'nasabah_id', '2', '', '14'),
(30, '2018-10-26 22:28:57', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'Merk_Type', '2', '', 'ATM'),
(31, '2018-10-26 22:28:57', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'No_Rangka', '2', '', NULL),
(32, '2018-10-26 22:28:57', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'No_Mesin', '2', '', NULL),
(33, '2018-10-26 22:28:57', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'Warna', '2', '', NULL),
(34, '2018-10-26 22:28:57', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'No_Pol', '2', '', NULL),
(35, '2018-10-26 22:28:57', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'Keterangan', '2', '', NULL),
(36, '2018-10-26 22:28:57', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'Atas_Nama', '2', '', NULL),
(37, '2018-10-26 22:28:57', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'id', '2', '', '2'),
(38, '2018-10-26 22:28:57', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'nasabah_id', '3', '', '14'),
(39, '2018-10-26 22:28:57', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'Merk_Type', '3', '', 'Ijasah'),
(40, '2018-10-26 22:28:57', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'No_Rangka', '3', '', NULL),
(41, '2018-10-26 22:28:57', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'No_Mesin', '3', '', NULL),
(42, '2018-10-26 22:28:57', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'Warna', '3', '', NULL),
(43, '2018-10-26 22:28:57', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'No_Pol', '3', '', NULL),
(44, '2018-10-26 22:28:57', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'Keterangan', '3', '', NULL),
(45, '2018-10-26 22:28:57', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'Atas_Nama', '3', '', NULL),
(46, '2018-10-26 22:28:57', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'id', '3', '', '3'),
(47, '2018-10-26 22:28:57', '/simkop4/t01_nasabahadd.php', '1', '*** Batch insert successful ***', 't02_jaminan', '', '', '', ''),
(48, '2018-10-27 00:54:32', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_No', '1', '', '1'),
(49, '2018-10-27 00:54:32', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_Tgl', '1', '', '2018-10-27'),
(50, '2018-10-27 00:54:32', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'nasabah_id', '1', '', '13'),
(51, '2018-10-27 00:54:32', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Pinjaman', '1', '', '10400000'),
(52, '2018-10-27 00:54:32', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Lama', '1', '', '12'),
(53, '2018-10-27 00:54:32', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga_Prosen', '1', '', '2.24'),
(54, '2018-10-27 00:54:32', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Denda', '1', '', '0.4'),
(55, '2018-10-27 00:54:32', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Dispensasi_Denda', '1', '', '3'),
(56, '2018-10-27 00:54:32', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Pokok', '1', '', '867000'),
(57, '2018-10-27 00:54:32', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga', '1', '', '233000'),
(58, '2018-10-27 00:54:32', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Total', '1', '', '0'),
(59, '2018-10-27 00:54:32', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'No_Ref', '1', '', NULL),
(60, '2018-10-27 00:54:32', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'id', '1', '', '1'),
(61, '2018-10-27 00:54:32', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(62, '2018-10-27 00:54:32', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't06_pinjamantitipan', '', '', '', ''),
(63, '2018-10-27 01:42:22', '/simkop4/t94_logadd.php', '1', 'A', 't94_log', 'index_', '1', '', '1'),
(64, '2018-10-27 01:42:22', '/simkop4/t94_logadd.php', '1', 'A', 't94_log', 'subj_', '1', '', '[application]'),
(65, '2018-10-27 01:42:22', '/simkop4/t94_logadd.php', '1', 'A', 't94_log', 'id', '1', '', '1'),
(66, '2018-10-27 01:42:22', '/simkop4/t94_logadd.php', '1', '*** Batch insert begin ***', 't95_logdesc', '', '', '', ''),
(67, '2018-10-27 01:46:12', '/simkop4/t94_logedit.php', '1', '*** Batch update begin ***', 't95_logdesc', '', '', '', ''),
(68, '2018-10-27 01:46:12', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'log_id', '1', '', '1'),
(69, '2018-10-27 01:46:12', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'desc_', '1', '', 'hilangkan menu SETUP - NASABAH'),
(70, '2018-10-27 01:46:12', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'date_issued', '1', '', '2018-10-04'),
(71, '2018-10-27 01:46:12', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'date_solved', '1', '', '2018-10-04'),
(72, '2018-10-27 01:46:12', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'id', '1', '', '1'),
(73, '2018-10-27 01:46:12', '/simkop4/t94_logedit.php', '1', '*** Batch update successful ***', 't95_logdesc', '', '', '', ''),
(74, '2018-10-27 01:52:58', '/simkop4/t94_logedit.php', '1', 'U', 't94_log', 'subj_', '1', '[application]', 'application'),
(75, '2018-10-27 02:01:50', '/simkop4/logout.php', 'admin', 'logout', '::1', '', '', '', ''),
(76, '2018-10-27 02:05:01', '/simkop4/login.php', 'admin', 'login', '::1', '', '', '', ''),
(77, '2018-10-27 02:08:06', '/simkop4/t94_logedit.php', '1', '*** Batch update begin ***', 't95_logdesc', '', '', '', ''),
(78, '2018-10-27 02:08:06', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'log_id', '2', '', '1'),
(79, '2018-10-27 02:08:06', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'desc_', '2', '', 'buat modul CHECK FOR UPDATE; aplikasi yang harus ada :: github desktop & gitscm'),
(80, '2018-10-27 02:08:06', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'date_issued', '2', '', '2018-10-04'),
(81, '2018-10-27 02:08:06', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'date_solved', '2', '', '2018-10-04'),
(82, '2018-10-27 02:08:06', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'id', '2', '', '2'),
(83, '2018-10-27 02:08:07', '/simkop4/t94_logedit.php', '1', '*** Batch update successful ***', 't95_logdesc', '', '', '', ''),
(84, '2018-10-27 12:04:33', '/simkop4/t94_logadd.php', '1', 'A', 't94_log', 'index_', '2', '', '2'),
(85, '2018-10-27 12:04:33', '/simkop4/t94_logadd.php', '1', 'A', 't94_log', 'subj_', '2', '', 'pinjaman - master'),
(86, '2018-10-27 12:04:33', '/simkop4/t94_logadd.php', '1', 'A', 't94_log', 'id', '2', '', '2'),
(87, '2018-10-27 12:04:33', '/simkop4/t94_logadd.php', '1', '*** Batch insert begin ***', 't95_logdesc', '', '', '', ''),
(88, '2018-10-27 12:04:33', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'log_id', '3', '', '2'),
(89, '2018-10-27 12:04:33', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'desc_', '3', '', 'tipe data NOMOR REFERENSI diubah dari integer menjadi varchar'),
(90, '2018-10-27 12:04:33', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'date_issued', '3', '', '2018-10-04'),
(91, '2018-10-27 12:04:33', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'date_solved', '3', '', '2018-10-17'),
(92, '2018-10-27 12:04:33', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'id', '3', '', '3'),
(93, '2018-10-27 12:04:34', '/simkop4/t94_logadd.php', '1', '*** Batch insert successful ***', 't95_logdesc', '', '', '', ''),
(94, '2018-10-27 12:07:04', '/simkop4/t94_logadd.php', '1', 'A', 't94_log', 'index_', '3', '', '3'),
(95, '2018-10-27 12:07:04', '/simkop4/t94_logadd.php', '1', 'A', 't94_log', 'subj_', '3', '', 'pinjaman - nasabah'),
(96, '2018-10-27 12:07:04', '/simkop4/t94_logadd.php', '1', 'A', 't94_log', 'id', '3', '', '3'),
(97, '2018-10-27 12:07:04', '/simkop4/t94_logadd.php', '1', '*** Batch insert begin ***', 't95_logdesc', '', '', '', ''),
(98, '2018-10-27 12:07:04', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'log_id', '4', '', '3'),
(99, '2018-10-27 12:07:04', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'desc_', '4', '', 'melengkapi tampilan add NASABAH di menu PINJAMAN'),
(100, '2018-10-27 12:07:04', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'date_issued', '4', '', '2018-10-04'),
(101, '2018-10-27 12:07:04', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'date_solved', '4', '', '2018-10-17'),
(102, '2018-10-27 12:07:04', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'id', '4', '', '4'),
(103, '2018-10-27 12:07:04', '/simkop4/t94_logadd.php', '1', '*** Batch insert successful ***', 't95_logdesc', '', '', '', ''),
(104, '2018-10-27 12:08:55', '/simkop4/t94_logadd.php', '1', 'A', 't94_log', 'index_', '4', '', '4'),
(105, '2018-10-27 12:08:55', '/simkop4/t94_logadd.php', '1', 'A', 't94_log', 'subj_', '4', '', 'pinjaman - angsuran'),
(106, '2018-10-27 12:08:55', '/simkop4/t94_logadd.php', '1', 'A', 't94_log', 'id', '4', '', '4'),
(107, '2018-10-27 12:08:55', '/simkop4/t94_logadd.php', '1', '*** Batch insert begin ***', 't95_logdesc', '', '', '', ''),
(108, '2018-10-27 12:08:55', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'log_id', '5', '', '4'),
(109, '2018-10-27 12:08:55', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'desc_', '5', '', 'check :: jumlah TOTAL PEMBAYARAN harus sama dengan jumlah TOTAL ANGSURAN'),
(110, '2018-10-27 12:08:55', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'date_issued', '5', '', '2018-10-04'),
(111, '2018-10-27 12:08:55', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'date_solved', '5', '', '2018-10-04'),
(112, '2018-10-27 12:08:55', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'id', '5', '', '5'),
(113, '2018-10-27 12:08:56', '/simkop4/t94_logadd.php', '1', '*** Batch insert successful ***', 't95_logdesc', '', '', '', ''),
(114, '2018-10-27 12:10:45', '/simkop4/t94_logadd.php', '1', 'A', 't94_log', 'index_', '5', '', '5'),
(115, '2018-10-27 12:10:45', '/simkop4/t94_logadd.php', '1', 'A', 't94_log', 'subj_', '5', '', 'pinjaman - jaminan'),
(116, '2018-10-27 12:10:45', '/simkop4/t94_logadd.php', '1', 'A', 't94_log', 'id', '5', '', '5'),
(117, '2018-10-27 12:10:45', '/simkop4/t94_logadd.php', '1', '*** Batch insert begin ***', 't95_logdesc', '', '', '', ''),
(118, '2018-10-27 12:10:45', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'log_id', '6', '', '5'),
(119, '2018-10-27 12:10:45', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'desc_', '6', '', 'menghilangkan nasabah_id di add JAMINAN pada proses input PINJAMAN'),
(120, '2018-10-27 12:10:45', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'date_issued', '6', '', '2018-10-04'),
(121, '2018-10-27 12:10:45', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'date_solved', '6', '', '2018-10-17'),
(122, '2018-10-27 12:10:45', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'id', '6', '', '6'),
(123, '2018-10-27 12:10:45', '/simkop4/t94_logadd.php', '1', '*** Batch insert successful ***', 't95_logdesc', '', '', '', ''),
(124, '2018-10-27 12:11:37', '/simkop4/t94_logadd.php', '1', 'A', 't94_log', 'index_', '6', '', '6'),
(125, '2018-10-27 12:11:37', '/simkop4/t94_logadd.php', '1', 'A', 't94_log', 'subj_', '6', '', 'pinjaman - titipan'),
(126, '2018-10-27 12:11:37', '/simkop4/t94_logadd.php', '1', 'A', 't94_log', 'id', '6', '', '6'),
(127, '2018-10-27 12:11:37', '/simkop4/t94_logadd.php', '1', '*** Batch insert begin ***', 't95_logdesc', '', '', '', ''),
(128, '2018-10-27 12:11:37', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'log_id', '7', '', '6'),
(129, '2018-10-27 12:11:37', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'desc_', '7', '', 'setelah input setoran TITIPAN :: harus save dulu agar jumlah saldo TITIPAN terupdate'),
(130, '2018-10-27 12:11:37', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'date_issued', '7', '', '2018-10-04'),
(131, '2018-10-27 12:11:37', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'date_solved', '7', '', '2018-10-17'),
(132, '2018-10-27 12:11:37', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'id', '7', '', '7'),
(133, '2018-10-27 12:11:38', '/simkop4/t94_logadd.php', '1', '*** Batch insert successful ***', 't95_logdesc', '', '', '', ''),
(134, '2018-10-27 12:13:11', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't03_pinjaman', 'No_Ref', '1', NULL, '1-A'),
(135, '2018-10-27 12:13:11', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(136, '2018-10-27 12:13:11', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(137, '2018-10-27 12:13:11', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(138, '2018-10-27 12:13:11', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(139, '2018-10-27 12:13:11', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(140, '2018-10-27 12:13:11', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(141, '2018-10-27 12:16:20', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't03_pinjaman', 'Angsuran_Total', '1', '0.00', '1100000'),
(142, '2018-10-27 12:16:20', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(143, '2018-10-27 12:16:20', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(144, '2018-10-27 12:16:20', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(145, '2018-10-27 12:16:20', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(146, '2018-10-27 12:16:20', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(147, '2018-10-27 12:16:20', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(148, '2018-10-27 13:01:41', '/simkop4/login.php', 'admin', 'login', '::1', '', '', '', ''),
(149, '2018-10-27 13:31:55', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(150, '2018-10-27 13:31:55', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Tanggal_Bayar', '13', NULL, '2018-10-27'),
(151, '2018-10-27 13:31:55', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Terlambat', '13', NULL, '0'),
(152, '2018-10-27 13:31:55', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Total_Denda', '13', NULL, '0'),
(153, '2018-10-27 13:31:55', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '13', NULL, '0'),
(154, '2018-10-27 13:31:55', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '13', NULL, '0'),
(155, '2018-10-27 13:31:55', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Total', '13', NULL, '0'),
(156, '2018-10-27 13:31:55', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(157, '2018-10-27 13:31:55', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(158, '2018-10-27 13:31:55', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(159, '2018-10-27 13:31:55', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(160, '2018-10-27 13:31:55', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(161, '2018-10-27 13:35:58', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(162, '2018-10-27 13:35:58', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Terlambat', '13', '0', '1'),
(163, '2018-10-27 13:35:58', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(164, '2018-10-27 13:35:58', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(165, '2018-10-27 13:35:58', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(166, '2018-10-27 13:35:58', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(167, '2018-10-27 13:35:58', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(176, '2018-10-28 22:51:31', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'Nama', '1', '', 'Andoko'),
(177, '2018-10-28 22:51:31', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'Alamat', '1', '', '-'),
(178, '2018-10-28 22:51:31', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'No_Telp_Hp', '1', '', '-'),
(179, '2018-10-28 22:51:31', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'Pekerjaan', '1', '', '-'),
(180, '2018-10-28 22:51:31', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'Pekerjaan_Alamat', '1', '', '-'),
(181, '2018-10-28 22:51:31', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'Pekerjaan_No_Telp_Hp', '1', '', '-'),
(182, '2018-10-28 22:51:31', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'id', '1', '', '1'),
(183, '2018-10-28 22:51:31', '/simkop4/t01_nasabahadd.php', '1', '*** Batch insert begin ***', 't02_jaminan', '', '', '', ''),
(184, '2018-10-28 22:51:31', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'nasabah_id', '1', '', '1'),
(185, '2018-10-28 22:51:31', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'Merk_Type', '1', '', 'ATM'),
(186, '2018-10-28 22:51:31', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'No_Rangka', '1', '', NULL),
(187, '2018-10-28 22:51:31', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'No_Mesin', '1', '', NULL),
(188, '2018-10-28 22:51:31', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'Warna', '1', '', NULL),
(189, '2018-10-28 22:51:31', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'No_Pol', '1', '', NULL),
(190, '2018-10-28 22:51:31', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'Keterangan', '1', '', NULL),
(191, '2018-10-28 22:51:31', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'Atas_Nama', '1', '', NULL),
(192, '2018-10-28 22:51:31', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'id', '1', '', '1'),
(193, '2018-10-28 22:51:31', '/simkop4/t01_nasabahadd.php', '1', '*** Batch insert successful ***', 't02_jaminan', '', '', '', ''),
(194, '2018-10-28 22:51:59', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'Nama', '2', '', 'Dodo'),
(195, '2018-10-28 22:51:59', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'Alamat', '2', '', '-'),
(196, '2018-10-28 22:51:59', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'No_Telp_Hp', '2', '', '-'),
(197, '2018-10-28 22:51:59', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'Pekerjaan', '2', '', '-'),
(198, '2018-10-28 22:51:59', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'Pekerjaan_Alamat', '2', '', '-'),
(199, '2018-10-28 22:51:59', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'Pekerjaan_No_Telp_Hp', '2', '', '-'),
(200, '2018-10-28 22:51:59', '/simkop4/t01_nasabahadd.php', '1', 'A', 't01_nasabah', 'id', '2', '', '2'),
(201, '2018-10-28 22:51:59', '/simkop4/t01_nasabahadd.php', '1', '*** Batch insert begin ***', 't02_jaminan', '', '', '', ''),
(202, '2018-10-28 22:51:59', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'nasabah_id', '2', '', '2'),
(203, '2018-10-28 22:51:59', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'Merk_Type', '2', '', 'ATM'),
(204, '2018-10-28 22:51:59', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'No_Rangka', '2', '', NULL),
(205, '2018-10-28 22:51:59', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'No_Mesin', '2', '', NULL),
(206, '2018-10-28 22:51:59', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'Warna', '2', '', NULL),
(207, '2018-10-28 22:51:59', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'No_Pol', '2', '', NULL),
(208, '2018-10-28 22:51:59', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'Keterangan', '2', '', NULL),
(209, '2018-10-28 22:51:59', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'Atas_Nama', '2', '', NULL),
(210, '2018-10-28 22:51:59', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'id', '2', '', '2'),
(211, '2018-10-28 22:51:59', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'nasabah_id', '3', '', '2'),
(212, '2018-10-28 22:51:59', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'Merk_Type', '3', '', 'Ijasah'),
(213, '2018-10-28 22:51:59', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'No_Rangka', '3', '', NULL),
(214, '2018-10-28 22:51:59', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'No_Mesin', '3', '', NULL),
(215, '2018-10-28 22:51:59', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'Warna', '3', '', NULL),
(216, '2018-10-28 22:51:59', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'No_Pol', '3', '', NULL),
(217, '2018-10-28 22:51:59', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'Keterangan', '3', '', NULL),
(218, '2018-10-28 22:51:59', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'Atas_Nama', '3', '', NULL),
(219, '2018-10-28 22:51:59', '/simkop4/t01_nasabahadd.php', '1', 'A', 't02_jaminan', 'id', '3', '', '3'),
(220, '2018-10-28 22:52:00', '/simkop4/t01_nasabahadd.php', '1', '*** Batch insert successful ***', 't02_jaminan', '', '', '', ''),
(221, '2018-10-28 22:52:51', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_No', '1', '', '1'),
(222, '2018-10-28 22:52:51', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_Tgl', '1', '', '2018-10-28'),
(223, '2018-10-28 22:52:51', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'nasabah_id', '1', '', '1'),
(224, '2018-10-28 22:52:51', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Pinjaman', '1', '', '10400000'),
(225, '2018-10-28 22:52:51', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Lama', '1', '', '12'),
(226, '2018-10-28 22:52:51', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga_Prosen', '1', '', '2.24'),
(227, '2018-10-28 22:52:51', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Denda', '1', '', '0.4'),
(228, '2018-10-28 22:52:51', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Dispensasi_Denda', '1', '', '3'),
(229, '2018-10-28 22:52:51', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Pokok', '1', '', '867000'),
(230, '2018-10-28 22:52:51', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga', '1', '', '233000'),
(231, '2018-10-28 22:52:51', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Total', '1', '', '1100000'),
(232, '2018-10-28 22:52:51', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'No_Ref', '1', '', NULL),
(233, '2018-10-28 22:52:51', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'id', '1', '', '1'),
(234, '2018-10-28 22:52:52', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(235, '2018-10-28 22:52:52', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't06_pinjamantitipan', '', '', '', ''),
(240, '2018-10-28 22:57:04', '/simkop4/t94_logdelete.php', '1', '*** Batch delete begin ***', 't94_log', '', '', '', ''),
(241, '2018-10-28 22:57:04', '/simkop4/t94_logdelete.php', '1', 'D', 't95_logdesc', 'id', '6', '6', ''),
(242, '2018-10-28 22:57:04', '/simkop4/t94_logdelete.php', '1', 'D', 't95_logdesc', 'log_id', '6', '5', ''),
(243, '2018-10-28 22:57:04', '/simkop4/t94_logdelete.php', '1', 'D', 't95_logdesc', 'date_issued', '6', '2018-10-04', ''),
(244, '2018-10-28 22:57:04', '/simkop4/t94_logdelete.php', '1', 'D', 't95_logdesc', 'desc_', '6', 'menghilangkan nasabah_id di add JAMINAN pada proses input PINJAMAN', ''),
(245, '2018-10-28 22:57:04', '/simkop4/t94_logdelete.php', '1', 'D', 't95_logdesc', 'date_solved', '6', '2018-10-17', ''),
(246, '2018-10-28 22:57:04', '/simkop4/t94_logdelete.php', '1', 'D', 't94_log', 'id', '5', '5', ''),
(247, '2018-10-28 22:57:04', '/simkop4/t94_logdelete.php', '1', 'D', 't94_log', 'index_', '5', '5', ''),
(248, '2018-10-28 22:57:04', '/simkop4/t94_logdelete.php', '1', 'D', 't94_log', 'subj_', '5', 'pinjaman - jaminan', ''),
(249, '2018-10-28 22:57:04', '/simkop4/t94_logdelete.php', '1', '*** Batch delete successful ***', 't94_log', '', '', '', ''),
(250, '2018-10-28 22:57:28', '/simkop4/t94_logdelete.php', '1', '*** Batch delete begin ***', 't94_log', '', '', '', ''),
(251, '2018-10-28 22:57:28', '/simkop4/t94_logdelete.php', '1', 'D', 't95_logdesc', 'id', '4', '4', ''),
(252, '2018-10-28 22:57:28', '/simkop4/t94_logdelete.php', '1', 'D', 't95_logdesc', 'log_id', '4', '3', ''),
(253, '2018-10-28 22:57:28', '/simkop4/t94_logdelete.php', '1', 'D', 't95_logdesc', 'date_issued', '4', '2018-10-04', ''),
(254, '2018-10-28 22:57:28', '/simkop4/t94_logdelete.php', '1', 'D', 't95_logdesc', 'desc_', '4', 'melengkapi tampilan add NASABAH di menu PINJAMAN', ''),
(255, '2018-10-28 22:57:28', '/simkop4/t94_logdelete.php', '1', 'D', 't95_logdesc', 'date_solved', '4', '2018-10-17', ''),
(256, '2018-10-28 22:57:29', '/simkop4/t94_logdelete.php', '1', 'D', 't94_log', 'id', '3', '3', ''),
(257, '2018-10-28 22:57:29', '/simkop4/t94_logdelete.php', '1', 'D', 't94_log', 'index_', '3', '3', ''),
(258, '2018-10-28 22:57:29', '/simkop4/t94_logdelete.php', '1', 'D', 't94_log', 'subj_', '3', 'pinjaman - nasabah', ''),
(259, '2018-10-28 22:57:29', '/simkop4/t94_logdelete.php', '1', '*** Batch delete successful ***', 't94_log', '', '', '', ''),
(260, '2018-10-28 22:58:39', '/simkop4/t94_logedit.php', '1', 'U', 't94_log', 'index_', '4', '4', '3'),
(261, '2018-10-28 22:58:59', '/simkop4/t94_logadd.php', '1', 'A', 't94_log', 'index_', '7', '', '4'),
(262, '2018-10-28 22:58:59', '/simkop4/t94_logadd.php', '1', 'A', 't94_log', 'subj_', '7', '', 'pinjaman - jaminan'),
(263, '2018-10-28 22:58:59', '/simkop4/t94_logadd.php', '1', 'A', 't94_log', 'id', '7', '', '7'),
(264, '2018-10-28 22:59:12', '/simkop4/t94_logedit.php', '1', 'U', 't94_log', 'index_', '6', '6', '5'),
(265, '2018-10-28 23:17:40', '/simkop4/t94_logedit.php', '1', '*** Batch update begin ***', 't95_logdesc', '', '', '', ''),
(266, '2018-10-28 23:17:40', '/simkop4/t94_logedit.php', '1', 'U', 't95_logdesc', 'date_solved', '7', '2018-10-17', NULL),
(267, '2018-10-28 23:17:40', '/simkop4/t94_logedit.php', '1', '*** Batch update successful ***', 't95_logdesc', '', '', '', ''),
(268, '2018-10-28 23:27:50', '/simkop4/t94_logedit.php', '1', '*** Batch update begin ***', 't95_logdesc', '', '', '', ''),
(269, '2018-10-28 23:27:50', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'log_id', '8', '', '4'),
(270, '2018-10-28 23:27:50', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'desc_', '8', '', 'otomatis tampil JUMLAH di semua kolom, JUMLAH : TERLAMBAT, DENDA, BAYAR TITIPAN, dan seterusnya'),
(271, '2018-10-28 23:27:50', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'date_issued', '8', '', '2018-10-18'),
(272, '2018-10-28 23:27:50', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'date_solved', '8', '', NULL),
(273, '2018-10-28 23:27:50', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'id', '8', '', '8'),
(274, '2018-10-28 23:27:50', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'log_id', '9', '', '4'),
(275, '2018-10-28 23:27:50', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'desc_', '9', '', 'jumlah TITIPAN langsung tampil bila nasabah memiliki SALDO TITIPAN'),
(276, '2018-10-28 23:27:50', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'date_issued', '9', '', '2018-10-18'),
(277, '2018-10-28 23:27:50', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'date_solved', '9', '', NULL),
(278, '2018-10-28 23:27:50', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'id', '9', '', '9'),
(279, '2018-10-28 23:27:50', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'log_id', '10', '', '4'),
(280, '2018-10-28 23:27:50', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'desc_', '10', '', 'nilai TERLAMBAT dan DENDA otomatis rumus, TANGGAL BAYAR dikurangi TANGGAL JATUH TEMPO'),
(281, '2018-10-28 23:27:50', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'date_issued', '10', '', '2018-10-18'),
(282, '2018-10-28 23:27:50', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'date_solved', '10', '', NULL),
(283, '2018-10-28 23:27:50', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'id', '10', '', '10'),
(284, '2018-10-28 23:27:50', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'log_id', '11', '', '4'),
(285, '2018-10-28 23:27:50', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'desc_', '11', '', 'read only baris record ANGSURAN, hanya dibuka 1 record saja, yg mana yg akan diproses datanya'),
(286, '2018-10-28 23:27:50', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'date_issued', '11', '', '2018-10-18'),
(287, '2018-10-28 23:27:50', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'date_solved', '11', '', NULL),
(288, '2018-10-28 23:27:50', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'id', '11', '', '11'),
(289, '2018-10-28 23:27:50', '/simkop4/t94_logedit.php', '1', '*** Batch update successful ***', 't95_logdesc', '', '', '', ''),
(290, '2018-10-29 00:18:27', '/simkop4/t94_logedit.php', '1', '*** Batch update begin ***', 't95_logdesc', '', '', '', ''),
(291, '2018-10-29 00:18:28', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'log_id', '12', '', '1'),
(292, '2018-10-29 00:18:28', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'desc_', '12', '', 'buat modul SETUP - PERIODE'),
(293, '2018-10-29 00:18:28', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'date_issued', '12', '', '2018-10-29'),
(294, '2018-10-29 00:18:28', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'date_solved', '12', '', NULL),
(295, '2018-10-29 00:18:28', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'id', '12', '', '12'),
(296, '2018-10-29 00:18:28', '/simkop4/t94_logedit.php', '1', '*** Batch update successful ***', 't95_logdesc', '', '', '', ''),
(297, '2018-10-29 00:21:36', '/simkop4/t94_logedit.php', '1', '*** Batch update begin ***', 't95_logdesc', '', '', '', ''),
(298, '2018-10-29 00:21:36', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'log_id', '13', '', '1'),
(299, '2018-10-29 00:21:36', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'desc_', '13', '', 'buat modul TUTUP BUKU (BULANAN)'),
(300, '2018-10-29 00:21:36', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'date_issued', '13', '', '2018-10-29'),
(301, '2018-10-29 00:21:36', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'date_solved', '13', '', NULL),
(302, '2018-10-29 00:21:36', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'id', '13', '', '13'),
(303, '2018-10-29 00:21:37', '/simkop4/t94_logedit.php', '1', '*** Batch update successful ***', 't95_logdesc', '', '', '', ''),
(304, '2018-10-29 00:38:27', '/simkop4/t95_logdesclist.php', '1', 'U', 't95_logdesc', 'date_solved', '12', NULL, '2018-10-29'),
(305, '2018-10-29 00:43:05', '/simkop4/t95_logdesclist.php', '1', 'U', 't95_logdesc', 'date_solved', '11', NULL, '2018-10-29'),
(306, '2018-10-29 00:44:27', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(307, '2018-10-29 00:44:27', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(308, '2018-10-29 00:44:27', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(309, '2018-10-29 00:44:27', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(310, '2018-10-29 00:44:27', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(311, '2018-10-29 00:44:27', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(312, '2018-10-29 03:07:52', '/simkop4/t94_logadd.php', '1', 'A', 't94_log', 'index_', '8', '', '0'),
(313, '2018-10-29 03:07:52', '/simkop4/t94_logadd.php', '1', 'A', 't94_log', 'subj_', '8', '', 'last update'),
(314, '2018-10-29 03:07:52', '/simkop4/t94_logadd.php', '1', 'A', 't94_log', 'id', '8', '', '8'),
(315, '2018-10-29 03:07:52', '/simkop4/t94_logadd.php', '1', '*** Batch insert begin ***', 't95_logdesc', '', '', '', ''),
(316, '2018-10-29 03:07:53', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'log_id', '14', '', '8'),
(317, '2018-10-29 03:07:53', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'desc_', '14', '', 'sampai dengan ss 8'),
(318, '2018-10-29 03:07:53', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'date_issued', '14', '', '2018-10-29'),
(319, '2018-10-29 03:07:53', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'date_solved', '14', '', NULL),
(320, '2018-10-29 03:07:53', '/simkop4/t94_logadd.php', '1', 'A', 't95_logdesc', 'id', '14', '', '14'),
(321, '2018-10-29 03:07:53', '/simkop4/t94_logadd.php', '1', '*** Batch insert successful ***', 't95_logdesc', '', '', '', ''),
(322, '2018-10-29 03:09:11', '/simkop4/t94_logedit.php', '1', '*** Batch update begin ***', 't95_logdesc', '', '', '', ''),
(323, '2018-10-29 03:09:11', '/simkop4/t94_logedit.php', '1', 'U', 't95_logdesc', 'desc_', '14', 'sampai dengan ss 8', 'sampai dengan ss 8; lengkapi record di pinjaman - angsuran'),
(324, '2018-10-29 03:09:11', '/simkop4/t94_logedit.php', '1', '*** Batch update successful ***', 't95_logdesc', '', '', '', ''),
(325, '2018-10-29 07:23:45', '/simkop4/login.php', 'admin', 'login', '::1', '', '', '', ''),
(326, '2018-10-30 02:57:47', '/simkop4/t94_logedit.php', '1', '*** Batch update begin ***', 't95_logdesc', '', '', '', ''),
(327, '2018-10-30 02:57:47', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'log_id', '15', '', '8'),
(328, '2018-10-30 02:57:47', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'desc_', '15', '', 'sampai dengan ss 9; lengkapi record di pinjaman - angsuran - lengkapi input titipan'),
(329, '2018-10-30 02:57:47', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'date_issued', '15', '', '2018-10-30'),
(330, '2018-10-30 02:57:47', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'date_solved', '15', '', NULL),
(331, '2018-10-30 02:57:47', '/simkop4/t94_logedit.php', '1', 'A', 't95_logdesc', 'id', '15', '', '15'),
(332, '2018-10-30 02:57:47', '/simkop4/t94_logedit.php', '1', '*** Batch update successful ***', 't95_logdesc', '', '', '', ''),
(341, '2018-10-30 04:07:20', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(342, '2018-10-30 04:07:20', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Tanggal_Bayar', '1', NULL, '2018-10-30'),
(343, '2018-10-30 04:07:20', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Terlambat', '1', NULL, '-29'),
(344, '2018-10-30 04:07:20', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Total_Denda', '1', NULL, '0'),
(345, '2018-10-30 04:07:20', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', NULL, '0'),
(346, '2018-10-30 04:07:20', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', NULL, '1100000'),
(347, '2018-10-30 04:07:20', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Total', '1', NULL, '1100000'),
(348, '2018-10-30 04:07:20', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(349, '2018-10-30 04:07:20', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(350, '2018-10-30 04:07:20', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(351, '2018-10-30 04:07:20', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(352, '2018-10-30 04:07:20', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'pinjaman_id', '1', '', '1'),
(353, '2018-10-30 04:07:20', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Tanggal', '1', '', '2018-10-30'),
(354, '2018-10-30 04:07:20', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keterangan', '1', '', '1'),
(355, '2018-10-30 04:07:20', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Masuk', '1', '', '200000'),
(356, '2018-10-30 04:07:20', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keluar', '1', '', '0'),
(357, '2018-10-30 04:07:20', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Sisa', '1', '', '0'),
(358, '2018-10-30 04:07:20', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'id', '1', '', '1'),
(359, '2018-10-30 04:07:21', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(360, '2018-10-30 05:09:45', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(361, '2018-10-30 05:09:45', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Tanggal_Bayar', '1', '2018-10-30', '2018-10-31'),
(362, '2018-10-30 05:09:45', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Terlambat', '1', '-29', '-28'),
(363, '2018-10-30 05:09:45', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(364, '2018-10-30 05:09:45', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(365, '2018-10-30 05:09:45', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(366, '2018-10-30 05:09:45', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(367, '2018-10-30 05:09:45', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(368, '2018-10-30 05:13:15', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_No', '1', '', '1'),
(369, '2018-10-30 05:13:15', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_Tgl', '1', '', '2018-10-30'),
(370, '2018-10-30 05:13:15', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'nasabah_id', '1', '', '1'),
(371, '2018-10-30 05:13:15', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Pinjaman', '1', '', '10400000'),
(372, '2018-10-30 05:13:15', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Lama', '1', '', '12'),
(373, '2018-10-30 05:13:15', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga_Prosen', '1', '', '2.24'),
(374, '2018-10-30 05:13:15', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Denda', '1', '', '0.4'),
(375, '2018-10-30 05:13:15', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Dispensasi_Denda', '1', '', '3'),
(376, '2018-10-30 05:13:15', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Pokok', '1', '', '867000'),
(377, '2018-10-30 05:13:15', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga', '1', '', '233000'),
(378, '2018-10-30 05:13:15', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Total', '1', '', '1100000'),
(379, '2018-10-30 05:13:15', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'No_Ref', '1', '', NULL),
(380, '2018-10-30 05:13:15', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'id', '1', '', '1'),
(381, '2018-10-30 05:13:15', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(382, '2018-10-30 05:13:15', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't06_pinjamantitipan', '', '', '', ''),
(383, '2018-10-30 05:16:01', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_No', '1', '', '1'),
(384, '2018-10-30 05:16:01', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_Tgl', '1', '', '2018-10-30'),
(385, '2018-10-30 05:16:01', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'nasabah_id', '1', '', '1'),
(386, '2018-10-30 05:16:01', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Pinjaman', '1', '', '10400000'),
(387, '2018-10-30 05:16:01', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Lama', '1', '', '12'),
(388, '2018-10-30 05:16:01', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga_Prosen', '1', '', '2.24'),
(389, '2018-10-30 05:16:01', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Denda', '1', '', '0.4'),
(390, '2018-10-30 05:16:01', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Dispensasi_Denda', '1', '', '3'),
(391, '2018-10-30 05:16:01', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Pokok', '1', '', '867000'),
(392, '2018-10-30 05:16:01', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga', '1', '', '233000'),
(393, '2018-10-30 05:16:01', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Total', '1', '', '1100000'),
(394, '2018-10-30 05:16:01', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'No_Ref', '1', '', NULL),
(395, '2018-10-30 05:16:01', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'id', '1', '', '1'),
(396, '2018-10-30 05:16:02', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(397, '2018-10-30 05:16:02', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't06_pinjamantitipan', '', '', '', ''),
(398, '2018-10-30 05:19:21', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_No', '1', '', '1'),
(399, '2018-10-30 05:19:21', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_Tgl', '1', '', '2018-10-30'),
(400, '2018-10-30 05:19:21', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'nasabah_id', '1', '', '1'),
(401, '2018-10-30 05:19:21', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Pinjaman', '1', '', '10400000'),
(402, '2018-10-30 05:19:21', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Lama', '1', '', '12'),
(403, '2018-10-30 05:19:21', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga_Prosen', '1', '', '2.24'),
(404, '2018-10-30 05:19:21', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Denda', '1', '', '0.4'),
(405, '2018-10-30 05:19:21', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Dispensasi_Denda', '1', '', '3'),
(406, '2018-10-30 05:19:21', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Pokok', '1', '', '867000'),
(407, '2018-10-30 05:19:21', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga', '1', '', '233000'),
(408, '2018-10-30 05:19:21', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Total', '1', '', '1100000'),
(409, '2018-10-30 05:19:21', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'No_Ref', '1', '', NULL),
(410, '2018-10-30 05:19:21', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'id', '1', '', '1'),
(411, '2018-10-30 05:19:22', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(412, '2018-10-30 05:19:22', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't06_pinjamantitipan', '', '', '', ''),
(413, '2018-10-30 05:27:33', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_No', '1', '', '1'),
(414, '2018-10-30 05:27:33', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_Tgl', '1', '', '2018-10-30'),
(415, '2018-10-30 05:27:33', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'nasabah_id', '1', '', '1'),
(416, '2018-10-30 05:27:33', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Pinjaman', '1', '', '10400000'),
(417, '2018-10-30 05:27:33', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Lama', '1', '', '12'),
(418, '2018-10-30 05:27:33', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga_Prosen', '1', '', '2.25'),
(419, '2018-10-30 05:27:33', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Denda', '1', '', '0.4'),
(420, '2018-10-30 05:27:33', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Dispensasi_Denda', '1', '', '3'),
(421, '2018-10-30 05:27:33', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Pokok', '1', '', '866666.6666666666'),
(422, '2018-10-30 05:27:33', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga', '1', '', '234000'),
(423, '2018-10-30 05:27:33', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Total', '1', '', '1100666.6666666665'),
(424, '2018-10-30 05:27:33', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'No_Ref', '1', '', NULL),
(425, '2018-10-30 05:27:33', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'id', '1', '', '1'),
(426, '2018-10-30 05:27:34', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(427, '2018-10-30 05:27:34', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't06_pinjamantitipan', '', '', '', ''),
(428, '2018-10-30 05:29:18', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_No', '2', '', '2'),
(429, '2018-10-30 05:29:18', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_Tgl', '2', '', '2018-10-30'),
(430, '2018-10-30 05:29:18', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'nasabah_id', '2', '', '2'),
(431, '2018-10-30 05:29:18', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Pinjaman', '2', '', '10400000'),
(432, '2018-10-30 05:29:18', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Lama', '2', '', '12'),
(433, '2018-10-30 05:29:18', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga_Prosen', '2', '', '2.25'),
(434, '2018-10-30 05:29:18', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Denda', '2', '', '0.4'),
(435, '2018-10-30 05:29:18', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Dispensasi_Denda', '2', '', '3');
INSERT INTO `t99_audittrail` (`id`, `datetime`, `script`, `user`, `action`, `table`, `field`, `keyvalue`, `oldvalue`, `newvalue`) VALUES
(436, '2018-10-30 05:29:18', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Pokok', '2', '', '866666.6666666666'),
(437, '2018-10-30 05:29:18', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga', '2', '', '234000'),
(438, '2018-10-30 05:29:18', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Total', '2', '', '1100666.6666666665'),
(439, '2018-10-30 05:29:18', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'No_Ref', '2', '', NULL),
(440, '2018-10-30 05:29:18', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'id', '2', '', '2'),
(441, '2018-10-30 05:29:18', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(442, '2018-10-30 05:29:18', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't06_pinjamantitipan', '', '', '', ''),
(443, '2018-10-30 05:30:28', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_No', '3', '', '3'),
(444, '2018-10-30 05:30:28', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_Tgl', '3', '', '2018-10-30'),
(445, '2018-10-30 05:30:28', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'nasabah_id', '3', '', '1'),
(446, '2018-10-30 05:30:28', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Pinjaman', '3', '', '10400000'),
(447, '2018-10-30 05:30:28', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Lama', '3', '', '12'),
(448, '2018-10-30 05:30:28', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga_Prosen', '3', '', '2.25'),
(449, '2018-10-30 05:30:28', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Denda', '3', '', '0.4'),
(450, '2018-10-30 05:30:28', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Dispensasi_Denda', '3', '', '3'),
(451, '2018-10-30 05:30:28', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Pokok', '3', '', '866666.6666666666'),
(452, '2018-10-30 05:30:28', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga', '3', '', '234000'),
(453, '2018-10-30 05:30:28', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Total', '3', '', '1100666.6666666665'),
(454, '2018-10-30 05:30:28', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'No_Ref', '3', '', NULL),
(455, '2018-10-30 05:30:28', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'id', '3', '', '3'),
(456, '2018-10-30 05:30:28', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(457, '2018-10-30 05:30:28', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't06_pinjamantitipan', '', '', '', ''),
(458, '2018-10-30 05:34:06', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_No', '4', '', '4'),
(459, '2018-10-30 05:34:06', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_Tgl', '4', '', '2018-10-30'),
(460, '2018-10-30 05:34:06', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'nasabah_id', '4', '', '2'),
(461, '2018-10-30 05:34:06', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Pinjaman', '4', '', '10400000'),
(462, '2018-10-30 05:34:06', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Lama', '4', '', '12'),
(463, '2018-10-30 05:34:06', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga_Prosen', '4', '', '2.25'),
(464, '2018-10-30 05:34:06', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Denda', '4', '', '0.4'),
(465, '2018-10-30 05:34:06', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Dispensasi_Denda', '4', '', '3'),
(466, '2018-10-30 05:34:06', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Pokok', '4', '', '866666.6666666666'),
(467, '2018-10-30 05:34:06', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga', '4', '', '234000'),
(468, '2018-10-30 05:34:06', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Total', '4', '', '1100666.6666666665'),
(469, '2018-10-30 05:34:06', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'No_Ref', '4', '', NULL),
(470, '2018-10-30 05:34:06', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'id', '4', '', '4'),
(471, '2018-10-30 05:34:06', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(472, '2018-10-30 05:34:06', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't06_pinjamantitipan', '', '', '', ''),
(473, '2018-10-30 05:35:12', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_No', '5', '', '5'),
(474, '2018-10-30 05:35:12', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_Tgl', '5', '', '2018-10-30'),
(475, '2018-10-30 05:35:12', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'nasabah_id', '5', '', '1'),
(476, '2018-10-30 05:35:12', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Pinjaman', '5', '', '10400000'),
(477, '2018-10-30 05:35:12', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Lama', '5', '', '12'),
(478, '2018-10-30 05:35:12', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga_Prosen', '5', '', '2.25'),
(479, '2018-10-30 05:35:12', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Denda', '5', '', '0.4'),
(480, '2018-10-30 05:35:12', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Dispensasi_Denda', '5', '', '3'),
(481, '2018-10-30 05:35:12', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Pokok', '5', '', '866666.6666666666'),
(482, '2018-10-30 05:35:12', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga', '5', '', '234000'),
(483, '2018-10-30 05:35:12', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Total', '5', '', '1100666.6666666665'),
(484, '2018-10-30 05:35:12', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'No_Ref', '5', '', NULL),
(485, '2018-10-30 05:35:12', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'id', '5', '', '5'),
(486, '2018-10-30 05:35:12', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(487, '2018-10-30 05:35:12', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't06_pinjamantitipan', '', '', '', ''),
(488, '2018-10-30 05:36:37', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_No', '6', '', '6'),
(489, '2018-10-30 05:36:37', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_Tgl', '6', '', '2018-10-30'),
(490, '2018-10-30 05:36:37', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'nasabah_id', '6', '', '2'),
(491, '2018-10-30 05:36:37', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Pinjaman', '6', '', '10400000'),
(492, '2018-10-30 05:36:37', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Lama', '6', '', '12'),
(493, '2018-10-30 05:36:37', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga_Prosen', '6', '', '2.25'),
(494, '2018-10-30 05:36:37', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Denda', '6', '', '0.4'),
(495, '2018-10-30 05:36:37', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Dispensasi_Denda', '6', '', '3'),
(496, '2018-10-30 05:36:37', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Pokok', '6', '', '866666.6666666666'),
(497, '2018-10-30 05:36:37', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga', '6', '', '234000'),
(498, '2018-10-30 05:36:37', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Total', '6', '', '1100666.6666666665'),
(499, '2018-10-30 05:36:37', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'No_Ref', '6', '', NULL),
(500, '2018-10-30 05:36:37', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'id', '6', '', '6'),
(501, '2018-10-30 05:36:37', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(502, '2018-10-30 05:36:37', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't06_pinjamantitipan', '', '', '', ''),
(503, '2018-10-30 05:37:55', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_No', '7', '', '7'),
(504, '2018-10-30 05:37:55', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_Tgl', '7', '', '2018-10-30'),
(505, '2018-10-30 05:37:55', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'nasabah_id', '7', '', '1'),
(506, '2018-10-30 05:37:55', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Pinjaman', '7', '', '10400000'),
(507, '2018-10-30 05:37:55', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Lama', '7', '', '12'),
(508, '2018-10-30 05:37:55', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga_Prosen', '7', '', '2.25'),
(509, '2018-10-30 05:37:55', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Denda', '7', '', '0.4'),
(510, '2018-10-30 05:37:55', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Dispensasi_Denda', '7', '', '3'),
(511, '2018-10-30 05:37:55', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Pokok', '7', '', '866666.6666666666'),
(512, '2018-10-30 05:37:55', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga', '7', '', '234000'),
(513, '2018-10-30 05:37:55', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Total', '7', '', '1100666.6666666665'),
(514, '2018-10-30 05:37:55', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'No_Ref', '7', '', NULL),
(515, '2018-10-30 05:37:55', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'id', '7', '', '7'),
(516, '2018-10-30 05:37:56', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(517, '2018-10-30 05:37:56', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't06_pinjamantitipan', '', '', '', ''),
(518, '2018-10-30 09:23:24', '/simkop4/login.php', 'admin', 'login', '::1', '', '', '', ''),
(525, '2018-10-30 11:54:54', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't03_pinjaman', 'Angsuran_Bunga_Prosen', '1', '2.25', '2.24'),
(526, '2018-10-30 11:54:54', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't03_pinjaman', 'Angsuran_Pokok', '1', '866666.69', '867000'),
(527, '2018-10-30 11:54:54', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't03_pinjaman', 'Angsuran_Bunga', '1', '234000.00', '233000'),
(528, '2018-10-30 11:54:54', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't03_pinjaman', 'Angsuran_Total', '1', '1100666.62', '1100000'),
(529, '2018-10-30 11:54:54', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(530, '2018-10-30 11:54:54', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Tanggal_Bayar', '1', NULL, '2018-10-30'),
(531, '2018-10-30 11:54:54', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Terlambat', '1', NULL, '-31'),
(532, '2018-10-30 11:54:54', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Total_Denda', '1', NULL, '0'),
(533, '2018-10-30 11:54:54', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', NULL, '0'),
(534, '2018-10-30 11:54:54', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', NULL, '1100666.62'),
(535, '2018-10-30 11:54:54', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Total', '1', NULL, '1100666.62'),
(536, '2018-10-30 11:54:54', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(537, '2018-10-30 11:54:54', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(538, '2018-10-30 11:54:54', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(539, '2018-10-30 11:54:55', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(540, '2018-10-30 11:54:55', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(541, '2018-10-30 12:22:03', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't03_pinjaman', 'Angsuran_Bunga_Prosen', '2', '2.25', '2.24'),
(542, '2018-10-30 12:22:03', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't03_pinjaman', 'Angsuran_Pokok', '2', '866666.69', '867000'),
(543, '2018-10-30 12:22:03', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't03_pinjaman', 'Angsuran_Bunga', '2', '234000.00', '233000'),
(544, '2018-10-30 12:22:03', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't03_pinjaman', 'Angsuran_Total', '2', '1100666.62', '1100000'),
(545, '2018-10-30 12:22:03', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(546, '2018-10-30 12:22:03', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Tanggal_Bayar', '13', NULL, '2018-10-30'),
(547, '2018-10-30 12:22:03', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Terlambat', '13', NULL, '-31'),
(548, '2018-10-30 12:22:03', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Total_Denda', '13', NULL, '0'),
(549, '2018-10-30 12:22:03', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '13', NULL, '0'),
(550, '2018-10-30 12:22:03', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '13', NULL, '1100666.62'),
(551, '2018-10-30 12:22:03', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Total', '13', NULL, '1100666.62'),
(552, '2018-10-30 12:22:03', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(553, '2018-10-30 12:22:03', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(554, '2018-10-30 12:22:03', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(555, '2018-10-30 12:22:03', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(556, '2018-10-30 12:22:03', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(557, '2018-10-30 12:22:36', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(558, '2018-10-30 12:22:36', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Tanggal_Bayar', '97', NULL, '2018-12-04'),
(559, '2018-10-30 12:22:36', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Terlambat', '97', NULL, '4'),
(560, '2018-10-30 12:22:36', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Total_Denda', '97', NULL, '17600'),
(561, '2018-10-30 12:22:36', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '97', NULL, '0'),
(562, '2018-10-30 12:22:36', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '97', NULL, '1100000'),
(563, '2018-10-30 12:22:36', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Total', '97', NULL, '1100000'),
(564, '2018-10-30 12:22:36', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(565, '2018-10-30 12:22:36', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(566, '2018-10-30 12:22:36', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(567, '2018-10-30 12:22:36', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(568, '2018-10-30 12:22:36', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(569, '2018-10-30 12:28:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_No', '1', '', '1'),
(570, '2018-10-30 12:28:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_Tgl', '1', '', '2018-10-30'),
(571, '2018-10-30 12:28:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'nasabah_id', '1', '', '1'),
(572, '2018-10-30 12:28:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Pinjaman', '1', '', '10400000'),
(573, '2018-10-30 12:28:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Lama', '1', '', '12'),
(574, '2018-10-30 12:28:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga_Prosen', '1', '', '2.24'),
(575, '2018-10-30 12:28:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Denda', '1', '', '0.4'),
(576, '2018-10-30 12:28:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Dispensasi_Denda', '1', '', '3'),
(577, '2018-10-30 12:28:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Pokok', '1', '', '867000'),
(578, '2018-10-30 12:28:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga', '1', '', '233000'),
(579, '2018-10-30 12:28:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Total', '1', '', '1100000'),
(580, '2018-10-30 12:28:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'No_Ref', '1', '', NULL),
(581, '2018-10-30 12:28:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'id', '1', '', '1'),
(582, '2018-10-30 12:28:41', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(583, '2018-10-30 12:28:41', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't06_pinjamantitipan', '', '', '', ''),
(584, '2018-10-30 13:42:54', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(585, '2018-10-30 13:42:54', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Tanggal_Bayar', '1', NULL, '2018-10-30'),
(586, '2018-10-30 13:42:54', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Terlambat', '1', NULL, '-31'),
(587, '2018-10-30 13:42:54', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Total_Denda', '1', NULL, '0'),
(588, '2018-10-30 13:42:54', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', NULL, '0'),
(589, '2018-10-30 13:42:54', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', NULL, '1100000'),
(590, '2018-10-30 13:42:54', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Total', '1', NULL, '1100000'),
(591, '2018-10-30 13:42:54', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(592, '2018-10-30 13:42:54', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(593, '2018-10-30 13:42:54', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(594, '2018-10-30 13:42:54', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(595, '2018-10-30 13:42:54', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'pinjaman_id', '1', '', '1'),
(596, '2018-10-30 13:42:54', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Tanggal', '1', '', '2018-10-30'),
(597, '2018-10-30 13:42:54', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keterangan', '1', '', '1'),
(598, '2018-10-30 13:42:54', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Masuk', '1', '', '200000'),
(599, '2018-10-30 13:42:54', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keluar', '1', '', '0'),
(600, '2018-10-30 13:42:54', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Sisa', '1', '', '0'),
(601, '2018-10-30 13:42:54', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'id', '1', '', '1'),
(602, '2018-10-30 13:42:54', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(603, '2018-10-30 13:43:22', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(604, '2018-10-30 13:43:22', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Tanggal_Bayar', '1', '2018-10-30', '2018-12-04'),
(605, '2018-10-30 13:43:22', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Terlambat', '1', '-31', '4'),
(606, '2018-10-30 13:43:22', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Total_Denda', '1', '0.00', '17600'),
(607, '2018-10-30 13:43:22', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Total', '1', '1100000.00', '1117600'),
(608, '2018-10-30 13:43:22', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(609, '2018-10-30 13:43:22', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(610, '2018-10-30 13:43:22', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(611, '2018-10-30 13:43:22', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(612, '2018-10-30 13:43:22', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(613, '2018-10-30 13:50:20', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(614, '2018-10-30 13:50:20', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Tanggal_Bayar', '1', '2018-12-04', '2018-12-05'),
(615, '2018-10-30 13:50:20', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Terlambat', '1', '4', '5'),
(616, '2018-10-30 13:50:20', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Total_Denda', '1', '17600.00', '22000'),
(617, '2018-10-30 13:50:20', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', '0.00', '200000.00'),
(618, '2018-10-30 13:50:20', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', '1100000.00', '900000'),
(619, '2018-10-30 13:50:20', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Total', '1', '1117600.00', '1122000'),
(620, '2018-10-30 13:50:20', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(621, '2018-10-30 13:50:20', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(622, '2018-10-30 13:50:20', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(623, '2018-10-30 13:50:20', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(624, '2018-10-30 13:50:20', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(625, '2018-10-30 13:52:05', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_No', '1', '', '1'),
(626, '2018-10-30 13:52:05', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_Tgl', '1', '', '2018-10-30'),
(627, '2018-10-30 13:52:05', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'nasabah_id', '1', '', '1'),
(628, '2018-10-30 13:52:05', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Pinjaman', '1', '', '10400000'),
(629, '2018-10-30 13:52:05', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Lama', '1', '', '12'),
(630, '2018-10-30 13:52:05', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga_Prosen', '1', '', '2.24'),
(631, '2018-10-30 13:52:05', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Denda', '1', '', '0.4'),
(632, '2018-10-30 13:52:05', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Dispensasi_Denda', '1', '', '3'),
(633, '2018-10-30 13:52:05', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Pokok', '1', '', '867000'),
(634, '2018-10-30 13:52:05', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga', '1', '', '233000'),
(635, '2018-10-30 13:52:05', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Total', '1', '', '1100000'),
(636, '2018-10-30 13:52:05', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'No_Ref', '1', '', NULL),
(637, '2018-10-30 13:52:05', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'id', '1', '', '1'),
(638, '2018-10-30 13:52:05', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(639, '2018-10-30 13:52:05', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't06_pinjamantitipan', '', '', '', ''),
(640, '2018-10-30 13:53:04', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(641, '2018-10-30 13:53:04', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Tanggal_Bayar', '1', NULL, '2018-12-04'),
(642, '2018-10-30 13:53:04', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Terlambat', '1', NULL, '4'),
(643, '2018-10-30 13:53:04', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Total_Denda', '1', NULL, '17600'),
(644, '2018-10-30 13:53:04', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', NULL, '0'),
(645, '2018-10-30 13:53:04', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', NULL, '1100000'),
(646, '2018-10-30 13:53:04', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Total', '1', NULL, '1117600'),
(647, '2018-10-30 13:53:05', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(648, '2018-10-30 13:53:05', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(649, '2018-10-30 13:53:05', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(650, '2018-10-30 13:53:05', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(651, '2018-10-30 13:53:05', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'pinjaman_id', '1', '', '1'),
(652, '2018-10-30 13:53:05', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Tanggal', '1', '', '2018-10-30'),
(653, '2018-10-30 13:53:05', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keterangan', '1', '', '1'),
(654, '2018-10-30 13:53:05', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Masuk', '1', '', '200000'),
(655, '2018-10-30 13:53:05', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keluar', '1', '', '0'),
(656, '2018-10-30 13:53:05', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Sisa', '1', '', '0'),
(657, '2018-10-30 13:53:05', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'id', '1', '', '1'),
(658, '2018-10-30 13:53:05', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(659, '2018-10-30 19:12:35', '/simkop4/login.php', 'admin', 'login', '::1', '', '', '', ''),
(660, '2018-10-30 19:14:05', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(661, '2018-10-30 19:14:05', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', '0.00', '200000.00'),
(662, '2018-10-30 19:14:05', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', '1100000.00', '900000'),
(663, '2018-10-30 19:14:05', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(664, '2018-10-30 19:14:05', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(665, '2018-10-30 19:14:05', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(666, '2018-10-30 19:14:05', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(667, '2018-10-30 19:14:05', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch delete begin ***', 't06_pinjamantitipan', '', '', '', ''),
(668, '2018-10-30 19:14:05', '/simkop4/t03_pinjamanedit.php', '1', 'D', 't06_pinjamantitipan', 'id', '1', '1', ''),
(669, '2018-10-30 19:14:05', '/simkop4/t03_pinjamanedit.php', '1', 'D', 't06_pinjamantitipan', 'pinjaman_id', '1', '1', ''),
(670, '2018-10-30 19:14:05', '/simkop4/t03_pinjamanedit.php', '1', 'D', 't06_pinjamantitipan', 'Tanggal', '1', '2018-10-30', ''),
(671, '2018-10-30 19:14:05', '/simkop4/t03_pinjamanedit.php', '1', 'D', 't06_pinjamantitipan', 'Keterangan', '1', '1', ''),
(672, '2018-10-30 19:14:05', '/simkop4/t03_pinjamanedit.php', '1', 'D', 't06_pinjamantitipan', 'Masuk', '1', '200000.00', ''),
(673, '2018-10-30 19:14:05', '/simkop4/t03_pinjamanedit.php', '1', 'D', 't06_pinjamantitipan', 'Keluar', '1', '0.00', ''),
(674, '2018-10-30 19:14:05', '/simkop4/t03_pinjamanedit.php', '1', 'D', 't06_pinjamantitipan', 'Sisa', '1', '200000.00', ''),
(675, '2018-10-30 19:14:06', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch delete successful ***', 't06_pinjamantitipan', '', '', '', ''),
(676, '2018-10-30 19:14:06', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(677, '2018-10-30 19:14:27', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(678, '2018-10-30 19:14:27', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', '200000.00', '0'),
(679, '2018-10-30 19:14:27', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', '900000.00', '1100000'),
(680, '2018-10-30 19:14:27', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(681, '2018-10-30 19:14:27', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(682, '2018-10-30 19:14:27', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(683, '2018-10-30 19:14:27', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(684, '2018-10-30 19:14:27', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'pinjaman_id', '2', '', '1'),
(685, '2018-10-30 19:14:27', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Tanggal', '2', '', '2018-10-30'),
(686, '2018-10-30 19:14:27', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keterangan', '2', '', '1'),
(687, '2018-10-30 19:14:27', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Masuk', '2', '', '200000'),
(688, '2018-10-30 19:14:27', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keluar', '2', '', '0'),
(689, '2018-10-30 19:14:27', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Sisa', '2', '', '0'),
(690, '2018-10-30 19:14:27', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'id', '2', '', '2'),
(691, '2018-10-30 19:14:27', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(692, '2018-10-30 19:38:52', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_No', '1', '', '1'),
(693, '2018-10-30 19:38:52', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_Tgl', '1', '', '2018-10-30'),
(694, '2018-10-30 19:38:52', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'nasabah_id', '1', '', '1'),
(695, '2018-10-30 19:38:52', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Pinjaman', '1', '', '10400000'),
(696, '2018-10-30 19:38:52', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Lama', '1', '', '12'),
(697, '2018-10-30 19:38:52', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga_Prosen', '1', '', '2.24'),
(698, '2018-10-30 19:38:52', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Denda', '1', '', '0.4'),
(699, '2018-10-30 19:38:52', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Dispensasi_Denda', '1', '', '3'),
(700, '2018-10-30 19:38:52', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Pokok', '1', '', '867000'),
(701, '2018-10-30 19:38:52', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga', '1', '', '233000'),
(702, '2018-10-30 19:38:52', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Total', '1', '', '1100000'),
(703, '2018-10-30 19:38:52', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'No_Ref', '1', '', NULL),
(704, '2018-10-30 19:38:52', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'id', '1', '', '1'),
(705, '2018-10-30 19:38:52', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(706, '2018-10-30 19:38:52', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't06_pinjamantitipan', '', '', '', ''),
(707, '2018-10-30 19:39:24', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(708, '2018-10-30 19:39:24', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Tanggal_Bayar', '1', NULL, '2018-12-02'),
(709, '2018-10-30 19:39:24', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Terlambat', '1', NULL, '2'),
(710, '2018-10-30 19:39:24', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Total_Denda', '1', NULL, '0'),
(711, '2018-10-30 19:39:24', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', NULL, '0'),
(712, '2018-10-30 19:39:24', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', NULL, '1100000'),
(713, '2018-10-30 19:39:24', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Total', '1', NULL, '1100000'),
(714, '2018-10-30 19:39:24', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(715, '2018-10-30 19:39:24', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(716, '2018-10-30 19:39:24', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(717, '2018-10-30 19:39:24', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(718, '2018-10-30 19:39:24', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(719, '2018-10-30 19:41:58', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(720, '2018-10-30 19:41:58', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(721, '2018-10-30 19:41:58', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(722, '2018-10-30 19:41:59', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(723, '2018-10-30 19:41:59', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(724, '2018-10-30 19:41:59', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(725, '2018-10-30 19:42:58', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_No', '1', '', '1'),
(726, '2018-10-30 19:42:58', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_Tgl', '1', '', '2018-10-30'),
(727, '2018-10-30 19:42:58', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'nasabah_id', '1', '', '1'),
(728, '2018-10-30 19:42:58', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Pinjaman', '1', '', '10400000'),
(729, '2018-10-30 19:42:58', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Lama', '1', '', '12'),
(730, '2018-10-30 19:42:58', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga_Prosen', '1', '', '2.24'),
(731, '2018-10-30 19:42:58', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Denda', '1', '', '0.4'),
(732, '2018-10-30 19:42:58', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Dispensasi_Denda', '1', '', '3'),
(733, '2018-10-30 19:42:58', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Pokok', '1', '', '867000'),
(734, '2018-10-30 19:42:58', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga', '1', '', '233000'),
(735, '2018-10-30 19:42:58', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Total', '1', '', '1100000'),
(736, '2018-10-30 19:42:58', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'No_Ref', '1', '', NULL),
(737, '2018-10-30 19:42:58', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'id', '1', '', '1'),
(738, '2018-10-30 19:42:58', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(739, '2018-10-30 19:42:58', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't06_pinjamantitipan', '', '', '', ''),
(740, '2018-10-30 19:43:11', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(741, '2018-10-30 19:43:11', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Tanggal_Bayar', '1', NULL, '2018-11-30'),
(742, '2018-10-30 19:43:11', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Terlambat', '1', NULL, '0'),
(743, '2018-10-30 19:43:11', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Total_Denda', '1', NULL, '0'),
(744, '2018-10-30 19:43:11', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', NULL, '0'),
(745, '2018-10-30 19:43:11', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', NULL, '1100000'),
(746, '2018-10-30 19:43:11', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Total', '1', NULL, '1100000'),
(747, '2018-10-30 19:43:11', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(748, '2018-10-30 19:43:11', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(749, '2018-10-30 19:43:11', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(750, '2018-10-30 19:43:11', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(751, '2018-10-30 19:43:11', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(752, '2018-10-31 03:35:15', '/simkop4/login.php', 'admin', 'login', '::1', '', '', '', ''),
(753, '2018-10-31 03:35:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_No', '1', '', '1'),
(754, '2018-10-31 03:35:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_Tgl', '1', '', '2018-10-31'),
(755, '2018-10-31 03:35:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'nasabah_id', '1', '', '1'),
(756, '2018-10-31 03:35:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Pinjaman', '1', '', '10400000'),
(757, '2018-10-31 03:35:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Lama', '1', '', '12'),
(758, '2018-10-31 03:35:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga_Prosen', '1', '', '2.24'),
(759, '2018-10-31 03:35:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Denda', '1', '', '0.4'),
(760, '2018-10-31 03:35:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Dispensasi_Denda', '1', '', '3'),
(761, '2018-10-31 03:35:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Pokok', '1', '', '867000'),
(762, '2018-10-31 03:35:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga', '1', '', '233000'),
(763, '2018-10-31 03:35:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Total', '1', '', '1100000'),
(764, '2018-10-31 03:35:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'No_Ref', '1', '', NULL),
(765, '2018-10-31 03:35:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'id', '1', '', '1'),
(766, '2018-10-31 03:35:41', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(767, '2018-10-31 03:35:41', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't06_pinjamantitipan', '', '', '', ''),
(768, '2018-10-31 03:36:23', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(769, '2018-10-31 03:36:23', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Tanggal_Bayar', '1', NULL, '2018-10-31'),
(770, '2018-10-31 03:36:23', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Terlambat', '1', NULL, '-30'),
(771, '2018-10-31 03:36:23', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Total_Denda', '1', NULL, '0'),
(772, '2018-10-31 03:36:23', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', NULL, '0'),
(773, '2018-10-31 03:36:23', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', NULL, '1100000'),
(774, '2018-10-31 03:36:23', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Total', '1', NULL, '1100000'),
(775, '2018-10-31 03:36:23', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(776, '2018-10-31 03:36:23', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(777, '2018-10-31 03:36:23', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(778, '2018-10-31 03:36:23', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(779, '2018-10-31 03:36:23', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'pinjaman_id', '1', '', '1'),
(780, '2018-10-31 03:36:23', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Tanggal', '1', '', '2018-10-31'),
(781, '2018-10-31 03:36:23', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keterangan', '1', '', '1'),
(782, '2018-10-31 03:36:23', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Masuk', '1', '', '200000'),
(783, '2018-10-31 03:36:23', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keluar', '1', '', '0'),
(784, '2018-10-31 03:36:23', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Sisa', '1', '', '0'),
(785, '2018-10-31 03:36:23', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'id', '1', '', '1'),
(786, '2018-10-31 03:36:23', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(787, '2018-10-31 03:36:51', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(788, '2018-10-31 03:36:51', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', '0.00', '200000.00'),
(789, '2018-10-31 03:36:51', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', '1100000.00', '900000'),
(790, '2018-10-31 03:36:51', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(791, '2018-10-31 03:36:51', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(792, '2018-10-31 03:36:51', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(793, '2018-10-31 03:36:51', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(794, '2018-10-31 03:36:51', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(795, '2018-10-31 03:38:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_No', '1', '', '1'),
(796, '2018-10-31 03:38:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Kontrak_Tgl', '1', '', '2018-10-31'),
(797, '2018-10-31 03:38:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'nasabah_id', '1', '', '1'),
(798, '2018-10-31 03:38:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Pinjaman', '1', '', '10400000'),
(799, '2018-10-31 03:38:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Lama', '1', '', '12'),
(800, '2018-10-31 03:38:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga_Prosen', '1', '', '2.24'),
(801, '2018-10-31 03:38:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Denda', '1', '', '0.4'),
(802, '2018-10-31 03:38:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Dispensasi_Denda', '1', '', '3'),
(803, '2018-10-31 03:38:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Pokok', '1', '', '867000'),
(804, '2018-10-31 03:38:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Bunga', '1', '', '233000'),
(805, '2018-10-31 03:38:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'Angsuran_Total', '1', '', '1100000'),
(806, '2018-10-31 03:38:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'No_Ref', '1', '', NULL),
(807, '2018-10-31 03:38:41', '/simkop4/t03_pinjamanadd.php', '1', 'A', 't03_pinjaman', 'id', '1', '', '1'),
(808, '2018-10-31 03:38:41', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(809, '2018-10-31 03:38:41', '/simkop4/t03_pinjamanadd.php', '1', '*** Batch insert begin ***', 't06_pinjamantitipan', '', '', '', ''),
(810, '2018-10-31 03:39:09', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(811, '2018-10-31 03:39:09', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Tanggal_Bayar', '1', NULL, '2018-10-31'),
(812, '2018-10-31 03:39:09', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Terlambat', '1', NULL, '-30'),
(813, '2018-10-31 03:39:09', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Total_Denda', '1', NULL, '0'),
(814, '2018-10-31 03:39:09', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', NULL, '0'),
(815, '2018-10-31 03:39:09', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', NULL, '1100000'),
(816, '2018-10-31 03:39:09', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Total', '1', NULL, '1100000'),
(817, '2018-10-31 03:39:09', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(818, '2018-10-31 03:39:09', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(819, '2018-10-31 03:39:09', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(820, '2018-10-31 03:39:09', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(821, '2018-10-31 03:39:09', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'pinjaman_id', '1', '', '1'),
(822, '2018-10-31 03:39:09', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Tanggal', '1', '', '2018-10-31'),
(823, '2018-10-31 03:39:09', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keterangan', '1', '', '1'),
(824, '2018-10-31 03:39:09', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Masuk', '1', '', '200000'),
(825, '2018-10-31 03:39:09', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keluar', '1', '', '0'),
(826, '2018-10-31 03:39:09', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Sisa', '1', '', '0'),
(827, '2018-10-31 03:39:09', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'id', '1', '', '1'),
(828, '2018-10-31 03:39:09', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(829, '2018-10-31 03:39:58', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(830, '2018-10-31 03:39:58', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', '0.00', '200000.00'),
(831, '2018-10-31 03:39:58', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', '1100000.00', '900000');
INSERT INTO `t99_audittrail` (`id`, `datetime`, `script`, `user`, `action`, `table`, `field`, `keyvalue`, `oldvalue`, `newvalue`) VALUES
(832, '2018-10-31 03:39:58', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(833, '2018-10-31 03:39:58', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(834, '2018-10-31 03:39:58', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(835, '2018-10-31 03:39:58', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(836, '2018-10-31 03:39:58', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(837, '2018-10-31 03:41:41', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(838, '2018-10-31 03:41:41', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Tanggal_Bayar', '1', NULL, '2018-10-31'),
(839, '2018-10-31 03:41:41', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Terlambat', '1', NULL, '-30'),
(840, '2018-10-31 03:41:41', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Total_Denda', '1', NULL, '0'),
(841, '2018-10-31 03:41:41', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', NULL, '0'),
(842, '2018-10-31 03:41:41', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', NULL, '1100000'),
(843, '2018-10-31 03:41:41', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Total', '1', NULL, '1100000'),
(844, '2018-10-31 03:41:41', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(845, '2018-10-31 03:41:41', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(846, '2018-10-31 03:41:41', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(847, '2018-10-31 03:41:41', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(848, '2018-10-31 03:41:41', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'pinjaman_id', '1', '', '1'),
(849, '2018-10-31 03:41:41', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Tanggal', '1', '', '2018-10-31'),
(850, '2018-10-31 03:41:41', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keterangan', '1', '', '1'),
(851, '2018-10-31 03:41:41', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Masuk', '1', '', '200000'),
(852, '2018-10-31 03:41:41', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keluar', '1', '', '0'),
(853, '2018-10-31 03:41:41', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Sisa', '1', '', '0'),
(854, '2018-10-31 03:41:41', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'id', '1', '', '1'),
(855, '2018-10-31 03:41:41', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(856, '2018-10-31 03:42:35', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(857, '2018-10-31 03:42:35', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', '0.00', '200000.00'),
(858, '2018-10-31 03:42:35', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', '1100000.00', '900000'),
(859, '2018-10-31 03:42:35', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(860, '2018-10-31 03:42:35', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(861, '2018-10-31 03:42:35', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(862, '2018-10-31 03:42:35', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(863, '2018-10-31 03:42:35', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(864, '2018-10-31 03:44:22', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(865, '2018-10-31 03:44:22', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Tanggal_Bayar', '1', NULL, '2018-10-31'),
(866, '2018-10-31 03:44:22', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Terlambat', '1', NULL, '-30'),
(867, '2018-10-31 03:44:22', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Total_Denda', '1', NULL, '0'),
(868, '2018-10-31 03:44:22', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', NULL, '0'),
(869, '2018-10-31 03:44:22', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', NULL, '1100000'),
(870, '2018-10-31 03:44:22', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Total', '1', NULL, '1100000'),
(871, '2018-10-31 03:44:22', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(872, '2018-10-31 03:44:22', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(873, '2018-10-31 03:44:22', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(874, '2018-10-31 03:44:22', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(875, '2018-10-31 03:44:22', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'pinjaman_id', '1', '', '1'),
(876, '2018-10-31 03:44:22', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Tanggal', '1', '', '2018-10-31'),
(877, '2018-10-31 03:44:22', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keterangan', '1', '', '1'),
(878, '2018-10-31 03:44:22', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Masuk', '1', '', '200000'),
(879, '2018-10-31 03:44:22', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keluar', '1', '', '0'),
(880, '2018-10-31 03:44:22', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Sisa', '1', '', '0'),
(881, '2018-10-31 03:44:22', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'id', '1', '', '1'),
(882, '2018-10-31 03:44:23', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(883, '2018-10-31 03:44:44', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(884, '2018-10-31 03:44:44', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', '0.00', '200000.00'),
(885, '2018-10-31 03:44:44', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', '1100000.00', '900000'),
(886, '2018-10-31 03:44:44', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(887, '2018-10-31 03:44:44', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(888, '2018-10-31 03:44:44', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(889, '2018-10-31 03:44:44', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(890, '2018-10-31 03:44:45', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(891, '2018-10-31 03:55:07', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(892, '2018-10-31 03:55:07', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Tanggal_Bayar', '1', NULL, '2018-10-31'),
(893, '2018-10-31 03:55:07', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Terlambat', '1', NULL, '-30'),
(894, '2018-10-31 03:55:07', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Total_Denda', '1', NULL, '0'),
(895, '2018-10-31 03:55:07', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', NULL, '0'),
(896, '2018-10-31 03:55:07', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', NULL, '1100000'),
(897, '2018-10-31 03:55:07', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Total', '1', NULL, '1100000'),
(898, '2018-10-31 03:55:07', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(899, '2018-10-31 03:55:07', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(900, '2018-10-31 03:55:07', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(901, '2018-10-31 03:55:08', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(902, '2018-10-31 03:55:08', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'pinjaman_id', '1', '', '1'),
(903, '2018-10-31 03:55:08', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Tanggal', '1', '', '2018-10-31'),
(904, '2018-10-31 03:55:08', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keterangan', '1', '', '1'),
(905, '2018-10-31 03:55:08', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Masuk', '1', '', '200000'),
(906, '2018-10-31 03:55:08', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keluar', '1', '', '0'),
(907, '2018-10-31 03:55:08', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Sisa', '1', '', '0'),
(908, '2018-10-31 03:55:08', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'id', '1', '', '1'),
(909, '2018-10-31 03:55:08', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(910, '2018-10-31 03:55:21', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(911, '2018-10-31 03:55:21', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', '0.00', '200000.00'),
(912, '2018-10-31 03:55:21', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', '1100000.00', '900000'),
(913, '2018-10-31 03:55:21', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(914, '2018-10-31 03:55:21', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(915, '2018-10-31 03:55:21', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(916, '2018-10-31 03:55:21', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(917, '2018-10-31 03:55:21', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(918, '2018-10-31 04:11:07', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(919, '2018-10-31 04:11:07', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Tanggal_Bayar', '1', NULL, '2018-10-31'),
(920, '2018-10-31 04:11:07', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Terlambat', '1', NULL, '-30'),
(921, '2018-10-31 04:11:07', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Total_Denda', '1', NULL, '0'),
(922, '2018-10-31 04:11:07', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', NULL, '0'),
(923, '2018-10-31 04:11:07', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', NULL, '1100000'),
(924, '2018-10-31 04:11:07', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Total', '1', NULL, '1100000'),
(925, '2018-10-31 04:11:07', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(926, '2018-10-31 04:11:08', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(927, '2018-10-31 04:11:08', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(928, '2018-10-31 04:11:08', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(929, '2018-10-31 04:11:08', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'pinjaman_id', '1', '', '1'),
(930, '2018-10-31 04:11:08', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Tanggal', '1', '', '2018-10-31'),
(931, '2018-10-31 04:11:08', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keterangan', '1', '', '1'),
(932, '2018-10-31 04:11:08', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Masuk', '1', '', '200000'),
(933, '2018-10-31 04:11:08', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keluar', '1', '', '0'),
(934, '2018-10-31 04:11:08', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Sisa', '1', '', '0'),
(935, '2018-10-31 04:11:08', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'id', '1', '', '1'),
(936, '2018-10-31 04:11:08', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(937, '2018-10-31 04:11:18', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(938, '2018-10-31 04:11:18', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', '0.00', '200000.00'),
(939, '2018-10-31 04:11:18', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', '1100000.00', '900000'),
(940, '2018-10-31 04:11:18', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(941, '2018-10-31 04:11:18', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(942, '2018-10-31 04:11:18', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(943, '2018-10-31 04:11:18', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(944, '2018-10-31 04:11:18', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(945, '2018-10-31 04:13:16', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(946, '2018-10-31 04:13:16', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Tanggal_Bayar', '1', NULL, '2018-10-31'),
(947, '2018-10-31 04:13:16', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Terlambat', '1', NULL, '-30'),
(948, '2018-10-31 04:13:16', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Total_Denda', '1', NULL, '0'),
(949, '2018-10-31 04:13:16', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', NULL, '0'),
(950, '2018-10-31 04:13:16', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', NULL, '1100000'),
(951, '2018-10-31 04:13:16', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Total', '1', NULL, '1100000'),
(952, '2018-10-31 04:13:16', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(953, '2018-10-31 04:13:16', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(954, '2018-10-31 04:13:16', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(955, '2018-10-31 04:13:16', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(956, '2018-10-31 04:13:16', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'pinjaman_id', '1', '', '1'),
(957, '2018-10-31 04:13:16', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Tanggal', '1', '', '2018-10-31'),
(958, '2018-10-31 04:13:16', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keterangan', '1', '', '1'),
(959, '2018-10-31 04:13:16', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Masuk', '1', '', '200000'),
(960, '2018-10-31 04:13:16', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keluar', '1', '', '0'),
(961, '2018-10-31 04:13:16', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Sisa', '1', '', '0'),
(962, '2018-10-31 04:13:16', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'id', '1', '', '1'),
(963, '2018-10-31 04:13:16', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(964, '2018-10-31 04:20:55', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(965, '2018-10-31 04:20:55', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Tanggal_Bayar', '1', NULL, '2018-10-31'),
(966, '2018-10-31 04:20:55', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Terlambat', '1', NULL, '-30'),
(967, '2018-10-31 04:20:55', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Total_Denda', '1', NULL, '0'),
(968, '2018-10-31 04:20:55', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', NULL, '0'),
(969, '2018-10-31 04:20:55', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', NULL, '1100000'),
(970, '2018-10-31 04:20:55', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Total', '1', NULL, '1100000'),
(971, '2018-10-31 04:20:55', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(972, '2018-10-31 04:20:55', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(973, '2018-10-31 04:20:55', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(974, '2018-10-31 04:20:55', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(975, '2018-10-31 04:20:55', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'pinjaman_id', '1', '', '1'),
(976, '2018-10-31 04:20:55', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Tanggal', '1', '', '2018-10-31'),
(977, '2018-10-31 04:20:55', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keterangan', '1', '', '1'),
(978, '2018-10-31 04:20:55', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Masuk', '1', '', '200000'),
(979, '2018-10-31 04:20:55', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keluar', '1', '', '0'),
(980, '2018-10-31 04:20:55', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Sisa', '1', '', '0'),
(981, '2018-10-31 04:20:55', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'id', '1', '', '1'),
(982, '2018-10-31 04:20:55', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(983, '2018-10-31 04:21:12', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(984, '2018-10-31 04:21:12', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', '0.00', '200000.00'),
(985, '2018-10-31 04:21:12', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', '1100000.00', '900000'),
(986, '2018-10-31 04:21:12', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(987, '2018-10-31 04:21:12', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(988, '2018-10-31 04:21:12', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(989, '2018-10-31 04:21:12', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(990, '2018-10-31 04:21:12', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(991, '2018-10-31 04:23:07', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(992, '2018-10-31 04:23:07', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Tanggal_Bayar', '1', NULL, '2018-10-31'),
(993, '2018-10-31 04:23:07', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Terlambat', '1', NULL, '-30'),
(994, '2018-10-31 04:23:07', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Total_Denda', '1', NULL, '0'),
(995, '2018-10-31 04:23:07', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', NULL, '0'),
(996, '2018-10-31 04:23:07', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', NULL, '1100000'),
(997, '2018-10-31 04:23:07', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Total', '1', NULL, '1100000'),
(998, '2018-10-31 04:23:07', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(999, '2018-10-31 04:23:07', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(1000, '2018-10-31 04:23:07', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(1001, '2018-10-31 04:23:08', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(1002, '2018-10-31 04:23:08', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'pinjaman_id', '1', '', '1'),
(1003, '2018-10-31 04:23:08', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Tanggal', '1', '', '2018-10-31'),
(1004, '2018-10-31 04:23:08', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keterangan', '1', '', '1'),
(1005, '2018-10-31 04:23:08', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Masuk', '1', '', '200000'),
(1006, '2018-10-31 04:23:08', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keluar', '1', '', '0'),
(1007, '2018-10-31 04:23:08', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Sisa', '1', '', '0'),
(1008, '2018-10-31 04:23:08', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'id', '1', '', '1'),
(1009, '2018-10-31 04:23:08', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(1010, '2018-10-31 04:23:53', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(1011, '2018-10-31 04:23:53', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Tanggal_Bayar', '1', '2018-10-31', '2018-11-01'),
(1012, '2018-10-31 04:23:53', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Terlambat', '1', '-30', '-29'),
(1013, '2018-10-31 04:23:53', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', '0.00', '200000.00'),
(1014, '2018-10-31 04:23:53', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', '1100000.00', '900000'),
(1015, '2018-10-31 04:23:53', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(1016, '2018-10-31 04:23:53', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(1017, '2018-10-31 04:23:53', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(1018, '2018-10-31 04:23:53', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(1019, '2018-10-31 04:23:53', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(1020, '2018-10-31 21:07:43', '/simkop4/login.php', 'admin', 'login', '::1', '', '', '', ''),
(1021, '2018-10-31 21:26:42', '/simkop4/login.php', 'admin', 'login', '::1', '', '', '', ''),
(1022, '2018-10-31 21:27:00', '/simkop4/logout.php', 'admin', 'logout', '::1', '', '', '', ''),
(1023, '2018-10-31 22:45:10', '/simkop4/login.php', 'admin', 'login', '::1', '', '', '', ''),
(1024, '2018-10-31 22:51:59', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(1025, '2018-10-31 22:51:59', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Tanggal_Bayar', '1', NULL, '2018-10-31'),
(1026, '2018-10-31 22:51:59', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Terlambat', '1', NULL, '-30'),
(1027, '2018-10-31 22:51:59', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Total_Denda', '1', NULL, '0'),
(1028, '2018-10-31 22:51:59', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', NULL, '0'),
(1029, '2018-10-31 22:51:59', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', NULL, '1100000'),
(1030, '2018-10-31 22:51:59', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Total', '1', NULL, '1100000'),
(1031, '2018-10-31 22:51:59', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(1032, '2018-10-31 22:51:59', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(1033, '2018-10-31 22:51:59', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(1034, '2018-10-31 22:51:59', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(1035, '2018-10-31 22:51:59', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'pinjaman_id', '1', '', '1'),
(1036, '2018-10-31 22:51:59', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Tanggal', '1', '', '2018-10-31'),
(1037, '2018-10-31 22:51:59', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keterangan', '1', '', '1'),
(1038, '2018-10-31 22:51:59', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Masuk', '1', '', '200000'),
(1039, '2018-10-31 22:51:59', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Keluar', '1', '', '0'),
(1040, '2018-10-31 22:51:59', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'Sisa', '1', '', '0'),
(1041, '2018-10-31 22:51:59', '/simkop4/t03_pinjamanedit.php', '1', 'A', 't06_pinjamantitipan', 'id', '1', '', '1'),
(1042, '2018-10-31 22:51:59', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', ''),
(1043, '2018-10-31 22:52:16', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't04_pinjamanangsuran', '', '', '', ''),
(1044, '2018-10-31 22:52:16', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Titipan', '1', '0.00', '200000.00'),
(1045, '2018-10-31 22:52:16', '/simkop4/t03_pinjamanedit.php', '1', 'U', 't04_pinjamanangsuran', 'Bayar_Non_Titipan', '1', '1100000.00', '900000'),
(1046, '2018-10-31 22:52:16', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't04_pinjamanangsuran', '', '', '', ''),
(1047, '2018-10-31 22:52:16', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't05_pinjamanjaminan', '', '', '', ''),
(1048, '2018-10-31 22:52:16', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't05_pinjamanjaminan', '', '', '', ''),
(1049, '2018-10-31 22:52:16', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update begin ***', 't06_pinjamantitipan', '', '', '', ''),
(1050, '2018-10-31 22:52:17', '/simkop4/t03_pinjamanedit.php', '1', '*** Batch update successful ***', 't06_pinjamantitipan', '', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t01_nasabah`
--
ALTER TABLE `t01_nasabah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t02_jaminan`
--
ALTER TABLE `t02_jaminan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t03_pinjaman`
--
ALTER TABLE `t03_pinjaman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t04_pinjamanangsuran`
--
ALTER TABLE `t04_pinjamanangsuran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t05_pinjamanjaminan`
--
ALTER TABLE `t05_pinjamanjaminan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t06_pinjamantitipan`
--
ALTER TABLE `t06_pinjamantitipan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t93_periode`
--
ALTER TABLE `t93_periode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t94_log`
--
ALTER TABLE `t94_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t95_logdesc`
--
ALTER TABLE `t95_logdesc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t96_employees`
--
ALTER TABLE `t96_employees`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- Indexes for table `t97_userlevels`
--
ALTER TABLE `t97_userlevels`
  ADD PRIMARY KEY (`userlevelid`);

--
-- Indexes for table `t98_userlevelpermissions`
--
ALTER TABLE `t98_userlevelpermissions`
  ADD PRIMARY KEY (`userlevelid`,`tablename`);

--
-- Indexes for table `t99_audittrail`
--
ALTER TABLE `t99_audittrail`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t01_nasabah`
--
ALTER TABLE `t01_nasabah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t02_jaminan`
--
ALTER TABLE `t02_jaminan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t03_pinjaman`
--
ALTER TABLE `t03_pinjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t04_pinjamanangsuran`
--
ALTER TABLE `t04_pinjamanangsuran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `t05_pinjamanjaminan`
--
ALTER TABLE `t05_pinjamanjaminan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t06_pinjamantitipan`
--
ALTER TABLE `t06_pinjamantitipan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t93_periode`
--
ALTER TABLE `t93_periode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t94_log`
--
ALTER TABLE `t94_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `t95_logdesc`
--
ALTER TABLE `t95_logdesc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `t96_employees`
--
ALTER TABLE `t96_employees`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t99_audittrail`
--
ALTER TABLE `t99_audittrail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1051;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
