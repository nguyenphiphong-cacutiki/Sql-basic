-- hello --
create database TH2
use TH2
-- create table
	--1
create table Khoa(maK char(50) primary key, vpK char(50))
insert into Khoa values('CNTT', 'hanoi'), ('KT', 'hanoi')
	--2
create table Lop(maL char(50) primary key, maK char(50), foreign key (maK) references Khoa(maK))
insert into Lop values('TH1', 'CNTT'), ('TH2', 'CNTT')
insert into Lop values('KT1', 'KT')
	--3
create table SinhVien(maSv char(50) primary key, hoSv char(50), tenSV char(50), nsSv date, diaChi char(50),
lopTr bit, maL char(50), foreign key (maL) references Lop(maL))
insert into SinhVien values('sv1', 'ho1', 'ten1', '2003-10-12', 'hatay', 0, 'TH1'),
							('sv2', 'ho2', 'ten2', '2003-12-12', 'hadong', 0, 'TH1'),
							('sv3', 'ho3', 'ten3', '2003-12-22', 'hanoi', 0, 'TH1'),
							('sv4', 'ho4', 'ten4', '2003-8-8', 'tayho', 1, 'TH2'),
							('sv5', 'ho5', 'ten5', '2003-11-11', 'hanam', 0, 'TH2'),
							('sv6', 'ho6', 'ten6', '2003-2-2', 'dongtac', 0, 'TH2')

insert into SinhVien values('sv7', 'ho7', 'ten7', '2003-2-2', 'dongtac', 0, 'KT1'),
							('sv8', 'ho8', 'ten8', '2003-2-2', 'hanam', 0, 'KT1'),
							('sv9', 'ho9', 'ten9', '2003-2-2', 'dongtac', 0, 'KT1'),
							('sv10', 'ho10', 'ten10', '2003-2-2', 'hanam', 0, 'KT1'),
							('sv11', 'ho11', 'ten11', '2003-2-2', 'hanoi', 0, 'KT1'),
							('sv12', 'ho12', 'ten12', '2003-2-2', 'hanoi', 0, 'KT1')

insert into SinhVien values('sv13', 'ho13', 'ten13', '2003-2-2', 'dongtac', 0, 'KT1')
							
	--4
create table MonHoc(maMh char(50) primary key, tenMh char(50), lt char(50), th char(50))
--ALTER TABLE MONHOC ALTER COLUMN TH INT
insert into MonHoc values('mh1', 'CSDL', 12, 12),
							('mh2', 'CTDL', 12, 13),
							('mh3', 'KTMT', 14, 14)
insert into MonHoc values('mh4', 'TTNT', 14, 20)
	--5
create table CtHoc(maL char(50), hk char(50), maMh char(50), foreign key (maL) references Lop(maL),
	foreign key (maMh) references MonHoc(maMh), primary key(maL, hk, maMh))
insert into CtHoc values('TH1', 'HK1', 'mh1'),
						('TH1', 'HK1','mh2'),
						('TH1', 'HK1', 'mh3'),
						('TH2', 'HK1', 'mh1'),
						('TH2', 'HK1', 'mh2'),
						('TH2', 'HK1', 'mh3'),
						('TH1', 'HK2', 'mh1'),
						('TH1', 'HK2','mh2'),
						('TH1', 'HK2', 'mh3'),
						('TH2', 'HK2', 'mh1'),
						('TH2', 'HK2', 'mh2'),
						('TH2', 'HK2', 'mh3')
insert into CtHoc values('KT1', 'HK1', 'mh3'),
						('KT1', 'HK1', 'mh4')

	--6
create table DiemSv(maSv char(50), maMh char(50), lan int, diem float, foreign key (maSv) references SinhVien(maSv),
	foreign key (maMh) references MonHoc(maMh), primary key(maSv, maMh, lan))
--drop table DiemSv
insert into DiemSv values('sv1', 'mh1', 1, 5),
						('sv1', 'mh2', 1, 5),
						('sv2', 'mh1', 1, 5),
						('sv2', 'mh2', 1, 5),
						('sv3', 'mh1', 1, 5),
						('sv3', 'mh2', 1, 5),
						('sv4', 'mh1', 1, 5),
						('sv4', 'mh2', 1, 5),
						('sv5', 'mh1', 1, 5),
						('sv5', 'mh2', 1, 5),
						('sv6', 'mh1', 1, 5),
						('sv6', 'mh2', 1, 5),
						('sv1', 'mh1', 2, 5),
						('sv1', 'mh2', 2, 5)
insert into DiemSv values('sv7', 'mh3', 1, 3),
						('sv7', 'mh4', 1, 4),
						('sv8', 'mh3', 1, 3),
						('sv8', 'mh4', 1, 3),
						('sv9', 'mh4', 1, 4),
						('sv10', 'mh3', 1, 3)
