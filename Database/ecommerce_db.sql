-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2021 at 05:31 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `c_id` int(11) NOT NULL,
  `c_name` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`c_id`, `c_name`, `status`) VALUES
(1, 'Special Offer', 1),
(2, 'Trousers', 1),
(3, 'tshirts', 0),
(4, 'trousers', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dealer`
--

CREATE TABLE `tbl_dealer` (
  `d_id` int(11) NOT NULL,
  `l_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `d_price` int(11) NOT NULL,
  `d_last_date` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_display_img`
--

CREATE TABLE `tbl_display_img` (
  `d_img_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `d_img_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `l_id` int(11) NOT NULL,
  `l_email` varchar(30) NOT NULL,
  `l_pass` varchar(30) NOT NULL,
  `l_type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`l_id`, `l_email`, `l_pass`, `l_type`) VALUES
(1, 'omundi@gmail.com', 'AAAAAAAAAA54132AA6AAAAAAAAAAAA', 'dealer'),
(2, 'omundi2@gmail.com', 'AAAAAAAAAA54132AA6AAAAAAAAAAAA', 'dealer'),
(3, 'omundi3@gmail.com', 'AAAAAAAAAA54132AA6AAAAAAAAAAAA', 'public');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `o_id` int(11) NOT NULL,
  `l_id` int(11) NOT NULL,
  `order_date` varchar(30) NOT NULL,
  `order_status` varchar(30) NOT NULL,
  `grand_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_detail`
--

