-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2023 at 03:48 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `weather_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `weather_data`
--

CREATE TABLE `weather_data` (
  `id` int(11) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `weatherCondition` varchar(255) DEFAULT NULL,
  `weatherIcon` varchar(255) DEFAULT NULL,
  `temperature` float DEFAULT NULL,
  `pressure` float DEFAULT NULL,
  `windSpeed` float DEFAULT NULL,
  `humidity` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `weather_data`
--

INSERT INTO `weather_data` (`id`, `city`, `country`, `date`, `weatherCondition`, `weatherIcon`, `temperature`, `pressure`, `windSpeed`, `humidity`) VALUES
(1, 'Birendranagar', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 22.54, 1004, 2.05, 99),
(2, 'Birendranagar', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 22.54, 1004, 2.05, 99),
(3, 'Kathmandu', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 19.91, 1011, 0, 92),
(4, 'Pokhara', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 21.88, 1007, 1.1, 100),
(5, 'Bhaktapur', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 20.08, 1013, 0, 94),
(6, 'Birendranagar', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 22.38, 1005, 1.76, 99),
(7, 'Birendranagar', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 22.38, 1005, 1.76, 99),
(8, 'Birendranagar', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 22.38, 1005, 1.76, 99),
(9, 'Birendranagar', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 22.38, 1005, 1.76, 99),
(10, 'Kathmandu', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 19.91, 1011, 0, 92),
(11, 'Kathmandu', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 19.91, 1011, 0, 92),
(12, 'Kathmandu', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 19.91, 1011, 0, 92),
(13, 'Pokhara', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 21.88, 1007, 1.1, 100),
(14, 'Birendranagar', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 22.38, 1005, 1.76, 99),
(15, 'Birendranagar', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 22.38, 1005, 1.76, 99),
(16, 'Birendranagar', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 22.38, 1005, 1.76, 99),
(17, 'Birendranagar', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 22.38, 1005, 1.76, 99),
(18, 'Birendranagar', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 22.29, 1006, 1.43, 99),
(19, 'Birendranagar', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 22.29, 1006, 1.43, 99),
(20, 'Birendranagar', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 22.29, 1006, 1.43, 99),
(21, 'Birendranagar', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 22.29, 1006, 1.43, 99),
(22, 'Birendranagar', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 22.29, 1006, 1.43, 99),
(23, 'Birendranagar', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 22.29, 1006, 1.43, 99),
(24, 'Birendranagar', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 22.29, 1006, 1.43, 99),
(25, 'Birendranagar', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 22.29, 1006, 1.43, 99),
(26, 'Birendranagar', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 22.29, 1006, 1.43, 99),
(27, 'Birendranagar', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 22.29, 1006, 1.43, 99),
(28, 'Birendranagar', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 22.29, 1006, 1.43, 99),
(29, 'Kathmandu', 'NP', '2023-08-13 00:00:00', 'drizzle', '09n', 19.91, 1012, 1.03, 92),
(30, 'Birendranagar', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 22.29, 1006, 1.43, 99),
(31, 'Birendranagar', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 22.29, 1006, 1.43, 99),
(32, 'Birendranagar', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 22.29, 1006, 1.43, 99),
(33, 'Birendranagar', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 22.29, 1006, 1.43, 99),
(34, 'Kathmandu', 'NP', '2023-08-13 00:00:00', 'drizzle', '09n', 19.91, 1012, 1.03, 92),
(35, 'Bhaktapur', 'NP', '2023-08-13 00:00:00', 'drizzle', '09n', 20.08, 1013, 1.03, 94),
(36, 'Pokhara', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 21.88, 1008, 0.96, 100),
(37, 'Bharatpur', 'IN', '2023-08-13 00:00:00', 'overcast clouds', '04n', 31.04, 1001, 4.47, 59),
(38, 'Lamjung', 'NP', '2023-08-13 00:00:00', 'overcast clouds', '04n', 18.02, 1009, 1.83, 100);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `weather_data`
--
ALTER TABLE `weather_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `weather_data`
--
ALTER TABLE `weather_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
