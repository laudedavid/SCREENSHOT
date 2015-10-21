-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2015 at 01:30 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cakeology`
--

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE IF NOT EXISTS `buyer` (
  `buyerId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fbId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`buyerId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=491 ;

--
-- Dumping data for table `buyer`
--

INSERT INTO `buyer` (`buyerId`, `name`, `fbId`, `email`, `image`, `created_at`, `updated_at`) VALUES
(488, 'Kim Kimii Carulasan', '10153485697683023', 'coolchix_fas@yahoo.com.sg', NULL, '2015-10-06 10:31:37', '2015-10-06 10:31:37'),
(489, 'David Laude', '10205083000930372', 'laudedavid@yahoo.com', NULL, '2015-10-09 03:07:46', '2015-10-09 03:07:46'),
(490, 'Jerald Patalinghug', '782430978570353', 'jeraldpunx11@yahoo.com', 'http://graph.facebook.com/782430978570353/picture?width=300', '2015-10-13 10:54:25', '2015-10-13 10:54:25');

-- --------------------------------------------------------

--
-- Table structure for table `cake`
--

CREATE TABLE IF NOT EXISTS `cake` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `userfbId` int(11) NOT NULL,
  `availability` tinyint(1) NOT NULL DEFAULT '1',
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `layer1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `layer2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `layer3` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `cake`
--

INSERT INTO `cake` (`id`, `name`, `price`, `category`, `description`, `userfbId`, `availability`, `image`, `layer1`, `layer2`, `layer3`, `created_at`, `updated_at`) VALUES
(4, 'dab', '150.00', 'Wedding', 'bday', 2147483647, 1, 'QxLNqTGAUFNe7ySt19rgPOkq5YqLmQ.jpg', '', '', '', '2015-10-10 14:07:06', '2015-10-10 14:07:06');

-- --------------------------------------------------------

--
-- Table structure for table `cakemodel`
--

CREATE TABLE IF NOT EXISTS `cakemodel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sellerID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `buyerID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `availability` tinyint(1) NOT NULL DEFAULT '1',
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `layer1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `layer2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `layer3` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `layer1topper` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `layer2topper` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `layer3topper` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=115 ;

--
-- Dumping data for table `cakemodel`
--

INSERT INTO `cakemodel` (`id`, `sellerID`, `buyerID`, `name`, `price`, `category`, `description`, `availability`, `image`, `layer1`, `layer2`, `layer3`, `layer1topper`, `layer2topper`, `layer3topper`, `created_at`, `updated_at`) VALUES
(113, '', '10205083000930372', '', '0.00', '', '', 0, '', '2', '2', '1', '0', '0', '5', '2015-10-20 18:20:24', '2015-10-20 18:58:05'),
(114, '', '10205083000930372', '', '0.00', '', '', 0, '24XN3fBkttfIwLskZHpWjQwRedWQzp.jpg', '1', '1', '1', '0', '0', '8', '2015-10-20 19:30:01', '2015-10-20 20:12:12');

-- --------------------------------------------------------

--
-- Table structure for table `layer`
--

CREATE TABLE IF NOT EXISTS `layer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `box` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BaseLayer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Toppers` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `layer`
--

INSERT INTO `layer` (`id`, `name`, `image`, `created_at`, `updated_at`, `box`, `BaseLayer`, `Toppers`) VALUES
(1, '', 'squarecake.jpg', '2015-10-10 14:07:06', '2015-10-10 14:07:06', 'choosebox', '1', 0),
(2, 'circlecake.jpg', 'circlecake.jpg', '2015-10-10 14:07:06', '2015-10-10 14:07:06', 'choosebox', '1', 0),
(4, 'sad.png', 'sad.png', '2015-10-10 14:07:06', '2015-10-10 14:07:06', 'choosebox', '', 1),
(8, '', 'lWqADYFZH0D4FCGHB1VxMPmKpClPXb.png', '2015-10-20 20:08:49', '2015-10-20 20:08:49', 'choosebox', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2015_08_03_063610_create_user_table', 1),
('2015_08_03_074724_create_buyer_table', 2),
('2015_08_03_075059_create_seller_table', 3),
('2015_08_05_171014_create_users_table', 4),
('2015_08_19_061200_create_user_table', 5),
('2015_09_22_171606_create_cake_table', 6),
('2015_09_24_064239_create_cake_table', 7),
('2015_10_02_145158_create_order_table', 8),
('2015_10_06_170855_create_cake_table', 9),
('2015_10_06_171606_create_cake_table', 10),
('2015_10_06_201654_create_layer_table', 11),
('2015_10_09_155915_create_cake_table', 12),
('2015_10_09_160156_create_cake_table', 13),
('2015_10_09_163125_create_cakeModel_table', 14),
('2015_10_09_163737_create_cakeModel_table', 15),
('2015_10_10_193437_create_layer_table', 16),
('2015_10_10_193852_create_cakeModel_table', 17),
('2015_10_10_215553_create_user_table', 18);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `buyersName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE IF NOT EXISTS `seller` (
  `sellerId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fbId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`sellerId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=26 ;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`sellerId`, `name`, `fbId`, `email`, `created_at`, `updated_at`) VALUES
(24, 'Kim Kimii Carulasan', '10153485697683023', 'coolchix_fas@yahoo.com.sg', '2015-10-06 10:38:25', '2015-10-06 10:38:25'),
(25, 'David Laude', '10205083000930372', 'laudedavid@yahoo.com', '2015-10-10 13:34:48', '2015-10-10 13:34:48');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fbId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `fbId`, `email`, `image`, `created_at`, `updated_at`, `remember_token`) VALUES
(1, 'David Laude', '10205083000930372', 'laudedavid@yahoo.com', 'http://graph.facebook.com/10205083000930372/picture?width=300', '2015-10-10 13:56:31', '2015-10-10 13:56:36', 'Nf1KjuvfhZ2xTKOdhRQFIdgTWEeyn5GuUwlvjl3TerDXgoSHXmJFX6SgO1hx'),
(2, 'Jerald Patalinghug', '782430978570353', 'jeraldpunx11@yahoo.com', 'http://graph.facebook.com/782430978570353/picture?width=300', '2015-10-13 10:52:58', '2015-10-13 10:52:58', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
