-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 08, 2013 at 09:28 AM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `crm_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `webmail_id` varchar(20) NOT NULL,
  `comment_text` text NOT NULL,
  `thread_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `thread_id` (`thread_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `webmail_id`, `comment_text`, `thread_id`) VALUES
(32, 'srs', '.No this is not. Sorry its fine', 3);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `course_id` varchar(10) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `syllabus` text NOT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `course_name` (`course_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `syllabus`) VALUES
('CS344', 'Databases', 'Data models with emphasis on the relational model; Database design with E-R model; Relational algebra and calculus; query Languages (specifically SQL); RDBMS design; File & system structure: indexed sequential, hashed, dynamic hashed, B-trees; Query processing; Concurrency control; error recovery; security; Case studies like ORACLE, Mysql, etc.; Introduction to Open Database Connectivity, Client-Server environment etc.'),
('CS346', 'Compilers', 'Overview of different phases of a compiler: front-end; back-end; Lexical analysis: specification of tokens, recognition of tokens, input buffering, automatic tools; Syntax analysis: context free grammars, top down and bottom up parsing techniques, construction of efficient parsers, syntax-directed translation, automatic tools; Semantic analysis: declaration processing, type checking, symbol tables, error recovery; Intermediate code generation: run-time environments, translation of language constructs; Code generation: flow-graphs, register allocation, code-generation algorithms; Introduction to code optimization techniques.\r\n\r\n '),
('CS348', 'Networks', 'Evolution of computer networks; Data link layer: Framing, HDLC, PPP, sliding window protocols, medium access control, Token Ring, Wireless LAN; Virtual circuit switching: Frame relay, ATM; Network Layer: Internet addressing, IP, ARP, ICMP, CIDR, routing algorithms (RIP, OSPF, BGP); Transport Layer: UDP, TCP, flow control, congestion control; Introduction to quality of service; Application Layer: DNS, Web, email, authentication, encryption.');

-- --------------------------------------------------------

--
-- Table structure for table `course_offerings`
--

