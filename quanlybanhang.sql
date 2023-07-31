-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 29, 2023 lúc 03:40 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlybanhang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chamcong`
--

CREATE TABLE `chamcong` (
  `Thang` tinyint(3) UNSIGNED NOT NULL,
  `Nam` smallint(5) UNSIGNED NOT NULL,
  `MaNV` int(11) NOT NULL,
  `NgayCong` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chamcong`
--

INSERT INTO `chamcong` (`Thang`, `Nam`, `MaNV`, `NgayCong`) VALUES
(7, 2023, 101, 20),
(7, 2023, 102, 22),
(7, 2023, 103, 18),
(8, 2023, 101, 23),
(8, 2023, 102, 21),
(8, 2023, 103, 19);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietddh`
--

CREATE TABLE `chitietddh` (
  `MaDDH` char(5) NOT NULL,
  `MaMH` int(11) NOT NULL,
  `SoLuong` int(11) NOT NULL,
  `GiamGia` date DEFAULT '2023-01-01'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dondathang`
--

CREATE TABLE `dondathang` (
  `MaDDH` char(5) NOT NULL,
  `MaKH` varchar(10) NOT NULL,
  `MaNV` int(11) NOT NULL,
  `NgayDH` date NOT NULL,
  `NgayGiao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `dondathang`
--

INSERT INTO `dondathang` (`MaDDH`, `MaKH`, `MaNV`, `NgayDH`, `NgayGiao`) VALUES
('DDH10', 'KH99', 1100, '2023-07-31', '2023-08-05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donvi`
--

CREATE TABLE `donvi` (
  `MaDV` char(2) NOT NULL,
  `TenDV` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `donvi`
--

INSERT INTO `donvi` (`MaDV`, `TenDV`) VALUES
('01', 'Department A'),
('02', 'Department B'),
('03', 'Department C'),
('04', 'Department D'),
('05', 'Department E'),
('10', 'Department XYZ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `MaKH` varchar(10) NOT NULL,
  `TenKH` varchar(40) NOT NULL DEFAULT ' ',
  `DiaChi` varchar(60) NOT NULL DEFAULT ' ',
  `DienThoai` varchar(11) NOT NULL DEFAULT ' ',
  `MaTP` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`MaKH`, `TenKH`, `DiaChi`, `DienThoai`, `MaTP`) VALUES
('KH001', 'Customer A', 'Address A', '1234567890', '01'),
('KH002', 'Customer B', 'Address B', '9876543210', '02'),
('KH003', 'Customer C', 'Address C', '4567890123', '03'),
('KH004', 'Customer D', 'Address D', '7890123456', '04'),
('KH005', 'Customer E', 'Address E', '2345678901', '05'),
('KH100', 'Customer XYZ', 'Address XYZ', '9998887770', '50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `luong9901`
--

CREATE TABLE `luong9901` (
  `Thang` date NOT NULL,
  `Nam` smallint(6) NOT NULL,
  `MaNV` int(11) NOT NULL,
  `HoTen` varchar(50) NOT NULL,
  `LuongCB` int(10) UNSIGNED NOT NULL,
  `NgayCong` tinyint(4) NOT NULL,
  `Luong` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `luuddh`
--

CREATE TABLE `luuddh` (
  `MaDDH` char(5) NOT NULL,
  `MaKH` varchar(10) NOT NULL,
  `NgayDH` date DEFAULT NULL,
  `NgayGiao` date DEFAULT NULL,
  `MaMH` varchar(10) DEFAULT NULL,
  `SoLuong` int(10) DEFAULT NULL,
  `GiamGia` date DEFAULT '2023-01-01'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mathang`
--

CREATE TABLE `mathang` (
  `MaMH` int(11) NOT NULL,
  `TenMH` varchar(30) NOT NULL,
  `DonViTinh` varchar(20) NOT NULL DEFAULT ' ',
  `DonGia` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `HinhSP` text DEFAULT NULL,
  `MaNCC` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `mathang`
--

INSERT INTO `mathang` (`MaMH`, `TenMH`, `DonViTinh`, `DonGia`, `HinhSP`, `MaNCC`) VALUES
(1, 'Product A', 'Unit A', 100, NULL, 1),
(2, 'Product B', 'Unit B', 150, 'image1.jpg', 2),
(3, 'Product C', 'Unit C', 200, 'image2.jpg', 3),
(4, 'Product D', 'Unit D', 80, NULL, 4),
(5, 'Product E', 'Unit E', 120, 'image3.jpg', 5),
(6, 'Product XYZ', 'Unit XYZ', 250, NULL, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhacungcap`
--

CREATE TABLE `nhacungcap` (
  `MaNCC` int(11) NOT NULL,
  `TenNCC` varchar(30) NOT NULL,
  `DiaChi` varchar(60) NOT NULL DEFAULT ' ',
  `DienThoai` varchar(11) NOT NULL DEFAULT ' '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhacungcap`
--

INSERT INTO `nhacungcap` (`MaNCC`, `TenNCC`, `DiaChi`, `DienThoai`) VALUES
(1, 'Supplier A', 'TP.HCM', '1234567890'),
(2, 'Supplier B', 'Address HaNoi', '9876543210'),
(3, 'Supplier C', 'Address C', '4567890123'),
(4, 'Supplier D', 'Address D', '7890123456'),
(5, 'Supplier E', 'Address E', '2345678901'),
(6, 'Supplier XYZ', 'Address XYZ', '9998887770');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MaNV` int(11) NOT NULL,
  `HoLot` varchar(30) NOT NULL DEFAULT ' ',
  `TenNV` varchar(20) NOT NULL DEFAULT ' ',
  `Phai` enum('F','M') NOT NULL DEFAULT 'F',
  `LuongCB` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `NgayNViec` date NOT NULL,
  `DiaChiNV` varchar(60) NOT NULL DEFAULT ' ',
  `DienThoaiNV` varchar(11) DEFAULT ' ',
  `HinhNV` text DEFAULT NULL,
  `MaDV` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`MaNV`, `HoLot`, `TenNV`, `Phai`, `LuongCB`, `NgayNViec`, `DiaChiNV`, `DienThoaiNV`, `HinhNV`, `MaDV`) VALUES
(1, 'Nguyen', 'Van A', 'M', 3000000, '2023-07-01', 'Address A', '1234567890', NULL, NULL),
(2, 'Tran', 'Thi B', 'F', 3500000, '2023-07-02', 'Address B', '9876543210', 'image1.jpg', NULL),
(3, 'Le', 'Van C', 'M', 3200000, '2023-07-03', 'Address C', NULL, 'image2.jpg', NULL),
(4, 'Pham', 'Thi D', 'F', 2800000, '2023-07-04', 'Quận 1', '7890123456', NULL, NULL),
(5, 'Hoang', 'Van E', 'M', 3400000, '2023-07-05', 'Address E', '2345678901', 'image3.jpg', NULL),
(6, 'Nguyen', 'Thi XYZ', 'F', 4000000, '2023-07-10', 'Address XYZ', '9998887770', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tinhtp`
--

CREATE TABLE `tinhtp` (
  `MaTP` char(2) NOT NULL,
  `TenTP` varchar(30) NOT NULL DEFAULT ' '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tinhtp`
--

INSERT INTO `tinhtp` (`MaTP`, `TenTP`) VALUES
('01', 'City A'),
('02', 'City B'),
('03', 'City C'),
('04', 'City D'),
('05', 'City E'),
('50', 'City XYZ');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chamcong`
--
ALTER TABLE `chamcong`
  ADD PRIMARY KEY (`Thang`,`Nam`,`MaNV`);

--
-- Chỉ mục cho bảng `chitietddh`
--
ALTER TABLE `chitietddh`
  ADD PRIMARY KEY (`MaDDH`,`MaMH`);

--
-- Chỉ mục cho bảng `dondathang`
--
ALTER TABLE `dondathang`
  ADD PRIMARY KEY (`MaDDH`);

--
-- Chỉ mục cho bảng `donvi`
--
ALTER TABLE `donvi`
  ADD PRIMARY KEY (`MaDV`),
  ADD UNIQUE KEY `TenDV` (`TenDV`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`MaKH`),
  ADD UNIQUE KEY `TenKH` (`TenKH`);

--
-- Chỉ mục cho bảng `luong9901`
--
ALTER TABLE `luong9901`
  ADD PRIMARY KEY (`Thang`,`Nam`,`MaNV`);

--
-- Chỉ mục cho bảng `luuddh`
--
ALTER TABLE `luuddh`
  ADD PRIMARY KEY (`MaDDH`);

--
-- Chỉ mục cho bảng `mathang`
--
ALTER TABLE `mathang`
  ADD PRIMARY KEY (`MaMH`),
  ADD UNIQUE KEY `TenMH` (`TenMH`);

--
-- Chỉ mục cho bảng `nhacungcap`
--
ALTER TABLE `nhacungcap`
  ADD PRIMARY KEY (`MaNCC`),
  ADD UNIQUE KEY `TenNCC` (`TenNCC`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MaNV`);

--
-- Chỉ mục cho bảng `tinhtp`
--
ALTER TABLE `tinhtp`
  ADD PRIMARY KEY (`MaTP`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `mathang`
--
ALTER TABLE `mathang`
  MODIFY `MaMH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `nhacungcap`
--
ALTER TABLE `nhacungcap`
  MODIFY `MaNCC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `MaNV` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
