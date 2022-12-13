-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2021 at 07:50 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(256) NOT NULL,
  `last_name` varchar(256) DEFAULT NULL,
  `email` varchar(256) NOT NULL,
  `mobile` bigint(10) NOT NULL,
  `address` varchar(256) DEFAULT NULL,
  `pin` int(6) DEFAULT NULL,
  `state` varchar(256) DEFAULT NULL,
  `country` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `mobile`, `address`, `pin`, `state`, `country`) VALUES
(1, 'John', 'Peterson', 'pjohn87@email.com', 7833929300, 'Highway 71', 872210, 'Ohio', 'USA'),
(2, 'Peter', 'Parker', 'ppeter847@email.com', 5733890128, 'Lowstreet 4', 782203, '', 'Canada'),
(3, 'Amy', 'Schumer', 'samy56@email.com', 7899903314, '', NULL, 'Philadelpia', 'USA'),
(4, 'Hannah', '', 'pjohn87@email.com', 4788019384, 'Mountain 21', 782210, '', 'England'),
(5, 'Michael', 'Schultz', 'smichael99@email.com', 7899403322, 'Valley 345', 678866, 'Frankfurt', 'Germany'),
(6, 'Sandy', 'Ambers', 'asandy3383@email.com', 9879665554, '', 473301, '', ''),
(7, 'Betty', '', 'pjohn87@email.com', 9000023223, 'Green Grass 1', NULL, 'Maharashtra', 'India'),
(8, 'Richard', 'Hendricks', 'hrichards88@email.com', 7811324456, 'Sky st 331', 388393, 'California', 'USA'),
(9, 'Susan', '', 'rsusan43@email.com', 7899664930, 'One way 98', NULL, '', 'Scotland'),
(10, 'Vicky', 'Singh', 'svicky998@email.com', 7988392200, 'Yellow Garden 2', 993939, 'Uttar Pradesh', 'India'),
(11, 'Ben', 'Mathews', 'mben777@email.com', 9876503340, 'Park Lane 38', 399393, '', 'Australia'),
(12, 'William', 'Shakespeare', 'williams8883@email.com', 9811234320, 'Central st 954', 210033, 'Atlanta', ''),
(13, 'Chuck', 'Loore', 'lchuck993@email.com', 9822304055, '', 310443, '', 'Ireland'),
(14, 'Viola', '', 'dviola667@email.com', 7822102239, 'Sideway 1633', NULL, 'Goa', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

CREATE TABLE `user_log` (
  `sno` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_log`
--

INSERT INTO `user_log` (`sno`, `email`, `password`) VALUES
(1, 'shwetagaur4698@gmail.com', 'tree'),
(2, 'nidhishahG2929@gmail.com', 'encryptEd'),
(3, 'jeevitv@gmail.com', 'DecryptED'),
(5, 'abcd1234@email.com', 'abcd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_log`
--
ALTER TABLE `user_log`
  ADD UNIQUE KEY `sno` (`sno`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_log`
--
ALTER TABLE `user_log`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
