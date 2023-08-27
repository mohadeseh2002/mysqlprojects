-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 27, 2023 at 02:38 PM
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
-- Database: `eticket`
--

-- --------------------------------------------------------

--
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
CREATE TABLE IF NOT EXISTS `aircraft` (
  `id` int NOT NULL,
  `flyid` int NOT NULL,
  `type` varchar(20) NOT NULL,
  `capacity` int NOT NULL,
  PRIMARY KEY (`id`,`flyid`),
  KEY `flyid` (`flyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `aircraft`
--

INSERT INTO `aircraft` (`id`, `flyid`, `type`, `capacity`) VALUES
(1, 4, 'mosaferbari', 50),
(2, 1, 'mosaferbari', 50),
(3, 2, 'mosaferbari', 50),
(4, 3, 'mosaferbari', 50);

-- --------------------------------------------------------

--
-- Table structure for table `airports`
--

DROP TABLE IF EXISTS `airports`;
CREATE TABLE IF NOT EXISTS `airports` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `flyid` int NOT NULL,
  PRIMARY KEY (`id`,`flyid`),
  KEY `flyid` (`flyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `airports`
--

INSERT INTO `airports` (`id`, `name`, `country`, `city`, `flyid`) VALUES
(1, 'mehrabad', 'iran', 'tehran', 1),
(2, 'emamkhomeini', 'iran', 'tehran', 2),
(3, 'rasht', 'iran', 'rasht', 3),
(4, 'amol', 'iran', 'amol', 4);

-- --------------------------------------------------------

--
-- Table structure for table `bankinfo`
--

DROP TABLE IF EXISTS `bankinfo`;
CREATE TABLE IF NOT EXISTS `bankinfo` (
  `bankcode` int NOT NULL,
  `payid` int NOT NULL,
  `namebank` varchar(20) NOT NULL,
  `account` int NOT NULL,
  `nameholder` varchar(20) NOT NULL,
  PRIMARY KEY (`payid`,`bankcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bankinfo`
--

INSERT INTO `bankinfo` (`bankcode`, `payid`, `namebank`, `account`, `nameholder`) VALUES
(1, 1, 'sepah', 1236, ''),
(2, 2, 'tejarat', 1456, ''),
(3, 3, 'sina', 1123, ''),
(4, 4, 'saderat', 1110, '');

-- --------------------------------------------------------

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
CREATE TABLE IF NOT EXISTS `cargo` (
  `id` int NOT NULL,
  `flyid` int NOT NULL,
  `weight` int NOT NULL,
  `origin` varchar(20) NOT NULL,
  `destintion` varchar(20) NOT NULL,
  PRIMARY KEY (`id`,`flyid`),
  KEY `flyid` (`flyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cargo`
--

INSERT INTO `cargo` (`id`, `flyid`, `weight`, `origin`, `destintion`) VALUES
(1, 4, 400, 'iran', 'iran'),
(2, 2, 100, 'iran', 'iran');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `origincountry` varchar(20) NOT NULL,
  `flyid` int NOT NULL,
  PRIMARY KEY (`id`,`flyid`),
  KEY `flyid` (`flyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `origincountry`, `flyid`) VALUES
(1, 'alibaba', 'iran', 1),
(2, 'iranair', 'iran', 2),
(3, 'aseman', 'iran', 3),
(4, 'mahan', 'iran', 4),
(5, 'caspian', 'iran', 5);

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
CREATE TABLE IF NOT EXISTS `discount` (
  `id` int NOT NULL,
  `payid` int NOT NULL,
  `type` varchar(20) NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`id`,`payid`),
  KEY `payid` (`payid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`id`, `payid`, `type`, `amount`) VALUES
(1, 1, '20', 20),
(2, 2, '50', 50);

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
CREATE TABLE IF NOT EXISTS `flight` (
  `flyid` int NOT NULL,
  `date` date NOT NULL,
  `time` int NOT NULL,
  `origin` varchar(20) NOT NULL,
  `destination` varchar(20) NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`flyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`flyid`, `date`, `time`, `origin`, `destination`, `price`) VALUES
(1, '2023-08-01', 10, 'tehran', 'shiraz', 90000),
(2, '2023-08-04', 12, 'tehran', 'isfahan', 10000),
(3, '2023-08-18', 11, 'rasht', 'yazd', 10000),
(4, '2023-08-16', 15, 'amol', 'mashhad', 10000),
(5, '2023-08-17', 19, 'tabriz', 'amol', 10000),
(6, '2023-08-11', 23, 'mashhad', 'tabriz', 10000),
(7, '2023-08-07', 17, 'tehran', 'mashhad', 10000),
(8, '2023-08-08', 16, 'shiraz', 'bandarabas', 10000),
(9, '2023-08-10', 4, 'tehran', 'babol', 10000),
(10, '2023-08-11', 13, 'tehran', 'ahvaz', 10000),
(12, '2023-08-16', 5, 'tehran', 'kerman', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

DROP TABLE IF EXISTS `passengers`;
CREATE TABLE IF NOT EXISTS `passengers` (
  `personalid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `phone` int NOT NULL,
  `address` varchar(50) NOT NULL,
  `payid` int NOT NULL,
  `flyid` int NOT NULL,
  PRIMARY KEY (`personalid`,`payid`,`flyid`),
  KEY `flyid` (`flyid`),
  KEY `payid` (`payid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`personalid`, `name`, `fname`, `phone`, `address`, `payid`, `flyid`) VALUES
(1, 'mohamad', 'askari', 9120000, '', 1, 1),
(2, 'hosein', 'mohamadi', 9120000, '', 2, 2),
(3, 'ali', 'khodabandeloo', 9120000, '', 3, 3),
(4, 'amir', 'hoseini', 9120000, '', 4, 4),
(5, 'fatemeh', 'moradi', 9120000, '', 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `payid` int NOT NULL,
  `date` int NOT NULL,
  `payamount` int NOT NULL,
  PRIMARY KEY (`payid`),
  KEY `payid` (`payid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payid`, `date`, `payamount`) VALUES
(1, 0, 10000),
(2, 0, 10000),
(3, 0, 10000),
(4, 0, 10000),
(5, 1, 10000);

-- --------------------------------------------------------

--
-- Table structure for table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
CREATE TABLE IF NOT EXISTS `personnel` (
  `id` int NOT NULL,
  `flyid` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `salary` int NOT NULL,
  `position` varchar(20) NOT NULL,
  PRIMARY KEY (`id`,`flyid`),
  KEY `flyid` (`flyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `personnel`
--

INSERT INTO `personnel` (`id`, `flyid`, `name`, `fname`, `salary`, `position`) VALUES
(1, 1, 'reza', 'rezai', 200000, 'mehmandar'),
(2, 2, 'hamid', 'ghorbani', 200000, 'mehmandar'),
(3, 3, 'saeed', 'amiri', 200000, 'khalaban'),
(4, 4, 'zahra', 'sohrabi', 200000, 'mehmandar');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
CREATE TABLE IF NOT EXISTS `seats` (
  `seatid` int NOT NULL,
  `flyid` int NOT NULL,
  `personalityid` int NOT NULL,
  PRIMARY KEY (`seatid`,`flyid`,`personalityid`),
  KEY `flyid` (`flyid`),
  KEY `personalityid` (`personalityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`seatid`, `flyid`, `personalityid`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aircraft`
--
ALTER TABLE `aircraft`
  ADD CONSTRAINT `aircraft_ibfk_1` FOREIGN KEY (`flyid`) REFERENCES `flight` (`flyid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `airports`
--
ALTER TABLE `airports`
  ADD CONSTRAINT `airports_ibfk_1` FOREIGN KEY (`flyid`) REFERENCES `flight` (`flyid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bankinfo`
--
ALTER TABLE `bankinfo`
  ADD CONSTRAINT `bankinfo_ibfk_1` FOREIGN KEY (`payid`) REFERENCES `payment` (`payid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cargo`
--
ALTER TABLE `cargo`
  ADD CONSTRAINT `cargo_ibfk_1` FOREIGN KEY (`flyid`) REFERENCES `flight` (`flyid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`flyid`) REFERENCES `flight` (`flyid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `discount`
--
ALTER TABLE `discount`
  ADD CONSTRAINT `discount_ibfk_1` FOREIGN KEY (`payid`) REFERENCES `payment` (`payid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `passengers`
--
ALTER TABLE `passengers`
  ADD CONSTRAINT `passengers_ibfk_1` FOREIGN KEY (`flyid`) REFERENCES `flight` (`flyid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `passengers_ibfk_2` FOREIGN KEY (`payid`) REFERENCES `payment` (`payid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `personnel`
--
ALTER TABLE `personnel`
  ADD CONSTRAINT `personnel_ibfk_1` FOREIGN KEY (`flyid`) REFERENCES `flight` (`flyid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`flyid`) REFERENCES `flight` (`flyid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `seats_ibfk_2` FOREIGN KEY (`personalityid`) REFERENCES `passengers` (`personalid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
