-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2024 at 02:46 PM
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
-- Database: `fp_web`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_purchase`
--

CREATE TABLE `detail_purchase` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `item_id` int(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` bigint(20) NOT NULL,
  `total_price` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_purchase`
--

INSERT INTO `detail_purchase` (`id`, `purchase_id`, `item_id`, `quantity`, `price`, `total_price`) VALUES
(11, 5, 1, 3, 20000, 60000),
(12, 6, 1, 2, 20000, 40000),
(13, 7, 1, 2, 20000, 40000);

-- --------------------------------------------------------

--
-- Table structure for table `detail_sale`
--

CREATE TABLE `detail_sale` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `item_id` int(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` bigint(20) NOT NULL,
  `total_price` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_sale`
--

INSERT INTO `detail_sale` (`id`, `sale_id`, `item_id`, `quantity`, `price`, `total_price`) VALUES
(24, 12, 3, 3, 1400000, 4200000),
(25, 12, 1, 3, 20000, 60000),
(26, 13, 1, 1, 20000, 20000),
(27, 13, 3, 2, 1400000, 2800000),
(28, 14, 1, 2, 20000, 40000),
(29, 14, 3, 2, 1400000, 2800000),
(30, 15, 1, 4, 20000, 80000),
(31, 15, 3, 2, 1400000, 2800000),
(32, 16, 1, 3, 20000, 60000),
(33, 16, 3, 4, 1400000, 5600000);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` bigint(20) NOT NULL,
  `stock` int(11) NOT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `name`, `price`, `stock`, `category`) VALUES
(1, 'Everyset', 20000, 396, 'Shoes Adidas'),
(3, 'Ultraboost 5x', 1400000, -3, 'Shoes');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `id` int(11) NOT NULL,
  `tgl_purchase` date NOT NULL,
  `supplier_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`id`, `tgl_purchase`, `supplier_id`) VALUES
(5, '2024-11-04', 2),
(6, '2024-11-04', 2),
(7, '2024-11-04', 3);

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `id` int(11) NOT NULL,
  `tgl_sale` date NOT NULL,
  `customer_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`id`, `tgl_sale`, `customer_name`) VALUES
(12, '2024-11-04', 'Juma'),
(13, '2024-11-04', 'Abi'),
(14, '2024-11-04', 'Firdiansyah'),
(15, '2024-11-04', 'Putra'),
(16, '2024-11-04', 'Adam');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `name`, `email`, `contact`, `address`) VALUES
(2, 'Didit', 'didit@gmail.com', '34234324', 'Tulungagung'),
(3, 'Zuma', 'zuma@gmail.com', '231321', 'dadas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_purchase`
--
ALTER TABLE `detail_purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `fk_item_purchase` (`item_id`);

--
-- Indexes for table `detail_sale`
--
ALTER TABLE `detail_sale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `fk_item_sale` (`item_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_purchase`
--
ALTER TABLE `detail_purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `detail_sale`
--
ALTER TABLE `detail_sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_purchase`
--
ALTER TABLE `detail_purchase`
  ADD CONSTRAINT `fk_item_purchase` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `detail_sale`
--
ALTER TABLE `detail_sale`
  ADD CONSTRAINT `fk_item_sale` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
