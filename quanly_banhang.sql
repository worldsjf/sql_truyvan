--1. 
select MaMH,TenMH,DonviTinh, DonGia
FROM mathang
--2 Liệt kê các mặt hàng có đơn giá >=62 thông tin gồm các cột sau: MaMH, TenMH DonViTinh, DonGia.
SELECT MaMH,TenMH,DonViTinh, DonGia
FROM mathang
WHERE DonGia>=62
-- 3. Liệt kê các mặt hàng mà nhà cung cấp có MaNCC là 4 hoặc 2 thông tin gồm các cột sau: MaNCC, TenNCC, MaMH, TenMH, DonViTinh, DonGia.
SELECT nhacungcap.MaNCC, TenNCC, MaMH, TenMH, DonViTinh, DonGia
FROM mathang JOIN nhacungcap ON mathang.MaNCC=nhacungcap.MaNCC
WHERE nhacungcap.MaNCC=4 or nhacungcap.MaNCC=2

-- 4.Liệt kê các mặt hàng mà nhà cung cấp có địa chỉ tại TP.HCM thông tin gồm các cột sau: MaNCC, TenNCC, DiaChi, MaMH, TenMH, DonViTinh, DonGia.
SELECT nhacungcap.MaNCC, TenNCC, DiaChi, MaMH, TenMH, DonViTinh, DonGia
FROM mathang JOIN nhacungcap on mathang.MaNCC=nhacungcap.MaNCC
WHERE DiaChi='TP.HCM'
-- 5. Liệt kê các đơn hàng trong khoảng thời gian từ ngày 01/01/1997 đến ngày 31/01/1997 thông tin gồm các trường sau: MaDDH, NgayDH, MaKH, TenKH, MaMH, TenMH, SoLuong.

SELECT dondathang.MaDDH, NgayDH, khachhang.MaKH, TenKH, mathang.MaMH, TenMH, chitietddh.SoLuong
FROM dondathang
JOIN khachhang on dondathang.MaKH=khachhang.MaKH
JOIN chitietddh ON dondathang.MaDDH=chitietddh.MaDDH
JOIN mathang on chitietddh.MaMH=mathang.MaMH
WHERE dondathang.NgayDH BETWEEN '1997-01-01' AND '2024-08-29'
-- 6. Liệt kê các đơn hàng trong tháng 2 năm 1997 thông tin gồm các trường sau : MaDDH, NgayDH, NgayGiao, MaNV, HoTenNV.
SELECT MaDDH, NgayDH, NgayGiao, nhanvien.MaNV,HoLot,TenNV
FROM dondathang RIGHT JOIN nhanvien on dondathang.MaNV=nhanvien.MaNV
WHERE NgayDH >= '2023-07-01' AND NgayDH < '2023-07-31';
-- 7. Liệt kê các đơn đặt hàng giao trước ngày 01/03/1997 và nhân viên phục vụ có MaNV là 4 hay 5. Thông tin gồm các trường sau : MaDDH, NgayDH, MaKH, TenKH, MaNV, HoTenNV.
SELECT dondathang.MaDDH, NgayDH, khachhang.MaKH,TenKH, nhanvien.MaNV,CONCAT(HoLot,'',TenNV) AS HoTenNV
FROM dondathang JOIN nhanvien on dondathang.MaNV=nhanvien.MaNV
JOIN khachhang on dondathang.MaKH=khachhang.MaKH
WHERE dondathang.NgayGiao < '2023-12-29' AND (nhanvien.MaNV='4' OR nhanvien.MaNV='5')
-- 8. Liệt kê các nhân viên thuộc phái Nam. Thông tin gồm các trường sau: MaNV, HoLot,TenNV, DiaChi, NgayNViec, Phai

SELECT MaNV, HoLot, TenNV, DiaChiNV, NgayNViec, Phai
FROM nhanvien 
WHERE phai='M'
-- 9. Liệt kê các nhân viên nhận việc từ ngày 01/07/1991 đến ngày 30/11/1992 và lương cơ bản  <300 thông tin gồm các Field sau: MaDV, MaNV, HoLot, TenNV, Phai, LuongCB, NgayNV.
SELECT donvi.MaDV, MaNV,HoLot, TenNV, Phai, LuongCB, NgayNViec
FROM nhanvien JOIN donvi
WHERE NgayNViec BETWEEN '1991-07-01' AND '2023-07-30' AND LuongCB<3000000

