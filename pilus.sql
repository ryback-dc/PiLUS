-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 27, 2016 at 01:22 AM
-- Server version: 5.5.52-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.19

--
-- PiLUS-1.4.0
--
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pilus`
--

-- --------------------------------------------------------

--
-- Table structure for table `pl_admin`
--

DROP TABLE IF EXISTS `pl_admin`;
CREATE TABLE IF NOT EXISTS `pl_admin` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `admin_login` varchar(60) NOT NULL,
  `admin_fullname` varchar(90) NOT NULL,
  `admin_email` varchar(150) NOT NULL,
  `admin_pass` varchar(300) NOT NULL,
  `admin_registered` date NOT NULL,
  `admin_activation_key` varchar(200) NOT NULL,
  `admin_reset_key` varchar(255) DEFAULT NULL,
  `admin_resetComplete` varchar(3) DEFAULT 'No',
  `admin_level` varchar(20) NOT NULL,
  `admin_session` varchar(128) NOT NULL,
  `admin_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `pl_admin`
--

INSERT INTO `pl_admin` (`ID`, `admin_login`, `admin_fullname`, `admin_email`, `admin_pass`, `admin_registered`, `admin_activation_key`, `admin_reset_key`, `admin_resetComplete`, `admin_level`, `admin_session`, `admin_url`) VALUES
(1, 'admin', 'administrator', 'webdev@kartatopia.com', '$2a$12$1lloIhtxMKnxZHdwu/hOl.BDY9cz3kPnUdDLd0haKaTLKxm08wYbO', '2015-03-28', 'Yes', NULL, 'No', 'superadmin', '14c9fa85ce4a3ef593142efad96caf209cc000d2', 'http://www.kartatopia.com/'),
(2, 'andik', 'Muhammad Andik Cahyono', 'ustad.aa@gmail.com', '$2a$12$xrwBuJ8eOBnZFMpTgHSQ9u5NFl77HWg6J0CWD7Doj.iEk5UecDKdy', '2015-03-29', 'Yes', NULL, 'No', 'author', '73c89be2d17ec1f0bd2003eefb93d1a91d2897a9', 'http://');

-- --------------------------------------------------------

--
-- Table structure for table `pl_adminmeta`
--

