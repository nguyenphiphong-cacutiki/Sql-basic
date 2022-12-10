-- bài thực hành 1, bài tập chương 4
create database baith1


use baith1
 --4.1 create table
	-- 1
create table DiaDiem(maDD char(30) primary key, tenDD char(40))
	-- 2
create table Xe(bienSo char(30) primary key, kHTD int)
	-- 3
create table HuongDV(maHDV char(30) primary key, tenHDV char(30), diaChiHDV char(50))
	-- 4
create table ChuyenDi(maCD char(30) primary key, tenCD char(30), ngayKH date, ngayKT date, kHDK int)
	-- 5 cách xác định khóa ngoại, khóa chính?
create table ChiTietCD(maCD char(30) , maDD char(30), soNL int, constraint khng foreign key(maDD) 
		references DiaDiem(maDD), foreign key(maCD) references ChuyenDi(maCD), primary key(maCD, maDD))
	-- 6
create table HuongDan(maCD char(30), maHDV char(30), constraint khng1 foreign key (maCD) references Chuyendi(maCD), 
constraint khng2 foreign key (maHDV) references HuongDV(maHDV), primary key(maCD, maHDV))
	-- 7
create table Khach(maCD char(30), hotenKH char(40), tuoi int, diachiKH char(40), dienthoaiKH char(30), 
	foreign key (maCD) references ChuyenDi(maCD))
	-- 8 
create table XePV(maCD char(30), bienSo char(30), foreign key (maCD) references ChuyenDi(maCD), 
	foreign key(bienSo) references xe(bienSo))
--4.1.1 insert data
insert into HuongDV values('hd01', 'ten01', 'Gia Lam'),
						('hd02', 'ten02', 'Dong da'),
						('hd03', 'ten03', 'Cau Giay'),
						('hd04', 'ten04', 'Thanh Xuan')
insert into DiaDiem values('dd01', 'Chua Huong'),
						('dd02', 'Ha Giang'),
						('dd03', 'Phong Nha')
insert into Xe values('bs01', 20),
					('bs02', 30),
					('bs03', 25)

insert into ChuyenDi values('CD2000', 'Di vi vu', '2021-12-8', '2021-12-30', 20),
							('CD1999', 'Di hoa toc', '2001-12-25', '2020-1-12', 30),
							('CD2023', 'Con duong hanh phuc', '2023-2-14', '2100-10-20', 2),
							('CD2024', 'Con duong hanh phuc', '2001-12-4', '2100-10-20', 2),
							('CD2021', 'Con duong hanh phuc', '2001-12-14', '2100-10-20', 2)

insert into ChiTietCD values('CD1999', 'dd01', 3),
							('CD1999', 'dd02', 4),
							('CD2023', 'dd03', 100000000),
							('CD2021', 'dd02', 4)
insert into HuongDan values('CD1999', 'hd01'),
							('CD2021', 'hd02'),
							('CD2023', 'hd03') -- có vấn đề có thể xảy ra là nếu như cùng một người hướng dẫn là hd 01 
										      -- lại đi hướng dấn 2 chuyến đi khác nhau, tuy nhiên hai chuyến đi đó 
												-- lại trùng lịch lên nhau.
insert into Khach values('CD1999', 'Tran Van Ba', 20, 'Nha Trang', '02282'),
						('CD2021', 'Kieu Phong', 35, 'Chiet Giang', '027373'),
						('CD2023', 'Nguyen Phi Phong', 22, 'BBHP', '0369510578'),
						('CD2023', 'THA', 19, 'BBHP', '********')
				insert into Khach values('CD2021', 'Kieu Phong', 35, 'Chiet Giang', '027373'),
										('CD2021', 'Kieu Phong 2', 35, 'Chiet Giang', '027373'),
										('CD2021', 'Kieu Phong 3', 35, 'Chiet Giang', '027373')
insert into XePV values('CD1999', 'bs01'),
						('CD2021', 'bs02'),
						('CD2023', 'bs03')
