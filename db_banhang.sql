-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2020 at 10:44 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_banhang`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_email` varchar(100) NOT NULL,
  `admin_password` varchar(100) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_phone` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_email`, `admin_password`, `admin_name`, `admin_phone`) VALUES
(11, 'lephongplus2016@gmail.com', '', 'Phong Lê', ''),
(13, 'lephongplus2015@gmail.com', '', 'lâm lâm', ''),
(14, 'phong.leqtm@hcmut.edu.vn', '', 'PHONG Lê Hồng', ''),
(15, 'mnhat71.t@gmail.com', '', 'Minh Nhat', ''),
(16, 'ngan.dangkhuyet@hcmut.edu.vn', '', 'NGÂN Đặng Thành', ''),
(17, 'nhon.leminhnhon@hcmut.edu.vn', '', 'NHƠN Lê Minh', ''),
(18, 'random123abcrandom@gmail.com', '', 'Bill Smith', '');

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `tinhtrang` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `created_at`, `updated_at`, `tinhtrang`) VALUES
(19, 18, '2020-07-27', 135000, 'ATM', 'Giao hàng trước 11h', '2020-07-27 07:31:17', '2020-07-27 07:31:17', NULL),
(20, 19, '2020-07-27', 10000, 'COD', 'không', '2020-07-27 08:04:55', '2020-07-27 08:04:55', NULL),
(18, 17, '2020-07-27', 105000, 'COD', 'giao hàng nhanh', '2020-07-27 07:22:04', '2020-07-27 07:22:04', NULL),
(21, 20, '2020-07-27', 20000, 'COD', 'giao hàng cẩn thận', '2020-07-27 08:21:39', '2020-07-27 08:21:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(30, 19, 12, 1, 15000, '2020-07-27 07:31:17', '2020-07-27 07:31:17'),
(29, 19, 23, 2, 20000, '2020-07-27 07:31:17', '2020-07-27 07:31:17'),
(28, 19, 24, 1, 20000, '2020-07-27 07:31:17', '2020-07-27 07:31:17'),
(27, 19, 20, 1, 25000, '2020-07-27 07:31:17', '2020-07-27 07:31:17'),
(26, 19, 33, 1, 35000, '2020-07-27 07:31:17', '2020-07-27 07:31:17'),
(25, 18, 15, 1, 20000, '2020-07-27 07:22:04', '2020-07-27 07:22:04'),
(24, 18, 13, 1, 10000, '2020-07-27 07:22:04', '2020-07-27 07:22:04'),
(23, 18, 19, 1, 30000, '2020-07-27 07:22:04', '2020-07-27 07:22:04'),
(22, 18, 28, 1, 30000, '2020-07-27 07:22:04', '2020-07-27 07:22:04'),
(21, 18, 11, 1, 15000, '2020-07-27 07:22:04', '2020-07-27 07:22:04'),
(31, 20, 13, 1, 10000, '2020-07-27 08:04:55', '2020-07-27 08:04:55'),
(32, 21, 15, 1, 20000, '2020-07-27 08:21:39', '2020-07-27 08:21:39');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(15, 'ê', 'Nữ', 'huongnguyen@gmail.com', 'e', 'e', 'e', '2017-03-24 07:14:32', '2017-03-24 07:14:32'),
(14, 'hhh', 'nam', 'huongnguyen@gmail.com', 'Lê thị riêng', '99999999999999999', 'k', '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(13, 'Hương Hương', 'Nữ', 'huongnguyenak96@gmail.com', 'Lê Thị Riêng, Quận 1', '23456789', 'Vui lòng giao hàng trước 5h', '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(12, 'Khoa phạm', 'Nam', 'khoapham@gmail.com', 'Lê thị riêng', '1234567890', 'Vui lòng chuyển đúng hạn', '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(11, 'Hương Hương', 'Nữ', 'huongnguyenak96@gmail.com', 'Lê Thị Riêng, Quận 1', '234567890-', 'không chú', '2020-06-20 14:24:39', '2017-03-21 07:16:09'),
(16, 'le phong', 'nam', 'lephong@gmail.com', 'binh duong', '0912345678', 'jkjh', '2020-07-04 10:35:48', '2020-07-04 10:35:48'),
(17, 'le phong', 'nam', 'b@gmaill.com', 'q thu duc, tp ho chi minh', '0912345678', 'giao hàng nhanh', '2020-07-27 07:22:03', '2020-07-27 07:22:03'),
(18, 'Phong Lee', 'nam', 'lephongplus2016@gmail.com', 'Block H6, HCMUT  branch Di An', '0967609589', 'Giao hàng trước 11h', '2020-07-27 07:31:17', '2020-07-27 07:31:17'),
(19, 'Nam', 'nam', 'lephongplus2016@gmail.com', 'binh duong', '0123', 'không', '2020-07-27 08:04:55', '2020-07-27 08:04:55'),
(20, 'Nam', 'nam', 'lephongplus2016@gmail.com', 'binh duong', '0123', 'giao hàng cẩn thận', '2020-07-27 08:21:39', '2020-07-27 08:21:39');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'tiêu đề',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'nội dung',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'hình',
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `image`, `create_at`, `update_at`) VALUES
(1, 'Mùa trung thu năm nay, Hỷ Lâm Môn muốn gửi đến quý khách hàng sản phẩm mới xuất hiện lần đầu tiên tại Việt nam \"Bánh trung thu Bơ Sữa HongKong\".', 'Những ý tưởng dưới đây sẽ giúp bạn sắp xếp tủ quần áo trong phòng ngủ chật hẹp của mình một cách dễ dàng và hiệu quả nhất. ', 'sample1.jpg', '2017-03-11 06:20:23', '0000-00-00 00:00:00'),
(2, 'Tư vấn cải tạo phòng ngủ nhỏ sao cho thoải mái và thoáng mát', 'Chúng tôi sẽ tư vấn cải tạo và bố trí nội thất để giúp phòng ngủ của chàng trai độc thân thật thoải mái, thoáng mát và sáng sủa nhất. ', 'sample2.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(3, 'Đồ gỗ nội thất và nhu cầu, xu hướng sử dụng của người dùng', 'Đồ gỗ nội thất ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Xu thế của các gia đình hiện nay là muốn đem thiên nhiên vào nhà ', 'sample3.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(4, 'Hướng dẫn sử dụng bảo quản đồ gỗ, nội thất.', 'Ngày nay, xu hướng chọn vật dụng làm bằng gỗ để trang trí, sử dụng trong văn phòng, gia đình được nhiều người ưa chuộng và quan tâm. Trên thị trường có nhiều sản phẩm mẫu ', 'sample4.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(5, 'Phong cách mới trong sử dụng đồ gỗ nội thất gia đình', 'Đồ gỗ nội thất gia đình ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Phong cách sử dụng đồ gỗ hiện nay của các gia đình hầu h ', 'sample5.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `description`, `unit_price`, `promotion_price`, `image`, `unit`, `new`, `created_at`, `updated_at`) VALUES
(11, 'Cà phê trứng', 2, NULL, 15000, 0, 'cafe-trung.jpg', NULL, 1, NULL, '2020-07-27 04:21:08'),
(12, 'Cà phê sữa', 2, '', 15000, 0, 'cafe-sua.jpg', 'cái', 0, NULL, NULL),
(13, 'Nước mía', 2, '', 10000, 0, 'nuoc-mia.jpg', 'cái', 1, NULL, NULL),
(14, 'Trà đào', 2, '', 20000, 15000, 'tra-dao.jpg', 'cái', 0, NULL, NULL),
(15, 'Trà sữa', 2, '', 20000, 0, 'tra-sua.jpg', 'cái', 1, NULL, NULL),
(16, 'Pepsi', 2, '', 10000, 0, 'pepsi.jpg', 'hộp', 0, NULL, NULL),
(17, 'Nước suối', 2, '', 5000, 0, 'nuoc-suoi.png', 'cai', 0, NULL, NULL),
(18, 'Hamburger', 1, '', 20000, 0, 'hamburger.jpg', 'hộp', 0, NULL, NULL),
(19, 'Mì gà quay', 1, '', 30000, 0, 'mi-ga-quay.jpg', 'hộp', 1, NULL, NULL),
(20, 'Mì hoàn thánh', 1, '', 25000, 0, 'mi-hoanh-thanh.jpg', 'hộp', 0, NULL, NULL),
(21, 'Mì Quảng', 1, '', 25000, 0, 'mi-quang.jpg', 'cái', 0, NULL, NULL),
(22, 'Bánh mì chả', 1, '', 15000, 12000, 'banh-mi.jpg', 'hộp', 1, NULL, NULL),
(23, 'Bánh mì bò', 1, '', 20000, 15000, 'banh-mi-bo.jpg', 'hộp', 0, NULL, NULL),
(24, 'Bánh mì cuộn', 1, '', 20000, 0, 'banh-mi-cuon.jpg', 'hộp', 0, NULL, NULL),
(25, 'Bún riêu', 1, '', 25000, 20000, 'bun-rieu.jpg', 'hộp', 0, NULL, NULL),
(26, 'Bún thịt nướng', 1, '', 25000, 0, 'bun-thit-nuong.jpg', 'hộp', 0, NULL, NULL),
(27, 'Cà ri', 1, '', 30000, 27000, 'ca-ri.jpg', 'hộp', 0, NULL, NULL),
(28, 'Dim-sum', 1, '', 30000, 0, 'dimsum.jpg', 'hộp', 1, NULL, NULL),
(29, 'Cơm gà xối mỡ', 1, '', 25000, 0, 'ga-xoi-mo.jpg', 'hộp', 0, NULL, NULL),
(30, 'Cam ép', 2, '', 15000, 0, 'nuoc-cam.jpg', 'cái', 1, NULL, NULL),
(31, 'Cà phê + bánh', 3, '', 25000, 0, 'caphe-banh.jpg', 'cái', 0, NULL, NULL),
(32, 'Pizza + Trà sữa', 3, '', 40000, 0, 'pizza-trasua.jpg', 'cái', 0, NULL, NULL),
(33, 'Combo cơm 1', 3, '', 35000, 0, 'vp1.jpg', 'cái', 1, NULL, NULL),
(34, 'Combo cơm 2', 3, '', 40000, 0, 'vp2.jpg', 'cái', 1, NULL, NULL),
(35, 'Combo cơm 3', 3, '', 50000, 0, 'vp3.jpg', 'cái', 1, NULL, NULL),
(36, 'Bánh sầu riêng', 4, '', 30000, 0, '1430967449-pancake-sau-rieng-6.jpg', 'cái', 0, NULL, NULL),
(37, 'Bánh bông lan', 4, '', 10000, 0, 'bong-lan.jpg', 'cái', 1, NULL, NULL),
(38, 'Bánh cherry', 4, '', 20000, 0, 'banh cherry.jpg', 'cái', 0, NULL, NULL),
(39, 'Bánh kem mây', 4, '', 15000, 0, 'banh-kem-may.jpg', 'cái', 0, NULL, NULL),
(40, 'Bánh phô mai', 4, '', 15000, 0, 'banh-pho-mai.jpg', 'cái', 0, NULL, NULL),
(41, 'Bánh su kem', 4, '', 15000, 0, 'sukem.jpg', 'cái', 0, NULL, NULL),
(58, 'Mì Ý', 1, '', 25000, 0, 'mi-y.jpg', '', 0, NULL, NULL),
(59, 'Pizza', 1, '', 30000, 0, 'pizza.jpg', '', 0, NULL, NULL),
(60, 'Sushi', 1, '', 30000, 0, 'sushi.jpg', '', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`) VALUES
(1, '', 'mi-y.jpg'),
(2, '', 'com-tron.jpg'),
(3, '', 'ga-ran.jpg'),
(4, '', 'coffe.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `social`
--

CREATE TABLE `social` (
  `user_id` int(11) NOT NULL,
  `provider_user_id` varchar(100) NOT NULL,
  `provider` varchar(100) NOT NULL,
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `social`
--

INSERT INTO `social` (`user_id`, `provider_user_id`, `provider`, `user`) VALUES
(11, '102778945017257587140', 'GOOGLE', 11),
(13, '117369604387390088175', 'GOOGLE', 13),
(14, '115666181346669216594', 'GOOGLE', 14),
(15, '103577747047901824578', 'GOOGLE', 15),
(16, '103020438796511615196', 'GOOGLE', 16),
(17, '114784229709815614745', 'GOOGLE', 17),
(18, '108068844844637922226', 'GOOGLE', 18);

-- --------------------------------------------------------

--
-- Table structure for table `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Món Ăn', '', '', NULL, NULL),
(2, 'Thức uống', '', '', NULL, NULL),
(3, 'Combo', '', '', NULL, NULL),
(4, 'Các loại bánh ngọt', '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(6, 'Nhon', '', '1', '123', '', NULL, NULL, NULL),
(8, 'b', 'b@gmaill.com', '$2y$10$FYcF03mcMEjLbSRPGXvl9eoI8RD7/sj8GTALrdkmU6g5ydzyQPf9i', '0123', 'binh duong', NULL, '2020-07-08 03:51:30', '2020-07-08 03:51:30'),
(12, 'Phong Lê', 'lephongplus2016@gmail.com', '$2y$10$.GClO2vP/uTbUDTxfnES0eXkLKnNpVdOpNZGMRNB31Zvm2WaYQxua', '', '', NULL, '2020-07-08 09:28:19', '2020-07-08 09:28:19'),
(14, 'lâm lâm', 'lephongplus2015@gmail.com', '$2y$10$BQ./f9gWqGmJjRBnK4AZaeHSs/Lu5930Eyhs8EcjAI3AGOPH/iNI6', '', '', NULL, '2020-07-08 15:30:01', '2020-07-08 15:30:01'),
(15, 'Chiến thần', 'c@gmail.com', '$2y$10$mAp1SW2FKUzf6LW17dQwBuB44n9gA0XZvkLNaOQYVEJuKt4O4emYO', '01234', 'tp ho chi minh', NULL, '2020-07-09 08:32:40', '2020-07-27 04:18:59'),
(16, 'PHONG Lê Hồng', 'phong.leqtm@hcmut.edu.vn', '$2y$10$J9LjBXJt3EX1zM5LIxi.LOfJ/4rtKigKmLFb8EYQcI8mmr0Z7J6Fa', '', '', NULL, '2020-07-12 02:45:13', '2020-07-12 02:45:13'),
(17, 'Nhật', 'abcd@gmail.com', '$2y$10$cXzhBbMn7QwKjkL.1ZD9lOpG6033twOBDHe8A9WK2mnIfUOP0sFlW', '0123456789', '123 st Ly Thuong Kiet', NULL, '2020-07-13 06:34:42', '2020-07-13 06:34:42'),
(18, 'Minh Nhat', 'mnhat71.t@gmail.com', '$2y$10$X74iQRQwGTnZwtKGo1bm/eBqo/.DM3dmjwexxdPZX3iQOHB6OAbte', '', '', NULL, '2020-07-13 06:38:23', '2020-07-13 06:38:23'),
(19, 'NGÂN Đặng Thành', 'ngan.dangkhuyet@hcmut.edu.vn', '$2y$10$Cke08JUiGmfsArLD84fg/uw2qfoiUVsdyCkro8YbUaAfTPmEmBv0y', '', '', NULL, '2020-07-13 06:39:52', '2020-07-13 06:39:52'),
(20, 'NHƠN Lê Minh', 'nhon.leminhnhon@hcmut.edu.vn', '$2y$10$pnFoqRaTTB96upVHlDNrbODzQnIjGw17THQGqsHbA.IasAS7JrUzK', '', '', NULL, '2020-07-13 09:53:54', '2020-07-13 09:53:54'),
(21, 'Bill Smith', 'random123abcrandom@gmail.com', '$2y$10$BQM8KiH6wARkq80.h/aw5OzNZjPW99z0G8rwAm7ZaddC2oHFZQm3m', '', '', NULL, '2020-07-21 02:50:03', '2020-07-21 02:50:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`);

--
-- Indexes for table `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social`
--
ALTER TABLE `social`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `social`
--
ALTER TABLE `social`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_type_foreign` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
