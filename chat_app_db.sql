-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2017 at 10:30 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat_app_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` binary(16) NOT NULL,
  `message_order` bigint(20) UNSIGNED NOT NULL,
  `message_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sender_name` varchar(100) NOT NULL,
  `message_text` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `message_order`, `message_time`, `sender_name`, `message_text`) VALUES
(0x8a0e8067c85411e7857ea1fa0529bd3a, 1, '2017-11-13 03:27:54', 'MIE', 'Hello'),
(0x8e0348c0c85411e7857ea1fa0529bd3a, 2, '2017-11-13 03:28:01', 'GC', 'Hi'),
(0x905022d2c85411e7857ea1fa0529bd3a, 3, '2017-11-13 03:28:04', 'MF', 'Hey'),
(0x998e1f74c85411e7857ea1fa0529bd3a, 4, '2017-11-13 03:28:20', 'MIE', 'Sup'),
(0x9fe4d73bc85411e7857ea1fa0529bd3a, 5, '2017-11-13 03:28:31', 'GC', 'Something'),
(0xa2634b97c85411e7857ea1fa0529bd3a, 6, '2017-11-13 03:28:35', 'MF', 'Wew'),
(0xa5fb68dbc85411e7857ea1fa0529bd3a, 7, '2017-11-13 03:28:41', 'MIE', 'OK');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD UNIQUE KEY `message_order` (`message_order`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_order` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