insert into DiemSv values('sv10', 'mh4', 1, 3), 
						('sv11', 'mh4', 1, 3)
						-- chèn điểm cho các lần thi sau
insert into DiemSv values('sv1', 'mh1', 3, 2),
						('sv1', 'mh2', 2, 9),
						('sv2', 'mh1', 2, 5),
						('sv2', 'mh2', 2, 4),
						('sv3', 'mh1', 2, 5),
						('sv3', 'mh2', 2, 7),
						('sv4', 'mh1', 2, 8),
						('sv4', 'mh2', 2, 5),
						('sv5', 'mh1', 2, 10),
						('sv5', 'mh2', 2, 5),
						('sv6', 'mh1', 2, 2),
						('sv6', 'mh2', 2, 5),
						('sv1', 'mh1', 3, 9),
						('sv1', 'mh2', 3, 2)
insert into DiemSv values('sv7', 'mh3', 2, 6),
						('sv7', 'mh4', 2, 9),
						('sv8', 'mh3', 2, 10),
						('sv8', 'mh4', 2, 3),
						('sv9', 'mh4', 2, 4),
						('sv10', 'mh3', 2, 8)
insert into DiemSv values('sv10', 'mh4', 2, 4), 
						('sv11', 'mh4', 3, 3)
						--select * from DiemSv where maSv = 'sv10'
					-- execute ----------------
-- 1 Cho biết danh sách lớp
select * from Lop
-- 2 Cho biết danh sách sinh viên lớp TH1
select * from SinhVien where maL = 'TH1'
-- 3 Cho biết danh sách SV khoa CNTT
select * from SinhVien inner join Lop on SinhVien.maL = Lop.maL where Lop.maK = 'CNTT'
-- 4 Cho biết chương trình học của lớp TH1
select * from CtHoc inner join MonHoc on CtHoc.maMh = MonHoc.maMh where maL = 'TH1'
-- 5 Điểm lần 1 môn CSDL của SV lớp TH1. câu lệnh inner join 3 bảng.
select * from DiemSv inner join CtHoc on DiemSv.maMh = CtHoc.maMh 
	inner join MonHoc on MonHoc.maMh = CtHoc.maMh where DiemSv.lan = 1 and MonHoc.tenMh 
	= 'CSDL' and CtHoc.maL = 'TH1'
-- 6 Điểm trung bình lần 1 môn CTDL của lớpTH1.
select AVG(DiemSv.diem) as dtb from DiemSv inner join CtHoc on DiemSv.maMh = CtHoc.maMh inner join MonHoc on MonHoc.maMh = CtHoc.maMh
	where DiemSv.lan = 1 and MonHoc.tenMh = 'CSDL' and CtHoc.maL = 'TH1'
-- 7 Số lượng SV của lớp TH2.
select count(*) as soluong from SinhVien where maL = 'TH2'
-- 8 Lớp TH1 phải học bao nhiêu môn trong HK1 và HK2.
select count(*) as soluong from CtHoc where maL = 'TH1' and (hk = 'HK1' or hk = 'HK2')
-- 9 Cho biết 3 SV đầu tiên có điểm thi lần 1 cao nhất môn CSDL.
select top 3 * from DiemSv inner join MonHoc on DiemSv.maMh = MonHoc.maMh where DiemSv.lan = 1 
	and MonHoc.tenMh = 'CSDL'
-- 10 Cho biết sĩ số từng lớp.
select SinhVien.maL, count(*) as siSo from SinhVien group by maL
-- 11 Khoa nào đông SV nhất.

select b.maK, b.soluong from
   (select Lop.maK as maK, COUNT(*) as soluong from Lop inner join SinhVien on
			Lop.maL = SinhVien.maL group by Lop.maK) as b 
	where b.soluong = (select max(c.soluong) from 
		(select COUNT(*) as soluong from Lop inner join SinhVien
			on Lop.maL = SinhVien.maL group by Lop.maK) as c)
-- 12 Lớp nào đông nhất khoa CNTT
	-- bảng cơ bản
--select Lop.maL, count(*) as soluong from Lop inner join SinhVien on Lop.maL = SinhVien.maL
--	group by Lop.maL having Lop.maK = 'CNTT' as b
	-- kết quả
select b.maL, b.soluong from (select Lop.maL, count(*) as soluong from Lop inner join SinhVien on Lop.maL = SinhVien.maL
	group by Lop.maL, Lop.maK having Lop.maK = 'CNTT') as b where b.soluong = (select max(c.soluong) from 
	(select Lop.maL, count(*) as soluong from Lop inner join SinhVien on Lop.maL = SinhVien.maL
	group by Lop.maL, Lop.maK having Lop.maK = 'CNTT') as c)
	-- cách 2
	select Lop.maL, count(*) as soluong from Lop inner join SinhVien on Lop.maL = SinhVien.maL
		where Lop.maK = 'CNTT'
		group by Lop.maL having count(*) >= all (select count(*) from 
		Lop inner join SinhVien on Lop.maL = SinhVien.maL where Lop.maK = 'CNTT'
		group by Lop.maL)
