-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 22, 2015 at 02:31 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `help_db`
--
CREATE DATABASE IF NOT EXISTS `help_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `help_db`;

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE IF NOT EXISTS `devices` (
  `Device_Id` int(10) NOT NULL AUTO_INCREMENT,
  `Device_Name` varchar(75) DEFAULT NULL,
  `Office_Id` int(11) NOT NULL,
  `Device_Properties` varchar(225) NOT NULL,
  PRIMARY KEY (`Device_Id`),
  KEY `FKdevices506639` (`Office_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`Device_Id`, `Device_Name`, `Office_Id`, `Device_Properties`) VALUES
(1, 'Dell Insipiron 2340E', 1, ''),
(2, 'Lenovo Laptop', 1, '500GB Hard Disk, 4GB RAM, 14inch'),
(3, 'Acer Laptop', 6, '450GB Hard Disk,3GB RAM'),
(4, 'tets', 1, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `knowledge_base`
--

CREATE TABLE IF NOT EXISTS `knowledge_base` (
  `Knowledge_Id` int(10) NOT NULL AUTO_INCREMENT,
  `Knowledge_Title` varchar(75) DEFAULT NULL,
  `Knowledge_Details` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`Knowledge_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `knowledge_base`
--

INSERT INTO `knowledge_base` (`Knowledge_Id`, `Knowledge_Title`, `Knowledge_Details`) VALUES
(1, 'Computers Repairs', 'Sample information'),
(2, 'test', 'test'),
(3, '', ''),
(4, 'disk failure', 'Please reboot machine'),
(5, 'Testing Location', 'fixed already'),
(6, 'checkers one', 'resolved'),
(7, 'checkone', 'chejced'),
(8, 'Basic', 'hhh'),
(9, 'Final Users ', 'fixed');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `message_id` int(10) NOT NULL AUTO_INCREMENT,
  `message_title` varchar(45) NOT NULL,
  `message_body` varchar(54) NOT NULL,
  `message_sender` varchar(25) NOT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `message_title`, `message_body`, `message_sender`) VALUES
(1, 'one', 'two three', 'three'),
(2, 'ivans', 'check ivan', 'hduser'),
(3, 'test', 'test	', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `offices`
--

CREATE TABLE IF NOT EXISTS `offices` (
  `Office_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Office_Name` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`Office_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `offices`
--

INSERT INTO `offices` (`Office_Id`, `Office_Name`) VALUES
(1, 'Dean'),
(2, 'AR-Office'),
(3, 'Lab I'),
(4, 'Lab II'),
(5, 'Lab III'),
(6, 'Lab IV'),
(7, 'tets'),
(8, 'InterDisciplinary Offices'),
(9, 'Office IV');

-- --------------------------------------------------------

--
-- Table structure for table `responses`
--

CREATE TABLE IF NOT EXISTS `responses` (
  `Response_Id` int(10) NOT NULL AUTO_INCREMENT,
  `Response` int(10) DEFAULT NULL,
  `Ticket_Id` int(10) NOT NULL,
  PRIMARY KEY (`Response_Id`),
  KEY `FKresponses605787` (`Ticket_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `server`
--

CREATE TABLE IF NOT EXISTS `server` (
  `Server_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Host_Ip` varchar(22) NOT NULL,
  `Db_Name` varchar(22) NOT NULL,
  `Password` varchar(22) NOT NULL,
  PRIMARY KEY (`Server_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `server`
--

INSERT INTO `server` (`Server_Id`, `Host_Ip`, `Db_Name`, `Password`) VALUES
(1, '192.168.1.150', 'root', ''),
(2, '192.100.1.1', 'Mukama', 'iueue'),
(3, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `service_term`
--

CREATE TABLE IF NOT EXISTS `service_term` (
  `Service_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Service_Name` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`Service_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `Task_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Ticket_Title` varchar(225) NOT NULL,
  `User_Id` varchar(100) NOT NULL,
  PRIMARY KEY (`Task_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`Task_Id`, `Date`, `Ticket_Title`, `User_Id`) VALUES
(1, '2015-03-29 18:19:08', 'Broken Monitor', '1'),
(2, '2015-04-07 18:41:17', 'disk failure', 'hduser'),
(3, '2015-04-08 09:24:49', 'Dell not starting', 'hduser'),
(4, '2015-04-08 09:24:55', 'checkone', 'hduser'),
(5, '2015-04-08 13:10:11', 'Laptop doesnt boot', 'hduser'),
(6, '2015-04-08 15:01:53', 'onesa', 'hduser'),
(7, '2015-04-18 06:07:04', 'Computer Doesnt Read a flash', 'hduser'),
(8, '2015-04-19 20:38:39', 'Laptop Does Boot', 'hduser'),
(9, '2015-04-21 16:07:25', 'Basic', 'hduser'),
(10, '2015-04-21 18:36:54', 'Help', 'hduser'),
(11, '2015-04-22 01:50:39', 'Testing Location', 'hduser'),
(12, '2015-04-22 01:50:53', 'Testing Location', 'hduser'),
(13, '2015-04-22 01:52:20', 'Testing Location', 'hduser'),
(14, '2015-04-22 01:55:47', 'Testing Location', 'hduser'),
(15, '2015-04-22 02:04:37', 'checkers one', 'hduser'),
(16, '2015-04-22 02:06:57', 'checkers one', 'hduser'),
(17, '2015-04-22 02:08:25', 'checkers one', 'hduser'),
(18, '2015-04-22 02:19:44', 'Final Trial', 'hduser'),
(19, '2015-04-22 02:21:43', 'Final Users ', 'hduser');

-- --------------------------------------------------------

--
-- Table structure for table `task_log`
--

CREATE TABLE IF NOT EXISTS `task_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Task` varchar(100) NOT NULL DEFAULT 'null',
  `User` varchar(45) NOT NULL DEFAULT 'null',
  `Sent_On` varchar(100) NOT NULL DEFAULT 'null',
  `Assigned_On` varchar(100) NOT NULL DEFAULT 'null',
  `Resolved` varchar(100) NOT NULL DEFAULT 'null',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `task_log`
--

INSERT INTO `task_log` (`Id`, `Task`, `User`, `Sent_On`, `Assigned_On`, `Resolved`) VALUES
(1, 'null', 'hduser', '2015-04-21 18:52:20', 'null', 'null'),
(2, 'Testing Location', 'hduser', '2015-04-21 18:55:47', 'null', 'null'),
(3, 'Basic', '', '2015-04-21 19:00:24', 'null', '2015-04-21 19:17:33'),
(4, 'Final Trial', 'null', '2015-04-21 19:19:13', 'null', 'null'),
(5, 'Final Users ', 'hduser', '2015-04-21 19:21:17', '2015-04-21 19:21:43', '2015-04-21 19:22:35');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE IF NOT EXISTS `tickets` (
  `Ticket_Id` int(10) NOT NULL AUTO_INCREMENT,
  `Ticket_Title` varchar(75) DEFAULT NULL,
  `Ticket_Details` varchar(225) DEFAULT NULL,
  `Status` varchar(10) DEFAULT 'Not Fixed',
  `Device_Id` int(10) NOT NULL,
  `Date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Priority_Level` varchar(20) NOT NULL,
  `User_Id` int(11) NOT NULL,
  `Additional_Info` varchar(225) NOT NULL DEFAULT 'Not Yet Fixed',
  `Submitted_By` varchar(100) NOT NULL,
  `Contact` varchar(22) NOT NULL,
  `Device_Location` varchar(56) NOT NULL,
  PRIMARY KEY (`Ticket_Id`),
  KEY `FKtickets209676` (`Device_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`Ticket_Id`, `Ticket_Title`, `Ticket_Details`, `Status`, `Device_Id`, `Date`, `Priority_Level`, `User_Id`, `Additional_Info`, `Submitted_By`, `Contact`, `Device_Location`) VALUES
(2, 'disk failure', 'machine doesnt boot.. disk failure is an issue', 'Fixed', 1, '2015-04-06 08:25:23', 'Low', 0, 'Please reboot machine', '', '', ''),
(3, 'Dell not starting', 'no boot sequence', 'Fixed', 1, '2015-04-06 13:07:48', 'High', 0, 'fixed now', '', '', ''),
(4, 'one', 'two', 'Not Fixed', 1, '2015-04-06 13:11:28', 'Low', 0, 'Not yet fixed', '', '', ''),
(5, '', '', 'Not Fixed', 2, '2015-04-06 13:16:38', 'High', 0, '0', '', '', ''),
(6, 'checking', 'checking', 'Not Fixed', 1, '2015-04-06 13:28:09', 'Low', 0, '0', '', '', ''),
(7, 'checker one', 'checker two', 'Not Fixed', 1, '2015-04-06 14:21:05', 'Moderate', 0, '0', '', '', ''),
(8, 'checkone', 'check three', 'Fixed', 1, '2015-04-06 14:27:59', 'Low', 0, 'chejced', '', '', ''),
(9, 'One', 'two', 'Not Fixed', 1, '2015-04-06 14:31:07', 'Low', 0, '0', '', '', ''),
(10, 'onesa', 'checkers', 'Fixed', 1, '2015-04-06 14:39:45', 'Low', 0, 'working fine now', '', '', ''),
(11, 'one', 'two', 'Not Fixed', 1, '2015-04-06 14:45:31', 'Low', 0, '0', '', '', ''),
(12, 'hey', 'hey one', 'Not Fixed', 2, '2015-04-06 14:53:25', 'Low', 0, '0', '', '', ''),
(13, 'sikcs', 'ashhas', 'Not Fixed', 1, '2015-04-06 15:09:03', 'Moderate', 0, '0', '', '', ''),
(14, 'Basic', 'basic', 'Fixed', 1, '2015-04-06 15:14:21', 'High', 0, 'hhh', '', '', ''),
(15, 'one', 'three', 'Not Fixed', 1, '2015-04-06 15:28:01', 'Low', 0, '0', '', '', ''),
(16, 'Laptop doesnt boot', 'Boot sequence is probaly faulty', 'Fixed', 1, '2015-04-08 11:00:09', 'Low', 1, 'checked and now working very fine....', 'officialuser', '', ''),
(17, 'Computer Doesnt Read a flash', 'please come and check why the flash is not being read', 'Fixed', 1, '2015-04-18 06:05:29', 'Low', 1, 'Been fixed', 'officialuser', '0706148080', ''),
(18, 'test', 'test', 'Not Fixed', 1, '2015-04-18 06:57:50', 'Low', 1, 'Not Yet Fixed', 'officialuser', '0770778373', ''),
(19, 'Laptop Does Boot', 'Milk spilled on it. Key board and power not functional', 'Fixed', 1, '2015-04-19 20:38:12', 'High', 1, 'Problem resolved', 'officialuser', '0706198189', ''),
(20, 'Help', 'Ticket One	', 'Not Fixed', 1, '2015-04-21 18:33:04', 'Low', 1, 'Not Yet Fixed', 'officialuser', '0700393673', 'Lab IV'),
(21, 'Testing Location', 'test location	', 'Fixed', 1, '2015-04-21 19:02:26', 'Low', 1, 'fixed already', 'officialuser', '0700898789', 'Lab II'),
(22, 'checkers one', 'checkers one', 'Fixed', 1, '2015-04-22 01:59:31', 'Low', 1, 'resolved', 'officialuser', '070098765', 'Lab IV'),
(23, 'checkers one', 'checkers', 'Fixed', 1, '2015-04-22 02:00:24', 'Low', 1, 'resolved', 'officialuser', '0700987766', 'Dean'),
(24, 'Final Trial', 'trials', 'Not Fixed', 1, '2015-04-22 02:19:13', 'Low', 1, 'Not Yet Fixed', 'officialuser', '07000987774', 'Dean'),
(25, 'Final Users ', 'guys finsal', 'Fixed', 1, '2015-04-22 02:21:17', 'Low', 1, 'fixed', 'officialuser', '070098773', 'Dean');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `User_Id` int(10) NOT NULL AUTO_INCREMENT,
  `User_Name` varchar(75) DEFAULT NULL,
  `Password` varchar(75) DEFAULT NULL,
  `User_Type` varchar(75) DEFAULT NULL,
  `Sex` varchar(6) DEFAULT NULL,
  `Job_Title` varchar(45) DEFAULT NULL,
  `Status` varchar(45) DEFAULT 'Active',
  `Service` varchar(100) NOT NULL,
  `Full_Names` varchar(100) NOT NULL,
  `DOB` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(100) NOT NULL,
  PRIMARY KEY (`User_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`User_Id`, `User_Name`, `Password`, `User_Type`, `Sex`, `Job_Title`, `Status`, `Service`, `Full_Names`, `DOB`, `Email`, `Phone`) VALUES
(1, 'Mukama', 'martin', 'Admin', 'Male', 'BIT', 'Active', '2013/2014', '', '', '', ''),
(2, 'CollinsMann', 'mann', 'Admin', 'Male', 'BIT', 'Active', '2013/2014', '', '', '', ''),
(3, 'Nowamani', 'Collino', 'Admin', 'Male', 'BIT', 'Active', '2014/ 2015', '', '', '', ''),
(4, 'hduser', 'hduser', 'HelpDesk', 'Male', 'BIT', 'Active', '2013/2014', '', '', '', ''),
(5, 'officialuser', 'officialuser', 'OfficialUser', 'Male', 'BIT', 'Active', '2013/2014', '', '', '', ''),
(6, 'Collins', 'collins', 'Admin', 'Male', 'BIT', 'Active', '2013/2014', 'Collins Nowamani', '19-09-1990', 'nowamani@gmail.com', '+256706148080'),
(7, 'Adminr', 'adminr', 'Admin', 'Male', 'Student', 'Active', '2013/2014', 'James Bond', '2014-09-09', 'emai', '90'),
(8, 'ja', 'ja', 'Admin', 'Male', 'ja', 'Active', '2013/2014', 'ja ja', '19-09-2014', 'mukama.martin@gmail.com', '0700393643'),
(9, 'martin', 'martin', 'HelpDesk', 'Male', 'techina', 'Active', '2013/2014', 'martin b', '2012/4/12', 'martin@gmail.com', '0776159925'),
(10, 'NewHDUser', 'hduser', 'Admin', 'Male', 'Student', 'Active', '2013/2014', 'New HDUser', '1990-09-09', 'mukama@gmail.com', '0700393643'),
(11, 'newHD', 'newhd', 'HelpDesk', 'Male', 'Student', 'Active', '2013/2014', 'New HD', '1990-09-09', 'student@gmail.com', '0700454313');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `devices`
--
ALTER TABLE `devices`
  ADD CONSTRAINT `FKdevices506639` FOREIGN KEY (`Office_Id`) REFERENCES `offices` (`Office_Id`);

--
-- Constraints for table `responses`
--
ALTER TABLE `responses`
  ADD CONSTRAINT `FKresponses605787` FOREIGN KEY (`Ticket_Id`) REFERENCES `tickets` (`Ticket_Id`);

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `FKtickets209676` FOREIGN KEY (`Device_Id`) REFERENCES `devices` (`Device_Id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
