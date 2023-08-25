-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 25, 2023 at 08:52 AM
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
-- Database: `university`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `profinfo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `profinfo` (`clg1` INT, `pname1` VARCHAR(20), `office1` VARCHAR(20), `esp1` VARCHAR(20), `degree1` VARCHAR(20))   BEGIN
INSERT INTO prof(clg, pname, office, esp, degree) VALUES (clg1,pname1,office1,esp1,degree1);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `clg`
--

DROP TABLE IF EXISTS `clg`;
CREATE TABLE IF NOT EXISTS `clg` (
  `clg` int NOT NULL,
  `clgname` varchar(20) CHARACTER SET utf32 COLLATE utf32_persian_ci NOT NULL,
  `city` varchar(20) CHARACTER SET utf32 COLLATE utf32_persian_ci NOT NULL,
  `pname` varchar(20) CHARACTER SET utf32 COLLATE utf32_persian_ci NOT NULL,
  PRIMARY KEY (`clg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_persian_ci;

--
-- Dumping data for table `clg`
--

INSERT INTO `clg` (`clg`, `clgname`, `city`, `pname`) VALUES
(1, 'ریاضی', 'تهران', 'حسینی'),
(2, 'فیزیک', 'مشهد', 'ذاکر'),
(3, 'زبان', 'مشهد', 'مفتون'),
(4, 'صنایع', 'تهران', 'صادقی'),
(5, 'شیمی', 'تهران', 'اشرفی'),
(6, 'مواد', 'تبریز', 'ابوطالبی'),
(7, 'برق', 'تهران', 'جلالی'),
(10, 'کامپیوتر', 'تهران', 'جاهد'),
(11, 'معماری', 'یزد', 'نقره کار'),
(12, 'معارف', 'تهران', 'خاتمی');

-- --------------------------------------------------------

--
-- Table structure for table `crs`
--