DROP TABLE IF EXISTS `pl_adminmeta`;
CREATE TABLE IF NOT EXISTS `pl_adminmeta` (
  `admeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) unsigned NOT NULL,
  `admeta_address` varchar(255) DEFAULT NULL,
  `admeta_gender` enum('L','P') DEFAULT NULL,
  `admeta_borndate` date DEFAULT NULL,
  `admeta_phone` varchar(20) DEFAULT NULL,
  `admeta_bio` text,
  `admeta_avatar` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`admeta_id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `pl_adminmeta`
--

INSERT INTO `pl_adminmeta` (`admeta_id`, `admin_id`, `admeta_address`, `admeta_gender`, `admeta_borndate`, `admeta_phone`, `admeta_bio`, `admeta_avatar`) VALUES
(1, 1, 'Perum Puri Cempaka Putih 1 Blok X -10 Malang', 'L', '1987-11-20', '0317324296', '&lt;p&gt;Web Developer&lt;/p&gt;', 'me2.jpg'),
(2, 2, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pl_banner`
--

DROP TABLE IF EXISTS `pl_banner`;
CREATE TABLE IF NOT EXISTS `pl_banner` (
  `banner_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `url` varchar(255) NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `uploadedOn` date NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pl_comment_reply`
--

DROP TABLE IF EXISTS `pl_comment_reply`;
CREATE TABLE IF NOT EXISTS `pl_comment_reply` (
  `reply_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) unsigned NOT NULL,
  `admin_id` bigint(20) unsigned NOT NULL,
  `reply` text NOT NULL,
  `date_created` date NOT NULL,
  `actived` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pl_customers`
--

DROP TABLE IF EXISTS `pl_customers`;
CREATE TABLE IF NOT EXISTS `pl_customers` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(128) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `district_id` smallint(5) unsigned NOT NULL,
  `shipping_id` smallint(5) unsigned NOT NULL,
  `customer_type` enum('member','guest') NOT NULL DEFAULT 'member',
  `customer_resetKey` varchar(255) DEFAULT NULL,
  `customer_resetComplete` varchar(3) DEFAULT 'No',
  `customer_session` varchar(255) NOT NULL,
  `date_registered` date NOT NULL,
  `time_registered` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pl_district`
--

DROP TABLE IF EXISTS `pl_district`;
CREATE TABLE IF NOT EXISTS `pl_district` (
  `district_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `province_id` smallint(5) unsigned NOT NULL,
  `shipping_id` smallint(5) unsigned NOT NULL,
  `district_name` varchar(100) NOT NULL,
  `shipping_cost` mediumint(9) NOT NULL,
  PRIMARY KEY (`district_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=522 ;

--
-- Dumping data for table `pl_district`
--

INSERT INTO `pl_district` (`district_id`, `province_id`, `shipping_id`, `district_name`, `shipping_cost`) VALUES
(1, 1, 1, 'KAB. ACEH SELATAN', 35000),
(2, 1, 1, 'KAB. ACEH TENGGARA', 0),
(3, 1, 0, 'KAB. ACEH TIMUR', 0),
(4, 1, 0, 'KAB. ACEH TENGAH', 0),
(5, 1, 0, 'KAB. ACEH BARAT', 0),
(6, 1, 0, 'KAB. ACEH BESAR', 0),
(7, 1, 0, 'KAB. PIDIE', 0),
(8, 1, 0, 'KAB. ACEH UTARA', 0),
(9, 1, 0, 'KAB. SIMEULUE', 0),
(10, 1, 0, 'KAB. ACEH SINGKIL', 0),
(11, 1, 0, 'KAB. BIREUEN', 0),
(12, 1, 0, 'KAB. ACEH BARAT DAYA', 0),
(13, 1, 0, 'KAB. GAYO LUES', 0),
(14, 1, 2, 'KAB. ACEH JAYA', 25000),
(15, 1, 1, 'KAB. NAGAN RAYA', 35000),
(16, 1, 1, 'KAB. ACEH TAMIANG', 20000),
(17, 1, 1, 'KAB. BENER MERIAH', 30000),
(18, 1, 1, 'KAB. PIDIE JAYA', 26500),
(19, 1, 0, 'KOTA BANDA ACEH', 18700),
(20, 1, 1, 'KOTA SABANG', 19400),
(21, 1, 1, 'KOTA LHOKSEUMAWE', 25000),
(22, 1, 1, 'KOTA LANGSA', 30000),
(23, 1, 0, 'KOTA SUBULUSSALAM', 0),
(24, 2, 0, 'KAB. TAPANULI TENGAH', 0),
(25, 2, 0, 'KAB. TAPANULI UTARA', 0),
(26, 2, 0, 'KAB. TAPANULI SELATAN', 0),
(27, 2, 0, 'KAB. NIAS', 0),
(28, 2, 0, 'KAB. LANGKAT', 0),
(29, 2, 0, 'KAB. KARO', 0),
(30, 2, 0, 'KAB. DELI SERDANG', 0),
(31, 2, 0, 'KAB. SIMALUNGUN', 0),
(32, 2, 0, 'KAB. ASAHAN', 0),
(33, 2, 0, 'KAB. LABUHANBATU', 0),
(34, 2, 0, 'KAB. DAIRI', 0),
(35, 2, 0, 'KAB. TOBA SAMOSIR', 0),
(36, 2, 0, 'KAB. MANDAILING NATAL', 0),
(37, 2, 0, 'KAB. NIAS SELATAN', 0),
(38, 2, 0, 'KAB. PAKPAK BHARAT', 0),
(39, 2, 0, 'KAB. HUMBANG HASUNDUTAN', 0),
(40, 2, 0, 'KAB. SAMOSIR', 0),
(41, 2, 0, 'KAB. SERDANG BEDAGAI', 0),
(42, 2, 0, 'KAB. BATU BARA', 0),
(43, 2, 0, 'KAB. PADANG LAWAS UTARA', 0),
(44, 2, 0, 'KAB. PADANG LAWAS', 0),
(45, 2, 0, 'KAB. LABUHANBATU SELATAN', 0),
(46, 2, 0, 'KAB. LABUHANBATU UTARA', 0),
(47, 2, 0, 'KAB. NIAS UTARA', 0),
(48, 2, 0, 'KAB. NIAS BARAT', 0),
(49, 2, 0, 'KOTA MEDAN', 0),
(50, 2, 0, 'KOTA PEMATANG SIANTAR', 0),
(51, 2, 0, 'KOTA SIBOLGA', 0),
(52, 2, 0, 'KOTA TANJUNG BALAI', 0),
(53, 2, 0, 'KOTA BINJAI', 0),
(54, 2, 0, 'KOTA TEBING TINGGI', 0),
(55, 2, 0, 'KOTA PADANGSIDIMPUAN', 0),
(56, 2, 0, 'KOTA GUNUNGSITOLI', 0),
(57, 3, 0, 'KAB. PESISIR SELATAN', 0),
(58, 3, 0, 'KAB. SOLOK', 0),
(59, 3, 0, 'KAB. SIJUNJUNG', 0),
(60, 3, 0, 'KAB. TANAH DATAR', 0),
(61, 3, 0, 'KAB. PADANG PARIAMAN', 0),
(62, 3, 0, 'KAB. AGAM', 0),
(63, 3, 0, 'KAB. LIMA PULUH KOTA', 0),
(64, 3, 0, 'KAB. PASAMAN', 0),
(65, 3, 0, 'KAB. KEPULAUAN MENTAWAI', 0),
(66, 3, 0, 'KAB. DHARMASRAYA', 0),
(67, 3, 0, 'KAB. SOLOK SELATAN', 0),
(68, 3, 0, 'KAB. PASAMAN BARAT', 0),
(69, 3, 0, 'KOTA PADANG', 0),
(70, 3, 0, 'KOTA SOLOK', 0),
(71, 3, 0, 'KOTA SAWAHLUNTO', 0),
(72, 3, 0, 'KOTA PADANG PANJANG', 0),
(73, 3, 0, 'KOTA BUKITTINGGI', 0),
(74, 3, 0, 'KOTA PAYAKUMBUH', 0),
(75, 3, 0, 'KOTA PARIAMAN', 0),
(76, 4, 0, 'KAB. KAMPAR', 0),
(77, 4, 0, 'KAB. INDRAGIRI HULU', 0),
(78, 4, 0, 'KAB. BENGKALIS', 0),
(79, 4, 0, 'KAB. INDRAGIRI HILIR', 0),
(80, 4, 0, 'KAB. PELALAWAN', 0),
(81, 4, 0, 'KAB. ROKAN HULU', 0),
(82, 4, 0, 'KAB. ROKAN HILIR', 0),
(83, 4, 0, 'KAB. SIAK', 0),
(84, 4, 0, 'KAB. KUANTAN SINGINGI', 0),
(85, 4, 0, 'KAB. KEPULAUAN MERANTI', 0),
(86, 4, 0, 'KOTA PEKANBARU', 0),
(87, 4, 0, 'KOTA DUMAI', 0),
(88, 5, 0, 'KAB. KERINCI', 0),
(89, 5, 0, 'KAB. MERANGIN', 0),
(90, 5, 0, 'KAB. SAROLANGUN', 0),
(91, 5, 0, 'KAB. BATANGHARI', 0),
(92, 5, 0, 'KAB. MUARO JAMBI', 0),
(93, 5, 0, 'KAB. TANJUNG JABUNG BARAT', 0),
(94, 5, 0, 'KAB. TANJUNG JABUNG TIMUR', 0),
(95, 5, 0, 'KAB. BUNGO', 0),
(96, 5, 0, 'KAB. TEBO', 0),
(97, 5, 0, 'KOTA JAMBI', 0),
(98, 5, 0, 'KOTA SUNGAI PENUH', 0),
(99, 6, 0, 'KAB. OGAN KOMERING ULU', 0),
(100, 6, 0, 'KAB. OGAN KOMERING ILIR', 0),
(101, 6, 0, 'KAB. MUARA ENIM', 0),
(102, 6, 0, 'KAB. LAHAT', 0),
(103, 6, 0, 'KAB. MUSI RAWAS', 0),
(104, 6, 0, 'KAB. MUSI BANYUASIN', 0),
(105, 6, 0, 'KAB. BANYUASIN', 0),
(106, 6, 0, 'KAB. OGAN KOMERING ULU TIMUR', 0),
(107, 6, 0, 'KAB. OGAN KOMERING ULU SELATAN', 0),
(108, 6, 0, 'KAB. OGAN ILIR', 0),
(109, 6, 0, 'KAB. EMPAT LAWANG', 0),
(110, 6, 0, 'KAB. PENUKAL ABAB LEMATANG ILIR', 0),
(111, 6, 0, 'KAB. MUSI RAWAS UTARA', 0),
(112, 6, 0, 'KOTA PALEMBANG', 0),
(113, 6, 0, 'KOTA PAGAR ALAM', 0),
(114, 6, 0, 'KOTA LUBUK LINGGAU', 0),
(115, 6, 0, 'KOTA PRABUMULIH', 0),
(116, 7, 0, 'KAB. BENGKULU SELATAN', 0),
(117, 7, 0, 'KAB. REJANG LEBONG', 0),
(118, 7, 0, 'KAB. BENGKULU UTARA', 0),
(119, 7, 0, 'KAB. KAUR', 0),
(120, 7, 0, 'KAB. SELUMA', 0),
(121, 7, 0, 'KAB. MUKO MUKO', 0),
(122, 7, 0, 'KAB. LEBONG', 0),
(123, 7, 0, 'KAB. KEPAHIANG', 0),
(124, 7, 0, 'KAB. BENGKULU TENGAH', 0),
(125, 7, 0, 'KOTA BENGKULU', 0),
(126, 8, 0, 'KAB. LAMPUNG SELATAN', 0),
(127, 8, 0, 'KAB. LAMPUNG TENGAH', 0),
(128, 8, 0, 'KAB. LAMPUNG UTARA', 0),
(129, 8, 0, 'KAB. LAMPUNG BARAT', 0),
(130, 8, 0, 'KAB. TULANG BAWANG', 0),
(131, 8, 0, 'KAB. TANGGAMUS', 0),
(132, 8, 0, 'KAB. LAMPUNG TIMUR', 0),
(133, 8, 0, 'KAB. WAY KANAN', 0),
(134, 8, 0, 'KAB. PESAWARAN', 0),
(135, 8, 0, 'KAB. PRINGSEWU', 0),
(136, 8, 0, 'KAB. MESUJI', 0),
(137, 8, 0, 'KAB. TULANG BAWANG BARAT', 0),
(138, 8, 0, 'KAB. PESISIR BARAT', 0),
(139, 8, 0, 'KOTA BANDAR LAMPUNG', 0),
(140, 8, 0, 'KOTA METRO', 0),
(141, 9, 0, 'KAB. BANGKA', 0),
(142, 9, 0, 'KAB. BELITUNG', 0),
(143, 9, 0, 'KAB. BANGKA SELATAN', 0),
(144, 9, 0, 'KAB. BANGKA TENGAH', 0),
(145, 9, 0, 'KAB. BANGKA BARAT', 0),
(146, 9, 0, 'KAB. BELITUNG TIMUR', 0),
(147, 9, 0, 'KOTA PANGKAL PINANG', 0),
(148, 10, 0, 'KAB. BINTAN', 0),
(149, 10, 0, 'KAB. KARIMUN', 0),
(150, 10, 0, 'KAB. NATUNA', 0),
(151, 10, 0, 'KAB. LINGGA', 0),
(152, 10, 0, 'KAB. KEPULAUAN ANAMBAS', 0),
(153, 10, 0, 'KOTA BATAM', 0),
(154, 10, 0, 'KOTA TANJUNG PINANG', 0),
(155, 11, 0, 'KAB. ADM. KEP. SERIBU', 0),
(156, 11, 0, 'KOTA ADM. JAKARTA PUSAT', 0),
(157, 11, 0, 'KOTA ADM. JAKARTA UTARA', 0),
(158, 11, 0, 'KOTA ADM. JAKARTA BARAT', 0),
(159, 11, 0, 'KOTA ADM. JAKARTA SELATAN', 0),
(160, 11, 0, 'KOTA ADM. JAKARTA TIMUR', 0),
(161, 12, 0, 'KAB. BOGOR', 0),
(163, 12, 0, 'KAB. SUKABUMI', 0),
(164, 12, 0, 'KAB. CIANJUR', 0),
(165, 12, 0, 'KAB. BANDUNG', 0),
(166, 12, 0, 'KAB. GARUT', 0),
(167, 12, 0, 'KAB. TASIKMALAYA', 0),
(168, 12, 0, 'KAB. CIAMIS', 0),
(169, 12, 0, 'KAB. KUNINGAN', 0),
(170, 12, 0, 'KAB. CIREBON', 0),
(171, 12, 0, 'KAB. MAJALENGKA', 0),
(172, 12, 0, 'KAB. SUMEDANG', 0),
(173, 12, 0, 'KAB. INDRAMAYU', 0),
(174, 12, 0, 'KAB. SUBANG', 0),
(175, 12, 0, 'KAB. PURWAKARTA', 0),
(176, 12, 0, 'KAB. KARAWANG', 0),
(177, 12, 0, 'KAB. BEKASI', 0),
(178, 12, 0, 'KAB. BANDUNG BARAT', 0),
(179, 12, 0, 'KAB. PANGANDARAN', 0),
(180, 12, 0, 'KOTA BOGOR', 0),
(181, 12, 0, 'KOTA SUKABUMI', 0),
(182, 12, 0, 'KOTA BANDUNG', 0),
(183, 12, 0, 'KOTA CIREBON', 0),
(184, 12, 0, 'KOTA BEKASI', 0),
(185, 12, 0, 'KOTA DEPOK', 0),
(186, 12, 0, 'KOTA CIMAHI', 0),
(188, 12, 0, 'KOTA TASIKMALAYA', 0),
(189, 12, 0, 'KOTA BANJAR', 0),
(190, 13, 0, 'KAB. CILACAP', 0),
(192, 13, 0, 'KAB. BANYUMAS', 0),
(193, 13, 0, 'KAB. PURBALINGGA', 0),
(194, 13, 0, 'KAB. BANJARNEGARA', 0),
(195, 13, 0, 'KAB. KEBUMEN', 0),
(196, 13, 0, 'KAB. PURWOREJO', 0),
(197, 13, 0, 'KAB. WONOSOBO', 0),
(198, 13, 0, 'KAB. MAGELANG', 0),
(199, 13, 0, 'KAB. BOYOLALI', 0),
(200, 13, 0, 'KAB. KLATEN', 0),
(201, 13, 0, 'KAB. SUKOHARJO', 0),
(202, 13, 0, 'KAB. WONOGIRI', 0),
(203, 13, 0, 'KAB. KARANGANYAR', 0),
(204, 13, 0, 'KAB. SRAGEN', 0),
(205, 13, 0, 'KAB. GROBOGAN', 0),
(206, 13, 0, 'KAB. BLORA', 0),
(207, 13, 0, 'KAB. REMBANG', 0),
(208, 13, 0, 'KAB. PATI', 0),
(209, 13, 0, 'KAB. KUDUS', 0),
(210, 13, 0, 'KAB. JEPARA', 0),
(211, 13, 0, 'KAB. DEMAK', 0),
(212, 13, 0, 'KAB. SEMARANG', 0),
(213, 13, 0, 'KAB. TEMANGGUNG', 0),
(214, 13, 0, 'KAB. KENDAL', 0),
(215, 13, 0, 'KAB. BATANG', 0),
(216, 13, 0, 'KAB. PEKALONGAN', 0),
(217, 13, 0, 'KAB. PEMALANG', 0),
(218, 13, 0, 'KAB. TEGAL', 0),
(219, 13, 0, 'KAB. BREBES', 0),
(220, 13, 0, 'KOTA MAGELANG', 0),
(221, 13, 0, 'KOTA SURAKARTA', 0),
(222, 13, 0, 'KOTA SALATIGA', 0),
(223, 13, 0, 'KOTA SEMARANG', 0),
(224, 13, 0, 'KOTA PEKALONGAN', 0),
(225, 13, 0, 'KOTA TEGAL', 0),
(226, 14, 0, 'KAB. KULON PROGO', 0),
(227, 14, 0, 'KAB. BANTUL', 0),
(228, 14, 0, 'KAB. GUNUNG KIDUL', 0),
(229, 14, 0, 'KAB. SLEMAN', 0),
(230, 14, 0, 'KOTA YOGYAKARTA', 0),
(231, 15, 0, 'KAB. PACITAN', 0),
(232, 15, 0, 'KAB. PONOROGO', 0),
(233, 15, 0, 'KAB. TRENGGALEK', 0),
(234, 15, 0, 'KAB. TULUNGAGUNG', 0),
(235, 15, 0, 'KAB. BLITAR', 0),
(236, 15, 0, 'KAB. KEDIRI', 0),
(237, 15, 0, 'KAB. MALANG', 0),
(238, 15, 0, 'KAB. LUMAJANG', 0),
(239, 15, 0, 'KAB. JEMBER', 0),
(240, 15, 0, 'KAB. BANYUWANGI', 0),
(241, 15, 0, 'KAB. BONDOWOSO', 0),
(243, 15, 0, 'KAB. SITUBONDO', 0),
(244, 15, 0, 'KAB. PROBOLINGGO', 0),
(245, 15, 0, 'KAB. PASURUAN', 0),
(246, 15, 0, 'KAB. SIDOARJO', 0),
(247, 15, 0, 'KAB. MOJOKERTO', 0),
(248, 15, 0, 'KAB. JOMBANG', 0),
(249, 15, 0, 'KAB. NGANJUK', 0),
(250, 15, 0, 'KAB. MADIUN', 0),
(251, 15, 0, 'KAB. MAGETAN', 0),
(252, 15, 0, 'KAB. NGAWI', 0),
(253, 15, 0, 'KAB. BOJONEGORO', 0),
(254, 15, 0, 'KAB. TUBAN', 0),
(255, 15, 0, 'KAB. LAMONGAN', 0),
(256, 15, 0, 'KAB. GRESIK', 0),
(257, 15, 0, 'KAB. BANGKALAN', 0),
(258, 15, 0, 'KAB. SAMPANG', 0),
(259, 15, 0, 'KAB. PAMEKASAN', 0),
(260, 15, 0, 'KAB. SUMENEP', 0),
(261, 15, 0, 'KOTA KEDIRI', 0),
(262, 15, 0, 'KOTA BLITAR', 0),
(263, 15, 0, 'KOTA MALANG', 0),
(264, 15, 0, 'KOTA PROBOLINGGO', 0),
(265, 15, 0, 'KOTA PASURUAN', 0),
(266, 15, 0, 'KOTA MOJOKERTO', 0),
(267, 15, 0, 'KOTA MADIUN', 0),
(268, 15, 0, 'KOTA SURABAYA', 0),
(269, 15, 0, 'KOTA BATU', 0),
(270, 16, 0, 'KAB. PANDEGLANG', 0),
(271, 16, 0, 'KAB. LEBAK', 0),
(272, 16, 0, 'KAB. TANGERANG', 0),
(273, 16, 0, 'KAB. SERANG', 0),
(274, 16, 0, 'KOTA TANGERANG', 0),
(275, 16, 0, 'KOTA CILEGON', 0),
(276, 16, 0, 'KOTA SERANG', 0),
(277, 16, 0, 'KOTA TANGERANG SELATAN', 0),
(278, 17, 0, 'KAB. JEMBRANA', 0),
(279, 17, 0, 'KAB. TABANAN', 0),
(280, 17, 0, 'KAB. BADUNG', 0),
(281, 17, 0, 'KAB. GIANYAR', 0),
(282, 17, 0, 'KAB. KLUNGKUNG', 0),
(283, 17, 0, 'KAB. BANGLI', 0),
(284, 17, 0, 'KAB. KARANGASEM', 0),
(285, 17, 0, 'KAB. BULELENG', 0),
(286, 17, 0, 'KOTA DENPASAR', 0),
(287, 18, 0, 'KAB. LOMBOK BARAT', 0),
(288, 18, 0, 'KAB. LOMBOK TENGAH', 0),
(289, 18, 0, 'KAB. LOMBOK TIMUR', 0),
(290, 18, 0, 'KAB. SUMBAWA', 0),
(291, 18, 0, 'KAB. DOMPU', 0),
(292, 18, 0, 'KAB. BIMA', 0),
(293, 18, 0, 'KAB. SUMBAWA BARAT', 0),
(294, 18, 0, 'KAB. LOMBOK UTARA', 0),
(295, 18, 0, 'KOTA MATARAM', 0),
(296, 18, 0, 'KOTA BIMA', 0),
(297, 19, 0, 'KAB. KUPANG', 0),
(298, 19, 0, 'KAB TIMOR TENGAH SELATAN', 0),
(299, 19, 0, 'KAB. TIMOR TENGAH UTARA', 0),
(300, 19, 0, 'KAB. BELU', 0),
(301, 19, 0, 'KAB. ALOR', 0),
(302, 19, 0, 'KAB. FLORES TIMUR', 0),
(303, 19, 0, 'KAB. SIKKA', 0),
(304, 19, 0, 'KAB. ENDE', 0),
(305, 19, 0, 'KAB. NGADA', 0),
(306, 19, 0, 'KAB. MANGGARAI', 0),
(307, 19, 0, 'KAB. SUMBA TIMUR', 0),
(308, 19, 0, 'KAB. SUMBA BARAT', 0),
(309, 19, 0, 'KAB. LEMBATA', 0),
(310, 19, 0, 'KAB. ROTE NDAO', 0),
(311, 19, 0, 'KAB. MANGGARAI BARAT', 0),
(312, 19, 0, 'KAB. NAGEKEO', 0),
(313, 19, 0, 'KAB. SUMBA TENGAH', 0),
(314, 19, 0, 'KAB. SUMBA BARAT DAYA', 0),
(315, 19, 0, 'KAB. MANGGARAI TIMUR', 0),
(316, 19, 0, 'KAB. SABU RAIJUA', 0),
(317, 19, 0, 'KAB. MALAKA', 0),
(318, 19, 0, 'KOTA KUPANG', 0),
(319, 20, 0, 'KAB. SAMBAS', 0),
(320, 20, 0, 'KAB. MEMPAWAH', 0),
(321, 20, 0, 'KAB. SANGGAU', 0),
(322, 20, 0, 'KAB. KETAPANG', 0),
(323, 20, 0, 'KAB. SINTANG', 0),
(324, 20, 0, 'KAB. KAPUAS HULU', 0),
(325, 20, 0, 'KAB. BENGKAYANG', 0),
(326, 20, 0, 'KAB. LANDAK', 0),
(327, 20, 0, 'KAB. SEKADAU', 0),
(328, 20, 0, 'KAB. MELAWI', 0),
(329, 20, 0, 'KAB. KAYONG UTARA', 0),
(330, 20, 0, 'KAB. KUBU RAYA', 0),
(331, 20, 0, 'KOTA PONTIANAK', 0),
(332, 20, 0, 'KOTA SINGKAWANG', 0),
(333, 21, 0, 'KAB. KOTAWARINGIN BARAT', 0),
(334, 21, 0, 'KAB. KOTAWARINGIN TIMUR', 0),
(335, 21, 0, 'KAB. KAPUAS', 0),
(336, 21, 0, 'KAB. BARITO SELATAN', 0),
(337, 21, 0, 'KAB. BARITO UTARA', 0),
(338, 21, 0, 'KAB. KATINGAN', 0),
(339, 21, 0, 'KAB. SERUYAN', 0),
(340, 21, 0, 'KAB. SUKAMARA', 0),
(341, 21, 0, 'KAB. LAMANDAU', 0),
(342, 21, 0, 'KAB. GUNUNG MAS', 0),
(343, 21, 0, 'KAB. PULANG PISAU', 0),
(344, 21, 0, 'KAB. MURUNG RAYA', 0),
(345, 21, 0, 'KAB. BARITO TIMUR', 0),
(346, 21, 0, 'KOTA PALANGKARAYA', 0),
(347, 22, 0, 'KAB. TANAH LAUT', 0),
(348, 22, 0, 'KAB. KOTABARU', 0),
(349, 22, 0, 'KAB. BANJAR', 0),
(350, 22, 0, 'KAB. BARITO KUALA', 0),
(351, 22, 0, 'KAB. TAPIN', 0),
(352, 22, 0, 'KAB. HULU SUNGAI SELATAN', 0),
(353, 22, 0, 'KAB. HULU SUNGAI TENGAH', 0),
(354, 22, 0, 'KAB. HULU SUNGAI UTARA', 0),
(355, 22, 0, 'KAB. TABALONG', 0),
(356, 22, 0, 'KAB. TANAH BUMBU', 0),
(357, 22, 0, 'KAB. BALANGAN', 0),
(358, 22, 0, 'KOTA BANJARMASIN', 0),
(359, 22, 0, 'KOTA BANJARBARU', 0),
(360, 23, 0, 'KAB. PASER', 0),
(361, 23, 0, 'KAB. KUTAI KARTANEGARA', 0),
(362, 23, 0, 'KAB. BERAU', 0),
(363, 23, 0, 'KAB. KUTAI BARAT', 0),
(364, 23, 0, 'KAB. KUTAI TIMUR', 0),
(365, 23, 0, 'KAB. PENAJAM PASER UTARA', 0),
(366, 23, 0, 'KAB. MAHAKAM ULU', 0),
(367, 23, 0, 'KOTA BALIKPAPAN', 0),
(368, 23, 0, 'KOTA SAMARINDA', 0),
(369, 23, 0, 'KOTA BONTANG', 0),
(370, 24, 0, 'KAB. BULUNGAN', 0),
(371, 24, 0, 'KAB. MALINAU', 0),
(372, 24, 0, 'KAB. NUNUKAN', 0),
(373, 24, 0, 'KAB. TANA TIDUNG', 0),
(374, 24, 0, 'KOTA TARAKAN', 0),
(375, 25, 0, 'KAB. BOLAANG MONGONDOW', 0),
(376, 25, 0, 'KAB. MINAHASA', 0),
(377, 25, 0, 'KAB. KEPULAUAN SANGIHE', 0),
(378, 25, 0, 'KAB. KEPULAUAN TALAUD', 0),
(379, 25, 0, 'KAB. MINAHASA SELATAN', 0),
(380, 25, 0, 'KAB. MINAHASA UTARA', 0),
(381, 25, 0, 'KAB. MINAHASA TENGGARA', 0),
(382, 25, 0, 'KAB. BOLAANG MONGONDOW UTARA', 0),
(383, 25, 0, 'KAB. KEP. SIAU TAGULANDANG BIARO', 0),
(384, 25, 0, 'KAB. BOLAANG MONGONDOW TIMUR', 0),
(385, 25, 0, 'KAB. BOLAANG MONGONDOW SELATAN', 0),
(386, 25, 0, 'KOTA MANADO', 0),
(387, 25, 0, 'KOTA BITUNG', 0),
(388, 25, 0, 'KOTA TOMOHON', 0),
(389, 25, 0, 'KOTA KOTAMOBAGU', 0),
(390, 26, 0, 'KAB. BANGGAI', 0),
(391, 26, 0, 'KAB. POSO', 0),
(392, 26, 0, 'KAB. DONGGALA', 0),
(393, 26, 0, 'KAB. TOLI TOLI', 0),
(394, 26, 0, 'KAB. BUOL', 0),
(395, 26, 0, 'KAB. MOROWALI', 0),
(396, 26, 0, 'KAB. BANGGAI KEPULAUAN', 0),
(397, 26, 0, 'KAB. PARIGI MOUTONG', 0),
(398, 26, 0, 'KAB. TOJO UNA UNA', 0),
(399, 26, 0, 'KAB. SIGI', 0),
(400, 26, 0, 'KAB. BANGGAI LAUT', 0),
(401, 26, 0, 'KAB. MOROWALI UTARA', 0),
(402, 26, 0, 'KOTA PALU', 0),
(403, 27, 0, 'KAB. KEPULAUAN SELAYAR', 0),
(404, 27, 0, 'KAB. BULUKUMBA', 0),
(405, 27, 0, 'KAB. BANTAENG', 0),
(406, 27, 0, 'KAB. JENEPONTO', 0),
(407, 27, 0, 'KAB. TAKALAR', 0),
(408, 27, 0, 'KAB. GOWA', 0),
(409, 27, 0, 'KAB. SINJAI', 0),
(410, 27, 0, 'KAB. BONE', 0),
(411, 27, 0, 'KAB. MAROS', 0),
(412, 27, 0, 'KAB. PANGKAJENE KEPULAUAN', 0),
(413, 27, 0, 'KAB. BARRU', 0),
(414, 27, 0, 'KAB. SOPPENG', 0),
(415, 27, 0, 'KAB. WAJO', 0),
(416, 27, 0, 'KAB. SIDENRENG RAPPANG', 0),
(417, 27, 0, 'KAB. PINRANG', 0),
(418, 27, 0, 'KAB. ENREKANG', 0),
(419, 27, 0, 'KAB. LUWU', 0),
(420, 27, 0, 'KAB. TANA TORAJA', 0),
(421, 27, 0, 'KAB. LUWU UTARA', 0),
(422, 27, 0, 'KAB. LUWU TIMUR', 0),
(423, 27, 0, 'KAB. TORAJA UTARA', 0),
(424, 27, 0, 'KOTA MAKASSAR', 0),
(425, 27, 0, 'KOTA PARE PARE', 0),
(426, 27, 0, 'KOTA PALOPO', 0),
(427, 28, 0, 'KAB. KOLAKA', 0),
(428, 28, 0, 'KAB. KONAWE', 0),
(429, 28, 0, 'KAB. MUNA', 0),
(430, 28, 0, 'KAB. BUTON', 0),
(431, 28, 0, 'KAB. KONAWE SELATAN', 0),
(432, 28, 0, 'KAB. BOMBANA', 0),
(433, 28, 0, 'KAB. WAKATOBI', 0),
(434, 28, 0, 'KAB. KOLAKA UTARA', 0),
(435, 28, 0, 'KAB. KONAWE UTARA', 0),
(436, 28, 0, 'KAB. BUTON UTARA', 0),
(437, 28, 0, 'KAB. KOLAKA TIMUR', 0),
(438, 28, 0, 'KAB. KONAWE KEPULAUAN', 0),
(439, 28, 0, 'KAB. MUNA BARAT', 0),
(440, 28, 0, 'KAB. BUTON TENGAH', 0),
(441, 28, 0, 'KAB. BUTON SELATAN', 0),
(442, 28, 0, 'KOTA KENDARI', 0),
(443, 28, 0, 'KOTA BAU BAU', 0),
(444, 29, 0, 'KAB. GORONTALO', 0),
(445, 29, 0, 'KAB. BOALEMO', 0),
(446, 29, 0, 'KAB. BONE BOLANGO', 0),
(447, 29, 0, 'KAB. PAHUWATO', 0),
(448, 29, 0, 'KAB. GORONTALO UTARA', 0),
(449, 29, 0, 'KOTA GORONTALO', 0),
(450, 30, 0, 'KAB. MAMUJU UTARA', 0),
(451, 30, 0, 'KAB. MAMUJU', 0),
(452, 30, 0, 'KAB. MAMASA', 0),
(453, 30, 0, 'KAB. POLEWALI MANDAR', 0),
(454, 30, 0, 'KAB. MAJENE', 0),
(456, 30, 0, 'KAB. MAMUJU TENGAH', 0),
(457, 31, 0, 'KAB. MALUKU TENGAH', 0),
(458, 31, 0, 'KAB. MALUKU TENGGARA', 0),
(459, 31, 0, 'KAB MALUKU TENGGARA BARAT', 0),
(460, 31, 0, 'KAB. BURU', 0),
(461, 31, 0, 'KAB. SERAM BAGIAN TIMUR', 0),
(462, 31, 0, 'KAB. SERAM BAGIAN BARAT', 0),
(463, 31, 0, 'KAB. KEPULAUAN ARU', 0),
(464, 31, 0, 'KAB. MALUKU BARAT DAYA', 0),
(465, 31, 0, 'KAB. BURU SELATAN', 0),
(466, 31, 0, 'KOTA AMBON', 0),
(467, 31, 0, 'KOTA TUAL', 0),
(468, 32, 0, 'KAB. HALMAHERA BARAT', 0),
(469, 32, 0, 'KAB. HALMAHERA TENGAH', 0),
(470, 32, 0, 'KAB. HALMAHERA UTARA', 0),
(471, 32, 0, 'KAB. HALMAHERA SELATAN', 0),
(472, 32, 0, 'KAB. KEPULAUAN SULA', 0),
(473, 32, 0, 'KAB. HALMAHERA TIMUR', 0),
(474, 32, 0, 'KAB. PULAU MOROTAI', 0),
(475, 32, 0, 'KAB. PULAU TALIABU', 0),
(476, 32, 0, 'KOTA TERNATE', 0),
(477, 32, 0, 'KOTA TIDORE KEPULAUAN', 0),
(478, 33, 0, 'KAB. MERAUKE', 0),
(479, 33, 0, 'KAB. JAYAWIJAYA', 0),
(480, 33, 0, 'KAB. JAYAPURA', 0),
(481, 33, 0, 'KAB. NABIRE', 0),
(482, 33, 0, 'KAB. KEPULAUAN YAPEN', 0),
(483, 33, 0, 'KAB. BIAK NUMFOR', 0),
(484, 33, 0, 'KAB. PUNCAK JAYA', 0),
(485, 33, 0, 'KAB. PANIAI', 0),
(486, 33, 0, 'KAB. MIMIKA', 0),
(487, 33, 0, 'KAB. SARMI', 0),
(488, 33, 0, 'KAB. KEEROM', 0),
(489, 33, 0, 'KAB PEGUNUNGAN BINTANG', 0),
(490, 33, 0, 'KAB. YAHUKIMO', 0),
(491, 33, 0, 'KAB. TOLIKARA', 0),
(492, 33, 0, 'KAB. WAROPEN', 0),
(493, 33, 0, 'KAB. BOVEN DIGOEL', 0),
(494, 33, 0, 'KAB. MAPPI', 0),
(495, 33, 0, 'KAB. ASMAT', 0),
(496, 33, 0, 'KAB. SUPIORI', 0),
(497, 33, 0, 'KAB. MAMBERAMO RAYA', 0),
(498, 33, 0, 'KAB. MAMBERAMO TENGAH', 0),
(499, 33, 0, 'KAB. YALIMO', 0),
(500, 33, 0, 'KAB. LANNY JAYA', 0),
(501, 33, 0, 'KAB. NDUGA', 0),
(502, 33, 0, 'KAB. PUNCAK', 0),
(503, 33, 0, 'KAB. DOGIYAI', 0),
(504, 33, 0, 'KAB. INTAN JAYA', 0),
(505, 33, 0, 'KAB. DEIYAI', 0),
(506, 33, 0, 'KOTA JAYAPURA', 0),
(507, 34, 0, 'KAB. SORONG', 0),
(508, 34, 0, 'KAB. MANOKWARI', 0),
(509, 34, 0, 'KAB. FAK FAK', 0),
(510, 34, 0, 'KAB. SORONG SELATAN', 0),
(511, 34, 0, 'KAB. RAJA AMPAT', 0),
(514, 34, 0, 'KAB. TELUK BINTUNI', 0),
(515, 34, 0, 'KAB. TELUK WONDAMA', 0),
(516, 34, 0, 'KAB. KAIMANA', 0),
(517, 34, 0, 'KAB. TAMBRAUW', 0),
(518, 34, 0, 'KAB. MAYBRAT', 0),
(519, 34, 0, 'KAB. MANOKWARI SELATAN', 0),
(520, 34, 0, 'KAB. PEGUNUNGAN ARFAK', 0),
(521, 34, 0, 'KOTA SORONG', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pl_download`
--

DROP TABLE IF EXISTS `pl_download`;
CREATE TABLE IF NOT EXISTS `pl_download` (
  `download_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `filename` varchar(200) NOT NULL,
  `date_uploaded` date NOT NULL,
  `hits` int(3) NOT NULL,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pl_inbox`
--

DROP TABLE IF EXISTS `pl_inbox`;
CREATE TABLE IF NOT EXISTS `pl_inbox` (
  `inbox_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `sender` varchar(90) NOT NULL,
  `email` varchar(180) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `messages` text NOT NULL,
  `date_sent` date NOT NULL,
  `time_sent` time NOT NULL,
  PRIMARY KEY (`inbox_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pl_menu`
--

DROP TABLE IF EXISTS `pl_menu`;
CREATE TABLE IF NOT EXISTS `pl_menu` (
  `menu_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `menu_label` varchar(150) NOT NULL,
  `menu_link` varchar(255) NOT NULL DEFAULT '#',
  `menu_order` int(5) NOT NULL DEFAULT '0',
  `menu_role` varchar(35) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `pl_menu`
--

INSERT INTO `pl_menu` (`menu_id`, `menu_label`, `menu_link`, `menu_order`, `menu_role`) VALUES
(1, 'Home', './', 1, 'public'),
(2, 'Cara Pembelian', 'cara-pembelian.html', 2, 'public'),
(3, 'Produk', '#', 3, 'public'),
(4, 'Blog', 'blog', 4, 'public'),
(5, 'Testimoni', 'testimoni', 5, 'public'),
(6, 'Hubungi Kami', 'hubungi-kami', 6, 'public');

-- --------------------------------------------------------

--
-- Table structure for table `pl_menu_child`
--

DROP TABLE IF EXISTS `pl_menu_child`;
CREATE TABLE IF NOT EXISTS `pl_menu_child` (
  `menu_child_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `menu_child_label` varchar(150) NOT NULL,
  `menu_child_link` varchar(255) NOT NULL DEFAULT '#',
  `menu_parent_id` int(11) unsigned NOT NULL,
  `menu_grand_child` int(11) unsigned NOT NULL,
  `menu_child_role` varchar(35) NOT NULL,
  PRIMARY KEY (`menu_child_id`),
  KEY `menu_parent_id` (`menu_parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `pl_menu_child`
--

INSERT INTO `pl_menu_child` (`menu_child_id`, `menu_child_label`, `menu_child_link`, `menu_parent_id`, `menu_grand_child`, `menu_child_role`) VALUES
(1, 'Pakaian Pria', 'kategori-pakaian-pria', 3, 0, 'public'),
(2, 'Pakaian Olahraga', 'kategori-pakaian-olahraga', 3, 0, 'public'),
(3, 'Pakaian Wanita', 'kategori-pakaian-wanita', 3, 0, 'public'),
(4, 'Casual Dress', 'kategori-casual-dress', 3, 0, 'public');

-- --------------------------------------------------------

--
-- Table structure for table `pl_module`
--

DROP TABLE IF EXISTS `pl_module`;
CREATE TABLE IF NOT EXISTS `pl_module` (
  `module_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(80) NOT NULL,
  `link` varchar(255) NOT NULL DEFAULT '#',
  `description` tinytext,
  `role_level` varchar(20) NOT NULL DEFAULT 'superadmin',
  `actived` enum('Y','N') NOT NULL DEFAULT 'N',
  `sort` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `pl_module`
--

INSERT INTO `pl_module` (`module_id`, `module_name`, `link`, `description`, `role_level`, `actived`, `sort`) VALUES
(1, 'Dashboard', '?module=dashboard', '&lt;p&gt;Modul Dashboard&lt;/p&gt;', 'public', 'Y', 1),
(2, 'Posts', '?module=posts', '&lt;p&gt;Modul Tulisan&lt;/p&gt;', 'public', 'Y', 2),
(3, 'Postcats', '?module=postcats', '&lt;p&gt;Modul Kategori Tulisan&lt;/p&gt;', 'public', 'Y', 3),
(4, 'Tags', '?module=tags', '&lt;p&gt;Modul Label Tulisan(tag)&lt;/p&gt;', 'public', 'Y', 4),
(5, 'Postimage', '?module=postimage', '&lt;p&gt;Modul Gambar atau Foto&lt;/p&gt;', 'public', 'Y', 5),
(6, 'Files', '?module=files', '&lt;p&gt;Modul Katalog Produk&lt;/p&gt;', 'public', 'Y', 6),
(7, 'Pages', '?module=pages', '&lt;p&gt;Modul Halaman&lt;/p&gt;', 'public', 'Y', 7),
(8, 'Comments', '?module=comments', '&lt;p&gt;Modul Komentar&lt;/p&gt;', 'public', 'Y', 8),
(9, 'Products', '?module=products', '&lt;p&gt;Modul Produk&lt;/p&gt;', 'public', 'Y', 9),
(10, 'Orders', '?module=orders', '&lt;p&gt;Modul Order&lt;/p&gt;', 'public', 'Y', 10),
(11, 'Provinces', '?module=provinces', '&lt;p&gt;Modul Provinsi&lt;/p&gt;', 'public', 'Y', 11),
(12, 'Districts', '?module=districts', '&lt;p&gt;Modul Kota atau kabupaten&lt;/p&gt;', 'public', 'Y', 12),
(13, 'Courier', '?module=courier', '&lt;p&gt;Modul jasa pengiriman&lt;/p&gt;', 'public', 'Y', 13),
(14, 'Report', '?module=report', '&lt;p&gt;Modul Laporan Penjualan&lt;/p&gt;', 'public', 'Y', 14),
(15, 'Navigation', '?module=navigation', '&lt;p&gt;Modul Menu&lt;/p&gt;', 'public', 'Y', 15),
(16, 'Themes', '?module=themes', '&lt;p&gt;Modul Template&lt;/p&gt;', 'public', 'Y', 16),
(17, 'Modules', '?module=modules', '&lt;p&gt;Modul Modules&lt;/p&gt;', 'public', 'Y', 17),
(18, 'Users', '?module=users', '&lt;p&gt;Modul Staff&lt;/p&gt;', 'public', 'Y', 18),
(19, 'Customers', '?module=customers', '&lt;p&gt;Modul Kustomer&lt;/p&gt;', 'public', 'Y', 19),
(20, 'Option', '?module=option', '&lt;p&gt;Modul Pengaturan&lt;/p&gt;', 'public', 'Y', 20),
(21, 'Banners', '?module=banners', '&lt;p&gt;Modul Banner&lt;/p&gt;', 'private', 'N', 21),
(22, 'Testimoni', '?module=testimoni', '&lt;p&gt;Modul Ulasan atau testimoni&lt;/p&gt;', 'private', 'N', 22),
(23, 'Ymchat', '?module=ymchat', '&lt;p&gt;Modul livechat dengan Yahoo Messengger&lt;/p&gt;', 'private', 'N', 23),
(24, 'Logout', '?module=logout', '&lt;p&gt;Modul log out dari halaman administrator&lt;/p&gt;', 'public', 'Y', 24);

-- --------------------------------------------------------

--
-- Table structure for table `pl_notification`
--

DROP TABLE IF EXISTS `pl_notification`;
CREATE TABLE IF NOT EXISTS `pl_notification` (
  `notify_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `notify_title` varchar(150) NOT NULL,
  `date_submited` date NOT NULL,
  `time_submited` time NOT NULL,
  `content` text NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`notify_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pl_option`
--

DROP TABLE IF EXISTS `pl_option`;
CREATE TABLE IF NOT EXISTS `pl_option` (
  `option_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `site_name` varchar(150) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `tagline` varchar(200) NOT NULL,
  `shop_address` text NOT NULL,
  `owner_email` varchar(150) NOT NULL,
  `nomor_rekening` varchar(255) NOT NULL,
  `nomor_telpon` varchar(20) NOT NULL,
  `nomor_fax` varchar(20) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `facebook` varchar(120) DEFAULT NULL,
  `pin_bb` varchar(12) NOT NULL,
  `favicon` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pl_option`
--

INSERT INTO `pl_option` (`option_id`, `site_name`, `meta_description`, `meta_keywords`, `tagline`, `shop_address`, `owner_email`, `nomor_rekening`, `nomor_telpon`, `nomor_fax`, `instagram`, `twitter`, `facebook`, `pin_bb`, `favicon`) VALUES
(1, 'My Online Shop', 'PiLUS adalah web based online shop management system, merupakan sistem manajemen toko online berbasis PHP dengan sumber kode terbuka(Open Source), gratis dan bebas didistribusikan yang dapat digunakan untuk mengelola toko online', 'free open source ecommerce solution', 'Free Online Store', 'Perum Puri Cempaka Putih Blok X-10', 'webdev@kartatopia.com', 'BCA 2582099431 a.n Maoelana Noermoehammad', '08155402231', NULL, NULL, NULL, NULL, '56E15149', 'faviconnew.png');

-- --------------------------------------------------------

--
-- Table structure for table `pl_orders`
--

DROP TABLE IF EXISTS `pl_orders`;
CREATE TABLE IF NOT EXISTS `pl_orders` (
  `orders_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(60) NOT NULL DEFAULT 'Baru',
  `time_order` time NOT NULL,
  `date_order` date NOT NULL,
  `customer_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`orders_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pl_orders_detail`
--

DROP TABLE IF EXISTS `pl_orders_detail`;
CREATE TABLE IF NOT EXISTS `pl_orders_detail` (
  `orders_id` smallint(5) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pl_orders_temp`
--

DROP TABLE IF EXISTS `pl_orders_temp`;
CREATE TABLE IF NOT EXISTS `pl_orders_temp` (
  `orders_temp_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `temp_session` varchar(120) NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_orders_temp` date NOT NULL,
  `time_orders_temp` time NOT NULL,
  `temp_stock` int(5) NOT NULL,
  PRIMARY KEY (`orders_temp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pl_post`
--

DROP TABLE IF EXISTS `pl_post`;
CREATE TABLE IF NOT EXISTS `pl_post` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_image` bigint(20) unsigned NOT NULL,
  `post_cat` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` date NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_slug` varchar(255) DEFAULT NULL,
  `post_content` longtext NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `post_type` varchar(120) NOT NULL DEFAULT 'blog',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_tag` varchar(150) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `pl_post`
--

INSERT INTO `pl_post` (`ID`, `post_image`, `post_cat`, `post_author`, `post_date`, `post_title`, `post_slug`, `post_content`, `post_status`, `post_type`, `comment_status`, `post_tag`) VALUES
(1, 1, 0, 1, '2016-03-23', ' Tentang Kami ', 'tentang-kami', '&lt;p&gt;PiLUS adalah &lt;em&gt;web based online shop management sytem&lt;/em&gt;, yang merupakan aplikasi toko online berbasis &lt;em&gt;web&lt;/em&gt; dengan sumber kode terbuka, yang dapat digunakan untuk mengelola toko online, konten &lt;em&gt;website&lt;/em&gt; dan &lt;em&gt;personal blog&lt;/em&gt; atau situs web pribadi.&lt;/p&gt;\r\n&lt;p&gt;PiLUS dapat digunakan, dibagikan atau disebarluaskan tanpa dipungut biaya, dengan tetap mencantumkan lisensi dan hak cipta yang terdapat di dalam paket aplikasi toko online PiLUS yang didistribusikan.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;TIM PENGEMBANG INTI PiLUS&lt;/strong&gt;&lt;/p&gt;', 'publish', 'page', 'close', ''),
(2, 2, 0, 1, '2016-03-23', ' Cara Pembelian ', 'cara-pembelian', '&lt;ol style=&quot;color: #000000; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;&quot;&gt;\r\n&lt;li&gt;Klik pada tombol&amp;nbsp;&lt;span style=&quot;font-weight: bold;&quot;&gt;Beli&lt;/span&gt;&lt;span class=&quot;Apple-converted-space&quot;&gt;&amp;nbsp;&lt;/span&gt;pada produk yang ingin Anda pesan.&lt;/li&gt;\r\n&lt;li&gt;Produk yang Anda pesan akan masuk ke dalam&lt;span class=&quot;Apple-converted-space&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;Keranjang Belanja&lt;/span&gt;. Anda dapat melakukan perubahan jumlah produk yang diinginkan dengan mengganti angka di kolom&lt;span class=&quot;Apple-converted-space&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;Jumlah&lt;/span&gt;, kemudian klik tombol&lt;span class=&quot;Apple-converted-space&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;Update&lt;/span&gt;. Sedangkan untuk menghapus sebuah produk dari Keranjang Belanja, klik tombol Kali yang berada di kolom paling kanan.&lt;/li&gt;\r\n&lt;li&gt;Jika sudah selesai, klik tombol&lt;span class=&quot;Apple-converted-space&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;Selesai Belanja&lt;/span&gt;, maka akan tampil form untuk pengisian data kustomer/pembeli.&lt;/li&gt;\r\n&lt;li&gt;Setelah data kustomer/pembeli selesai diisikan, klik tombol&lt;span class=&quot;Apple-converted-space&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;Proses&lt;/span&gt;, maka data pembeli, produk yang dipesan (jika diperlukan catat nomor ordersnya), total pembayaran serta nomor rekening pembayaran akan dikirim ke email kustomer yang bersangkutan.&lt;/li&gt;\r\n&lt;li&gt;Apabila telah melakukan pembayaran segera konfirmasikan pembayaran anda, maka produk/barang akan segera kami kirimkan.&lt;span class=&quot;Apple-converted-space&quot;&gt; &lt;br /&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;', 'publish', 'page', 'close', ''),
(3, 3, 1, 1, '2016-04-20', 'Apa itu PDO ?  ', 'apa-itu-pdo', '&lt;p&gt;PHP Data Objects (PDO) adalah ekstensi PHP yang menyediakan abstraksi antarmuka akses data(&lt;em&gt;data-access abstraction layer&lt;/em&gt;) untuk mengakses database di PHP.&amp;nbsp; PDO berfungsi sebagai ekstensi layer yang menghubungkan ke database, maka dengan&amp;nbsp; menggunakan method seragam&amp;nbsp; pada database driver yang disediakan oleh PDO, kita dapat mengakses beragam DBMS(MySQL, Oracle, IBM DB2, Microsoft SQL Server, Firebird/Interbase, IBM Informix Dynamic Server,&amp;nbsp; PostGreSql, SQLite, dan sebagainya). Mengapa ?.&amp;nbsp; Karena PDO membolehkan kita berpindah &amp;ndash; pindah database dan platforms tanpa rumit, mudah hanya dengan mengubah string koneksi di banyak objek[Erik Wurzer].&lt;/p&gt;\r\n&lt;p&gt;PDO menyediakan &lt;em&gt;data-access abstraction layer, &lt;/em&gt;maksudnya &amp;ndash; apapun database yang kita gunakan, kita menggunakan fungsi atau method yang sama untuk meminta(query) maupun mengambil (fetch) data[php.net]. Jadi PDO, tidak mengubah atau menulis ulang kode SQL kita, sehingga beban kita semakin ringan dan semakin produktif. :). PDO disisipkan bersama dengan PHP versi 5.1, dan tersedia sebagai &lt;em&gt;PECL extension&lt;/em&gt; untuk PHP 5.0. Pastikan anda menggunakan PHP versi&amp;nbsp; 5.1.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Database driver yang disediakan oleh PDO:&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;PDO_DBLIB&lt;/p&gt;\r\n&lt;p&gt;database driver&amp;nbsp; untuk Microsoft SQL Server, Sybase, FreeTDS.&lt;/p&gt;\r\n&lt;p&gt;PDO_FIREBIRD&lt;/p&gt;\r\n&lt;p&gt;database driver untuk Interbase 6, Firebird.&lt;/p&gt;\r\n&lt;p&gt;PDO_IBM&lt;/p&gt;\r\n&lt;p&gt;database driver untuk IBM DB2&lt;/p&gt;\r\n&lt;p&gt;PDO_MYSQL&lt;/p&gt;\r\n&lt;p&gt;database driver untuk MYSQL&lt;/p&gt;\r\n&lt;p&gt;PDO_INFORMIX&lt;/p&gt;\r\n&lt;p&gt;database driver untuk IBM Informix Dynamic Server&lt;/p&gt;\r\n&lt;p&gt;PDO_PGSQL&lt;/p&gt;\r\n&lt;p&gt;database driver untuk postgreSQL.&lt;/p&gt;\r\n&lt;p&gt;PDO_OCl&lt;/p&gt;\r\n&lt;p&gt;database driver untuk Oracle Call Interface&lt;/p&gt;\r\n&lt;p&gt;PDO_SQLITE&lt;/p&gt;\r\n&lt;p&gt;database driver untuk SQLite3 dan SQLite2&lt;/p&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;strong&gt;Koneksi Database&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;lalu bagaimana cara koneksi database dengan ekstensi PHP &amp;ndash; PDO ?. Coba perhatikan sintaks atau skrip koneksi database berikut untuk beberapa database yang populer(MS SQL Server, MySQL, SQLITE) :&lt;/p&gt;\r\n&lt;pre class=&quot;brush: php;light: true; fontsize: 100; first-line: 1; &quot;&gt;&amp;lt;?php\r\ntry {\r\n  # Penggunaan MS SQL Server dan Sybase dengan PDO_DBLIB\r\n  $DBH = new PDO(&quot;mssql:host=$dbhost;dbname=$dbname, $dbduser, $dbpass&quot;);\r\n  $DBH = new PDO(&quot;sybase:host=$dbhost;dbname=$dbname, $dbuser, $dbpass&quot;);\r\n \r\n  # Penggunaan MySQL dengan PDO_MYSQL\r\n  $DBH = new PDO(&quot;mysql:host=$dbhost;dbname=$dbname&quot;, $dbuser, $dbpass);\r\n \r\n  # SQLite Database\r\n  $DBH = new PDO(&quot;sqlite:my/database/path/database.db&quot;);\r\n}\r\ncatch(PDOException $e) {\r\n    echo $e-&amp;gt;getMessage();\r\n}\r\n\r\n?&amp;gt;&lt;/pre&gt;\r\n&lt;p&gt;pada praktiknya, sintax atau kode tersebut hanya digunakan sesuai dengan database yang kita gunakan. Secara umum, kita akan menggunakan satu koneksi database untuk satu jenis database driver. Bahasan berikutnya kita akan mempelajari cara mengakses dan mengelola database dengan PDO.&lt;/p&gt;', 'publish', 'blog', 'open', 'membuat-website,pemrograman-web'),
(4, 4, 2, 2, '2016-04-20', 'Apa itu Web Hosting, Domain dan Website ?   ', 'apa-itu-web-hosting-domain-dan-website', '&lt;p&gt;Tahun 2016, di masa abad ke-21 ini, salah satu gaya hidup yang menjamur di kalangan masyarakat adalah mengakses internet via mobile phone, tablet, laptop atau smartphone. Yang diakses pun bisa beraneka raga ?. Mulai dari ajang narsis di Facebook hingga berjualan online melalui internet.&lt;/p&gt;\r\n&lt;p&gt;Ya, memang di internet banyak sekali informasi yang dapat kita cari. Karena banyaknya website &amp;ndash; website yang dibuat dan diterbitkan melalui internet. Apa itu Website?. &lt;strong&gt;Website &lt;/strong&gt;sendiri adalah kumpulan halaman situs &amp;ndash; situs yang saling terkait satu sama lain dalam jaringan internet, biasanya berisi seputar informasi, animasi, dokumen, atau tempat interaksi antar pengguna internet.&lt;/p&gt;\r\n&lt;p&gt;Bagaimana Website bisa diakses di Internet ?. Website yang berisi file &amp;ndash; file penyusun situs web yang telah dibuat, haruslah di tempatkan di suatu tempat atau lahan yang namanya Web server, file &amp;ndash; file penyusun situs web tersebut di letakkan di web server yang memiliki akses ke jaringan internet yang disebut dengan &lt;strong&gt;Web Hosting.&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;Untuk mengakses Website diperlukan adanya alamat situs web, sehigga memudahkan para pengguna untuk dapat mengakses situs web tersebut, alamat situs web tersebut biasanya teridentifikasi sebagai baris teks seperti &lt;a href=&quot;http://www.namadomain.com/&quot;&gt;http://www.namadomain.com&lt;/a&gt;. Inilah yang disebut dengan &lt;strong&gt;domain&lt;/strong&gt; dari situs web.&lt;/p&gt;\r\n&lt;p&gt;&amp;nbsp;Itulah pengertian dari Web Hosting, Domain dan Website menurut versi kepo-nya. :)&amp;nbsp;&lt;/p&gt;', 'publish', 'blog', 'open', 'membuat-website,website');

-- --------------------------------------------------------

--
-- Table structure for table `pl_post_category`
--

DROP TABLE IF EXISTS `pl_post_category`;
CREATE TABLE IF NOT EXISTS `pl_post_category` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `postCat_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` tinytext,
  `actived` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `pl_post_category`
--

INSERT INTO `pl_post_category` (`ID`, `postCat_name`, `slug`, `description`, `actived`) VALUES
(1, 'Belajar PHP', 'belajar-php', '<p>Kategori tulisan dengan topik tutorial PHP</p>', 'Y'),
(2, 'Website', 'website', '<p>Kategori tulisan dengan topik website</p>', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `pl_post_comment`
--

DROP TABLE IF EXISTS `pl_post_comment`;
CREATE TABLE IF NOT EXISTS `pl_post_comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `fullname` varchar(90) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `comment` text NOT NULL,
  `date_created` date NOT NULL,
  `time_created` time NOT NULL,
  `actived` enum('Y','N') NOT NULL DEFAULT 'Y',
  `ip` varchar(30) NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pl_post_img`
--

DROP TABLE IF EXISTS `pl_post_img`;
CREATE TABLE IF NOT EXISTS `pl_post_img` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(200) DEFAULT NULL,
  `caption` varchar(200) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `pl_post_img`
--

INSERT INTO `pl_post_img` (`ID`, `filename`, `caption`, `slug`) VALUES
(1, 'pilusopensource.jpg', 'Free Open Source E-commerce Software', 'free-open-source-e-commerce-software'),
(2, 'e-business.jpg', 'PiLUS Aplikasi Toko Online', 'pilus-aplikasi-toko-online'),
(3, 'PHPLogo.png', 'free open source ecommerce software PiLUS', 'free-open-source-ecommerce-software-pilus'),
(4, 'temadefault.jpg', 'website', 'website');

-- --------------------------------------------------------

--
-- Table structure for table `pl_post_tag`
--

DROP TABLE IF EXISTS `pl_post_tag`;
CREATE TABLE IF NOT EXISTS `pl_post_tag` (
  `tag_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `count_tag` smallint(6) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `pl_post_tag`
--

INSERT INTO `pl_post_tag` (`tag_id`, `tag`, `slug`, `count_tag`) VALUES
(1, 'website', 'website', 1),
(2, 'membuat website', 'membuat-website', 1),
(3, 'website toko online', 'website-toko-online', 1),
(4, 'pemrograman web', 'pemrograman-web', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pl_product`
--

DROP TABLE IF EXISTS `pl_product`;
CREATE TABLE IF NOT EXISTS `pl_product` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_catId` bigint(20) unsigned NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `price` int(20) NOT NULL,
  `stock` int(5) NOT NULL,
  `weight` decimal(5,2) unsigned NOT NULL DEFAULT '0.00',
  `date_submited` date NOT NULL,
  `bought` int(5) NOT NULL DEFAULT '1',
  `discount` int(5) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `product_catId` (`product_catId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `pl_product`
--

INSERT INTO `pl_product` (`ID`, `product_catId`, `product_name`, `slug`, `description`, `price`, `stock`, `weight`, `date_submited`, `bought`, `discount`, `image`) VALUES
(1, 4, 'Clearly Ambiguous ', 'clearly-ambiguous', '&lt;p&gt;Clearly ambiguous. The shapes say it all.&lt;/p&gt;', 120000, 15, '0.60', '2016-03-22', 1, 0, '9t-5.jpg'),
(2, 4, 'Yes or No ', 'yes-or-no', '&lt;p&gt;Double T-shirt for couples&lt;/p&gt;', 240000, 12, '0.40', '2016-03-22', 1, 10, '7t-4.jpg'),
(3, 4, '2 plus 3 equals five', '2-plus-3-equals-five', '&lt;p&gt;Combed Cotton 3&lt;/p&gt;', 160000, 20, '0.50', '2016-03-22', 1, 0, '21t-3.jpg'),
(4, 4, 'Se7en ', 'se7en', '&lt;p&gt;Seven Sin&lt;/p&gt;', 136000, 14, '0.40', '2016-03-22', 1, 0, '58t-2.jpg'),
(5, 4, 'A Hood       ', 'a-hood', '&lt;p&gt;A hood for you&lt;/p&gt;', 178000, 20, '0.60', '2016-03-22', 1, 25, '33h-2.jpg'),
(6, 4, 'Ampersand', 'ampersand', '&lt;p&gt;Ampersand &amp;amp; me&lt;/p&gt;', 210000, 0, '1.20', '2016-03-22', 1, 15, '41h-1.jpg'),
(7, 4, 'Kaos Feed Me', 'kaos-feed-me', '&lt;p&gt;Kaos Feed Me Bahan 100% katun&lt;/p&gt;', 65000, 25, '0.30', '2016-03-23', 1, 0, '323.jpg'),
(8, 2, 'Colorful Striped Wool Bathing Suit, c. 1910', 'colorful-striped-wool-bathing-suit-c-1910', '&lt;p&gt;Gent&#039;s 1-piece machine knit suit in red, green, black &amp;amp; cream, 3 buttons each shoulder, DLM, Ch 35&quot;, W 32.5&quot;, L 43&quot;, (minor mends, 1 dime size hole in back) good.&lt;/p&gt;', 1380000, 20, '0.50', '2016-03-23', 1, 0, '20swimsuit.jpg'),
(9, 2, 'Frontier Beaded Jacket  Chaps, c. 1920', 'frontier-beaded-jacket-chaps-c-1920', '&lt;p&gt;Caramel deerskin leather w/ large glass beads in green &amp;amp; white, Jacket: Chest 42&quot;, W 39&quot;, L 34&quot;, Chap&#039;s inseam 29&quot;, prob. made by Mohawks for Wild West shows or as fraternal costume for Improved Order of Red Men, (leather dry, bead loss) good.&lt;/p&gt;', 2600750, 18, '1.20', '2016-03-23', 1, 0, '12frontier.jpg'),
(10, 2, 'Ladies Bathing Costume, Shoes  Floats, c. 1900', 'ladies-bathing-costume-shoes-floats-c-1900', '&lt;p&gt;Marine blue lightweight wool, white sailor collar &amp;amp; trim, button-on skirt, labeled &quot;Arnold Constable &amp;amp; Co. New York&quot;, B 34&quot;, W 25&quot;, L 40&quot;; 1 pair black cotton knit thigh-high canvas sole bathing shoes &amp;amp; set of &quot;Aybad&#039;s Water Wings Patented May 7, 1901&quot;, excellent.&lt;/p&gt;', 2540000, 14, '0.40', '2016-03-23', 1, 15, '58skirted-bathing.jpg'),
(11, 3, 'Printed  Voided Velvet Evening Gown, 1850s', 'printed-voided-velvet-evening-gown-1850s', '&lt;p&gt;Chocolate brown silk faille with border design of brown and cream roses, uncut and voided velvet printed in shades of brown and cream, full skirt in two tiers, back brass hook &amp;amp; eye closure, glazed linen bodice lining, (seams at waistline weak, minor stains) excellent.&lt;/p&gt;', 138000000, 5, '1.60', '2016-03-23', 1, 20, '90gownvictorian.jpg'),
(12, 3, 'Dior Couture Wool Cocktail Dress, 1948', 'dior-couture-wool-cocktail-dress-1948', '&lt;p&gt;Unlabeled black melton wool 3 piece ensemble, c/o tulip shape skirt w/ projecting side panel, strapless bodice w/ built-in corset, &amp;amp; face-framing off-the-shoulder shrug, B 36&quot;, W 27&quot;, H 42&quot;, center front bodice L 9.75&quot;, skirt L 31&quot;, excellent.&lt;/p&gt;', 40250000, 10, '0.80', '2016-03-23', 1, 0, '89dior.jpg'),
(13, 3, 'Pierre Cardin for Mia Farrow Dress, 1967', 'pierre-cardin-for-mia-farrow-dress-1967', '&lt;p&gt;Made exclusively for Mia Farrow in her first starring film role, 1968&amp;amp;#39;s &amp;amp;#34;A Dandy In Aspic&amp;amp;#34;, white wool woven in tiny honey-comb pattern, graduated accordian pleats from collar to hem, circular padded roll collar w/ CF snap, white China silk lining. excellent.&lt;/p&gt;', 19550000, 1, '1.10', '2016-03-23', 1, 0, '69cardin.jpg'),
(14, 1, 'Striped Cotton Tailcoat, America, 1835-1845', 'striped-cotton-tailcoat-america-1835-1845', '&lt;p&gt;Orange and white pin-striped twill cotton, double breasted, turn down collar, waist seam, self-fabric buttons, inside single button pockets in each tail, (soiled, faded, cuff edges frayed) good.&lt;/p&gt;', 21300000, 12, '1.20', '2016-03-23', 1, 15, '49gentsstriped.jpg'),
(15, 1, 'Black Broadcloth Tailcoat, 1830-1845', 'black-broadcloth-tailcoat-1830-1845', '&lt;p&gt;Fine thin wool broadcloth, double breasted, notched collar, horizontal front and side waist seam, slim long sleeves with notched cuffs, curved tails, black silk satin lining quilted in diamond pattern, padded and quilted chest, black silk covered buttons, (buttons worn) excellent.&lt;/p&gt;', 3450000, 25, '1.30', '2016-03-23', 1, 0, '69gentsblack.jpg'),
(16, 1, 'Naval Officer''s Formal Tailcoat, 1840s', 'naval-officer-s-formal-tailcoat-1840s', '&lt;p&gt;Black wool broadcloth, double breast front, missing 3 of 18 raised round gold buttons w/ crossed cannon barrels &amp;amp; &quot;Ordnance Corps&quot; text, silver sequin &amp;amp; tinsel embroidered emblem on each square cut tail, quilted black silk lining, very good.&lt;/p&gt;', 5820000, 20, '1.20', '2016-03-23', 1, 0, '88naval.jpg'),
(17, 4, 'Broken Heart ', 'broken-heart', '&lt;p&gt;Kaos bahan 100% kain katun. Broken Heart&lt;/p&gt;', 76000, 25, '0.30', '2016-03-23', 1, 0, '53heart.jpg'),
(18, 3, 'Betty La Fea ', 'betty-la-fea', '&lt;p&gt;Office Suite Dress. Comfortable, Formal and Eye Catching.&lt;/p&gt;', 372000, 25, '1.20', '2016-03-23', 1, 50, '41blackoffice.jpg'),
(19, 3, 'Cassandra', 'cassandra', '&lt;p&gt;Pink Cassandra. Looking Good for your formal dress.&lt;/p&gt;', 98000, 11, '0.20', '2016-03-23', 2, 0, '83cassandra.jpg'),
(20, 4, 'Pink Lifter', 'pink-lifter', '&lt;p&gt;Pink Lifter is the best for your daily activities. it is a comfort and perfect!&lt;/p&gt;', 46000, 25, '0.20', '2016-03-23', 1, 0, '52pinklifter.jpg'),
(21, 1, 'Red Ferrari ', 'red-ferrari', '&lt;p&gt;Red Ferrari Uniform.&lt;/p&gt;', 370000, 8, '0.60', '2016-03-23', 3, 20, '13redferrari.jpg'),
(22, 1, ' Vodafone ', 'vodafone', '&lt;p&gt;vodafone black orange uniform&lt;/p&gt;', 380000, 15, '1.20', '2016-03-23', 1, 10, '94vodafone.jpg'),
(23, 2, 'El Barca', 'el-barca', '&lt;p&gt;Barcelona jersey Original&lt;/p&gt;', 645000, 10, '0.30', '2016-03-23', 1, 25, '32elbarca.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `pl_product_category`
--

DROP TABLE IF EXISTS `pl_product_category`;
CREATE TABLE IF NOT EXISTS `pl_product_category` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_cat` varchar(150) NOT NULL,
  `description` text,
  `actived` enum('Y','N') NOT NULL DEFAULT 'Y',
  `cat_image` varchar(255) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `pl_product_category`
--

INSERT INTO `pl_product_category` (`ID`, `product_cat`, `description`, `actived`, `cat_image`, `slug`) VALUES
(1, 'Pakaian Pria', 'Gents'' clothing from the 18th century to modern times', 'Y', '891387tophat.jpg', 'pakaian-pria'),
(2, 'Pakaian Olahraga', 'Sporting clothing and gear', 'Y', '203704skirted-bathing.jpg', 'pakaian-olahraga'),
(3, 'Pakaian Wanita', 'Women''s Clothing from the 18th century to modern times', 'Y', '158691gernreich.jpg', 'pakaian-wanita'),
(4, 'Casual Dress', 'Pakaian sehari - hari', 'Y', '582967rope_red.jpg', 'casual-dress');

-- --------------------------------------------------------

--
-- Table structure for table `pl_province`
--

DROP TABLE IF EXISTS `pl_province`;
CREATE TABLE IF NOT EXISTS `pl_province` (
  `province_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `province_name` varchar(100) NOT NULL,
  PRIMARY KEY (`province_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `pl_province`
--

INSERT INTO `pl_province` (`province_id`, `province_name`) VALUES
(1, 'Nangroe Aceh Darussalam'),
(2, 'Sumatera Utara'),
(3, 'Sumatera Barat'),
(4, 'Riau'),
(5, 'Jambi'),
(6, 'Sumatera Selatan'),
(7, 'Bengkulu'),
(8, 'Lampung'),
(9, 'Kepulauan Bangka Belitung'),
(10, 'Kepulauan Riau'),
(11, 'Dki Jakarta'),
(12, 'Jawa Barat'),
(13, 'Jawa Tengah'),
(14, 'Di Yogyakarta'),
(15, 'Jawa Timur'),
(16, 'Banten'),
(17, 'Bali'),
(18, 'Nusa Tenggara Barat'),
(19, 'Nusa Tenggara Timur'),
(20, 'Kalimantan Barat'),
(21, 'Kalimantan Tengah'),
(22, 'Kalimantan Selatan'),
(23, 'Kalimantan Timur'),
(24, 'Kalimantan Utara'),
(25, 'Sulawesi Utara'),
(26, 'Sulawesi Tengah'),
(27, 'Sulawesi Selatan'),
(28, 'Sulawesi Tenggara'),
(29, 'Gorontalo'),
(30, 'Sulawesi Barat'),
(31, 'Maluku'),
(32, 'Maluku Utara'),
(33, 'Papua Barat'),
(34, 'Papua');

-- --------------------------------------------------------

--
-- Table structure for table `pl_shipping`
--

DROP TABLE IF EXISTS `pl_shipping`;
CREATE TABLE IF NOT EXISTS `pl_shipping` (
  `shipping_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `shipping_name` varchar(100) NOT NULL,
  `shipping_logo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`shipping_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `pl_shipping`
--

INSERT INTO `pl_shipping` (`shipping_id`, `shipping_name`, `shipping_logo`) VALUES
(1, 'POS EKSPRESS', NULL),
(2, 'TIKI', NULL),
(3, 'JNE', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pl_statistics`
--

DROP TABLE IF EXISTS `pl_statistics`;
CREATE TABLE IF NOT EXISTS `pl_statistics` (
  `statistic_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) NOT NULL DEFAULT '',
  `browser` varchar(255) NOT NULL,
  `date_visit` date NOT NULL,
  `time_visit` time NOT NULL,
  `hits` int(10) NOT NULL DEFAULT '1',
  `online` varchar(255) NOT NULL,
  PRIMARY KEY (`statistic_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pl_statistics`
--

INSERT INTO `pl_statistics` (`statistic_id`, `ip`, `browser`, `date_visit`, `time_visit`, `hits`, `online`) VALUES
(1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:48.0) Gecko/20100101 Firefox/48.0', '2016-08-12', '20:13:03', 2, '1471007587');

-- --------------------------------------------------------

--
-- Table structure for table `pl_template`
--

DROP TABLE IF EXISTS `pl_template`;
CREATE TABLE IF NOT EXISTS `pl_template` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `template_name` varchar(100) NOT NULL,
  `short_desc` tinytext NOT NULL,
  `designed_by` varchar(150) NOT NULL,
  `folder` varchar(90) NOT NULL,
  `actived` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pl_template`
--

INSERT INTO `pl_template` (`ID`, `template_name`, `short_desc`, `designed_by`, `folder`, `actived`) VALUES
(1, ' webstore default  ', '&lt;p&gt;tema webstore toko online default&lt;/p&gt;', 'templatemo.com', 'content/themes/default', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `pl_testimoni`
--

DROP TABLE IF EXISTS `pl_testimoni`;
CREATE TABLE IF NOT EXISTS `pl_testimoni` (
  `testimoni_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) unsigned NOT NULL,
  `testimoni` mediumtext NOT NULL,
  `submission_date` date NOT NULL,
  `actived` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`testimoni_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pl_ymchat`
--

DROP TABLE IF EXISTS `pl_ymchat`;
CREATE TABLE IF NOT EXISTS `pl_ymchat` (
  `ymchat_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `openID` varchar(80) NOT NULL,
  PRIMARY KEY (`ymchat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
