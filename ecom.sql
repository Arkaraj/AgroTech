-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 16, 2020 at 07:51 AM
-- Server version: 8.0.19
-- PHP Version: 7.1.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_users`
--

-- Removed the users
INSERT INTO `admin_users` (`id`, `username`, `password`, `role`, `email`, `mobile`, `status`) VALUES
(1, '', '', 0, '', '', 1),
(2, '', '', 1, '', '1234567890', 1),
(3, '', '', 1, '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `categories` varchar(255) NOT NULL,
  `status` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories`, `status`) VALUES
(1, 'Fruits', 1),
(2, 'Vegetable', 1),
(3, 'Grains', 1),
(4, 'Nuts', 1),
(5, 'Organic', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(75) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `comment` text NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `comment`, `added_on`) VALUES
(1, 'Arkaraj', 'arkaraj@test.com', '1234567890', 'Testing DataBase', '2020-09-14 00:00:00'),
(2, 'TestBot', 'Test@Bot.com', '1234567890', 'testing', '2020-01-20 07:59:38'),
(5, 'Arkaraj', 'arkaraj@test.com', '7395847373', 'This is for testing purpose', '2020-10-22 09:44:47');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_master`
--

CREATE TABLE `coupon_master` (
  `id` int NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `coupon_value` int NOT NULL,
  `coupon_type` varchar(10) NOT NULL,
  `cart_min_value` int NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupon_master`
--

