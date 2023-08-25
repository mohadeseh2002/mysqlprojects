-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 14, 2023 at 12:29 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
CREATE TABLE IF NOT EXISTS `authors` (
  `au_id` int NOT NULL,
  `au_lname` varchar(20) NOT NULL,
  `au_fname` varchar(20) NOT NULL,
  `phone` int NOT NULL,
  `address` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `zip` int NOT NULL,
  `contract` varchar(20) NOT NULL,
  PRIMARY KEY (`au_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`au_id`, `au_lname`, `au_fname`, `phone`, `address`, `city`, `state`, `zip`, `contract`) VALUES
(1, 'Mohammadi', 'Aram', 1234567, 'Azadi', 'tehran', 'A', 124444, 'A'),
(2, 'Ahmadi', 'Asal', 1234568, 'Enghelab', 'tehran', 'I', 5445454, 'A'),
(3, 'Najafi', 'Ali', 8855454, 'najafabad', 'Tabriz', 'A', 77885544, 'A'),
(4, 'Mosavi', 'Shayan', 66998844, 'Enghelab', 'Tehran', 'A', 115544778, 'I');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
CREATE TABLE IF NOT EXISTS `discount` (
  `discounttype` varchar(11) NOT NULL,
  `stor_id` int NOT NULL,
  `lowqty` int NOT NULL,
  `highqty` int NOT NULL,
  `discount` int NOT NULL,
  PRIMARY KEY (`stor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`discounttype`, `stor_id`, `lowqty`, `highqty`, `discount`) VALUES
('special', 1, 10, 30, 20),
('day', 2, 10, 30, 20),
('blackfriday', 3, 11, 56, 20),
('special', 12345, 5, 45, 30),
('???', 55858, 55, 100, 50),
('Student', 554455, 4, 9, 25);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `emp_id` int NOT NULL,
  `fname` varchar(20) NOT NULL,
  `minit` int NOT NULL,
  `lname` varchar(20) NOT NULL,
  `job_id` int NOT NULL,
  `job_lvl` int NOT NULL,
  `pub_id` int NOT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`emp_id`,`job_id`,`pub_id`),
  KEY `job_id` (`job_id`),
  KEY `pub_id` (`pub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `fname`, `minit`, `lname`, `job_id`, `job_lvl`, `pub_id`, `hire_date`) VALUES
(2, 'ahdfg', 1, 'yrtth', 1, 4, 3, '2023-03-14'),
(2, 'afhdhd', 6, 'hhgthfhf', 1, 5, 4, '2016-03-15'),
(4, 'a', 2, 'aghai', 2, 20, 1, '2022-02-15'),
(1325, 'ewewe', 2, 'Ahmadi', 2, 1, 2, '2022-03-04');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `job_id` int NOT NULL,
  `job_desc` varchar(20) NOT NULL,
  `min_lvl` int NOT NULL,
  `max_lvl` int NOT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`job_id`, `job_desc`, `min_lvl`, `max_lvl`) VALUES
(1, 'karmand', 1, 10),
(2, 'modir', 10, 20),
(565656, 'karmand', 4, 10);

-- --------------------------------------------------------

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
CREATE TABLE IF NOT EXISTS `publishers` (
  `pub_id` int NOT NULL,
  `pub_name` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  PRIMARY KEY (`pub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`pub_id`, `pub_name`, `city`, `state`, `country`) VALUES
(1, 'jjjjj', 'tehran', 'z', 'iran'),
(2, 'kkkkk', 'tehran', 'z', 'iran'),
(3, 'lllllll', 'shiraz', 'a', 'iran'),
(4, 'uuuuu', 'shiraz', 'a', 'iran');

-- --------------------------------------------------------

--
-- Table structure for table `pub_info`
--