-- 10. Liệt kê các nhân viên Nữ cứ trú tại Q1 Hay Nam. Thông tin gồm các field sau: MaNV, HoLot, Ten,NV, Phai, DiaChi.

SELECT MaNV, HoLot, TenNV, Phai, DiaChiNV
FROM nhanvien
WHERE Phai='F' AND DiaChiNV='Quận 1'
-- 11. Liệt kê các nhân viên có ngày công làm việc trong tháng 1 năm 1999 nhỏ hơn 25 ngày thông tin gồm các Field sau: MaNV, HoLot, TenNV, MaDV, TenDV, Thang, Nam, NgayCong.
SELECT nhanvien.MaNV, HoLot,TenNV, chamcong.Thang, Nam, NgayCong
FROM nhanvien 
JOIN chamcong ON chamcong.MaNV=nhanvien.MaNV
WHERE chamcong.Thang = 1 AND chamcong.Nam = 1999 AND NgayCong < 25;
-- 12. Liệt kê các đơn hàng mà nhân viên phục vụ thuộc phái nữ thông tin gồm các trường sau: MaDDH, NgayDH, NgayGiao, MaNV, HoTenNV, Phai.

SELECT dondathang.MaDDH,NgayDH, NgayGiao, nhanvien.MaNV,CONCAT(HoLot,'',TenNV) AS HoTenNV, Phai
FROM nhanvien 
JOIN dondathang ON nhanvien.MaNV=dondathang.MaNV
WHERE phai='F'
-- 13. L iệt kê các đơn hàng được hẹn giao trong vòng 15 ngày sau khi đặt hàng. Thông tin gồm các trường sau: MaDDH, NgayDH, NgayGiao, MaKH, TenKH, Thời gian (Từ ngày đặt hàng đến ngày giao hàng)