CREATE TABLE IF NOT EXISTS `course_offerings` (
  `course_id` varchar(10) NOT NULL,
  `semester` int(2) NOT NULL,
  `absolute_year` year(4) NOT NULL,
  PRIMARY KEY (`course_id`,`semester`,`absolute_year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_offerings`
--

INSERT INTO `course_offerings` (`course_id`, `semester`, `absolute_year`) VALUES
('CS344', 1, 2013),
('CS346', 1, 2013),
('CS348', 1, 2013);

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE IF NOT EXISTS `documents` (
  `file_id` int(10) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(200) NOT NULL,
  `file_data` varchar(300) NOT NULL,
  `file_description` text NOT NULL,
  `uploader_id` varchar(20) NOT NULL,
  `course_id` varchar(10) NOT NULL,
  `semester` int(2) NOT NULL,
  `year` year(4) NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`file_id`),
  KEY `course_id` (`course_id`,`semester`,`year`),
  KEY `uploader_id` (`uploader_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`file_id`, `file_name`, `file_data`, `file_description`, `uploader_id`, `course_id`, `semester`, `year`, `time_stamp`) VALUES
(39, '230910_351174001644249_746160530_n.jpg', 'upload/CS346/1_2013/230910_351174001644249_746160530_n.jpg', '', 'p.dileep', 'CS346', 1, 2013, '2013-03-30 14:23:19'),
(50, 'Doc1.txt', 'upload/CS346/1_2013/Doc1.txt', '', 'p.dileep', 'CS346', 1, 2013, '2013-04-01 09:32:45'),
(51, 'data-structures-questions.pdf', 'upload/CS346/1_2013/data-structures-questions.pdf', '', 'p.dileep', 'CS346', 1, 2013, '2013-04-01 09:32:51'),
(52, 'LAB REPORT1.pdf', 'upload/CS346/1_2013/LAB REPORT1.pdf', '', 'p.sai', 'CS346', 1, 2013, '2013-04-01 09:33:13');

-- --------------------------------------------------------

--
-- Table structure for table `enrolls`
--

CREATE TABLE IF NOT EXISTS `enrolls` (
  `stud_webmail_id` varchar(20) NOT NULL,
  `course_id` varchar(10) NOT NULL,
  `semester` int(2) NOT NULL,
  `year` year(4) NOT NULL,
  PRIMARY KEY (`stud_webmail_id`,`course_id`,`semester`,`year`),
  KEY `my_key` (`course_id`,`semester`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enrolls`
--

INSERT INTO `enrolls` (`stud_webmail_id`, `course_id`, `semester`, `year`) VALUES
('p.sai', 'CS344', 1, 2013),
('p.dileep', 'CS346', 1, 2013),
('p.sai', 'CS346', 1, 2013),
('p.sai', 'CS348', 1, 2013);

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE IF NOT EXISTS `instructor` (
  `webmail_id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `instructor_id` varchar(10) NOT NULL,
  PRIMARY KEY (`webmail_id`),
  UNIQUE KEY `instuctor_id` (`instructor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`webmail_id`, `name`, `instructor_id`) VALUES
('srs', 'Dr. Ranbir ', '101');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `webmail_id_sender` varchar(20) NOT NULL,
  `webmail_id_reciever` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reciever_read` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`webmail_id_sender`, `webmail_id_reciever`, `message`, `time_stamp`, `reciever_read`) VALUES
('sahil', 'aduti', 'dsafsdfasd sdaf sad fsa f', '2013-04-01 01:13:49', 0),
('sahil', 'aduti', 'dsafsdfassafasd sf asd fadsf sad fsa f', '2013-04-01 01:14:03', 0),
('sahil', 'aduti', 'sdafdsaf sf sf ', '2013-04-01 01:14:57', 0),
('aduti', 'sahil', 'sdafdsaf sf sf ', '2013-04-01 01:14:59', 0),
('sahil', 'aduti', 'hello 1 ', '2013-04-01 01:15:57', 0),
('aduti', 'sahil', 'hello 2 ', '2013-04-01 01:16:59', 0),
('dileep', 'sahil', 'databases kar saale', '2013-03-31 13:00:45', 0),
('dileep', 'aduti', 'room se bahar nikla?', '2013-03-31 12:57:45', 0),
('sahil', 'aduti', 'dsafsdfasd sdaf sad fsa f', '2013-03-31 19:43:49', 0),
('sahil', 'aduti', 'dsafsdfassafasd sf asd fadsf sad fsa f', '2013-03-31 19:44:03', 0),
('sahil', 'aduti', 'sdafdsaf sf sf ', '2013-03-31 19:44:57', 0),
('aduti', 'sahil', 'sdafdsaf sf sf ', '2013-03-31 19:44:59', 0),
('sahil', 'aduti', 'hello 1 ', '2013-03-31 19:45:57', 0),
('aduti', 'sahil', 'hello 2 ', '2013-03-31 19:46:59', 0),
('dileep', 'sahil', 'databases kar saale', '2013-03-31 07:30:45', 0),
('dileep', 'aduti', 'room se bahar nikla?', '2013-03-31 07:27:45', 0),
('p.sai', 'p.dileep', 'Hii ra', '2013-04-01 07:59:24', 0),
('p.dileep', 'p.sai', 'Hii chepu enti', '2013-04-01 07:59:24', 0),
('p.sai', 'p.dileep', 'Message', '2013-04-08 07:00:00', 0),
('p.sai', 'p.dileep', 'hi ra', '2013-04-08 07:00:00', 0),
('p.sai', 'p.dileep', 'fsdafsafdasfasfdsadf', '2013-04-08 07:00:00', 0),
('p.sai', 'p.dillep', '', '2013-04-09 07:00:00', 0),
('p.sai', 'p.dileep', '', '2013-04-09 07:00:00', 0),
('p.sai', 'p.dileep', '', '2013-04-09 07:00:00', 0),
('p.sai', 'dasfdsa', '', '2013-04-09 07:00:00', 0),
('p.sai', 'p.dileep', '', '2013-04-09 07:00:00', 0),
('p.sai', 'asdf', '', '2013-04-09 07:00:00', 0),
('p.sai', 'asdf', '', '2013-04-09 07:00:00', 0),
('p.sai', 'asdfd', '', '2013-04-09 07:00:00', 0),
('p.sai', 'adsf', '', '2013-04-09 07:00:00', 0),
('p.sai', 'asdf', 'fasdf', '2013-04-09 07:00:00', 0),
('p.sai', 'sadfdas', 'sadfdsa', '2013-04-09 07:00:00', 0),
('p.sai', 'p.dileep', 'sadfdsa', '2013-04-09 07:00:00', 0),
('p.sai', 'sharath', 'sadfdsa', '2013-04-09 07:00:00', 0),
('p.sai', 'sharath', 'sadfdsa', '2013-04-09 07:00:00', 0),
('p.sai', 'sharath', 'fasf', '2013-04-09 07:00:00', 0),
('p.sai', 'sahil', 'fsadf', '2013-04-09 07:00:00', 0),
('p.sai', 'mohan', 'dsaf', '2013-04-09 07:00:00', 0),
('p.sai', 'mohan', 'dsaf', '2013-04-09 07:00:00', 0),
('p.sai', 'mohan', 'fsadf', '2013-04-09 07:00:00', 0),
('p.sai', 'sahil', 'dfsa', '2013-04-09 07:00:00', 0),
('p.sai', 'sa', 'fadsf', '2013-04-09 07:00:00', 0),
('p.sai', 'lolz', 'dfasf', '2013-04-09 07:00:00', 0),
('p.sai', 'tol', 'dfsaf', '2013-04-09 07:00:00', 0),
('p.dileep', 'p.dileep', 'Yes going', '2013-04-07 18:30:00', 0),
('p.dileep', 'p.sai', 'get time pls', '2013-04-07 18:30:00', 0),
('p.dileep', 'p.sai', 'manchiga kottu', '2013-04-07 18:30:00', 0),
('p.sai', 'p.dileep', 'SOME THING', '2013-04-07 18:30:00', 0),
('p.sai', 'p.dileep', 'sdafdsafasd', '2013-04-07 18:30:00', 0),
('p.sai', 'sahil', 'dfsfadsf sadf sad f', '2013-04-07 18:30:00', 0),
('p.sai', 'p.dileep', 'mohan', '2013-04-07 18:30:00', 0),
('p.dileep', 'p.sai', 'dasfdsaf saf sadf ', '2013-04-08 09:09:53', 0),
('p.sai', 'p.dileep', 'sahil with key', '2013-04-08 09:10:45', 0),
('p.sai', 'p.dileep', 'Messagesdfdas', '2013-04-08 09:12:41', 0),
('p.sai', 'p.dileep', 'Message lolz', '2013-04-08 09:13:25', 0);

-- --------------------------------------------------------

--
-- Table structure for table `news_course`
--

CREATE TABLE IF NOT EXISTS `news_course` (
  `nid` int(11) NOT NULL DEFAULT '0',
  `course_id` varchar(10) NOT NULL,
  `semester` int(2) NOT NULL,
  `year` year(4) NOT NULL,
  PRIMARY KEY (`nid`,`course_id`,`semester`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news_course`
--

INSERT INTO `news_course` (`nid`, `course_id`, `semester`, `year`) VALUES
(1, 'CS344', 1, 2013),
(3, 'CS344', 1, 2013),
(4, 'CS344', 1, 2013);

-- --------------------------------------------------------

--
-- Table structure for table `news_feed`
--

CREATE TABLE IF NOT EXISTS `news_feed` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `news_text` text,
  `webmail` varchar(20) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `news_feed`
--

INSERT INTO `news_feed` (`nid`, `news_text`, `webmail`, `date`) VALUES
(1, 'quiz2 on wed', 'venkatesh', '2013-04-08 00:00:00'),
(3, 'hello, this saturday no class', 'p.sai', '2013-04-07 00:00:00'),
(4, 'Slides are uploaded', 'p.sai', '2013-04-05 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `webmail_id` varchar(20) NOT NULL,
  `psswd` varchar(100) NOT NULL,
  PRIMARY KEY (`webmail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`webmail_id`, `psswd`) VALUES
('p.dileep', 'a6f9b3bcd538b605eaa3fa8e829f88df2ecea540'),
('p.sai', '4a139ab8ba403e6a085b018d276c203b0e0875e4'),
('srs', '9f97ab1131b1ad6055bd34cdbada48b407764d2e');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE IF NOT EXISTS `quiz` (
  `webmail_id` varchar(60) NOT NULL,
  `first` int(11) NOT NULL,
  `second` int(11) NOT NULL,
  `third` int(11) NOT NULL,
  `fourth` int(11) NOT NULL,
  `fifth` int(11) NOT NULL,
  `sixth` int(11) NOT NULL,
  `seventh` int(11) NOT NULL,
  `eighth` int(11) NOT NULL,
  `ninth` int(11) NOT NULL,
  `tenth` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `webmail_id_2` (`webmail_id`),
  UNIQUE KEY `webmail_id_3` (`webmail_id`),
  KEY `webmail_id` (`webmail_id`),
  KEY `webmail_id_4` (`webmail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`webmail_id`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `eighth`, `ninth`, `tenth`, `total`, `time`) VALUES
('p.dileep', 0, 0, 0, 0, 0, 0, 5, 0, 5, 5, 15, '2013-04-01 09:35:42'),
('p.sai', 5, 5, 0, 0, 5, 0, 5, 0, 5, 0, 25, '2013-04-01 09:29:04');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE IF NOT EXISTS `reports` (
  `reported_by` varchar(20) NOT NULL,
  `file_id` int(10) NOT NULL,
  PRIMARY KEY (`reported_by`,`file_id`),
  KEY `file_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`reported_by`, `file_id`) VALUES
('p.sai', 39),
('p.sai', 50);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `webmail_id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `roll_no` varchar(10) NOT NULL,
  `semester` int(2) NOT NULL,
  `abs_semester` int(2) NOT NULL,
  `abs_year` year(4) NOT NULL,
  PRIMARY KEY (`webmail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`webmail_id`, `name`, `roll_no`, `semester`, `abs_semester`, `abs_year`) VALUES
('p.dileep', 'Dileep', '10010180', 6, 1, 2013),
('p.sai', 'Venkat', '10010149', 6, 1, 2013);

-- --------------------------------------------------------

--
-- Table structure for table `teaches`
--

CREATE TABLE IF NOT EXISTS `teaches` (
  `instructor_webmail_id` varchar(20) NOT NULL,
  `course_id` varchar(10) NOT NULL,
  `semester` int(2) NOT NULL,
  `year` year(4) NOT NULL,
  PRIMARY KEY (`instructor_webmail_id`,`course_id`,`semester`,`year`),
  KEY `course_id` (`course_id`,`semester`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teaches`
--

INSERT INTO `teaches` (`instructor_webmail_id`, `course_id`, `semester`, `year`) VALUES
('srs', 'CS344', 1, 2013);

-- --------------------------------------------------------

--
-- Table structure for table `thread`
--

CREATE TABLE IF NOT EXISTS `thread` (
  `thread_id` int(11) NOT NULL AUTO_INCREMENT,
  `thread_name` varchar(200) NOT NULL,
  `webmail_id` varchar(20) NOT NULL,
  `course_id` varchar(10) NOT NULL,
  `semester` int(2) NOT NULL,
  `year` year(4) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`thread_id`),
  KEY `course_id` (`course_id`,`semester`,`year`),
  KEY `webmail_id` (`webmail_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=54 ;

--
-- Dumping data for table `thread`
--

INSERT INTO `thread` (`thread_id`, `thread_name`, `webmail_id`, `course_id`, `semester`, `year`, `description`) VALUES
(3, 'This is waste', 'p.dileep', 'CS344', 1, 2013, 'waste'),
(14, 'Parsing', 'p.sai', 'CS346', 1, 2013, 'Syatax analysis'),
(38, 'yes', 'p.sai', 'CS344', 1, 2013, 'please'),
(44, 'edit thread', 'p.sai', 'CS344', 1, 2013, 'editing done'),
(50, 'New thread with bootstrap', 'p.sai', 'CS344', 1, 2013, 'boot strap is awesome'),
(51, 'merged code', 'p.sai', 'CS344', 1, 2013, 'This is mereged'),
(52, 'cretae', 'p.dileep', 'CS346', 1, 2013, ' new thread'),
(53, 'Instructoir thread', 'srs', 'CS344', 1, 2013, 'Instructor desc');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`thread_id`) REFERENCES `thread` (`thread_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`course_id`, `semester`, `year`) REFERENCES `course_offerings` (`course_id`, `semester`, `absolute_year`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `documents_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course_offerings` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `documents_ibfk_3` FOREIGN KEY (`uploader_id`) REFERENCES `person` (`webmail_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `enrolls`
--
ALTER TABLE `enrolls`
  ADD CONSTRAINT `enrolls_ibfk_1` FOREIGN KEY (`stud_webmail_id`) REFERENCES `student` (`webmail_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enrolls_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course_offerings` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enrolls_ibfk_3` FOREIGN KEY (`course_id`, `semester`, `year`) REFERENCES `course_offerings` (`course_id`, `semester`, `absolute_year`),
  ADD CONSTRAINT `enrolls_ibfk_4` FOREIGN KEY (`course_id`, `semester`, `year`) REFERENCES `course_offerings` (`course_id`, `semester`, `absolute_year`),
  ADD CONSTRAINT `my_key` FOREIGN KEY (`course_id`, `semester`, `year`) REFERENCES `course_offerings` (`course_id`, `semester`, `absolute_year`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `instructor`
--
ALTER TABLE `instructor`
  ADD CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`webmail_id`) REFERENCES `person` (`webmail_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `news_course`
--
ALTER TABLE `news_course`
  ADD CONSTRAINT `news_course_ibfk_1` FOREIGN KEY (`nid`) REFERENCES `news_feed` (`nid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`webmail_id`) REFERENCES `person` (`webmail_id`);

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `documents` (`file_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`webmail_id`) REFERENCES `person` (`webmail_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teaches`
--
ALTER TABLE `teaches`
  ADD CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`course_id`, `semester`, `year`) REFERENCES `course_offerings` (`course_id`, `semester`, `absolute_year`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`instructor_webmail_id`) REFERENCES `instructor` (`webmail_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teaches_ibfk_3` FOREIGN KEY (`course_id`, `semester`, `year`) REFERENCES `course_offerings` (`course_id`, `semester`, `absolute_year`),
  ADD CONSTRAINT `teaches_ibfk_4` FOREIGN KEY (`course_id`) REFERENCES `course_offerings` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teaches_ibfk_5` FOREIGN KEY (`course_id`, `semester`, `year`) REFERENCES `course_offerings` (`course_id`, `semester`, `absolute_year`);

--
-- Constraints for table `thread`
--
ALTER TABLE `thread`
  ADD CONSTRAINT `thread_ibfk_1` FOREIGN KEY (`course_id`, `semester`, `year`) REFERENCES `course_offerings` (`course_id`, `semester`, `absolute_year`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `thread_ibfk_3` FOREIGN KEY (`course_id`) REFERENCES `course_offerings` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `thread_ibfk_4` FOREIGN KEY (`webmail_id`) REFERENCES `person` (`webmail_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
