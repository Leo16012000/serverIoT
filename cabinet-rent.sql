-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 25, 2021 lúc 07:04 PM
-- Phiên bản máy phục vụ: 10.4.18-MariaDB
-- Phiên bản PHP: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `cabinet-rent`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cabinet`
--

CREATE TABLE `cabinet` (
  `id` int(3) NOT NULL,
  `feedid` int(3) NOT NULL,
  `feedkey` varchar(30) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `size` int(3) NOT NULL,
  `state` enum('ready','in_progress') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `cabinet`
--

INSERT INTO `cabinet` (`id`, `feedid`, `feedkey`, `size`, `state`) VALUES
(1, 1638515, 'rc-servo-590-number-1', 20, 'in_progress'),
(2, 1643652, 'rc-servo-590-number-2', 30, 'ready'),
(3, 1644073, 'rc-servo-590-number-3', 40, 'ready');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `history_trade`
--

CREATE TABLE `history_trade` (
  `ID` int(10) NOT NULL,
  `Time_Arrive` datetime NOT NULL,
  `Time_Leave` datetime NOT NULL DEFAULT current_timestamp(),
  `PhoneNumSender` varchar(20) NOT NULL,
  `PhoneNumReceiver` varchar(20) NOT NULL,
  `Fee` int(6) NOT NULL,
  `User_ID` int(6) NOT NULL,
  `Cabinet_ID` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `history_trade`
--

INSERT INTO `history_trade` (`ID`, `Time_Arrive`, `Time_Leave`, `PhoneNumSender`, `PhoneNumReceiver`, `Fee`, `User_ID`, `Cabinet_ID`) VALUES
(4, '2021-06-18 19:06:56', '2021-06-19 02:48:21', '0353323643', '0213112313', 5000, 1, 3),
(5, '2021-06-18 19:06:56', '2021-06-19 13:59:45', '0353323643', '0213112313', 5000, 1, 3),
(6, '2021-06-18 19:06:56', '2021-06-19 14:02:17', '0353323643', '0213112313', 5000, 1, 3),
(7, '2021-06-18 19:06:56', '2021-06-19 14:02:36', '0353323643', '0213112313', 5000, 1, 3),
(8, '2021-06-18 19:06:56', '2021-06-19 14:08:07', '0353323643', '0213112313', 5000, 1, 3),
(9, '2021-06-18 19:06:56', '2021-06-19 16:00:43', '0353323643', '0213112313', 5000, 1, 3),
(10, '2021-06-18 19:06:56', '2021-06-19 16:02:46', '0353323643', '0213112313', 5000, 1, 3),
(11, '2021-06-18 19:06:56', '2021-06-19 16:03:04', '0353323643', '0213112313', 5000, 1, 3),
(12, '2021-06-18 19:06:56', '2021-06-19 16:09:18', '0353323643', '0213112313', 5000, 1, 3),
(13, '2021-06-18 19:06:56', '2021-06-19 16:10:21', '0353323643', '0213112313', 5000, 1, 3),
(14, '2021-06-18 19:06:56', '2021-06-19 16:10:41', '0353323643', '0213112313', 5000, 1, 3),
(15, '2021-06-18 19:06:56', '2021-06-19 16:11:51', '0353323643', '0213112313', 5000, 1, 3),
(16, '2021-06-18 19:06:56', '2021-06-19 16:20:33', '0353323643', '0213112313', 5000, 1, 3),
(17, '2021-06-18 19:06:56', '2021-06-19 16:21:08', '0353323643', '0213112313', 5000, 1, 3),
(18, '2021-06-18 19:06:56', '2021-06-19 16:22:58', '0353323643', '0213112313', 5000, 1, 3),
(19, '2021-06-18 19:06:56', '2021-06-19 16:23:19', '0353323643', '0213112313', 5000, 1, 3),
(20, '2021-06-18 19:06:56', '2021-06-19 16:24:36', '0353323643', '0213112313', 5000, 1, 3),
(21, '2021-06-18 19:06:56', '2021-06-19 16:25:36', '0353323643', '0213112313', 5000, 1, 3),
(22, '2021-06-19 09:30:41', '2021-06-19 16:31:01', '0353323643', '0231313212', 5000, 1, 3),
(23, '2021-06-19 12:32:06', '2021-06-19 19:32:28', '0353323643', '0321312122', 5000, 1, 2),
(24, '2021-06-19 18:05:54', '2021-06-20 01:06:24', '0353323643', '01111111111', 5000, 1, 3),
(25, '2021-06-19 18:05:54', '2021-06-20 01:06:39', '0353323643', '01111111111', 5000, 1, 3),
(26, '2021-06-25 04:37:24', '2021-06-25 11:37:41', '0353323643', '0546545645', 5000, 1, 1),
(27, '2021-06-25 04:38:03', '2021-06-25 11:39:05', '0353323643', '01111111111', 5000, 1, 2),
(28, '2021-06-25 04:39:52', '2021-06-25 11:40:08', '0353323643', '0222222222', 5000, 1, 1),
(29, '2021-06-25 04:44:45', '2021-06-25 11:46:43', '0353323643', '0333333333', 5000, 1, 3),
(30, '2021-06-25 04:46:55', '2021-06-25 11:47:19', '0353323643', '0121212112', 5000, 1, 3),
(31, '2021-06-25 04:47:30', '2021-06-25 11:48:43', '0353323643', '0211145455', 5000, 1, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transaction_in_progress`
--

