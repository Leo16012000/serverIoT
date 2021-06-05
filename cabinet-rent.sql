-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 05, 2021 lúc 03:37 AM
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
  `ID` int(3) NOT NULL,
  `FeedID` int(3) NOT NULL,
  `FeedKey` varchar(30) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `Kích thước` int(3) NOT NULL,
  `state` enum('ready','in_progress') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `cabinet`
--

INSERT INTO `cabinet` (`ID`, `FeedID`, `FeedKey`, `Kích thước`, `state`) VALUES
(1, 1638515, 'rc-servo-590-number-1', 20, 'in_progress');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `history_trade`
--

CREATE TABLE `history_trade` (
  `ID` int(10) NOT NULL,
  `Time_Arrive` datetime NOT NULL,
  `Time_Leave` datetime NOT NULL,
  `PhoneNumSender` varchar(20) NOT NULL,
  `PhoneNumReceiver` varchar(20) NOT NULL,
  `Fee` int(6) NOT NULL,
  `User_ID` int(6) NOT NULL,
  `Cabintet_ID` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transasction_in_progress`
--

CREATE TABLE `transasction_in_progress` (
  `Time_Arrive` datetime NOT NULL,
  `Time_Leave` datetime DEFAULT NULL,
  `PhoneNum_Sender` varchar(20) NOT NULL,
  `PhoneNumReceiver` varchar(20) NOT NULL,
  `Fee` int(6) NOT NULL,
  `State` enum('ready','in_progress') NOT NULL,
  `Cabintet_ID` int(3) NOT NULL,
  `UserID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `transasction_in_progress`
--

INSERT INTO `transasction_in_progress` (`Time_Arrive`, `Time_Leave`, `PhoneNum_Sender`, `PhoneNumReceiver`, `Fee`, `State`, `Cabintet_ID`, `UserID`) VALUES
('2021-06-03 20:33:17', NULL, '0353323643', '0983098604', 5000, 'in_progress', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `ID` int(6) NOT NULL,
  `Fullname` varchar(50) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `Username` varchar(20) CHARACTER SET utf8 NOT NULL,
  `PhoneNum` varchar(20) NOT NULL,
  `Password` varchar(20) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`ID`, `Fullname`, `Username`, `PhoneNum`, `Password`) VALUES
(1, 'Đặng Tuấn Anh', '0353323643', '0353323643', '123456');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cabinet`
--
ALTER TABLE `cabinet`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `history_trade`
--
ALTER TABLE `history_trade`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `Cabintet_ID` (`Cabintet_ID`);

--
-- Chỉ mục cho bảng `transasction_in_progress`
--
ALTER TABLE `transasction_in_progress`
  ADD PRIMARY KEY (`Cabintet_ID`),
  ADD KEY `UserID` (`UserID`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cabinet`
--
ALTER TABLE `cabinet`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `history_trade`
--
ALTER TABLE `history_trade`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `history_trade`
--
ALTER TABLE `history_trade`
  ADD CONSTRAINT `history_trade_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `history_trade_ibfk_2` FOREIGN KEY (`Cabintet_ID`) REFERENCES `cabinet` (`ID`);

--
-- Các ràng buộc cho bảng `transasction_in_progress`
--
ALTER TABLE `transasction_in_progress`
  ADD CONSTRAINT `transasction_in_progress_ibfk_1` FOREIGN KEY (`Cabintet_ID`) REFERENCES `cabinet` (`ID`),
  ADD CONSTRAINT `transasction_in_progress_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
