-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2024 at 10:03 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alm`
--

-- --------------------------------------------------------

--
-- Table structure for table `achievements`
--

CREATE TABLE `achievements` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `email` varchar(50) NOT NULL,
  `achievement` varchar(100) NOT NULL,
  `description` varchar(400) NOT NULL,
  `file_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `achievements`
--

INSERT INTO `achievements` (`id`, `name`, `email`, `achievement`, `description`, `file_name`) VALUES
(1, 'Sowmiya S', 'sowmiyaselvam01@gmail.com', 'Best Budding Unicorn of the Year 2021', 'Company XTECH had won the Award of Best Budding Unicorn of the year 2021.', 'xtech.pdf'),
(2, 'David Miller', 'davidmiller@gmail.com', 'Doctorate in Chemical Engineering', 'Completed Doctorate in Chemical Engineering from ARTAS university', 'davidmiller.pdf'),
(3, 'Helen', 'helen@yahoo.in', 'Budding Entrepreneur Award', 'Had won the Budding Entrepreneur Award of the year 2021', 'helen.pdf'),
(4, 'Ram Kumar R', 'ramit@gmail.com', 'Best Graphic Design', 'One of my project had won the 2022 Best Graphic Activity award.', 'ramkumar_certificate.pdf'),
(5, 'Maliya', 'maliya06@gmail.com', 'Masters in Communication Arts', 'Completed Masters degree in Communication Arts', 'maliyacertificate.pdf'),
(6, 'Marceline Anderson', 'manderson@yahoo.in', 'Best Software Developer 2021', 'Had won the award for Best Software Developer of 2021', 'marceline.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `adminlogin`
--

CREATE TABLE `adminlogin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminlogin`
--

INSERT INTO `adminlogin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin@aust123'),
(2, 'admin2', 'admin@aust');

-- --------------------------------------------------------

--
-- Table structure for table `alumnilogin`
--

CREATE TABLE `alumnilogin` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `email` varchar(50) NOT NULL,
  `department` varchar(20) NOT NULL,
  `batch` varchar(15) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alumnilogin`
--

INSERT INTO `alumnilogin` (`id`, `name`, `email`, `department`, `batch`, `password`) VALUES
(1, 'Rohan', 'rohan@gmail.com', 'CSE', '2019-2023', '123qwerty'),
(2, 'Riaz', 'riaz@gmail.com', 'CSE', '2014-2018', 'qwerty123'),
(3, 'Fahim', 'fahim@yahoo.in', 'CSE', '2010-2014', 'qwerty123'),
(4, 'Tanim', 'tanim@gmail.com', 'CSE', '2009-2011', '123qwerty');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `eventname` varchar(100) NOT NULL,
  `organizer` varchar(60) NOT NULL,
  `description` varchar(300) NOT NULL,
  `fromdate` date NOT NULL,
  `todate` date NOT NULL,
  `file_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `eventname`, `organizer`, `description`, `fromdate`, `todate`, `file_name`) VALUES
(1, 'Alumni Meet', 'Department of CSE', 'An online alumni meet for the alumni\'s of Department of CSE of the Batch 2010-2014.', '2022-05-05', '2022-05-05', 'alumnimeet.jpg'),
(2, 'Caravan- Down the Memory Lane', 'Department of CSE', 'This is an online event where one of our alumni CEO of AR International Mr. Abrar recalls his college days.', '2022-04-30', '2022-04-30', 'caravan.jpg'),
(3, 'Alumni Day 2022', 'All Departments', 'Alumni Day 2022 is a offline alumni meet inside the campus for all the alumni of our institution. All the alumni\'s are requested to attend the event.', '2022-05-29', '2022-05-29', 'alumniday.jpg'),
(4, 'The Journey of an Entrepreneur', 'Entrepreneur Development Club', 'This a online webminar by the EDC club of AUST in which our alumni Miss. Helen will share her journey.', '2022-06-04', '2022-06-04', 'journey.jpg'),
(5, 'Mentor-Mentee Connect', 'Department of EEE', 'This is an offline event conducted for the alumni and students of EEE department.', '2022-07-20', '2022-07-20', 'mentormenteeconnect.jpg'),
(6, 'Meetup', 'Alumni Council', 'A small meetup for the alumni in and around Dhaka', '2022-08-20', '2022-08-20', 'meetupdhaka.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `uploaded_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mentorrequests`
--

CREATE TABLE `mentorrequests` (
  `id` int(11) NOT NULL,
  `eventname` varchar(100) NOT NULL,
  `organizer` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `description` varchar(300) NOT NULL,
  `fromdate` date NOT NULL,
  `todate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mentorrequests`
--

INSERT INTO `mentorrequests` (`id`, `eventname`, `organizer`, `email`, `description`, `fromdate`, `todate`) VALUES
(1, 'BUGISTA', 'Rasel', 'rasel@yahoo.in', 'BUGISTA is conducted for the students of the School of Computing. This is an online debugging event.', '2022-05-19', '2022-05-19'),
(2, 'Resume Review Session', 'Debolina', 'debolina@yahoo.in', 'Small resume review session for the students of Department of Architecture', '2022-06-10', '2022-06-11'),
(3, 'How to start investing', 'Ishan', 'ishan@yahoo.in', 'An online webminar for the students on how to start investing at young age', '2022-07-13', '2022-07-13'),
(7, 'ME Webminar', 'Rayan', 'rayan@gmail.com', 'An online webminar for the students of the Department of ME', '2022-05-20', '2022-05-20');

-- --------------------------------------------------------

--
-- Table structure for table `postedjobs`
--

CREATE TABLE `postedjobs` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `companyname` varchar(60) NOT NULL,
  `job` varchar(90) NOT NULL,
  `jobdescription` varchar(400) NOT NULL,
  `salary` varchar(40) NOT NULL,
  `skills` varchar(100) NOT NULL,
  `timeposted` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `postedjobs`
--

INSERT INTO `postedjobs` (`id`, `email`, `companyname`, `job`, `jobdescription`, `salary`, `skills`, `timeposted`) VALUES
(1, 'sowmiyaselvam01@gmail.com', 'XTECH', 'Software Developer', 'Requirement for the position of Software Developer . Expecting candidates with good knowledge in DSA. Three Rounds; 1. Aptitude round 2. Coding round 3. HR interview', '9 LPA', 'Python/ Java/ C++, Good knowledge in database', '2022-04-07 10:13:53'),
(2, 'rohitvzozo@yahoo.in', 'ZOZO', 'Full Stack Developer', 'This position requires a developer with good knowledge in both frontend and backend', '10 LPA', 'Strong knowledge in frontend and backend.', '2022-04-07 11:24:32'),
(3, 'tarun@yahoo.in', 'HOL', 'Database Adminstrator', 'Needed individuals who have deep knowledge in Databases.', '6 LPA', 'Database', '2022-04-07 13:04:23'),
(4, 'kalyaniprakash@gmail.com', 'ZenO', 'Data Analyst', 'Three Rounds:\r\n1. Online test\r\n2. TR interview\r\n3. HR interview', '10 LPA', 'Deep knowledge in database and related current technologies', '2022-04-07 15:52:32'),
(5, 'martha@yahoo.in', 'XD Techologies', 'Frontend Developer', 'Expecting individuals with good knowledge and in-hand experience in Frontend Development.', '8 LPA', 'Frontend skills', '2022-04-07 22:56:06'),
(6, 'sowmiyaselvam01@gmail.com', 'TSA', 'Python Developer', 'Three rounds: 1.Aptitude 2.Coding 3.HR interview', '8 LPA', 'Python, DSA, database', '2022-04-08 10:44:00');

-- --------------------------------------------------------

--
-- Table structure for table `queries`
--

CREATE TABLE `queries` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `email` varchar(50) NOT NULL,
  `query` varchar(500) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `queries`
--

INSERT INTO `queries` (`id`, `name`, `email`, `query`, `time`) VALUES
(1, 'Swathi R', 'swathiraja@gmail.com', 'Request for campus visit on 10-06-2022.', '2022-04-07 10:25:16'),
(2, 'Reshma Andrea', 'resh12@gmail.com', 'Request for getting academic transcripts. Details: Name: Reshma Andrea Batch: 2012-2016 Dept: ECE', '2022-04-07 13:02:57'),
(3, 'Jonas', 'jonas@gmail.com', 'Request to visit the campus on 23rd july 2022.', '2022-04-08 00:22:28'),
(10, 'Sowmiya S', 'sowmiyaselvam01@gmail.com', 'Request to visit the campus on June 1st 2022.', '2022-04-08 10:42:43'),
(11, 'Sowmiya S', 'sowmiyaselvam01@gmail.com', 'Request for campus visit on july 12th 2022.', '2022-04-09 23:06:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminlogin`
--
ALTER TABLE `adminlogin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alumnilogin`
--
ALTER TABLE `alumnilogin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mentorrequests`
--
ALTER TABLE `mentorrequests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `postedjobs`
--
ALTER TABLE `postedjobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `queries`
--
ALTER TABLE `queries`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `achievements`
--
ALTER TABLE `achievements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `adminlogin`
--
ALTER TABLE `adminlogin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `alumnilogin`
--
ALTER TABLE `alumnilogin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mentorrequests`
--
ALTER TABLE `mentorrequests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `postedjobs`
--
ALTER TABLE `postedjobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `queries`
--
ALTER TABLE `queries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