insert into ChiTietCD
	-- 4.1.2 cho biet danh sach cac huong dv cua cong ty
	select * from HuongDV
	-- 4.1.3 liệt kê đầy đủ thông tin về các địa điểm du lịch liên kết với công ty
	select * from DiaDiem
	-- 4.1.4 cho biết đầy đủ thông tin về địa điểm mà chuyến đi mã số CD2000 đi qua
	select DiaDiem.maDD, DiaDiem.tenDD from DiaDiem inner join ChiTietCD on DiaDiem.maDD = ChiTietCD.maDD where 
		ChiTietCD.maCD = 'CD2000'
	-- 4.1.5 Liệt kê các lữ khách của chuyến đi CD2000
	select * from khach where maCD = 'CD2000'
	-- 4.1.6 hãy cho biết số lượng khách của chuyến đi CD1999
	select count(*) as soLuong from Khach where maCD = 'CD1999'
	-- 4.1.7 chuyến đi nào có số lượng khách lớn hơn số lượng khách dự kiến. câu này thật là vi diệu quá đi à =))))
	select ChuyenDi.maCD, count(*) as soluong, ChuyenDi.kHDK from ChuyenDi inner join Khach on ChuyenDi.maCD = Khach.maCD
		group by ChuyenDi.maCD, ChuyenDi.kHDK having count(*) > ChuyenDi.kHDK
	-- 4.1.8 cho biết tổng lượng khách của tất cả các chuyến đi có ngày khởi hành trong tháng 12/2001
	select count(*) as soluong from ChuyenDi inner join Khach on ChuyenDi.maCD = Khach.maCD
	where year(ChuyenDi.ngayKH) = 2001 and month(ChuyenDi.ngayKH) = 12
	-- 4.1.9 Cho biết số ngày lưu lại trung bình, số ngày lưu lại lớn nhất, nhỏ nhất