INSERT INTO `coupon_master` (`id`, `coupon_code`, `coupon_value`, `coupon_type`, `cart_min_value`, `status`) VALUES
(1, 'First50', 1000, 'Rupee', 1500, 1),
(2, 'First60', 20, 'Percentage', 1000, 1),
(3, 'Agro123', 500, 'Rupee', 1000, 1),
(5, 'XYZ40', 2000, 'Rupee', 4000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pincode` int NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `total_price` float NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `order_status` int NOT NULL,
  `length` float NOT NULL,
  `breadth` float NOT NULL,
  `height` float NOT NULL,
  `weight` float NOT NULL,
  `txnid` varchar(20) NOT NULL,
  `mihpayid` varchar(20) NOT NULL,
  `ship_order_id` int NOT NULL,
  `ship_shipment_id` int NOT NULL,
  `payu_status` varchar(10) NOT NULL,
  `coupon_id` int NOT NULL,
  `coupon_value` varchar(50) NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `address`, `city`, `pincode`, `payment_type`, `total_price`, `payment_status`, `order_status`, `length`, `breadth`, `height`, `weight`, `txnid`, `mihpayid`, `ship_order_id`, `ship_shipment_id`, `payu_status`, `coupon_id`, `coupon_value`, `coupon_code`, `added_on`) VALUES
(1, 1, 'delhi', 'delhi', 110076, 'COD', 110, 'pending', 1, 0, 0, 0, 0, 'a0a7dfccb449d8fef1fc', '', 0, 0, '', 0, '', '', '2020-05-29 09:55:15'),
(2, 1, 'Delhi', 'Delhi', 110076, 'COD', 250, 'pending', 1, 0, 0, 0, 0, '2f51ccbc668e912fa9c2', '', 0, 0, '', 0, '', '', '2020-05-29 09:59:03'),
(3, 3, 'Vellore', 'Vellore', 632014, 'COD', 2677, 'pending', 1, 0, 0, 0, 0, '2f51ccbc668e912fa9c2', '', 0, 0, '', 0, '', '', '2020-05-29 09:59:03');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `qty` int NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `qty`, `price`) VALUES
(1, 1, 12, 1, 100),
(2, 1, 10, 1, 10),
(3, 2, 13, 1, 150),
(4, 2, 12, 1, 100),
(5, 0, 45, 1, 150),
(6, 0, 21, 5, 70),
(7, 0, 5, 1, 2399),
(8, 0, 29, 1, 35),
(9, 0, 20, 1, 125),
(10, 0, 29, 1, 35),
(11, 0, 18, 1, 50),
(12, 0, 17, 1, 45),
(13, 0, 13, 1, 130),
(14, 0, 1, 1, 44),
(15, 0, 29, 2, 35),
(16, 0, 28, 1, 180),
(17, 0, 26, 1, 150),
(18, 0, 6, 1, 1500),
(19, 0, 22, 1, 75),
(20, 0, 18, 1, 50),
(21, 0, 17, 1, 45),
(22, 0, 5, 1, 2399),
(23, 0, 18, 4, 50),
(24, 0, 17, 1, 45),
(25, 0, 20, 1, 125),
(26, 0, 22, 1, 75),
(27, 0, 1, 3, 44),
(28, 0, 45, 1, 150),
(29, 0, 46, 1, 330),
(30, 0, 45, 1, 150),
(31, 0, 18, 3, 50),
(32, 0, 17, 1, 45),
(33, 0, 1, 1, 44),
(34, 0, 1, 3, 44),
(35, 0, 46, 4, 330),
(36, 0, 11, 1, 150),
(37, 0, 29, 1, 35),
(38, 0, 28, 2, 180),
(39, 0, 27, 1, 170),
(40, 0, 23, 1, 45),
(41, 0, 22, 1, 75),
(42, 0, 1, 1, 44),
(43, 0, 1, 1, 44),
(44, 0, 1, 3, 44),
(45, 0, 45, 1, 150),
(46, 0, 13, 1, 130),
(47, 0, 3, 1, 115900),
(48, 0, 12, 1, 50),
(49, 0, 20, 1, 125),
(50, 0, 33, 1, 100),
(51, 0, 29, 1, 35),
(52, 0, 28, 1, 180),
(53, 0, 17, 1, 45),
(54, 0, 38, 1, 550),
(55, 0, 4, 1, 25),
(56, 0, 5, 1, 2399),
(57, 0, 36, 1, 160),
(58, 0, 42, 1, 350),
(59, 0, 29, 1, 35),
(60, 3, 1, 1, 44),
(61, 3, 45, 2, 150),
(62, 3, 45, 1, 150),
(63, 3, 38, 1, 550),
(64, 3, 42, 1, 350),
(65, 3, 1, 1, 44),
(66, 3, 2, 1, 35),
(67, 3, 6, 1, 1500),
(68, 3, 11, 1, 150),
(69, 3, 17, 1, 45),
(70, 3, 18, 1, 50),
(71, 3, 25, 1, 35),
(72, 3, 22, 1, 75),
(73, 3, 23, 1, 45),
(74, 3, 20, 1, 125),
(75, 3, 12, 1, 50);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipped'),
(4, 'Canceled'),
(5, 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `categories_id` int NOT NULL,
  `sub_categories_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `mrp` float NOT NULL,
  `price` float NOT NULL,
  `qty` int NOT NULL,
  `image` varchar(255) NOT NULL,
  `short_desc` varchar(2000) NOT NULL,
  `description` text NOT NULL,
  `best_seller` int NOT NULL,
  `meta_title` varchar(2000) NOT NULL,
  `meta_desc` varchar(2000) NOT NULL,
  `meta_keyword` varchar(2000) NOT NULL,
  `added_by` int NOT NULL,
  `status` tinyint NOT NULL,
  `Rating` int NOT NULL
) ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `categories_id`, `sub_categories_id`, `name`, `mrp`, `price`, `qty`, `image`, `short_desc`, `description`, `best_seller`, `meta_title`, `meta_desc`, `meta_keyword`, `added_by`, `status`, `Rating`) VALUES
(1, 1, 1, 'Fresh Organic Simla Apple Fruit 4 Pieces', 9999, 44, 10, 'apples.jpg', '100% Wax Free, Pack contains 4 pieces\nGood source of Vitamin C, Dietary Fiber, Flavonoids and antioxidants', 'Shimla apples are commonly grown apples in India. They are one of the healthiest fruit. They are good source of vitamin c, dietary fiber, flavonoids and antioxidants. Store them in a cool dry place away from direct sunlight. They can eaten as a fresh or used in fruit chat, salads, smoothies, pies etc.', 1, 'apple', '', 'apple', 0, 1, 5),
(2, 1, 1, 'Pears', 165800, 35, 4, 'pears.jpg', 'Aenean tempus ut leo nec laoreet. Vestibulum ut est neque.', 'Curabitur eget augue dolor. Curabitur id dapibus massa. Vestibulum at enim quis metus ultrices posuere vitae sit amet eros. Morbi et libero pellentesque, efficitur odio nec, congue lorem. Vestibulum faucibus, risus eget pretium efficitur, neque nulla eleifend purus, non venenatis lorem ligula vel nulla. Fusce finibus efficitur sapien vitae laoreet. Integer imperdiet justo sed tellus dictum, at egestas arcu finibus. Fusce et augue elit. Praesent tincidunt purus in purus dictum volutpat. Aenean tempus ut leo nec laoreet. Vestibulum ut est neque.', 0, 'Pears', '', 'Pears', 0, 1, 4),
(3, 1, 1, 'Cherries', 115900, 40, 5, 'cherries.jpg', 'Nullam purus lorem, tincidunt vitae tristique non, imperdiet ut urna.', 'Nullam a nunc et lorem ornare faucibus. Etiam tortor lacus, auctor eget enim at, tincidunt dignissim magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin tincidunt eros eget felis tempor, id volutpat ipsum lacinia. Donec scelerisque risus non purus scelerisque tristique. Mauris enim ligula, condimentum sed iaculis nec, porttitor eu nunc. Sed hendrerit vel arcu vitae iaculis. Phasellus vehicula molestie leo. Nullam purus lorem, tincidunt vitae tristique non, imperdiet ut urna.', 0, 'Pears', 'Pears', 'Pears', 0, 1, 4),
(4, 1, 2, 'Bananas', 1999, 25, 3, 'bananas.jpg', 'per inceptos himenaeos. Ut commodo ullamcorper quam non pulvinar.', 'Duis a felis congue, feugiat est non, suscipit quam. In elit lacus, auctor sed lacus eget, egestas consectetur leo. Duis pellentesque pharetra ante, ac ornare nibh faucibus id. Integer pulvinar malesuada nisl. Nulla vel orci nunc. Nullam a tellus eu ex ullamcorper mollis. Donec commodo ligula a accumsan fermentum. Mauris sed orci lacinia, posuere leo molestie, pretium mi. Cras sodales, neque id cursus fermentum, mi purus vehicula sem, vel laoreet lorem justo id tortor. Sed ut urna ut ipsum vestibulum commodo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut commodo ullamcorper quam non pulvinar.', 1, 'bananas', 'bananas', 'bananas', 0, 1, 4),
(5, 1, 2, 'Mangoes', 2799, 2399, 8, 'mangoes.jpg', 'a nisl pharetra orci, at condimentum nisl lorem elementum ipsum.', 'Nunc auctor turpis ante, eget bibendum mi mollis in. Aliquam quis neque ut libero malesuada auctor. Aliquam interdum enim at commodo gravida. Donec nisl sem, molestie ut quam quis, vulputate venenatis ipsum. Aenean quis ex ut magna accumsan fringilla. Quisque id ex massa. Sed libero ante, fringilla ac condimentum in, porttitor ac risus. Integer mattis odio nec nunc semper imperdiet. In porttitor tellus eget sapien vulputate, eu euismod lacus aliquet. Maecenas molestie elit augue, sit amet fringilla dolor congue et. Nunc eu libero auctor, sollicitudin lectus quis, porta ligula. In vel ullamcorper risus. Nullam viverra, mi sit amet laoreet luctus, urna nisl pharetra orci, at condimentum nisl lorem elementum ipsum.', 1, 'mangoes', 'mangoes', 'Fresh Indian mangoes', 0, 1, 4),
(6, 1, 3, 'Oranges', 1999, 1500, 10, 'oranges.jpg', 'lacus quis urna tristique suscipit. Praesent vitae mi mollis dui facilisis convallis eu faucibus augue.', 'Duis in risus quis lectus dictum fringilla. Aenean tempor pellentesque velit id ullamcorper. Ut id aliquam odio. Morbi id pharetra libero, ut tempor nisi. Maecenas a lectus nec risus maximus rutrum. Mauris vel elit ut magna semper laoreet nec sed magna. Quisque eleifend vel sem non malesuada. Interdum et malesuada fames ac ante ipsum primis in faucibus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum eget posuere orci, eu ultrices sapien. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam sit amet ex dictum nisl bibendum elementum non in turpis. In bibendum ipsum nunc, bibendum lacinia lacus maximus eu. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vivamus aliquam lacus quis urna tristique suscipit. Praesent vitae mi mollis dui facilisis convallis eu faucibus augue.', 1, 'Oranges', 'Oranges', 'Oranges', 0, 1, 4),
(7, 1, 3, 'Mausambi', 1900, 53, 20, 'mausambi.jpg', 'isl pharetra orci, at condimentum nisl lorem elementum ipsum.', 'Nunc auctor turpis ante, eget bibendum mi mollis in. Aliquam quis neque ut libero malesuada auctor. Aliquam interdum enim at commodo gravida. Donec nisl sem, molestie ut quam quis, vulputate venenatis ipsum. Aenean quis ex ut magna accumsan fringilla. Quisque id ex massa. Sed libero ante, fringilla ac condimentum in, porttitor ac risus. Integer mattis odio nec nunc semper imperdiet. In porttitor tellus eget sapien vulputate, eu euismod lacus aliquet. Maecenas molestie elit augue, sit amet fringilla dolor congue et. Nunc eu libero auctor, sollicitudin lectus quis, porta ligula. In vel ullamcorper risus. Nullam viverra, mi sit amet laoreet luctus, urna nisl pharetra orci, at condimentum nisl lorem elementum ipsum.', 0, 'mausambi', 'mausambi', 'mausambi', 0, 1, 3),
(8, 1, 4, 'Strawberry', 1120, 550, 10, 'strawberry.jpg', 'rius, lacus velit aliquam ex, in dignissim sem eros ac erat. Vestibulum ac arcu tortor.', 'Vestibulum in auctor turpis. Quisque hendrerit eget turpis et molestie. Phasellus nec nibh a lacus rhoncus eleifend. Donec suscipit id diam non mattis. Fusce eu luctus leo. Etiam eget dui libero. Etiam eros lorem, rhoncus et convallis eget, tempus vel tellus. Nam at diam quis nisl tincidunt aliquam. Quisque placerat magna non libero interdum varius vel id risus. Vivamus mollis maximus fermentum. Donec eget nulla dui. Sed ultricies malesuada metus, non feugiat purus fringilla ac. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer accumsan, tortor id eleifend varius, lacus velit aliquam ex, in dignissim sem eros ac erat. Vestibulum ac arcu tortor.', 0, 'strawberry', '', 'strawberry', 0, 1, 4),
(9, 1, 4, 'Kiwi', 650, 1560, 10, 'kiwi.jpg', 's mus. Vestibulum eget posuere orci, eu ultrices sapien. Orc', 'aximus rutrum. Mauris vel elit ut magna semper laoreet nec sed magna. Quisque eleifend vel sem non malesuada. Interdum et malesuada fames ac ante ipsum primis in faucibus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum eget posuere orci, eu ultrices sapien. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam sit amet ex d', 0, 'kiwi', '', 'kiwi', 0, 1, 3),
(10, 1, 4, 'Pomegranate', 100, 70, 50, 'pomegranate.jpg', 'test', 'test', 1, 'pomegranate', 'pomegranate', 'pomegranate', 0, 1, 2),
(11, 1, 5, 'Watermelon', 100, 150, 10, 'watermelon.jpg', 'Test', 'test', 1, 'watermelon', 'watermelon', 'watermelon', 0, 1, 5),
(12, 2, 6, 'Potatoes', 120, 50, 10, 'potatoes.jpg', 'Test desc', 'Test desc', 1, 'Potatoes', 'Potatoes', 'Potatoes', 2, 1, 5),
(13, 2, 6, 'Tomatoes', 200, 130, 10, 'tomatoes.jpg', 'Test desc', 'Test desc', 1, 'tomatoes', 'tomatoes', 'tomatoes', 2, 1, 4),
(14, 2, 6, 'Peas', 201, 30, 10, 'peas.jpg', 'Test desc', 'Test desc', 0, 'peas', 'peas', 'peas', 2, 1, 5),
(15, 2, 6, 'Brinjal', 202, 50, 10, 'brinjal.jpg', 'Test desc', 'Test desc', 0, 'brinjal', 'brinjal', 'brinjal', 2, 1, 2),
(16, 2, 6, 'Ladyfingers', 203, 50, 10, 'ladyfingers.jpg', 'Test desc', 'Test desc', 0, 'ladyfingers', 'ladyfingers', 'ladyfingers', 1, 1, 3),
(17, 2, 6, 'Carrots', 204, 45, 10, 'carrots.jpg', 'Test desc', 'Test desc', 1, 'carrots', 'carrots', 'carrots', 2, 1, 5),
(18, 2, 6, 'Onions', 205, 50, 10, 'onions.jpg', 'Test desc', 'Test desc', 1, 'onions', 'onions', 'onions', 2, 1, 4),
(19, 2, 6, 'Bottle gourd', 206, 150, 10, 'bottlegourd.jpg', 'Test desc', 'Test desc', 0, 'bottle gourd', 'bottle gourd', 'bottle gourd', 2, 1, 4),
(20, 2, 7, 'Lettuce', 206, 125, 10, 'lettuce.jpg', 'Test desc', 'Test desc', 0, 'lettuce', 'lettuce', 'lettuce', 2, 1, 3),
(21, 2, 7, 'Spinach', 207, 70, 10, 'spinach.jpg', 'Test desc', 'Test desc', 1, 'spinach', 'spinach', 'spinach', 2, 1, 4),
(22, 2, 8, 'Cauliflower', 200, 75, 10, 'cauliflower.jpg', 'Test desc', 'Test desc', 0, 'cauliflower', 'cauliflower', 'cauliflower', 2, 1, 4),
(23, 2, 8, 'Cabbage', 208, 45, 10, 'cabbage.jpg', 'Test desc', 'Test desc', 1, 'cabbage', 'cabbage', 'cabbage', 2, 1, 5),
(24, 2, 9, 'Pumpkin', 209, 60, 10, 'pumpkin.jpg', 'Test desc', 'Test desc', 0, 'pumpkin', 'pumpkin', 'pumpkin', 2, 1, 3),
(25, 2, 9, 'Cucumber', 210, 35, 10, 'cucumber.jpg', 'Test desc', 'Test desc', 0, 'cucumber', 'cucumber', 'cucumber', 2, 1, 3),
(26, 3, 10, 'Wheat(1 Kg)', 211, 150, 10, 'wheat.jpg', 'Test desc', 'Test desc', 1, 'wheat', 'wheat', 'wheat', 2, 1, 4),
(27, 3, 10, 'Oats', 212, 170, 10, 'oats.jpg', 'Test desc', 'Test desc', 0, 'oats', 'oats', 'oats', 2, 1, 4),
(28, 3, 10, 'RICE', 213, 180, 10, 'rice.jpg', 'Test desc', 'Test desc', 1, 'rice', 'rice', 'rice', 2, 1, 4),
(29, 3, 10, 'CORN', 214, 35, 10, 'corn.jpg', 'Test desc', 'Test desc', 1, 'corn', 'corn', 'corn', 2, 1, 4),
(30, 3, 10, 'BARLEY', 215, 150, 10, 'barley.jpg', 'Test desc', 'Test desc', 0, 'barley', 'barley', 'barley', 2, 1, 5),
(31, 3, 10, 'MILLET', 216, 330, 10, 'millet.jpg', 'Test desc', 'Test desc', 0, 'millet', 'millet', 'millet', 2, 1, 3),
(32, 3, 10, 'RYE', 217, 500, 10, 'rye.jpg', 'Test desc', 'Test desc', 0, 'rye', 'rye', 'rye', 2, 1, 3),
(33, 3, 10, 'Sorghum', 218, 100, 10, 'sorghum.jpg', 'Test desc', 'Test desc', 0, 'sorghum', 'sorghum', 'sorghum', 2, 1, 4),
(34, 3, 10, 'TRITICALE', 219, 150, 10, 'triticale.jpg', 'Test desc', 'Test desc', 0, 'triticale', 'triticale', 'triticale', 2, 1, 3),
(35, 3, 11, 'Buckwheat', 220, 300, 10, 'buckwheat.jpg', 'Test desc', 'Test desc', 0, 'buckwheat', 'buckwheat', 'buckwheat', 2, 1, 2),
(36, 4, 0, 'Peanuts', 221, 160, 10, 'peanuts.jpg', 'Test desc', 'Test desc', 1, 'peanuts', 'peanuts', 'peanuts', 2, 1, 4),
(37, 4, 0, 'Almonds (500g)', 222, 450, 10, 'almonds.jpg', 'Test desc', 'Test desc', 1, 'almonds', 'almonds', 'almonds', 1, 1, 4),
(38, 4, 0, 'Cashew Nuts', 223, 550, 10, 'cashew.jpg', 'Test desc', 'Test desc', 1, 'cashew', 'cashew', 'cashew', 1, 1, 5),
(39, 4, 0, 'Hazelnuts', 224, 420, 10, 'hazelnuts.jpg', 'Test desc', 'Test desc', 0, 'hazelnuts', 'hazelnuts', 'hazelnuts', 1, 1, 4),
(40, 4, 0, 'Pecans', 225, 330, 10, 'pecans.jpg', 'Test desc', 'Test desc', 0, 'pecans', 'pecans', 'pecans', 1, 1, 3),
(41, 4, 0, 'Pistachio Nuts', 226, 330, 10, 'pistachio.jpg', 'Test desc', 'Test desc', 1, 'pista', 'pista', 'pista', 1, 1, 4),
(42, 4, 0, 'Walnuts', 227, 350, 10, 'walnuts.jpg', 'Test desc', 'Test desc', 0, 'walnuts', 'walnuts', 'walnuts', 2, 1, 5),
(43, 4, 0, 'Pine Nuts', 228, 650, 10, 'pinenuts.jpg', 'Test desc', 'Test desc', 1, '', '', '', 2, 1, 3),
(44, 4, 0, 'Chestnuts', 229, 150, 10, 'chestnuts.jpg', 'Test desc', 'Test desc', 0, 'chestnuts', 'chestnuts', 'chestnuts', 0, 1, 4),
(45, 5, 12, 'Farm made Bread', 40, 150, 10, 'bread.jpg', 'Test desc', 'Test desc', 1, 'bread', 'bread', 'bread', 3, 1, 5),
(46, 5, 13, 'Home made Chocolate(500g)', 230, 330, 10, 'homechocolate.jpg', 'Test desc', 'Test desc', 1, 'chocolate', 'chocolate', 'chocolate', 3, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `shiprocket_token`
--

CREATE TABLE `shiprocket_token` (
  `id` int NOT NULL,
  `token` varchar(500) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shiprocket_token`
--

-- Removed for safety
INSERT INTO `shiprocket_token` (`id`, `token`) VALUES
(1, '');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int NOT NULL,
  `categories_id` int NOT NULL,
  `sub_categories` varchar(100) NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `categories_id`, `sub_categories`, `status`) VALUES
(0, 4, 'General', 1),
(1, 1, 'General', 1),
(2, 1, 'Tropic and Exotic', 1),
(3, 1, 'Citrus', 1),
(4, 1, 'Berries', 1),
(5, 1, 'Melons', 1),
(6, 2, 'General', 1),
(7, 2, 'Leafy Green', 1),
(8, 2, 'Cruciferous', 1),
(9, 2, 'Marrow', 1),
(10, 3, 'Cereals', 1),
(11, 3, 'Pseudo-Cereals', 1),
(12, 5, 'Bread', 1),
(13, 5, 'Chocolate', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

-- Removed for safety

INSERT INTO `users` (`id`, `name`, `password`, `email`, `mobile`, `added_on`) VALUES
(1, 'Arkaraj Ghosh', '', '', '7395847373', '2020-08-13 00:00:00'),
(2, '', 'AgroBot', '', '1234567890', '2020-09-14 00:00:00'),
(3, '', '', '', '1122334455', '2020-09-13 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_master`
--
ALTER TABLE `coupon_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shiprocket_token`
--
ALTER TABLE `shiprocket_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `coupon_master`
--
ALTER TABLE `coupon_master`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shiprocket_token`
--
ALTER TABLE `shiprocket_token`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