DROP TABLE IF EXISTS `pub_info`;
CREATE TABLE IF NOT EXISTS `pub_info` (
  `pub_id` int NOT NULL,
  `logo` varchar(20) NOT NULL,
  `pr_info` varchar(20) NOT NULL,
  PRIMARY KEY (`pub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pub_info`
--

INSERT INTO `pub_info` (`pub_id`, `logo`, `pr_info`) VALUES
(1, 'a', 'z'),
(2, 'z', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `roysched`
--

DROP TABLE IF EXISTS `roysched`;
CREATE TABLE IF NOT EXISTS `roysched` (
  `title_id` int NOT NULL,
  `lorange` int NOT NULL,
  `hirange` int NOT NULL,
  `royalty` int NOT NULL,
  PRIMARY KEY (`title_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roysched`
--

INSERT INTO `roysched` (`title_id`, `lorange`, `hirange`, `royalty`) VALUES
(1, 1, 2, 3),
(2, 4, 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `stor_id` int NOT NULL,
  `ord_num` int NOT NULL,
  `ord_date` int NOT NULL,
  `qty` int NOT NULL,
  `payterms` int NOT NULL,
  `title_id` int NOT NULL,
  PRIMARY KEY (`title_id`,`stor_id`,`ord_num`),
  KEY `stor_id` (`stor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`stor_id`, `ord_num`, `ord_date`, `qty`, `payterms`, `title_id`) VALUES
(1, 2, 2021, 1, 1, 1),
(2, 1, 2023, 1, 2, 2),
(3, 1, 2019, 1, 6, 3),
(1, 1, 2018, 1, 18, 4);

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
CREATE TABLE IF NOT EXISTS `stores` (
  `stor_id` int NOT NULL AUTO_INCREMENT,
  `stor_name` varchar(20) NOT NULL,
  `stor_address` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `zip` int NOT NULL,
  PRIMARY KEY (`stor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`stor_id`, `stor_name`, `stor_address`, `city`, `state`, `zip`) VALUES
(1, 'shahreketab', 'tehran', 'tehran', 'A', 124444),
(2, 'namyeshgahketab', 'tehran', 'tehran', 'a', 144444),
(3, 'Enghelab', 'tehran', 'Tehran', 'a', 18888);

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
CREATE TABLE IF NOT EXISTS `titles` (
  `title_id` int NOT NULL,
  `title` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `pub_id` int NOT NULL,
  `price` int NOT NULL,
  `advance` int NOT NULL,
  `royalty` int NOT NULL,
  `ytd-sales` int NOT NULL,
  `notes` varchar(20) NOT NULL,
  PRIMARY KEY (`title_id`,`pub_id`),
  KEY `pub_id` (`pub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `titles`
--

INSERT INTO `titles` (`title_id`, `title`, `type`, `pub_id`, `price`, `advance`, `royalty`, `ytd-sales`, `notes`) VALUES
(1, 'eertt', 'Amozeshi', 2, 850000, 8, 5, 3, '0'),
(1, 'sharif', 'Amozeshi', 4, 1850000, 2, 6, 7, '0'),
(2, 'tahlil tarikh', 'tarikhi', 1, 2000000, 1, 6, 4, '0'),
(2, 'nakhoda', 'Elmi', 2, 1550000, 2, 5, 3, '0'),
(3, 'ZistShenasi', 'Elmi', 3, 7000000, 2, 8, 6, '0'),
(4, 'Faza', 'Elmi', 4, 13800000, 2, 1, 11, 'SatareShenasi');

-- --------------------------------------------------------

--
-- Table structure for table `title_author`
--

DROP TABLE IF EXISTS `title_author`;
CREATE TABLE IF NOT EXISTS `title_author` (
  `au_id` int NOT NULL,
  `title_id` int NOT NULL,
  `au_ord` int NOT NULL,
  `royaltyper` int NOT NULL,
  PRIMARY KEY (`au_id`,`title_id`),
  KEY `title_id` (`title_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `title_author`
--

INSERT INTO `title_author` (`au_id`, `title_id`, `au_ord`, `royaltyper`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authors`
--
ALTER TABLE `authors`
  ADD CONSTRAINT `authors_ibfk_1` FOREIGN KEY (`au_id`) REFERENCES `title_author` (`au_id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`pub_id`) REFERENCES `publishers` (`pub_id`);

--
-- Constraints for table `pub_info`
--
ALTER TABLE `pub_info`
  ADD CONSTRAINT `pub_info_ibfk_1` FOREIGN KEY (`pub_id`) REFERENCES `publishers` (`pub_id`);

--
-- Constraints for table `roysched`
--
ALTER TABLE `roysched`
  ADD CONSTRAINT `roysched_ibfk_1` FOREIGN KEY (`title_id`) REFERENCES `titles` (`title_id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`stor_id`) REFERENCES `stores` (`stor_id`);

--
-- Constraints for table `stores`
--
ALTER TABLE `stores`
  ADD CONSTRAINT `stores_ibfk_1` FOREIGN KEY (`stor_id`) REFERENCES `discount` (`stor_id`);

--
-- Constraints for table `titles`
--
ALTER TABLE `titles`
  ADD CONSTRAINT `titles_ibfk_1` FOREIGN KEY (`title_id`) REFERENCES `sales` (`title_id`),
  ADD CONSTRAINT `titles_ibfk_2` FOREIGN KEY (`pub_id`) REFERENCES `publishers` (`pub_id`);

--
-- Constraints for table `title_author`
--
ALTER TABLE `title_author`
  ADD CONSTRAINT `title_author_ibfk_1` FOREIGN KEY (`title_id`) REFERENCES `titles` (`title_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