CREATE TABLE `tbl_order_detail` (
  `o_detail_id` int(11) NOT NULL,
  `o_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `user_qty` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `p_id` int(11) NOT NULL,
  `sub_id` int(11) NOT NULL,
  `p_name` varchar(30) NOT NULL,
  `p_desc` varchar(30) NOT NULL,
  `p_price` int(11) NOT NULL,
  `old_price` int(100) NOT NULL,
  `p_qty` int(11) NOT NULL,
  `p_type` varchar(50) NOT NULL,
  `p_img` varchar(150) NOT NULL,
  `p_company` varchar(30) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`p_id`, `sub_id`, `p_name`, `p_desc`, `p_price`, `old_price`, `p_qty`, `p_type`, `p_img`, `p_company`, `status`) VALUES
(1, 1, 'Trouser', 'Best Product', 3000, 4580, 26, 'special', 'images/productImages/cloth1.jpg', 'ProTech', 'true'),
(2, 2, 'Mens shorts', 'Smart', 4850, 6000, 45, 'special', 'images/productImages/cloth9.jpg', 'Nata', 'true'),
(3, 2, 'Men\'s Suits', 'Look Good', 10000, 12500, 10, 'special', 'images/productImages/cloth3.jpg', 'ProTech', 'true'),
(4, 2, 'Men\'s Suits', 'Look Good', 1000, 1500, 10, 'special', 'images/productImages/cloth5.jpg', 'ProTech', 'true'),
(5, 2, 'Men\'s Suits', 'Look Good', 1800, 3500, 10, 'special', 'images/productImages/cloth6.jpg', 'ProTech', 'true'),
(6, 2, 'Men\'s Suits', 'Look Good', 1800, 3500, 10, 'special', 'images/productImages/cloth6.jpg', 'ProTech', 'true'),
(7, 2, 'Men\'s Suits', 'Look Good', 1800, 3500, 10, 'special', 'images/productImages/cloth2.jpg', 'ProTech', 'true'),
(8, 2, 'Men\'s Suits', 'Look Good', 1800, 3500, 10, 'special', 'images/productImages/cloth3.jpg', 'ProTech', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_dealer_info`
--

CREATE TABLE `tbl_product_dealer_info` (
  `d_id` int(11) NOT NULL,
  `d_name` varchar(30) NOT NULL,
  `d_contact` varchar(20) NOT NULL,
  `d_address` varchar(50) NOT NULL,
  `d_email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_special_product`
--

CREATE TABLE `tbl_special_product` (
  `l_id` int(11) NOT NULL,
  `p_id` int(100) NOT NULL,
  `sub_id` int(11) NOT NULL,
  `p_name` varchar(30) NOT NULL,
  `p_desc` varchar(30) NOT NULL,
  `p_price` int(11) NOT NULL,
  `old_price` int(100) NOT NULL,
  `p_qty` int(11) NOT NULL,
  `p_type` varchar(50) NOT NULL,
  `p_img` varchar(150) NOT NULL,
  `p_company` varchar(30) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_special_product`
--

INSERT INTO `tbl_special_product` (`l_id`, `p_id`, `sub_id`, `p_name`, `p_desc`, `p_price`, `old_price`, `p_qty`, `p_type`, `p_img`, `p_company`, `status`) VALUES
(1, 0, 1, 'Trouser', 'Best Product', 3000, 4580, 26, 'special', 'images/productImages/cloth2.jpg', 'ProTech', 'true'),
(2, 0, 2, 'Mens shorts', 'Smart', 4850, 6000, 45, 'special', 'images/productImages/cloth9.jpg', 'Nata', 'true'),
(3, 0, 2, 'Men\'s Suits', 'Look Good', 10000, 12500, 10, 'special', 'images/productImages/cloth3.jpg', 'ProTech', 'true'),
(4, 0, 2, 'Men\'s Suits', 'Look Good', 1000, 1500, 10, 'special', 'images/productImages/cloth5.jpg', 'ProTech', 'true'),
(5, 0, 2, 'Men\'s Suits', 'Look Good', 1800, 3500, 10, 'special', 'images/productImages/cloth6.jpg', 'ProTech', 'true'),
(6, 0, 2, 'Men\'s Suits', 'Look Good', 1800, 3500, 10, 'special', 'images/productImages/cloth6.jpg', 'ProTech', 'true'),
(7, 0, 2, 'Men\'s Suits', 'Look Good', 1800, 3500, 10, 'special', 'images/productImages/cloth2.jpg', 'ProTech', 'true'),
(8, 0, 2, 'Men\'s Suits', 'Look Good', 1800, 3500, 10, 'special', 'images/productImages/cloth3.jpg', 'ProTech', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_st_new_user`
--

CREATE TABLE `tbl_st_new_user` (
  `email_id` int(100) NOT NULL,
  `new_pass` varchar(1000) NOT NULL,
  `status` varchar(100) NOT NULL,
  `name` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sub_cat`
--

CREATE TABLE `tbl_sub_cat` (
  `sub_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `sub_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_sub_cat`
--

INSERT INTO `tbl_sub_cat` (`sub_id`, `c_id`, `sub_name`) VALUES
(1, 1, 'Chinese shirts'),
(2, 2, 'Short Trouser');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_detail`
--

CREATE TABLE `tbl_user_detail` (
  `u_id` int(11) NOT NULL,
  `l_id` int(11) NOT NULL,
  `u_fname` varchar(20) DEFAULT NULL,
  `u_lname` varchar(20) DEFAULT NULL,
  `u_gender` varchar(20) DEFAULT NULL,
  `u_contact` varchar(20) DEFAULT NULL,
  `u_add` varchar(50) DEFAULT NULL,
  `u_city` int(11) DEFAULT NULL,
  `u_state` int(11) DEFAULT NULL,
  `u_country` int(11) DEFAULT NULL,
  `u_pincode` int(11) DEFAULT NULL,
  `u_join_date` varchar(20) NOT NULL,
  `u_laste_date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user_detail`
--

INSERT INTO `tbl_user_detail` (`u_id`, `l_id`, `u_fname`, `u_lname`, `u_gender`, `u_contact`, `u_add`, `u_city`, `u_state`, `u_country`, `u_pincode`, `u_join_date`, `u_laste_date`) VALUES
(1, 1, 'Erick', 'Omari', 'male', '0785963245', '854dfdgdgdfafsgsg', 1, 1, 1, 402003, '2021/12/12', '2021/12/12'),
(2, 2, 'fnvbj', 'vbn', 'male', '5858855888', 'fgnfnfhguidhguidhu', 1, 1, 1, 122255, '2021/12/12', '2021/12/12'),
(3, 3, 'null', 'null', 'null', 'null', 'null', 1, 1, 1, 0, '2021/12/12', '2021/12/12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `tbl_dealer`
--
ALTER TABLE `tbl_dealer`
  ADD PRIMARY KEY (`d_id`),
  ADD KEY `l_id` (`l_id`),
  ADD KEY `p_id` (`p_id`);

--
-- Indexes for table `tbl_display_img`
--
ALTER TABLE `tbl_display_img`
  ADD PRIMARY KEY (`d_img_id`),
  ADD KEY `p_id` (`p_id`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`l_id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`o_id`),
  ADD KEY `l_id` (`l_id`);

--
-- Indexes for table `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  ADD PRIMARY KEY (`o_detail_id`),
  ADD KEY `o_id` (`o_id`),
  ADD KEY `p_id` (`p_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `sub_id` (`sub_id`);

--
-- Indexes for table `tbl_product_dealer_info`
--
ALTER TABLE `tbl_product_dealer_info`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `tbl_special_product`
--
ALTER TABLE `tbl_special_product`
  ADD PRIMARY KEY (`l_id`),
  ADD KEY `sub_id` (`sub_id`);

--
-- Indexes for table `tbl_st_new_user`
--
ALTER TABLE `tbl_st_new_user`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `tbl_sub_cat`
--
ALTER TABLE `tbl_sub_cat`
  ADD PRIMARY KEY (`sub_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `tbl_user_detail`
--
ALTER TABLE `tbl_user_detail`
  ADD PRIMARY KEY (`u_id`),
  ADD KEY `l_id` (`l_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_dealer`
--
ALTER TABLE `tbl_dealer`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_display_img`
--
ALTER TABLE `tbl_display_img`
  MODIFY `d_img_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `l_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `o_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  MODIFY `o_detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_product_dealer_info`
--
ALTER TABLE `tbl_product_dealer_info`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_special_product`
--
ALTER TABLE `tbl_special_product`
  MODIFY `l_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_st_new_user`
--
ALTER TABLE `tbl_st_new_user`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_sub_cat`
--
ALTER TABLE `tbl_sub_cat`
  MODIFY `sub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_user_detail`
--
ALTER TABLE `tbl_user_detail`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_dealer`
--
ALTER TABLE `tbl_dealer`
  ADD CONSTRAINT `tbl_dealer_ibfk_1` FOREIGN KEY (`l_id`) REFERENCES `tbl_login` (`l_id`),
  ADD CONSTRAINT `tbl_dealer_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `tbl_product` (`p_id`);

--
-- Constraints for table `tbl_display_img`
--
ALTER TABLE `tbl_display_img`
  ADD CONSTRAINT `tbl_display_img_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `tbl_product` (`p_id`);

--
-- Constraints for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD CONSTRAINT `tbl_order_ibfk_1` FOREIGN KEY (`l_id`) REFERENCES `tbl_login` (`l_id`);

--
-- Constraints for table `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  ADD CONSTRAINT `tbl_order_detail_ibfk_1` FOREIGN KEY (`o_id`) REFERENCES `tbl_order` (`o_id`),
  ADD CONSTRAINT `tbl_order_detail_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `tbl_product` (`p_id`);

--
-- Constraints for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `tbl_product_ibfk_1` FOREIGN KEY (`sub_id`) REFERENCES `tbl_sub_cat` (`sub_id`);

--
-- Constraints for table `tbl_sub_cat`
--
ALTER TABLE `tbl_sub_cat`
  ADD CONSTRAINT `tbl_sub_cat_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `tbl_category` (`c_id`);

--
-- Constraints for table `tbl_user_detail`
--
ALTER TABLE `tbl_user_detail`
  ADD CONSTRAINT `tbl_user_detail_ibfk_1` FOREIGN KEY (`l_id`) REFERENCES `tbl_login` (`l_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