-- 13 Môn học nào mà ở lần thi 1 có số SV không đạt nhiều nhất. (diem < 5)
select b.tenMh, b.soluong from
(select MonHoc.tenMh, count(*) as soluong from MonHoc inner join DiemSv on MonHoc.maMh = DiemSv.maMh
	where DiemSv.diem < 5 and DiemSv.lan = 1 group by MonHoc.maMh, MonHoc.tenMh) as b 
		where b.soluong = (select max(c.soluong) from 
		(select MonHoc.tenMh, count(*) as soluong from MonHoc inner join DiemSv on MonHoc.maMh = DiemSv.maMh
	where DiemSv.diem < 5 and DiemSv.lan = 1 group by MonHoc.maMh, MonHoc.tenMh) as c) 

-- số Môn học mà ở lần thi 1 có số SV không đạt nhiều nhất. (diem < 5)
	select count(*) as soluongmon from
	(select MonHoc.tenMh, count(*) as soluong from MonHoc inner join DiemSv on MonHoc.maMh = DiemSv.maMh
	where DiemSv.diem < 5 and DiemSv.lan = 1 group by MonHoc.maMh, MonHoc.tenMh) as b 
		where b.soluong = (select max(c.soluong) from 
		(select MonHoc.tenMh, count(*) as soluong from MonHoc inner join DiemSv on MonHoc.maMh = DiemSv.maMh
	where DiemSv.diem < 5 and DiemSv.lan = 1 group by MonHoc.maMh, MonHoc.tenMh) as c)
-- 14 Tìm điểm thi lớn nhất của mỗi SV cho mỗi môn học (vì SV được thi nhiều lần)
select SinhVien.tenSV, DiemSv.maMh, max(DiemSv.diem) as diemcaonhat from SinhVien inner join DiemSv on SinhVien.maSv = DiemSv.maSv
	group by SinhVien.tenSV, DiemSv.maSv, DiemSv.maMh

	-- hiển thị hết để kiểm tra
select SinhVien.tenSV, DiemSv.maMh, DiemSv.diem from SinhVien inner join DiemSv on SinhVien.maSv = DiemSv.maSv
	group by SinhVien.tenSV, DiemSv.maSv, DiemSv.diem, DiemSv.maMh
-- 15 Điểm trung bình của từng lớp khoa CNTT ở lần thi thứ nhất môn CSDL
select L.maL, AVG(D.diem) as diemtb from DiemSv D inner join SinhVien S on D.maSv = S.maSv
		inner join Lop L on S.maL = L.maL inner join MonHoc M on M.maMh = D.maMh
		where L.maK = 'CNTT' and D.lan = 2 and M.tenMh = 'CSDL'
		group by L.maL

-- 16 Sinh viên nào của lớp TH1 đã thi đạt tất cả các môn học ở lần 1 của HK2.
select d.maSv from DiemSv d inner join CtHoc c on d.maMh = c.maMh
	where d.lan = 1 and c.hk = 'HK1' and d.diem >= 4
	group by d.maSv


	select d.maSv, s.tenSV from DiemSv d inner join CtHoc c on d.maMh = c.maMh inner join SinhVien s on d.maSv = s.maSv
	where d.lan = 1 and c.hk = 'HK1' and d.diem >= 4
	group by d.maSv, s.tenSV
-- 17 Danh sách SV nhận học bổng học kỳ 2 của lớp TH2, nghĩa là đạt
--tất cả các môn học của học kỳ này ở lần thi thứ nhất
select d.masv from DiemSv d inner join CtHoc c on d.maMh = c.maMh
	where d.lan = 1 and c.hk = 'HK1' and d.diem >= 5
	group by d.maSv

-- 18 Biết rằng lớp TH1 đã học đủ 6 học kỳ, cho biết SV nào đủ điều kiện
--thi tốt nghiệp, nghĩa là đã đạt đủ tất cả các môn
select d.maSv from DiemSv d inner join SinhVien s on d.maSv = s.maSv
	where s.maL =  'TH1' and d.diem >= 5 
	group by d.maSv
-- 19 xem ai có điểm cao nhất mỗi môn
select s.tenSV, b.maMh, d.diem from SinhVien s inner join DiemSv d on s.maSv = d.maSv inner join
(select d.maMh, max(d.diem) as lonnhat from DiemSv d inner join SinhVien s on d.maSv = s.maSv group by d.maMh) as b
 on b.maMh = d.maMh 
	where b.lonnhat = d.diem

		







		

	