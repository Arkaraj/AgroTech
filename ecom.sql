-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 30, 2020 at 12:37 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `role`, `email`, `mobile`, `status`) VALUES
(1, 'admin', 'admin', 0, '', '', 1),
(2, 'vishal', 'vishal', 1, 'vishal@gmail.com', '1234567890', 1),
(3, 'Arkaraj', 'Arkaraj', 1, 'arkaraj@test.com', '1234567890', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
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
  `id` int(11) NOT NULL,
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
(2, 'TestBot', 'Test@Bot.com', '1234567890', 'testing', '2020-01-20 07:59:38');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_master`
--

CREATE TABLE `coupon_master` (
  `id` int(11) NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `coupon_value` int(11) NOT NULL,
  `coupon_type` varchar(10) NOT NULL,
  `cart_min_value` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupon_master`
--

INSERT INTO `coupon_master` (`id`, `coupon_code`, `coupon_value`, `coupon_type`, `cart_min_value`, `status`) VALUES
(1, 'First50', 1000, 'Rupee', 1500, 1),
(2, 'First60', 20, 'Percentage', 1000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pincode` int(11) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `total_price` float NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `order_status` int(11) NOT NULL,
  `length` float NOT NULL,
  `breadth` float NOT NULL,
  `height` float NOT NULL,
  `weight` float NOT NULL,
  `txnid` varchar(20) NOT NULL,
  `mihpayid` varchar(20) NOT NULL,
  `ship_order_id` int(11) NOT NULL,
  `ship_shipment_id` int(11) NOT NULL,
  `payu_status` varchar(10) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `coupon_value` varchar(50) NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `address`, `city`, `pincode`, `payment_type`, `total_price`, `payment_status`, `order_status`, `length`, `breadth`, `height`, `weight`, `txnid`, `mihpayid`, `ship_order_id`, `ship_shipment_id`, `payu_status`, `coupon_id`, `coupon_value`, `coupon_code`, `added_on`) VALUES
(1, 1, 'delhi', 'delhi', 110076, 'COD', 110, 'pending', 1, 0, 0, 0, 0, 'a0a7dfccb449d8fef1fc', '', 0, 0, '', 0, '', '', '2020-05-29 09:55:15'),
(2, 1, 'Delhi', 'Delhi', 110076, 'COD', 250, 'pending', 1, 0, 0, 0, 0, '2f51ccbc668e912fa9c2', '', 0, 0, '', 0, '', '', '2020-05-29 09:59:03');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `qty`, `price`) VALUES
(1, 1, 12, 1, 100),
(2, 1, 10, 1, 10),
(3, 2, 13, 1, 150),
(4, 2, 12, 1, 100);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
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
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `sub_categories_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mrp` float NOT NULL,
  `price` float NOT NULL,
  `qty` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `short_desc` varchar(2000) NOT NULL,
  `description` text NOT NULL,
  `best_seller` int(11) NOT NULL,
  `meta_title` varchar(2000) NOT NULL,
  `meta_desc` varchar(2000) NOT NULL,
  `meta_keyword` varchar(2000) NOT NULL,
  `added_by` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `categories_id`, `sub_categories_id`, `name`, `mrp`, `price`, `qty`, `image`, `short_desc`, `description`, `best_seller`, `meta_title`, `meta_desc`, `meta_keyword`, `added_by`, `status`) VALUES
(1, 1, 1, 'Fresh Organic Simla Apple Fruit 4 Pieces', 9999, 44, 10, 'apples.jpg', '100% Wax Free, Pack contains 4 pieces
Good source of Vitamin C, Dietary Fiber, Flavonoids and antioxidants', 'Shimla apples are commonly grown apples in India. They are one of the healthiest fruit. They are good source of vitamin c, dietary fiber, flavonoids and antioxidants. Store them in a cool dry place away from direct sunlight. They can eaten as a fresh or used in fruit chat, salads, smoothies, pies etc.', 1, 'apple', '', 'apple', 0, 1),
(2, 1, 1, 'Pears', 165800, 155800, 4, 'pears.jpg', 'Aenean tempus ut leo nec laoreet. Vestibulum ut est neque.', 'Curabitur eget augue dolor. Curabitur id dapibus massa. Vestibulum at enim quis metus ultrices posuere vitae sit amet eros. Morbi et libero pellentesque, efficitur odio nec, congue lorem. Vestibulum faucibus, risus eget pretium efficitur, neque nulla eleifend purus, non venenatis lorem ligula vel nulla. Fusce finibus efficitur sapien vitae laoreet. Integer imperdiet justo sed tellus dictum, at egestas arcu finibus. Fusce et augue elit. Praesent tincidunt purus in purus dictum volutpat. Aenean tempus ut leo nec laoreet. Vestibulum ut est neque.', 0, 'Pears', '', 'Pears', 0, 1),
(3, 1, 1, 'Cherries', 115900, 115900, 5, 'cherries.jpg', 'Nullam purus lorem, tincidunt vitae tristique non, imperdiet ut urna.', 'Nullam a nunc et lorem ornare faucibus. Etiam tortor lacus, auctor eget enim at, tincidunt dignissim magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin tincidunt eros eget felis tempor, id volutpat ipsum lacinia. Donec scelerisque risus non purus scelerisque tristique. Mauris enim ligula, condimentum sed iaculis nec, porttitor eu nunc. Sed hendrerit vel arcu vitae iaculis. Phasellus vehicula molestie leo. Nullam purus lorem, tincidunt vitae tristique non, imperdiet ut urna.', 0, 'Pears', 'Pears', 'Pears', 0, 1),
(4, 1, 2, 'Bananas', 1999, 25, 3, 'bananas.jpg', 'per inceptos himenaeos. Ut commodo ullamcorper quam non pulvinar.', 'Duis a felis congue, feugiat est non, suscipit quam. In elit lacus, auctor sed lacus eget, egestas consectetur leo. Duis pellentesque pharetra ante, ac ornare nibh faucibus id. Integer pulvinar malesuada nisl. Nulla vel orci nunc. Nullam a tellus eu ex ullamcorper mollis. Donec commodo ligula a accumsan fermentum. Mauris sed orci lacinia, posuere leo molestie, pretium mi. Cras sodales, neque id cursus fermentum, mi purus vehicula sem, vel laoreet lorem justo id tortor. Sed ut urna ut ipsum vestibulum commodo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut commodo ullamcorper quam non pulvinar.', 1, 'bananas', 'bananas', 'bananas', 0, 1),
(5, 1, 2, 'Mangoes', 2799, 2399, 8, 'mangoes.jpg', 'a nisl pharetra orci, at condimentum nisl lorem elementum ipsum.', 'Nunc auctor turpis ante, eget bibendum mi mollis in. Aliquam quis neque ut libero malesuada auctor. Aliquam interdum enim at commodo gravida. Donec nisl sem, molestie ut quam quis, vulputate venenatis ipsum. Aenean quis ex ut magna accumsan fringilla. Quisque id ex massa. Sed libero ante, fringilla ac condimentum in, porttitor ac risus. Integer mattis odio nec nunc semper imperdiet. In porttitor tellus eget sapien vulputate, eu euismod lacus aliquet. Maecenas molestie elit augue, sit amet fringilla dolor congue et. Nunc eu libero auctor, sollicitudin lectus quis, porta ligula. In vel ullamcorper risus. Nullam viverra, mi sit amet laoreet luctus, urna nisl pharetra orci, at condimentum nisl lorem elementum ipsum.', 1, 'mangoes', 'mangoes', 'Fresh Indian mangoes', 0, 1),
(6, 1, 3, 'Oranges', 1999, 1500, 10, 'oranges.jpg', 'lacus quis urna tristique suscipit. Praesent vitae mi mollis dui facilisis convallis eu faucibus augue.', 'Duis in risus quis lectus dictum fringilla. Aenean tempor pellentesque velit id ullamcorper. Ut id aliquam odio. Morbi id pharetra libero, ut tempor nisi. Maecenas a lectus nec risus maximus rutrum. Mauris vel elit ut magna semper laoreet nec sed magna. Quisque eleifend vel sem non malesuada. Interdum et malesuada fames ac ante ipsum primis in faucibus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum eget posuere orci, eu ultrices sapien. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam sit amet ex dictum nisl bibendum elementum non in turpis. In bibendum ipsum nunc, bibendum lacinia lacus maximus eu. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vivamus aliquam lacus quis urna tristique suscipit. Praesent vitae mi mollis dui facilisis convallis eu faucibus augue.', 1, 'Oranges', 'Oranges', 'Oranges', 0, 1),
(7, 1, 3, 'Mausambi', 1900, 53, 7, 'mausambi.jpg', 'isl pharetra orci, at condimentum nisl lorem elementum ipsum.', 'Nunc auctor turpis ante, eget bibendum mi mollis in. Aliquam quis neque ut libero malesuada auctor. Aliquam interdum enim at commodo gravida. Donec nisl sem, molestie ut quam quis, vulputate venenatis ipsum. Aenean quis ex ut magna accumsan fringilla. Quisque id ex massa. Sed libero ante, fringilla ac condimentum in, porttitor ac risus. Integer mattis odio nec nunc semper imperdiet. In porttitor tellus eget sapien vulputate, eu euismod lacus aliquet. Maecenas molestie elit augue, sit amet fringilla dolor congue et. Nunc eu libero auctor, sollicitudin lectus quis, porta ligula. In vel ullamcorper risus. Nullam viverra, mi sit amet laoreet luctus, urna nisl pharetra orci, at condimentum nisl lorem elementum ipsum.', 0, 'mausambi', 'mausambi', 'mausambi', 0, 1),
(8, 1, 4, 'Strawberry', 1120, 550, 10, 'strawberry.jpg', 'rius, lacus velit aliquam ex, in dignissim sem eros ac erat. Vestibulum ac arcu tortor.', 'Vestibulum in auctor turpis. Quisque hendrerit eget turpis et molestie. Phasellus nec nibh a lacus rhoncus eleifend. Donec suscipit id diam non mattis. Fusce eu luctus leo. Etiam eget dui libero. Etiam eros lorem, rhoncus et convallis eget, tempus vel tellus. Nam at diam quis nisl tincidunt aliquam. Quisque placerat magna non libero interdum varius vel id risus. Vivamus mollis maximus fermentum. Donec eget nulla dui. Sed ultricies malesuada metus, non feugiat purus fringilla ac. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer accumsan, tortor id eleifend varius, lacus velit aliquam ex, in dignissim sem eros ac erat. Vestibulum ac arcu tortor.', 0, 'strawberry', '', 'strawberry', 0, 1),
(9, 1, 4, 'Kiwi', 650, 1560, 10, 'kiwi.jpg', 's mus. Vestibulum eget posuere orci, eu ultrices sapien. Orc', 'aximus rutrum. Mauris vel elit ut magna semper laoreet nec sed magna. Quisque eleifend vel sem non malesuada. Interdum et malesuada fames ac ante ipsum primis in faucibus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum eget posuere orci, eu ultrices sapien. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam sit amet ex d', 0, 'kiwi', '', 'kiwi', 0, 1),
(10, 1, 4, 'Pomegranate', 100, 70, 50, 'pomegranate.jpg', 'test', 'test', 1, 'pomegranate', 'pomegranate', 'pomegranate', 0, 1),
(11, 1, 5, 'Watermelon', 100, 150, 10, 'watermelon.jpg', 'Test', 'test', 1, 'watermelon', 'watermelon', 'watermelon', 0, 1),
(12, 2, 1, 'Potatoes', 120, 50, 10, 'potatoes.jpg', 'Test desc', 'Test desc', 1, 'Potatoes', 'Potatoes', 'Potatoes', 2, 1),
(13, 2, 6, 'Tomatoes', 200, 130, 10, 'tomatoes.jpg', 'Test desc', 'Test desc', 1, 'tomatoes', 'tomatoes', 'tomatoes', 2, 1),
(14, 2, 6, 'Peas', 201, 30, 10, 'peas.jpg', 'Test desc', 'Test desc', 0, 'peas', 'peas', 'peas', 2, 1),
(15, 2, 6, 'Brinjal', 202, 50, 10, 'brinjal.jpg', 'Test desc', 'Test desc', 0, 'brinjal', 'brinjal', 'brinjal', 2, 1),
(16, 2, 6, 'Ladyfingers', 203, 50, 10, 'ladyfingers.jpg', 'Test desc', 'Test desc', 0, 'ladyfingers', 'ladyfingers', 'ladyfingers', 1, 1),
(17, 2, 6, 'Carrots', 204, 45, 10, 'carrots.jpg', 'Test desc', 'Test desc', 1, 'carrots', 'carrots', 'carrots', 2, 1),
(18, 2, 6, 'Onions', 205, 50, 10, 'onions.jpg', 'Test desc', 'Test desc', 1, 'onions', 'onions', 'onions', 2, 1),
(19, 2, 6, 'Bottle gourd', 206, 150, 10, 'bottlegourd.jpg', 'Test desc', 'Test desc', 0, 'bottle gourd', 'bottle gourd', 'bottle gourd', 2, 1),
(20, 2, 7, 'Lettuce', 206, 125, 10, 'lettuce.jpg', 'Test desc', 'Test desc', 0, 'lettuce', 'lettuce', 'lettuce', 2, 1),
(21, 2, 7, 'Spinach', 207, 70, 10, 'spinach.jpg', 'Test desc', 'Test desc', 1, 'spinach', 'spinach', 'spinach', 2, 1),
(22, 2, 8, 'Cauliflower', 200, 75, 10, 'cauliflower.jpg', 'Test desc', 'Test desc', 0, 'cauliflower', 'cauliflower', 'cauliflower', 2, 1),
(23, 2, 8, 'Cabbage', 208, 45, 10, 'cabbage.jpg', 'Test desc', 'Test desc', 1, 'cabbage', 'cabbage', 'cabbage', 2, 1),
(24, 2, 9, 'Pumpkin', 209, 60, 10, 'pumpkin.jpg', 'Test desc', 'Test desc', 0, 'pumpkin', 'pumpkin', 'pumpkin', 2, 1),
(25, 2, 9, 'Cucumber', 210, 35, 10, 'cucumber.jpg', 'Test desc', 'Test desc', 0, 'cucumber', 'cucumber', 'cucumber', 2, 1),
(26, 3, 10, 'Wheat(1 Kf)', 211, 150, 10, 'wheat.jpg', 'Test desc', 'Test desc', 1, 'wheat', 'wheat', 'wheat', 2, 1),
(27, 3, 10, 'Oats', 212, 170, 10, 'oats.jpg', 'Test desc', 'Test desc', 0, 'oats', 'oats', 'oats', 2, 1),
(28, 3, 10, 'RICE', 213, 180, 10, 'rice.jpg', 'Test desc', 'Test desc', 1, 'rice', 'rice', 'rice', 2, 1),
(29, 3, 10, 'CORN', 214, 35, 10, 'corn.jpg', 'Test desc', 'Test desc', 1, 'corn', 'corn', 'corn', 2, 1),
(30, 3, 10, 'BARLEY', 215, 150, 10, 'barley.jpg', 'Test desc', 'Test desc', 0, 'barley', 'barley', 'barley', 2, 1),
(31, 3, 10, 'MILLET', 216, 330, 10, 'millet.jpg', 'Test desc', 'Test desc', 0, 'millet', 'millet', 'millet', 2, 1),
(32, 3, 10, 'RYE', 217, 500, 10, 'rye.jpg', 'Test desc', 'Test desc', 0, 'rye', 'rye', 'rye', 2, 1),
(33, 3, 10, 'Sorghum', 218, 100, 10, 'sorghum.jpg', 'Test desc', 'Test desc', 0, 'sorghum', 'sorghum', 'sorghum', 2, 1),
(34, 3, 10, 'TRITICALE', 219, 150, 10, 'triticale.jpg', 'Test desc', 'Test desc', 0, 'triticale', 'triticale', 'triticale', 2, 1),
(35, 3, 11, 'Buckwheat', 220, 300, 10, 'buckwheat.jpg', 'Test desc', 'Test desc', 0, 'buckwheat', 'buckwheat', 'buckwheat', 2, 1),
(36, 4, 0, 'Peanuts', 221, 160, 10, 'peanuts.jpg', 'Test desc', 'Test desc', 1, 'peanuts', 'peanuts', 'peanuts', 2, 1),
(37, 4, 0, 'Almonds (500g)', 222, 450, 10, 'almonds.jpg', 'Test desc', 'Test desc', 1, 'almonds', 'almonds', 'almonds', 1, 1),
(38, 4, 0, 'Cashew Nuts', 223, 550, 10, 'cashew.jpg', 'Test desc', 'Test desc', 1, 'cashew', 'cashew', 'cashew', 1, 1),
(39, 4, 0, 'Hazelnuts', 224, 420, 10, 'hazelnuts.jpg', 'Test desc', 'Test desc', 0, 'hazelnuts', 'hazelnuts', 'hazelnuts', 1, 1),
(40, 4, 0, 'Pecans', 225, 330, 10, 'pecans.jpg', 'Test desc', 'Test desc', 0, 'pecans', 'pecans', 'pecans', 1, 1),
(41, 4, 0, 'Pistachio Nuts', 226, 330, 10, 'pistachio.jpg', 'Test desc', 'Test desc', 1, 'pista', 'pista', 'pista', 1, 1),
(42, 4, 0, 'Walnuts', 227, 350, 10, 'walnuts.jpg', 'Test desc', 'Test desc', 0, 'walnuts', 'walnuts', 'walnuts', 2, 1),
(43, 4, 0, 'Pine Nuts', 228, 650, 10, 'pinenuts.jpg', 'Test desc', 'Test desc', 1, '', '', '', 2, 1),
(44, 4, 0, 'Chestnuts', 229, 150, 10, 'chestnuts.jpg', 'Test desc', 'Test desc', 0, 'chestnuts', 'chestnuts', 'chestnuts', 0, 1),
(45, 5, 12, 'Farm made Bread', 40, 150, 10, 'bread.jpg', 'Test desc', 'Test desc', 1, 'bread', 'bread', 'bread', 3, 1),
(46, 5, 13, 'Home made Chocolate(500g)', 230, 330, 10, 'homechocolate.jpg', 'Test desc', 'Test desc', 1, 'chocolate', 'chocolate', 'chocolate', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shiprocket_token`
--

CREATE TABLE `shiprocket_token` (
  `id` int(11) NOT NULL,
  `token` varchar(500) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shiprocket_token`
--

INSERT INTO `shiprocket_token` (`id`, `token`, `added_on`) VALUES
(1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjQ5NDkwOSwiaXNzIjoiaHR0cHM6Ly9hcGl2Mi5zaGlwcm9ja2V0LmluL3YxL2V4dGVybmFsL2F1dGgvbG9naW4iLCJpYXQiOjE1OTA0MDQ4NTMsImV4cCI6MTU5MTI2ODg1MywibmJmIjoxNTkwNDA0ODUzLCJqdGkiOiJWZU4zaE5YMm1LdVY4cXB0In0.YKracv-yDKppYb2FISr5zE_4gEGWIAz-HzIa6cit9nw', '2020-05-25 05:07:26');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `sub_categories` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `categories_id`, `sub_categories`, `status`) VALUES
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
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `mobile`, `added_on`) VALUES
(1, 'Arkaraj Ghosh', 'Arkaraj', 'arkaraj@test.com', '7395847373', '2020-08-13 00:00:00'),
(2, 'Bot 1', 'AgroBot', 'agro@bot.com', '1234567890', '2020-09-14 00:00:00'),
(3, 'Arkaraj', 'test1234', 'arkaraj@test.com', '1122334455', '2020-09-13 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `coupon_master`
--
ALTER TABLE `coupon_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `shiprocket_token`
--
ALTER TABLE `shiprocket_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
