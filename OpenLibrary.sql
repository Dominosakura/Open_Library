
create database OpenLibrary 
GO 
use OpenLibrary
GO

CREATE TABLE KHACHHANG(

     MaKH INT IDENTITY(1,1),

     HoTen nVarchar(50) NOT NULL,

     TaiKhoan Varchar(50) UNIQUE,

     MatKhau Varchar(50) NOT NULL,

     Email Varchar(100) UNIQUE,

     DiaChiKH nVarchar(200),

     DienThoaiKH Varchar(50), 

     NgaySinh DATETIME

     CONSTRAINT PK_KhachHang PRIMARY KEY(MaKH)

)
GO 

Create Table CHUDE 
( 
 	MaCD int Identity(1,1), 
 	TenChuDe nvarchar(50) NOT NULL,  	
    CONSTRAINT PK_ChuDe PRIMARY KEY(MaCD) 
) 
GO

Create Table NHAXUATBAN
(
     MaNXB int identity(1,1),

     TenNXB nvarchar(50) NOT NULL,

     DiaChi NVARCHAR(200),

     DienThoai VARCHAR(50),

     CONSTRAINT PK_NhaXuatBan PRIMARY KEY(MaNXB)

)
Go

CREATE TABLE SACH
(

     MaSach INT IDENTITY(1,1),

     TenSach NVARCHAR(100) NOT NULL,

     GiaBan Decimal(18,0) CHECK (GiaBan>=0),

     MoTa NVarchar(Max),

     AnhBia VARCHAR(50),

     NgayCapNhat DATETIME,

     SoLuongTon INT,

     MaCD INT,

     MaNXB INT,

     Constraint PK_SACH Primary Key(MaSach),

     Constraint FK_CHUDE Foreign Key(MaCD) References CHUDE(MaCD),

     Constraint FK_NHAXUATBAN Foreign Key(MaNXB)References NHAXUATBAN(MaNXB)

)
GO

CREATE TABLE TACGIA(

     MaTG INT IDENTITY(1,1),

     TenTG NVARCHAR(50) NOT NULL,

     DiaChi NVARCHAR(100),

     TieuSu nVarchar(Max),

     DienThoai VARCHAR(50),

     CONSTRAINT PK_TACGIA PRIMARY KEY(MaTG)
)
GO



CREATE TABLE VIETSACH

(
     MaTG INT,

     MaSach INT,

     VaiTro NVARCHAR(50) ,

     ViTri NVARCHAR(50), 

     CONSTRAINT PK_VIETSACH PRIMARY KEY(MaTG,MaSach),

     CONSTRAINT FK_VIETSACH_TACGIA FOREIGN KEY (MaTG) REFERENCES TACGIA(MaTG),

     CONSTRAINT FK_VIETSACH_SACH FOREIGN KEY (MaSach) REFERENCES SACH(MaSach)

)

CREATE TABLE DONDATHANG
(

     MaDonHang INT IDENTITY(1,1),

     DaThanhToan bit,

     TinhTrangGiaoHang  bit,

     NgayDat Datetime,

     NgayGiao Datetime, 

     MaKH INT,

     CONSTRAINT FK_KHACHHANG FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH),    
     CONSTRAINT PK_DONDATHANG PRIMARY KEY (MaDonHang)
)
Go

CREATE TABLE CHITIETDONTHANG

(

     MaDonHang INT,

     MaSach INT,

     SoLuong Int Check(SoLuong>0),

     DonGia Decimal(18,0) Check(DonGia>=0), 

     CONSTRAINT PK_CHITIETDONTHANG PRIMARY KEY(MaDonHang,MaSach),

     CONSTRAINT FK_DONHANG FOREIGN KEY (MaDonHang) REFERENCES DONDATHANG(MaDonHang),

     CONSTRAINT FK_SACH FOREIGN KEY (MaSach) REFERENCES SACH(MaSach)

)

INSERT INTO CHUDE (TenChuDe) 
VALUES 
(N'Ngo?i ng?'), 
(N'C�ng ngh? th�ng tin'), 
(N'Lu?t'), 
(N'V?n h?c'), 
(N'Khoa h?c k? thu�t'), 
(N'N�ng nghi?p'), 
(N'Tri?t h?c - Ch�nh tr?'), 
(N'L?ch s? ??a l�'),
(N'Kinh t?'), 
(N'S�ch gi�o khoa'), 
(N'Ngh? thu? s?ng');
GO

INSERT INTO NHAXUATBAN (TenNXB, DiaChi, DienThoai) 
VALUES 
(N'Nh� Xu?t B?n Tr?', N'123 ???ng S? 1, TP. H? Ch� Minh', '0909000001'),
(N'Nh� Xu?t B?n Gi�o D?c', N'456 ???ng S? 2, H� N?i', '0909000002'),
(N'Nh� Xu?t B?n Khoa H?c', N'789 ???ng S? 3, TP. ?� N?ng', '0909000003'),
(N'Nh� Xu?t B?n Lao ??ng', N'101 ???ng S? 4, TP. C?n Th?', '0909000004'),
(N'Nh� Xu?t B?n C�ng Ngh?', N'111 ???ng S? 5, TP. H?i Ph�ng', '0909000005'),
(N'Nh� Xu?t B?n Kim ??ng', N'118 ???ng S? 10, TP. H?i Ph�ng', '0909000008'),
(N'Nh� Xu?t B?n Thanh Ni�n', N'111 ???ng S? 9, TP. H?i Ph�ng', '0909000007'),
(N'Nh� Xu?t B?n Y H?c', N'121 ???ng S? 6, TP. Hu?', '0909000006');
GO


