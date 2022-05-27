-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2022 at 03:47 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hkt_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`) VALUES
(6, 'Sạc dự phòng', 1),
(7, 'Sạc, cáp', 1),
(8, 'Gậy chụp ảnh, Gimbal', 1),
(9, 'Giá đỡ điện thoại/ laptop', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `receivedDate` date DEFAULT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `createdDate`, `receivedDate`, `status`) VALUES
(40, 1, '2022-05-19', '2022-05-25', 'Complete'),
(41, 1, '2022-05-19', NULL, 'Processing'),
(42, 1, '2022-05-20', '2022-05-23', 'Processed'),
(43, 1, '2022-05-25', NULL, 'Processing');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `orderId`, `productId`, `qty`, `productPrice`, `productName`, `productImage`) VALUES
(40, 40, 21, 2, '245000', 'Pin sạc dự phòng Polymer 10.000 mAh Hydrus PA CK01 ', 'df280f19b3.jpg'),
(41, 41, 28, 40, '100000', 'Adapter Sạc USB Hydrus ACL2018', 'b52eabed75.jpeg'),
(42, 42, 22, 5, '245000', 'Pin sạc dự phòng Polymer 10.000 mAh Hydrus PJ JP196', 'cbdb844350.jpg'),
(43, 43, 28, 3, '100000', 'Adapter Sạc USB Hydrus ACL2018', 'b52eabed75.jpeg'),
(44, 43, 31, 1, '80000', 'Cáp Type C - Type C 2m Hydrus DS465', '29d1f8fd1e.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `originalPrice` decimal(10,0) NOT NULL,
  `promotionPrice` decimal(10,0) NOT NULL,
  `image` varchar(50) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `cateId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `des` varchar(1000) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `soldCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `originalPrice`, `promotionPrice`, `image`, `createdBy`, `createdDate`, `cateId`, `qty`, `des`, `status`, `soldCount`) VALUES
(19, 'Pin sạc dự phòng 7500 mAh AVA+ LJ JP199', '350000', '199000', 'be2888a350.jpg', 1, '2022-05-18', 6, 10, '<b>Thông số kỹ thuật: </b>\r\n<br> - Hiệu suất sạc: 64%\r\n<br> - Dung lượng pin: 7.500 mAh\r\n<br> - Thời gian sạc đầy pin: 3 - 4 giờ (dùng Adapter 2A)7 - 8 giờ (dùng Adapter 1A)\r\n<br> - Nguồn vào: Micro USB: 5V - 2A\r\n<br> - Nguồn ra: USB: 5V - 2A\r\n<br> - Lõi pin: Li-Ion\r\n<br> - Công nghệ/Tiện ích: Đèn LED báo hiệu\r\n<br> - Kích thước: Dài 8.7 cm - Rộng 5.8 cm - Dày 2 cm\r\n<br> - Trọng lượng: 172 g\r\n<br> - Thương hiệu của: Thế Giới Di Động\r\n<br> - Sản xuất tại: Trung Quốc\r\n<br> - Hãng: AVA+.', 1, 0),
(20, 'Pin sạc dự phòng 7.500 mAh AVA+ DS005-PP', '350000', '190000', 'f9e9511a72.jpg', 1, '2022-05-18', 6, 15, '<b>Thông số kỹ thuật: </b>\r\n<br> - Hiệu suất sạc: 64%\r\n<br> - Dung lượng pin: 7.500 mAh\r\n<br> - Thời gian sạc đầy pin: 7 - 8 giờ (dùng Adapter 1A)3 - 4 giờ (dùng Adapter 2A)\r\n<br> - Nguồn vào: Micro USB: 5V - 2A\r\n<br> - Nguồn ra: USB: 5V - 2A\r\n<br> - Lõi pin: Li-Ion\r\n<br> - Công nghệ/Tiện ích: Đèn LED báo hiệu\r\n<br> - Kích thước: Dày 2 cm - Rộng 7 cm - Dài 8 cm\r\n<br> - Trọng lượng: 170 g\r\n<br> - Thương hiệu của: Thế Giới Di Động\r\n<br> - Sản xuất tại: Trung Quốc', 1, 0),
(21, 'Pin sạc dự phòng Polymer 10.000 mAh Hydrus PA CK01 ', '490000', '245000', 'df280f19b3.jpg', 1, '2022-05-18', 6, 18, '<b>Thông số kỹ thuật: </b>\r\n<br> - Hiệu suất sạc: 64%\r\n<br> - Dung lượng pin: 10.000 mAh\r\n<br> - Thời gian sạc đầy pin: 10 - 11 giờ (dùng Adapter 1A)5 - 6 giờ (dùng Adapter 2A)\r\n<br> - Nguồn vào: Micro USB: 5V - 2A\r\n<br> - Nguồn ra: USB: 5V - 2.1A\r\n<br> - Lõi pin: Polymer\r\n<br> - Công nghệ/Tiện ích: Đèn LED báo hiệu\r\n<br> - Kích thước: Dày 1.5 cm - Rộng 7.5 cm - Dài 14.5cm\r\n<br> - Trọng lượng: 233g\r\n<br> - Thương hiệu của: Thế Giới Di Động\r\n<br> - Sản xuất tại: Trung Quốc\r\n<br> - Hãng: Hydrus. Xem thông tin hãng', 1, 2),
(22, 'Pin sạc dự phòng Polymer 10.000 mAh Hydrus PJ JP196', '490000', '245000', 'cbdb844350.jpg', 1, '2022-05-18', 6, 0, '<b>Thông số kỹ thuật: </b>\r\n<br> - Hiệu suất sạc: 65%\r\n<br> - Dung lượng pin: 10.000 mAh\r\n<br> - Thời gian sạc đầy pin: 10 - 11 giờ (dùng Adapter 1A)\r\n<br> - Nguồn vào: 5 - 6 giờ (dùng Adapter 2A)\r\n<br> - Nguồn ra: Micro USB: 5V - 2A\r\n<br> - Lõi pin: USB: 5V - 2A\r\n<br> - Công nghệ/Tiện ích: Polymer\r\n<br> - Kích thước: Đèn LED báo hiệu\r\n<br> - Trọng lượng: Cao 13.5 cm - Rộng 6.7 cm - Dày 1.6 cm\r\n<br> - Thương hiệu của: 225 g\r\n<br> - Sản xuất tại: Thế Giới Di Động\r\n<br> - Hãng Trung Quốc', 1, 5),
(23, 'Pin sạc dự phòng Polymer 10.000mAh AVA+ JP208', '500000', '299000', '6551020c7f.jpg', 1, '2022-05-18', 6, 8, '<b>Thông số kỹ thuật: </b>\r\n<br> - Hiệu suất sạc: 64%\r\n<br> - Dung lượng pin: 10.000 mAh\r\n<br> - Thời gian sạc đầy pin: 10 - 11 giờ (dùng Adapter 1A)\r\n<br> - Nguồn vào: 6 - 7 giờ (dùng Adapter 5V - 2A)\r\n<br> - Nguồn ra: 5V - 2A\r\n<br> - Lõi pin: USB: 5V - 2A\r\n<br> - Công nghệ/Tiện ích: Polymer\r\n<br> - Kích thước: Đèn LED báo hiệu\r\n<br> - Trọng lượng: Dày 1.7 cm - Rộng 6.5 cm - Dài 13.5 cm\r\n<br> - Thương hiệu của: 225 g\r\n<br> - Sản xuất tại: Thế Giới Di Động\r\n<br> - Hãng Trung Quốc', 1, 0),
(24, 'Pin sạc dự phòng Polymer 10000mAh AVA+ DS006', '500000', '299000', 'dbe7bf9eb1.jpg', 1, '2022-05-18', 6, 20, '- Hiệu suất sạc: 64%\r\n- Dung lượng pin: 10.000 mAh\r\n- Thời gian sạc đầy pin: 10 - 11 giờ (dùng Adapter 1A)\r\n- Nguồn vào: 5 - 6 giờ (dùng Adapter 2A)\r\n- Nguồn ra: Micro USB: 5V - 2A\r\n- Lõi pin: USB: 5V - 2A\r\n- Công nghệ/Tiện ích: Polymer\r\n- Kích thước: Đèn LED báo hiệu\r\n- Trọng lượng: Dày 1.5 cm - Rộng 7 cm - Dài 14.5 cm\r\n- Thương hiệu của: 225 g\r\n- Sản xuất tại: Thế Giới Di Động\r\n- Hãng Trung Quốc', 1, 0),
(25, 'Pin sạc dự phòng Polymer 10.000 mAh AVA+ PJ JP192', '500000', '299000', '06624ef4d7.jpg', 1, '2022-05-18', 6, 22, '- Hiệu suất sạc: 64%\r\n- Dung lượng pin: 10.000 mAh\r\n- Thời gian sạc đầy pin: 10 - 11 giờ (dùng Adapter 1A)\r\n- Nguồn vào: 5 - 6 giờ (dùng Adapter 2A)\r\n- Nguồn ra: Micro USB: 5V - 2A\r\n- Lõi pin: USB: 5V - 2.4A\r\n- Công nghệ/Tiện ích: Polymer\r\n- Kích thước: Đèn LED báo hiệu\r\n- Trọng lượng: Dài 8.7 cm - Ngang 6 cm - Cao 2 cm\r\n- Thương hiệu của: 182 g\r\n- Sản xuất tại: Thế Giới Di Động\r\n- Hãng Trung Quốc', 1, 0),
(26, 'Pin sạc dự phòng Polymer 10000mAh Type C AVA+ PJ JP260 ', '550000', '329000', '1842f01391.jpg', 1, '2022-05-18', 6, 10, '- Hiệu suất sạc: 65%\r\n- Dung lượng pin: 10.000 mAh\r\n- Thời gian sạc đầy pin: 10 - 11 giờ (dùng Adapter 1A)\r\n- Nguồn vào: 6 - 7 giờ (dùng Adapter 5V - 2A)\r\n- Nguồn ra: Micro USB: 5V - 2A\r\n- Lõi pin: Type C: 5V- 2.4A\r\n- Công nghệ/Tiện ích: USB: 5V - 2.4A\r\n- Kích thước: Polymer\r\n- Trọng lượng: Đèn LED báo hiệu\r\n- Thương hiệu của: Dày 2 cm - Rộng 6.7 cm - Dài 14.5 cm\r\n- Sản xuất tại: 238g\r\n- Hãng Thế Giới Di Động', 1, 0),
(27, 'Cáp Type C - Lightning 1m Apple MM0A3 Trắng', '590000', '501000', 'ac55bd19cb.jpeg', 1, '2022-05-19', 7, 100, '<b>Thông số kĩ thuật</b>\r\n<br> - Công nghệ/Tiện ích Hỗ trợ sạc nhanh\r\n<br> - Chức năng Sạc\r\n<br> - Đầu vào Truyền dữ liệu\r\n<br> - Đầu ra USB Type-C\r\n<br> - Độ dài dây Lightning\r\n<br> - Công suất tối đa 1 m\r\n<br> - Sản xuất tại 87 W\r\n<br> - Thương hiệu của Trung Quốc\r\n<br> - Hãng Mỹ', 1, 0),
(28, 'Adapter Sạc USB Hydrus ACL2018', '200000', '100000', 'b52eabed75.jpeg', 1, '2022-05-19', 7, 57, '<b>Thông số kĩ thuật</b>\r\n<br> - Model: ACL2018\r\n<br> - Chức năng: Sạc\r\n<br> - Đầu vào: 100-240V~50/60Hz, 0.35A\r\n<br> - Đầu ra: USB: 5V - 2.4A\r\n<br> - Dòng sạc tối đa: 12 W\r\n<br> - Kích thước: Dài 8.3 cm - Ngang 3.7 cm - Cao 2.5 cm\r\n<br> - Thương hiệu của: Thế Giới Di Động\r\n<br> - Sản xuất tại: Trung Quốc\r\n<br> - Hãng Hydrus.', 1, 43),
(29, 'Adapter sạc 3 cổng USB Type C PD 65W Samsung EP-T6530N Đen', '1490000', '1192000', '02d538cbc2.jpeg', 1, '2022-05-19', 7, 50, '<b>Thông số kĩ thuật</b>\r\n<br> - Model: EP-T6530N\r\n<br> - Chức năng: Sạc\r\n<br> - Đầu ra: Type-C1 - PDO: 5V - 3A, 9V - 3A, 15V - 3A, 20V - 3.25A (Max 65W)\r\n<br> - Dòng sạc tối đa: Type-C1 - PPS: SFC 2.0 - Max 45W\r\n<br> - Kích thước: Type-C2 - PDO: 5V - 3A, 9V - 2.77A (Max 25W)\r\n<br> - Công nghệ/Tiện ích: Type-C2 - PPS: SFC 25W\r\n<br> - Thương hiệu của: USB: 5V - 2A, 9V - 1.67A (Max 15W)\r\n<br> - Sản xuất tại: 65 W\r\n<br> - Hãng Dài 10.8 cm - Ngang 5.2 cm - Cao 3 cm', 1, 0),
(30, 'Cáp Type C - Type C 1m Hydrus DS464', '200000', '100000', '4b9515e06f.jpeg', 1, '2022-05-19', 7, 100, '<b>Thông số kĩ thuật</b>\r\n<br> - Công nghệ/Tiện ích Hỗ trợ sạc nhanh\r\n<br> - Chức năng Sạc\r\n<br> - Đầu vào Truyền dữ liệu\r\n<br> - Đầu ra USB Type-C\r\n<br> - Độ dài dây Type C: 5V - 3A, 9V - 2A, 12V - 3A, 15V - 3A, 20V - 3A (Max 60W)\r\n<br> - Công suất tối đa 1 m\r\n<br> - Sản xuất tại 60 W\r\n<br> - Thương hiệu của Trung Quốc\r\n<br> - Hãng Thế Giới Di Động', 1, 0),
(31, 'Cáp Type C - Type C 2m Hydrus DS465', '200000', '80000', '29d1f8fd1e.jpeg', 1, '2022-05-20', 7, 99, '<b>Thông số kĩ thuật</b>\r\n<br> - Công nghệ/Tiện ích Hỗ trợ sạc nhanh\r\n<br> - Chức năng Sạc\r\n<br> - Đầu vào Truyền dữ liệu\r\n<br> - Đầu ra USB Type-C\r\n<br> - Độ dài dây Type C: 5V - 3A, 9V - 2A, 12V - 3A, 15V - 3A, 20V - 3A (Max 60W)\r\n<br> - Công suất tối đa 2 m\r\n<br> - Sản xuất tại 60 W\r\n<br> - Thương hiệu của Trung Quốc\r\n<br> - Hãng Thế Giới Di Động', 1, 1),
(32, 'Adapter Sạc USB 5W Hydrus CS-TC027 Trắng', '120000', '48000', 'cc84fda5cf.jpg', 1, '2022-05-20', 7, 20, '<b>Thông số kĩ thuật</b>\r\n<br> - Chức năng: Sạc\r\n<br> - Model: CS-TC027\r\n<br> - Đầu vào: 100-240V~50/60Hz, 0.2A\r\n<br> - Đầu ra: USB: 5V - 1A\r\n<br> - Dòng sạc tối đa: 5 W\r\n<br> - Kích thước: Dài 7.1 cm - Ngang 4 cm - Cao 1.9 cm\r\n<br> - Thương hiệu của: Thế Giới Di Động\r\n<br> - Sản xuất tại: Trung Quốc\r\n<br> - Hãng Hydrus. Xem thông tin hãng', 1, 0),
(33, 'Gimbal chống rung Zhiyun Smooth XS', '1370000', '1370000', 'ac471e68eb.jpg', 1, '2022-05-25', 8, 15, '<b>Thông số kĩ thuật:</b>\r\n<br> - Phù hợp với: Điện thoại từ 4.7 - 6.7 inch\r\n<br> - Kết nối: Bluetooth 5.0\r\n<br> - Trục chống rung: Trục cuộn\r\n<br> - Phạm vi góc quay: Trục quay\r\n<br> - Thời gian sử dụng: Trục cuộn 270 độ - Trục xoay 268 độ\r\n<br> - Chế độ: Dùng 4 giờ - Sạc 3 giờ\r\n<br> - Trọng lượng: Chế độ chân dung', 1, 0),
(34, 'Gimbal chống rung Moza Nano SE', '890000', '890000', '8f31bf8870.jpg', 1, '2022-05-25', 8, 15, '<b>Thông số kĩ thuật:</b>\r\n<br> - Phù hợp với: Điện thoại từ 4.7 - 6.7 inch\r\n<br> - Kết nối: Bluetooth 4.0\r\n<br> - Trục chống rung: Bluetooth 5.0\r\n<br> - Phạm vi góc quay: Trục cuộn\r\n<br> - Thời gian sử dụng: Trục cuộn 270 độ\r\n<br> - Chế độ: Dùng 10 giờ - Sạc 2.5 giờ\r\n<br> - Trọng lượng: Chế độ chân dung', 1, 0),
(35, 'Gậy chụp ảnh Bluetooth Tripod Xmobile K06 Đen', '300000', '300000', '6368f1fbc8.jpg', 1, '2022-05-25', 8, 25, '<b>Thông số kĩ thuật:</b>\r\n<br>- Phù hợp với: Điện thoại dưới 6 inch\r\n<br>- Kết nối: Bluetooth', 1, 0),
(36, 'Gậy Chụp Ảnh Bluetooth Cosano HD-P7', '150000', '150000', '4c40bb23e1.jpg', 1, '2022-05-25', 8, 30, '<b>Thông số kĩ thuật:</b>\r\n<br> - Tương thích: Điện thoại dưới 6 inch\r\n<br> - Thời gian sử dụng: 20 giờ\r\n<br> - Thời gian sạc đầy: 0.5 giờ\r\n<br> - Độ dài tối thiểu: 20 cm\r\n<br> - Độ dài tối đa: 80 cm\r\n<br> - Thương hiệu của: Trung Quốc\r\n<br> - Sản xuất tại: Trung Quốc', 1, 0),
(37, 'Gậy Chụp Ảnh Xmobile Hình Cô gái CSA005', '90000', '90000', '93005fbfe0.jpg', 1, '2022-05-25', 8, 50, '<b>Thông số kĩ thuật:</b>\r\n<br> - Phù hợp với: Điện thoại dưới 6 inch', 1, 0),
(38, 'Gậy Chụp Ảnh Osmia OW5', '70000', '70000', '7a631cb669.jpg', 1, '2022-05-25', 8, 100, '<b>Thông số kĩ thuật:</b>\r\n<br> - Phù hợp với: Điện thoại dưới 6 inch', 1, 0),
(39, 'Gậy Chụp Ảnh Mini Cosano CW1', '50000', '50000', '7c347eadda.jpg', 1, '2022-05-25', 8, 100, '<b>Thông số kĩ thuật:</b>\r\n<br> - Phù hợp với: Điện thoại dưới 6 inch', 1, 0),
(40, 'Gậy Chụp Ảnh Osmia OW4', '70000', '70000', '8d4973b1b3.jpg', 1, '2022-05-25', 8, 100, '<b>Thông số kĩ thuật:</b>\r\n<br> - Phù hợp với: Điện thoại dưới 6 inch', 1, 0),
(41, 'Gậy Chụp Ảnh Xmobile Hình Stitch CSA004', '90000', '90000', 'ce2d8b2ae6.jpg', 1, '2022-05-25', 8, 100, '<b>Thông số kĩ thuật:</b>\r\n<br> - Phù hợp với: Điện thoại dưới 6 inch', 1, 0),
(42, 'Gậy Chụp Ảnh Osmia OW2', '70000', '70000', 'e1afeccdd5.jpg', 1, '2022-05-25', 8, 100, '<b>Thông số kĩ thuật:</b>\r\n<br> - Phù hợp với: Điện thoại dưới 6 inch', 1, 0),
(43, 'Gậy Chụp Ảnh Xmobile Hình Kitty CSA003', '90000', '89999', 'a18a5dd51f.jpg', 1, '2022-05-25', 8, 100, '<b>Thông số kĩ thuật:</b>\r\n<br> - Phù hợp với: Điện thoại dưới 6 inch', 1, 0),
(44, 'Đế điện thoại xe hơi Vent mount Pro With MagSafe Belkin WIC002btGR Bạc', '1590000', '1590000', '4377426429.jpg', 1, '2022-05-25', 9, 50, '<b>Đặc điểm nổi bật</b>\r\n<br> - Thiết kế để gắn ở quạt gió trên ô tô.\r\n<br> - Thiết kế riêng cho dòng iPhone 12, kết nối Magsafe chắc chắn.\r\n<br> - Tương thích với ốp lưng MagSafe (được Apple công nhận).', 1, 0),
(45, 'Đế điện thoại xe hơi Vent mount Belkin F7U017BT Đen', '769000', '669000', '092b939367.jpg', 1, '2022-05-25', 9, 100, '<b>Đặc điểm nổi bật</b>\r\n<br> - Kiểu dáng nhỏ nhắn, phù hợp đa số các lỗ thông hơi trên ô tô. \r\n<br> - Sử dụng ở chế độ dọc hoặc ngang linh hoạt nhờ khả năng xoay 180 độ.\r\n<br> - Vừa vặn cho smartphone có màn hình tối đa 5.5 inch (bao gồm ốp điện thoại).\r\n<br> - Tích hợp giá đỡ cáp, thu gọn cáp sạc và sử dụng tiện lợi. ', 1, 0),
(46, 'Đế Laptop Rain Design RD10038 Nhôm Xám', '1290000', '1290000', 'd11f8afa93.jpg', 1, '2022-05-25', 9, 100, '<b>Đặc điểm nổi bật</b>\r\n<br> - Thiết kế đế laptop dọc độc đáo giúp tiết kiệm không gian bàn làm việc. \r\n<br> - Chất liệu nhôm (Aluminum) nguyên khối liền mảnh sang trọng, bền bỉ, tản nhiệt hiệu quả. \r\n<br> - Bên trong khe sườn để Macbook, có đệm bọc cao su chống trầy xước máy.\r\n<br> - Dùng cho mọi dòng Macbook từ 12 – 16 inch và các máy tính xách tay tương thích khác.', 1, 0),
(47, 'Đế Laptop Rain Design RD10037 Nhôm Bạc', '1290000', '1290000', '1e470c5392.jpg', 1, '2022-05-25', 9, 100, '<b>Đặc điểm nổi bật</b>\r\n<br> - Thiết kế bằng hợp kim nhôm (Aluminum) cao cấp nguyên khối chắc chắn, bền bỉ.\r\n<br> - Giá đỡ máy tính xách tay dọc giúp tiết kiệm không gian bàn làm việc\r\n<br> - Tăng luồng không khí xung quanh để giúp máy tản nhiệt tốt hơn.\r\n<br> - Bên trong khe sườn để Macbook có đệm bọc cao su cao cấp bảo vệ thiết bị đặt vào giá đỡ không bị trầy xước.\r\n<br> - Phù hợp với tất cả các Macbook từ 12 – 16 inch và các dòng laptop tương tự khác', 1, 0),
(48, 'Đế Tablet Rain Design RD10055 Nhôm Xám', '1190000', '1190000', 'c53bbd26ae.jpg', 1, '2022-05-25', 9, 100, '<b>Đặc điểm nổi bật</b>\r\n<br> - Vẻ ngoài sang trọng, chân đế lớn đặt vững vàng trên mặt phẳng.\r\n<br> - Điều khiển góc nghiêng 10º - 50º chính xác để có tầm nhìn xem phim phù hợp nhất. \r\n<br> - Bằng nhôm nguyên khối cao cấp bền bỉ, tản nhiệt hiệu quả. \r\n<br> - Sạc pin tiện lợi qua khe cắm sạc. \r\n<br> - Đặt vừa các dòng iPad từ 9.7 - 12.9 inch và nhiều mẫu tablet khác.', 1, 0),
(49, 'Đế Laptop Rain Design RD12031 Nhôm Bạc', '1790000', '1790000', 'c3071307e6.jpg', 1, '2022-05-25', 9, 100, '<b>Đặc điểm nổi bật</b>\r\n<br> - Điều chỉnh độ cao dễ dàng với thanh trượt phía trước và nâng màn hình lên ngang tầm mắt để có tư thế tốt hơn.\r\n<br> - Miếng đệm cao su trên giá đỡ bảo vệ máy tính xách tay và bàn của bạn.\r\n<br> - Thiết kế nghiêng giúp tản nhiệt tốt, tạo khoảng cách phù hợp giữa mắt người dùng và màn hình máy tính.\r\n<br> - Chất liệu hợp kim nhôm (Aluminum) cao cấp nguyên khối, làm mát máy tính giúp tản nhiệt tối ưu nhất.\r\n<br> - Phù hợp với tất cả các Macbook từ 12 inch – 16 inch và hầu hết các máy tính xách tay khác.', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Normal');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `address` varchar(500) NOT NULL,
  `isConfirmed` tinyint(4) NOT NULL DEFAULT 0,
  `captcha` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `fullname`, `dob`, `password`, `role_id`, `status`, `address`, `isConfirmed`, `captcha`) VALUES
(1, 'admin@gmail.com', 'Admin', '0000-00-00', '0cc175b9c0f1b6a831c399e269772661', 1, 1, '', 1, ''),
(2, 'viettrungcntt03@gmail.com', 'Nguyễn Việt Trung', '2001-09-30', 'c4ca4238a0b923820dcc509a6f75849b', 2, 1, 'Thái Nguyên', 1, '56661');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`),
  ADD KEY `product_id` (`productId`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`orderId`),
  ADD KEY `product_id` (`productId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cate_id` (`cateId`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cateId`) REFERENCES `categories` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
