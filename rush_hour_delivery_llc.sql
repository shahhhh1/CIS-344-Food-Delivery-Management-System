-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2025 at 02:10 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
CREATE DATABASE rush_hour_delivery_llc
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;
USE rush_hour_delivery_llc;
--
-- Database: `rush_hour_delivery_llc`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `email`, `phone`, `address`, `created_at`) VALUES
(1, 'Alice Johnson', 'alice@example.com', '555-0101', '123 Main St', '2025-11-01 17:33:09'),
(2, 'Bob Smith', 'bob@example.com', '555-0202', '456 Oak Ave', '2025-11-01 17:33:09'),
(3, 'John Quintel', 'jquintel@example.com', '909-4545', '52 Dexter Ave', NULL),
(4, 'Kobe Bryant', 'kbryant@example.com', '787-0033', 'Doran Blvd', NULL),
(5, 'Hidetaka Miyazaki', 'hmiyazaki@example.com', '343-1223', 'Evergreen St', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `delivery_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `driver_name` varchar(100) DEFAULT NULL,
  `driver_phone` varchar(20) DEFAULT NULL,
  `assigned_at` datetime DEFAULT NULL,
  `delivered_at` datetime DEFAULT NULL,
  `status` enum('unassigned','assigned','in_transit','delivered','failed') DEFAULT 'unassigned',
  `delivery_zone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`delivery_id`, `order_id`, `driver_name`, `driver_phone`, `assigned_at`, `delivered_at`, `status`, `delivery_zone`) VALUES
(1, 1, 'Carlos Rivera', '555-0303', NULL, NULL, 'assigned', 'Zone A'),
(2, 2, 'Cactus McCoy', '829-1414', NULL, NULL, 'assigned', 'Zone B'),
(3, 3, 'Tony Soprano', '333-1200', NULL, NULL, 'assigned', 'Zone C'),
(4, 4, 'Starscourge Radahn', '404-9999', NULL, NULL, 'assigned', 'Zone A'),
(5, 5, 'Dominic Toretto', '121-4590', NULL, NULL, 'assigned', 'Zone B');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `menu_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `item_name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  `availability` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`menu_id`, `restaurant_id`, `item_name`, `description`, `price`, `availability`, `created_at`) VALUES
(1, 1, 'Cinnamon Roll', 'Warm cinnamon roll with cream cheese icing', 3.50, 1, '2025-11-11 20:07:15'),
(2, 1, 'Cookies (2 pcs)', 'Fresh baked cookies (choc chip)', 2.00, 1, '2025-11-11 20:07:15'),
(3, 2, 'Margherita Pizza (Small)', 'Tomato, fresh mozzarella, basil', 9.99, 1, '2025-11-11 20:07:15'),
(4, 2, 'Pepperoni Pizza (Small)', 'Classic pepperoni and cheese', 11.49, 1, '2025-11-11 20:07:15'),
(5, 3, 'Tonkotsu Ramen', 'Creamy pork broth, noodles, chashu, egg', 12.99, 1, '2025-11-11 20:07:15'),
(6, 3, 'Shoyu Ramen', 'Soy-based broth with noodles and green onion', 11.49, 1, '2025-11-11 20:07:15'),
(7, 4, 'Crabby Patty', 'Signature burger with crispy patty and secret sauce', 5.99, 1, '2025-11-11 20:07:15'),
(8, 4, 'Sea Fries', 'Seasoned fries with sea salt', 3.49, 1, '2025-11-11 20:07:15');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('placed','preparing','out_for_delivery','delivered','cancelled') DEFAULT 'placed',
  `delivery_zone` varchar(100) DEFAULT NULL,
  `payment_status` enum('pending','paid','failed') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `restaurant_id`, `order_date`, `total_amount`, `status`, `delivery_zone`, `payment_status`) VALUES
(1, 1, 4, '2025-11-11 20:07:29', 5.99, 'placed', 'Zone A', 'paid'),
(2, 2, 2, '2025-11-11 20:07:29', 11.49, 'placed', 'Zone B', 'paid'),
(3, 3, 3, '2025-11-11 20:07:29', 12.99, 'preparing', 'Zone C', 'paid'),
(4, 4, 2, '2025-11-11 20:07:29', 9.99, 'delivered', 'Zone A', 'paid'),
(5, 5, 1, '2025-11-11 20:07:29', 5.50, 'placed', 'Zone B', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `detail_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `unit_price` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`detail_id`, `order_id`, `menu_id`, `quantity`, `unit_price`) VALUES
(1, 1, 7, 1, 5.99),
(2, 2, 4, 1, 11.49),
(3, 3, 5, 1, 12.99),
(4, 4, 3, 1, 9.99),
(5, 5, 1, 1, 3.50),
(6, 5, 2, 1, 2.00);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `bank_card` varchar(50) NOT NULL,
  `expiration_date` date NOT NULL,
  `security_code` char(3) NOT NULL,
  `payment_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `order_id`, `bank_card`, `expiration_date`, `security_code`, `payment_date`) VALUES
(1, 1, 'Visa', '2028-06-30', '123', '2025-11-11 20:09:53'),
(2, 2, 'Mastercard', '2029-12-31', '456', '2025-11-11 20:09:53');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `restaurant_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `cuisine_type` varchar(100) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`restaurant_id`, `name`, `cuisine_type`, `location`, `rating`, `created_at`) VALUES
(1, 'Kiki\'s Bakery', 'Bakery', 'Downtown', 4.7, '2025-11-11 20:07:08'),
(2, 'Luigi\'s Pizzeria', 'Italian', 'Uptown', 4.5, '2025-11-11 20:07:08'),
(3, 'Ichiraku Ramen', 'Japanese', 'Midtown', 4.8, '2025-11-11 20:07:08'),
(4, 'Crusty Crabs', 'Seafood', 'Beachside', 4.6, '2025-11-11 20:07:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `fk_deliveries_order` (`order_id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`menu_id`),
  ADD KEY `fk_menu_rest` (`restaurant_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_orders_customer` (`customer_id`),
  ADD KEY `fk_orders_rest` (`restaurant_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `fk_details_order` (`order_id`),
  ADD KEY `fk_details_menu` (`menu_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `fk_payment_order` (`order_id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`restaurant_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `restaurant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `fk_deliveries_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `fk_menu_rest` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `fk_orders_rest` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `fk_details_menu` FOREIGN KEY (`menu_id`) REFERENCES `menu_items` (`menu_id`),
  ADD CONSTRAINT `fk_details_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_payment_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
