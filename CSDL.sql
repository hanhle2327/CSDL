create database QuanLyDaoTao;
use QuanLyDaoTao;
create table lophoc(
MaLop char(5) primary key,
TenLop nvarchar(100),
Tongso int constraint Chk_Tongso check (Tongso < 50)
);
GO
create table sinhvien(
MaSV char(10) primary key,
TenSV nvarchar(100),
NgaySinh date,
MaLop char(5) references lophoc(MaLop)
);
GO
create table monhoc(
MaMH char(5) primary key,
TenMH nvarchar(100),
SoTC int
);
GO
create table diem(
MaSV char(10) references sinhvien(MaSV),
MaMH char(5) references monhoc(MaMH), 
diem decimal,
constraint kchinh primary key (MaSV, MaMH)
);
ALTER TABLE sinhvien
ADD GioiTinh nvarchar(10);
GO
ALTER TABLE sinhvien
ADD CONSTRAINT Chk_GioiTinh CHECK (GioiTinh IN (N'Nam', N'Nữ')
);
GO
insert into sinhvien (MaSV, TenSV, NgaySinh, GioiTinh) values
('SV01', 'Nguyen Van A', '2003-05-10', N'Nam'),
('SV02', 'Le Thi B', '2002-08-25', N'Nữ'),
('SV03', 'Tran Van C', '2001-12-20', N'Nam'),
('SV04', 'Pham Thi D', '2004-03-25', N'Nữ'),
('SV05', ' Hoang Van E', '2000-07-30', N'Nam');
INSERT INTO lophoc (MaLop, TenLop, Tongso) VALUES
('L01', N'Kế toán', 40),
('L02', N'CNTT', 35),
('L03', N'Marketing', 30);
UPDATE sinhvien SET MaLop = 'L01' WHERE MaSV IN ('SV01', 'SV02');
UPDATE sinhvien SET MaLop = 'L02' WHERE MaSV IN ('SV03', 'SV04');
UPDATE sinhvien SET MaLop = 'L03' WHERE MaSV = 'SV05';
GO
INSERT INTO monhoc(MaMH, TenMH, SoTC) VALUES
('CSDL', N'Cơ sở dữ liệu', 3),
('DS&AI', N'Nhập môn cơ sở dữ liệu và trí tuệ nhân tạo', 2),
('CSLT', N'Cơ sở lập trình', 3);
ALTER TABLE diem
ALTER COLUMN diem decimal(4,2);
GO
INSERT INTO diem (MaSV, MaMH, diem) VALUES
('SV01', 'CSDL', 8.5),
('SV01', 'CSLT', 7.0),
('SV02', 'CSLT', 9.0),
('SV02', 'DS&AI', 6.5),
('SV03', 'CSDL', 10),
('SV04', 'DS&AI', 4.5),
('SV05', 'DS&AI', 5.0);