--qua các điểm du lịch của chuyến đi CD2000.
	select avg(soNL) sotrungbinh from ChiTietCD where maCD = 'CD2000'
	select max(soNL) soLonNhat from ChiTietCD where maCD = 'CD2000'
	select min(soNL) soNhoNhat from ChiTietCD where maCD = 'CD2000'
	-- 4.1.10  Cho biết số lượng xe phục vụ cho chuyến đi CD2000.
	select count(*) as soluong from ChiTietCD inner join XePV on ChiTietCD.maCD = XePV.maCD where XePV.maCD = 'CD2000'
	-- 4.1.11 . Điểm du lịch nào(Mã số, tên) có số ngày lưu lại lớn nhất của chuyến đi CD2000
	select DiaDiem.maDD, tenDD from DiaDiem inner join ChiTietCD on DiaDiem.maDD = ChiTietCD.maDD where
	soNL = (select max(soNL) from ChiTietCD where ChiTietCD.maCD = 'CD2000') and ChiTietCD.maCD = 'CD2000'
	-- 4.1.12. Điểm du lịch nào(Mã số, tên) có số ngày lưu lại lớn hơn số ngày lưu lại trungbình qua các điểm của chuyến đi 
	--CD2000.
	select DiaDiem.maDD, DiaDiem.tenDD from DiaDiem inner join ChiTietCD on DiaDiem.maDD = ChiTietCD.maDD 
	where ChiTietCD.soNL > (select avg(soNL) from ChiTietCD where maCD = 'CD2000')
	-- 4.1.13 Điểm du lịch SaPa(mã số SP) có bao nhiêu chuyến đi ghé qua và khai thácđược bao nhiêu ngày
	--(tổng số ngày phục vụ).
	select count(*) from ChiTietCD where maDD = 'SP'
	select sum(soNL) from ChiTietCD where maDD = 'SP'
	-- 4.1.14 Liệt kê 3 điểm du lịch đầu tiên của chuyến đi CD2000 có số ngày lưu lại lớn nhất.
	select top 3 * from ChiTietCD where maCD = 'CD2000' order by soNL desc
	-- 4.1.15 Liệt kê 3 điểm du lịch đầu tiên của chuyến đi CD2000 có số ngày lưu lại ít nhất.
	select top 3 * from ChiTietCD where maCD = 'CD2000' order by soNL asc
	-- 4.1.16 Liệt kê các điểm du lịch của chuyến đi CD2000 ngoại trừ điểm có số ngày lưu ít nhất

	select DiaDiem.maDD, DiaDiem.tenDD from DiaDiem inner join ChiTietCD on DiaDiem.maDD = ChiTietCD.maDD
	where ChiTietCD.soNL > any (select ChiTietCD.soNL from ChiTietCD where ChiTietCD.maCD = 'CD2000')
	and ChiTietCD.maCD = 'CD2000'

	-- 4.1.17 .Cho biết số lượng các điểm du lịch, tổng số ngày lưu lại tại các địa điểm, sốlượng các hướng dẫn viên,
	--số lượng xe phục vụ cho từng chuyến đi có ngày khởihành trong tháng 12/2000

	 select * from ChuyenDi inner join ChiTietCD on ChuyenDi.maCD = ChiTietCD.maCD
	 select ChiTietCD.maDD from ChuyenDi inner join ChiTietCD on ChuyenDi.maCD = ChiTietCD.maCD where
		year(ChuyenDi.ngayKH) = '2001' and month(ChuyenDi.ngayKH) = '12'
		group by ChiTietCD.maDD   
		--Cho biết số lượng các điểm du lịch
	 select count(*) as soluongcacdiemdulich from (select ChiTietCD.maDD from ChuyenDi inner join ChiTietCD on ChuyenDi.maCD = ChiTietCD.maCD where
		year(ChuyenDi.ngayKH) = '2001' and month(ChuyenDi.ngayKH) = '12'
		group by ChiTietCD.maDD) as b
		-- tổng số ngày lưu lại các địa điểm
	select sum(ChiTietCD.soNL) as tongsongayluu from ChiTietCD inner join ChuyenDi on ChiTietCD.maCD = ChuyenDi.maCD
			where year(ChuyenDi.ngayKH) = '2001' and month(ChuyenDi.ngayKH) = '12'
		-- số lượng các hướng dẫn viên
	select * from ChuyenDi inner join HuongDan on ChuyenDi.maCD = HuongDan.maCD
			where year(ChuyenDi.ngayKH) = '2001'and month(ChuyenDi.ngayKH) = '12'
	select count(*) as tongsohuongdanvien from (select HuongDan.maHDV from ChuyenDi inner join HuongDan on ChuyenDi.maCD = HuongDan.maCD
			where year(ChuyenDi.ngayKH) = '2001'and month(ChuyenDi.ngayKH) = '12'
			group by HuongDan.maHDV) as b
		-- số lượng xe phục vụ cho từng chuyến đi
	select ChuyenDi.maCD, count(*) as soluongxe from ChuyenDi inner join XePV on ChuyenDi.maCD = XePV.maCD
			where year(ChuyenDi.ngayKH) = '2001' and month(ChuyenDi.ngayKH) = '12'
			group by ChuyenDi.maCD

	select ChuyenDi.*, b.soluongxe from ChuyenDi inner join (select ChuyenDi.maCD, count(*) as soluongxe from ChuyenDi inner join XePV on ChuyenDi.maCD = XePV.maCD
				where year(ChuyenDi.ngayKH) = '2001' and month(ChuyenDi.ngayKH) = '12'
				group by ChuyenDi.maCD) as b on ChuyenDi.maCD = b.maCD
			-- 4.1.18 số chuyến đi có số lượng khách lớn hơn số lượng khách dự kiến. câu này thật là vi diệu quá đi à =))))
	select count(*) as lonHon from ChuyenDi inner join (select maCD, count(*) as slThucTe from Khach group by maCD) as b
		on b.maCD = ChuyenDi.maCD where ChuyenDi.kHDK < b.slThucTe
			
	