DROP TABLE IF EXISTS `crs`;
CREATE TABLE IF NOT EXISTS `crs` (
  `c` int NOT NULL COMMENT 'کد درس',
  `clg` int NOT NULL COMMENT 'شماره دانشکده',
  `cname` varchar(20) CHARACTER SET utf32 COLLATE utf32_persian_ci NOT NULL COMMENT 'نام درس',
  `unit` int NOT NULL COMMENT 'تعداد واحد',
  PRIMARY KEY (`c`,`clg`),
  KEY `clg#` (`clg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_persian_ci;

--
-- Dumping data for table `crs`
--

INSERT INTO `crs` (`c`, `clg`, `cname`, `unit`) VALUES
(10172, 10, 'شبیه سازی', 3),
(10174, 10, 'مدارمنطقی', 3),
(12100, 11, 'معارف', 2),
(12564, 1, 'ریاضی', 4),
(51516, 5, 'شیمی آلی', 3),
(71203, 7, 'کنترل خطی', 3),
(99099, 10, 'هوش مصنوعی', 3);

-- --------------------------------------------------------

--
-- Table structure for table `prof`
--

DROP TABLE IF EXISTS `prof`;
CREATE TABLE IF NOT EXISTS `prof` (
  `clg` int NOT NULL,
  `pname` varchar(20) CHARACTER SET utf32 COLLATE utf32_persian_ci NOT NULL,
  `office` varchar(20) CHARACTER SET utf32 COLLATE utf32_persian_ci NOT NULL COMMENT 'دفتر کار',
  `esp` varchar(20) CHARACTER SET utf32 COLLATE utf32_persian_ci NOT NULL COMMENT 'تخصص',
  `degree` varchar(20) CHARACTER SET utf32 COLLATE utf32_persian_ci NOT NULL COMMENT 'مدرک تحصیلی',
  PRIMARY KEY (`clg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_persian_ci;

--
-- Dumping data for table `prof`
--

INSERT INTO `prof` (`clg`, `pname`, `office`, `esp`, `degree`) VALUES
(1, 'حسینی', '2', 'ریاضی', 'دکتری'),
(2, 'ذاکر', '4', 'فیزیک', 'دکتری'),
(3, 'مفتون', '1', 'زبان', 'دکتری'),
(4, 'صادقی', '3', 'صنایع', 'دکتری'),
(5, 'اشرفی', '8', 'شیمی', 'دکتری'),
(6, 'ابوطالبی', '3', 'مواد', 'دکتری'),
(7, 'جلالی', '5', 'برق', 'دکتری'),
(10, 'میر شمسی', '4', 'کامپیوتر', 'فوق لیسانس'),
(11, 'نقره کار', '3', 'معماری', 'دکتری'),
(12, 'شجاعی', '5', 'زبان', 'دکتری');

-- --------------------------------------------------------

--
-- Table structure for table `sec`
--

DROP TABLE IF EXISTS `sec`;
CREATE TABLE IF NOT EXISTS `sec` (
  `sec` int NOT NULL COMMENT 'شماره گروه',
  `c` int NOT NULL COMMENT 'شماره درس',
  `s` int NOT NULL COMMENT 'شماره دانشجو',
  `pname` varchar(20) CHARACTER SET utf32 COLLATE utf32_persian_ci NOT NULL,
  `score` int NOT NULL,
  `term` int NOT NULL,
  PRIMARY KEY (`sec`,`c`,`s`),
  KEY `c#` (`c`),
  KEY `s#` (`s`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_persian_ci;

--
-- Dumping data for table `sec`
--

INSERT INTO `sec` (`sec`, `c`, `s`, `pname`, `score`, `term`) VALUES
(1516, 51516, 734569, 'اشرفی', 17, 752),
(1724, 10172, 712345, 'هاشمی', 15, 761),
(1724, 10172, 724569, 'قربانی', 16, 761),
(1747, 10174, 724569, 'میر شمسی', 16, 752);

-- --------------------------------------------------------

--
-- Table structure for table `stud`
--

DROP TABLE IF EXISTS `stud`;
CREATE TABLE IF NOT EXISTS `stud` (
  `s` int NOT NULL COMMENT 'شماره دانشجو',
  `clg` int NOT NULL COMMENT 'شماره دانشکده',
  `sname` varchar(20) CHARACTER SET utf32 COLLATE utf32_persian_ci NOT NULL,
  `city` varchar(20) CHARACTER SET utf32 COLLATE utf32_persian_ci NOT NULL,
  `avg` int NOT NULL,
  PRIMARY KEY (`s`,`clg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_persian_ci;

--
-- Dumping data for table `stud`
--

INSERT INTO `stud` (`s`, `clg`, `sname`, `city`, `avg`) VALUES
(73254, 4, 'کمانی', 'کرمان', 18),
(712345, 10, 'محمدی', 'تهران', 17),
(712549, 6, 'حسینی', 'تبریز', 12),
(712586, 10, 'وکیلی', 'اصفهان', 14),
(714569, 5, 'احمدی', 'کرمان', 15),
(724569, 1, 'علیاری', 'مشهد', 16),
(734569, 5, 'جوادی', 'تهران', 17);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view1`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view1`;
CREATE TABLE IF NOT EXISTS `view1` (
`clg` int
,`clgname` varchar(20)
,`city` varchar(20)
,`pname` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view2`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view2`;
CREATE TABLE IF NOT EXISTS `view2` (
`s` int
,`clg` int
,`sname` varchar(20)
,`city` varchar(20)
,`avg` int
);

-- --------------------------------------------------------

--
-- Structure for view `view1`
--
DROP TABLE IF EXISTS `view1`;

DROP VIEW IF EXISTS `view1`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view1`  AS SELECT `clg`.`clg` AS `clg`, `clg`.`clgname` AS `clgname`, `clg`.`city` AS `city`, `clg`.`pname` AS `pname` FROM `clg``clg`  ;

-- --------------------------------------------------------

--
-- Structure for view `view2`
--
DROP TABLE IF EXISTS `view2`;

DROP VIEW IF EXISTS `view2`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view2`  AS SELECT `stud`.`s` AS `s`, `stud`.`clg` AS `clg`, `stud`.`sname` AS `sname`, `stud`.`city` AS `city`, `stud`.`avg` AS `avg` FROM `stud` WHERE (`stud`.`avg` > 15)  ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `crs`
--
ALTER TABLE `crs`
  ADD CONSTRAINT `crs_ibfk_1` FOREIGN KEY (`clg`) REFERENCES `prof` (`clg`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prof`
--
ALTER TABLE `prof`
  ADD CONSTRAINT `prof_ibfk_1` FOREIGN KEY (`clg`) REFERENCES `clg` (`clg`);

--
-- Constraints for table `sec`
--
ALTER TABLE `sec`
  ADD CONSTRAINT `sec_ibfk_1` FOREIGN KEY (`c`) REFERENCES `crs` (`c`),
  ADD CONSTRAINT `sec_ibfk_2` FOREIGN KEY (`s`) REFERENCES `stud` (`s`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
