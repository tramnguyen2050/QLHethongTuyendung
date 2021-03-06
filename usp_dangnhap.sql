
---kiem tra dang nhap NTD
if OBJECT_ID('uspKiemTraDangNhapNTD','P') is not null
	drop procedure uspKiemTraDangNhapNTD;
go
create proc uspKiemTraDangNhapNTD
@Email nvarchar (50), @Matkhau nvarchar(50),
@Result bit = 0 output
as
	begin
	set @Result = 0;
		if exists (select * from NhaTuyenDung
		where Email = @Email and MatKhau = @Matkhau)
		begin	set @Result = 1	
		
		end
		else
			set @Result = 0
	end
	select @Result
go
declare @RESULT bit 
exec uspKiemTraDangNhapNTD 'thanglong@gmail.com', 'thanglong', @Result OUTPUT
select @RESULT

---kiem tra dang nhap NTV
if OBJECT_ID('uspKiemTraDangNhapNTV','P') is not null
	drop procedure uspKiemTraDangNhapNTV;
go
create proc uspKiemTraDangNhapNTV
@Email nvarchar(50) , @Matkhau nvarchar(50),
@result bit = 0 output
as
	begin
	set @result = 0;
		if exists (select * from NguoiTimViec
		where Email = @Email and MatKhau = @Matkhau)
		begin
			set @result = 1	
			--select * from NguoiTimViec where Email = @Email and MatKhau = @Matkhau
			end
		else
			set @result = 0
	end	
	select @result
go
declare @RESULT bit 
exec uspKiemTraDangNhapNTV 'tramguyen2050@gmail.com', 'aimabiet', @result OUTPUT
select @RESULT


----Them du lieu NTD

if OBJECT_ID('uspInsertIntoNTV','P') is not null
	drop procedure uspInsertIntoNTV;
go
create proc uspInsertIntoNTV
@TenCV  nchar(50),
@Chucvu nvarchar(50),
@LoaiCV nvarchar(50),
@Kinhnghiem nvarchar(50),
@Ngonngu nvarchar(50),
@Mota nvarchar(MAX),
@Nganhnghe nchar(50)
AS
BEGIN

select cv.Ten_CV, cv.ChucVu, cv.KinhNghiem, cv.LoaiCV, cv.Ma_NN, cv.NgonNgu, cv.MoTa
			 from CongViec cv inner join NTD_CongViec ncv on cv.Ma_CV = ncv.Ma_CV
						inner join NhaTuyenDung ntd on ncv.Ma_NTD = ntd.Ma_NTD	
						inner join NganhNgheTuyenDung nntd on ntd.Ma_NTD = nntd.Ma_NTD
						inner join NganhNghe nn on nntd.Ma_NN = nn.Ten_NN
	where cv.Ten_CV = @TenCV and cv.ChucVu = @Chucvu and cv.KinhNghiem = @Kinhnghiem
	and cv.NgonNgu = @Ngonngu and cv.MoTa = @Mota and nn.Ten_NN = @Nganhnghe
	
	
	
	insert into CongViec(Ten_CV, ChucVu,KinhNghiem,NgonNgu, MoTa,Ma_NN)
	values (@TenCV,@Chucvu,@LoaiCV,@Kinhnghiem,@Ngonngu,@Nganhnghe)		
	
END
go
exec uspInsertIntoNTV N'Marketing', N'Giám đốc',N'Toàn thời gian', N'5 năm', N'Tiếng anh', N' ', N'Marketing'