SELECT dondathang.MaDDH,NgayDH,NgayGiao, khachhang.MaKH,TenKH, DATEDIFF(NgayGiao, NgayDH) As ThoiGian
FROM dondathang 
JOIN khachhang ON dondathang.MaKH = khachhang.MaKH
WHERE DATEDIFF(NgayGiao, NgayDH) <= 15;
-- 14. L iệt kê các đơn đặt hàng. Thông tin gồm các trường sau : MaDDH, NgayDH, MaMH, tenMH, SoLuong, DonGia, ThanhTien (Biết ThanhTien = SoLuong*DonGia*(1- GiamGia)
SELECT dondathang.MaDDH,NgayDH, mathang.MaMH,TenMH, chitietddh.SoLuong,DonGia, (SoLuong*DonGia*(1- GiamGia)) AS ThanhTien
FROM dondathang 
JOIN chitietddh ON dondathang.MaDDH=chitietddh.MaDDH
JOIN mathang ON chitietddh.MaMH=mathang.MaMH
-- 15. Liệt kê các đơn hàng được đặt trong quý 1 năm 1997. Thông tin gồm các trường sau :Nam, Quy, NgayDH, MaDDH, MaKH, TenKH, MaNV, TenNV
SELECT 
    YEAR(NgayDH) AS Nam,
    (CASE 
        WHEN MONTH(NgayDH) IN (1, 2, 3) THEN 1
        WHEN MONTH(NgayDH) IN (4, 5, 6) THEN 2
        WHEN MONTH(NgayDH) IN (7, 8, 9) THEN 3
        ELSE 4
    END) AS Quy,
    dondathang.MaDDH,NgayDH,khachhang.MaKH,TenKH, nhanvien.MaNV,TenNV
FROM dondathang
JOIN khachhang ON dondathang.MaKH = khachhang.MaKH
JOIN nhanvien ON dondathang.MaNV = nhanvien.MaNV
WHERE YEAR(NgayDH) = 2023 AND (MONTH(NgayDH) IN (1, 2, 3));
-- 16 Liệt kê các đơn đặt hàng có chứa các mặt hàng có mã như sau: 1,3,5,7 thông tin gồm :MaDDH, NgayDH, MaMH, TenMH

SELECT dondathang.MaDDH , NgayDH,mathang.MaMH,TenMH
FROM dondathang
JOIN chitietddh on dondathang.MaDDH=chitietddh.MaDDH
JOIN mathang ON chitietddh.MaMH=mathang.MaMH
WHERE mathang.MaMH IN(1,3,5,7)
-- 17. Đếm tổng số khách hàng theo từng TinhTp. Thông tin gồm: MaTP, TongsoKH.
SELECT MaTP, COUNT(MaKH) AS TongsoKH
FROM khachhang
GROUP BY MaTP
-- 18. Đếm tổng số nhân viên theo từng Đơn Vị. Thông tin gồm: MaDV, TenDV, TongSoNV.
SELECT donvi.MaDV,TenDV, COUNT(nhanvien.MaNV) AS TongSoNV
FROM donvi
LEFT JOIN nhanvien ON donvi.MaDV = nhanvien.MaDV
GROUP BY donvi.MaDV
-- 19. Đếm số đơn hàng. Thông tin gồm : Nam, MaKH, TenKH, TongSoDDH.
SELECT  dondathang.MaKH, TenKH, COUNT(MaDDH) As TongSoDDH, year(NgayDH) AS Nam
FROM dondathang 
JOIN khachhang ON dondathang.MaKH=khachhang.MaKH
GROUP by  dondathang.MaKH, TenKH
-- 20. Tính tổng trị (Thành tiền) của từng đơn hàng. Thông tin gồm : Nam, MaDDH, MaKH, NgayDH, NgayGiao, TongTri.

SELECT chitietddh.MaDDH,NgayDH, NgayGiao, YEAR(NgayDH) AS Nam, MaKH, SUM(SoLuong * mathang.DonGia*(1-GiamGia)) AS TongTri
FROM chitietddh
JOIN dondathang ON chitietddh.MaDDH=dondathang.MaDDH
JOIN mathang on chitietddh.MaMH=mathang.MaMH
GROUP BY MaDDH, NgayDH, NgayGiao, MaKH
-- 21. Tính tổng thành tiền của từng khách hàng trong từng năm. Thông tin gồm : Nam, MaKH, TenKH, TongTien khachhang, dondathang,mathang
SELECT dondathang.MaKH, TenKH, YEAR(NgayDH) As Nam, SUM(SoLuong*DonGia*(1-GiamGia))AS TongTien 
FROM chitietddh
JOIN mathang ON chitietddh.MaMH= mathang.MaMH
JOIN dondathang ON dondathang.MaDDH=chitietddh.MaDDH
JOIN khachhang ON dondathang.MaKH=khachhang.MaKH
GROUP BY dondathang.MaKH, TenKH,YEAR(NgayDH)
                                                        
                                                    
                                                        
-- 22. Liệt kê danh sách khách hàng có tổng trị đặt hàng nhiều nhất trong năm 1998. thông tin gồm : MaKH, TenKH, Nam, TongTienMax.

SELECT khachhang.MaKH, TenKH, 1998 AS Nam, SUM(SoLuong * DonGia * (1 - GiamGia)) AS TongTienMax
FROM khachhang
JOIN dondathang ON khachhang.MaKH = dondathang.MaKH
JOIN chitietddh ON chitietddh.MaDDH = dondathang.MaDDH
JOIN mathang ON mathang.MaMH = chitietddh.MaMH
WHERE YEAR(NgayDH) = 2023
GROUP BY khachhang.MaKH, TenKH
ORDER BY TongTienMax DESC
LIMIT 1;

-- 23. Liệt kê danh sách các mặt hàng có tổng giá trị đặt hàng nhiều nhất trong 1997 thông tin gồm : MaMH, TenMH, Nam, TongTienMax
SELECT khachhang.MaKH, TenKH, 1998 AS Nam, SUM(SoLuong * DonGia * (1 - GiamGia)) AS TongTienMax
FROM khachhang
JOIN dondathang ON khachhang.MaKH = dondathang.MaKH
JOIN chitietddh ON chitietddh.MaDDH = dondathang.MaDDH
JOIN mathang ON mathang.MaMH = chitietddh.MaMH
WHERE YEAR(NgayDH) = 1997
GROUP BY khachhang.MaKH, TenKH
ORDER BY TongTienMax DESC
LIMIT 1;
-- 24. Cuối năm công ty muốn tặng lịch cho khách hàng với quy định như sau: 1 đơn đặt hàng 2 cuốn lịch. Tạo truy vấn gồm các thông tin sau: MaKH, TenKH, DiaChi, SoDDH, SoLichTang.

SELECT dondathang.MaDDH, TenKH, DiaChi,COUNT(dondathang.MaDDH) AS SoDDH,  COUNT(dondathang.MaDDH) * 2 AS SoLichTang
FROM dondathang 
JOIN khachhang ON dondathang.MaKH=khachhang.MaKH
GROUP BY dondathang.MaDDH, TenKH, DiaChi
-- 25. Thống kê tổng lương nhân viên của từng Đơn vị trong năm 1999. thông tin gồm : MaDV, TenDV, Thang, TongLuong.

SELECT donvi.MaDV, TenDV, Thang, SUM(NgayCong* LuongCB) AS TongLuong
FROM chamcong
JOIN nhanvien ON chamcong.MaNV=nhanvien.MaNV
JOIN donvi on donvi.MaDV=nhanvien.MaDV
WHERE YEAR(NgayCong)= 1999
GROUP BY donvi.MaDV, TenDV
-- 27. Tạo Table LuuDDH gồm các đơn đặt hàng trong năm 1997,1998 và 1999 gồm các trường sau : MaDDH, MaKH, NgayDH, NgayGiao, MaMH, SoLuong, GiamGia.

CREATE TABLE LuuDDH(
    MaDDH char(5) NOT null PRIMARY KEY,
    MaKH varchar(10) NOT null,
    NgayDH DATE,
    NgayGiao Date,
    MaMH varchar(10),
    SoLuong int(10),
    GiamGia DATE DEFAULT '0'
    )

INSERT INTO LuuDDH (MaDDH, MaKH, NgayDH, NgayGiao, MaMH, SoLuong, GiamGia)
SELECT ddh.MaDDH, ddh.MaKH, ddh.NgayDH, ddh.NgayGiao, ctd.MaMH, ctd.SoLuong, ctd.GiamGia
FROM DonDatHang ddh
JOIN ChiTietDDH ctd ON ddh.MaDDH = ctd.MaDDH
WHERE YEAR(ddh.NgayDH) IN (1997, 1998, 1999);
-- 28. Xóa Trong Table LuuDDH các đơn đặt hàng 1997
DELETE FROM luuddh WHERE YEAR(NgayDH)='1997'
-- 29. Tăng 2% giảm giá trong Table LuuDDH cho các đơn đặt hàng trong năm 1999
UPDATE luuddh SET GiamGia=GiamGia*1.02 WHERE YEAR(NgayDH)='1999'
-- 30. Tạo table Luong9901 (bảng lương tháng 1 năm 1999) gồm các Field sau: Thang, Nam, MaNV, HoTen, LuongCB, NgayCong, Luong. (biết lương = Luơng căn bản * Ngày công)
CREATE TABLE Luong9901 (
    Thang date NOT NULL ,
    Nam SMALLINT NOT NULL,
    MaNV INT NOT NULL,
    HoTen VARCHAR(50) NOT NULL,
    LuongCB INT UNSIGNED NOT NULL,
    NgayCong TINYINT NOT NULL,
    Luong INT UNSIGNED NOT NULL,
    PRIMARY KEY (Thang, Nam, MaNV)
);

INSERT INTO Luong9901 (Thang, Nam, MaNV, HoTen, LuongCB, NgayCong, Luong)
SELECT 1 AS Thang,
       1999 AS Nam,
       nhanvien.MaNV,
       CONCAT(nhanvien.HoLot, ' ', nhanvien.TenNV) AS HoTen,
       nhanvien.LuongCB,
       chamcong.NgayCong,
       nhanvien.LuongCB * chamcong.NgayCong AS Luong
FROM nhanvien
JOIN chamcong ON nhanvien.MaNV = chamcong.MaNV
WHERE MONTH(chamcong.NgayCong) = 1 AND YEAR(chamcong.NgayCong) = 1999;
-- 31. Tăng lương các nhân viên trong bảng lương Luong9901 tăng 10% đối với các nhân viên Nam và 20% đối với các nhân viên nữ và điều kiện là có ngày công > 20 ngày.
UPDATE luong9901 
JOIN nhanvien ON luong9901.MaNV=nhanvien.MaNV
SET Luong= CASE
	WHEN NgayCong>20 AND Phai='M' Then Luong *1.1
    WHEN NgayCong >20 AND Phai='F' THEN Luong *1.2
    END

    -- 32. Liệt kê các mặt hàng không có đặt hàng trong khoảng thời gian [từ 1/5/1997] [đến 1/5/1998]
SELECT MatHang.MaMH, MatHang.TenMH
FROM MatHang
LEFT JOIN ChiTietDDH ON MatHang.MaMH = ChiTietDDH.MaMH
LEFT JOIN DonDatHang ON ChiTietDDH.MaDDH = DonDatHang.MaDDH
WHERE DonDatHang.NgayDH IS NULL OR (DonDatHang.NgayDH >= '1997-05-01' AND DonDatHang.NgayDH <= '1998-05-01');