CREATE TABLE `transaction_in_progress` (
  `Time_Arrive` datetime NOT NULL DEFAULT current_timestamp(),
  `Time_Leave` datetime DEFAULT NULL,
  `PhoneNum_Sender` varchar(20) NOT NULL,
  `PhoneNumReceiver` varchar(20) DEFAULT NULL,
  `Fee` int(6) NOT NULL DEFAULT 5000,
  `Cabinet_ID` int(3) NOT NULL,
  `UserID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `transaction_in_progress`
--

INSERT INTO `transaction_in_progress` (`Time_Arrive`, `Time_Leave`, `PhoneNum_Sender`, `PhoneNumReceiver`, `Fee`, `Cabinet_ID`, `UserID`) VALUES
('2021-06-25 11:53:37', NULL, '0353323643', '0213113455', 5000, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(6) NOT NULL,
  `fullname` varchar(50) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 NOT NULL,
  `phonenum` varchar(20) NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `fullname`, `username`, `phonenum`, `password`) VALUES
(1, 'Đặng Tuấn Anh', 'leo', '0353323643', '123456'),
(2, 'Nguyễn Công Hòa', 'hoa', '983098604', '123'),
(3, 'Rudolf Pham', 'rudolf', '213131321', '123');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cabinet`
--
ALTER TABLE `cabinet`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `history_trade`
--
ALTER TABLE `history_trade`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `Cabinet_ID` (`Cabinet_ID`);

--
-- Chỉ mục cho bảng `transaction_in_progress`
--
ALTER TABLE `transaction_in_progress`
  ADD PRIMARY KEY (`Cabinet_ID`),
  ADD UNIQUE KEY `UserID` (`UserID`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Username` (`username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cabinet`
--
ALTER TABLE `cabinet`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `history_trade`
--
ALTER TABLE `history_trade`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `history_trade`
--
ALTER TABLE `history_trade`
  ADD CONSTRAINT `history_trade_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `history_trade_ibfk_2` FOREIGN KEY (`Cabinet_ID`) REFERENCES `cabinet` (`id`);

--
-- Các ràng buộc cho bảng `transaction_in_progress`
--
ALTER TABLE `transaction_in_progress`
  ADD CONSTRAINT `transaction_in_progress_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `transaction_in_progress_ibfk_3` FOREIGN KEY (`Cabinet_ID`) REFERENCES `cabinet` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
