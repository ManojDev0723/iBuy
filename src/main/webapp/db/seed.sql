-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2025 at 06:04 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iBuy`
--

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`) VALUES
(1, 1),
(2, 2);

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`cart_item_id`, `cart_id`, `product_id`, `quantity`) VALUES
(4, 1, 1, 2),
(5, 1, 2, 1),
(6, 2, 3, 3);

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `total_price`, `order_date`) VALUES
(1, 1, 1300.00, '2025-05-05 03:50:44'),
(2, 2, 400.00, '2025-05-05 03:50:44'),
(3, 4, 50.00, '2025-05-05 03:50:44'),
(4, 6, 1000.00, '2025-05-05 03:50:44'),
(5, 8, 600.00, '2025-05-05 03:50:44');

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(6, 1, 1, 1, 999.00),
(7, 2, 3, 1, 249.00),
(8, 3, 5, 1, 1599.00),
(9, 4, 4, 1, 129.00),
(10, 5, 2, 1, 1999.00);

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`, `price`, `stock`, `created_at`) VALUES
(1, 'iPhone 14 Pro', 'Apple iPhone 14 Pro with A16 Bionic chip and 128GB storage', 999.00, 100, '2025-05-05 03:42:12'),
(2, 'MacBook Pro 14\"', 'Apple MacBook Pro with M2 chip, 16GB RAM, 512GB SSD', 1999.00, 50, '2025-05-05 03:42:12'),
(3, 'AirPods Pro (2nd Gen)', 'Apple AirPods Pro with active noise cancellation', 249.00, 200, '2025-05-05 03:42:12'),
(4, 'Apple TV 4K', 'Apple TV 4K streaming device with Siri Remote', 129.00, 80, '2025-05-05 03:42:12'),
(5, 'Apple Studio Display', '27-inch 5K Retina display with P3 wide color', 1599.00, 40, '2025-05-05 03:42:12');

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'Sagar', 'Sagar@gmail.com', '123', 'ADMIN', '2025-05-05 02:23:25'),
(2, 'Manoj', 'Manoj@gmail.com', '456', 'ADMIN', '2025-05-05 02:37:32'),
(4, 'Sachet', 'Sachet@gmail.com', '789', 'STAFF', '2025-05-05 02:38:59'),
(6, 'Ritesh', 'Ritesh@gmail.com', '101', 'CUSTOMER', '2025-05-05 02:39:49'),
(8, 'Manish', 'Manish@gmail.com', '102', 'CUSTOMER', '2025-05-05 02:40:35');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
