USE [master]
GO
/****** Object:  Database [ViecLamIT]    Script Date: 6/19/2020 9:16:40 PM ******/
CREATE DATABASE [ViecLamIT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ViecLamIT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ViecLamIT.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ViecLamIT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ViecLamIT_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ViecLamIT] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ViecLamIT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ViecLamIT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ViecLamIT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ViecLamIT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ViecLamIT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ViecLamIT] SET ARITHABORT OFF 
GO
ALTER DATABASE [ViecLamIT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ViecLamIT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ViecLamIT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ViecLamIT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ViecLamIT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ViecLamIT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ViecLamIT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ViecLamIT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ViecLamIT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ViecLamIT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ViecLamIT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ViecLamIT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ViecLamIT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ViecLamIT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ViecLamIT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ViecLamIT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ViecLamIT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ViecLamIT] SET RECOVERY FULL 
GO
ALTER DATABASE [ViecLamIT] SET  MULTI_USER 
GO
ALTER DATABASE [ViecLamIT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ViecLamIT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ViecLamIT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ViecLamIT] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ViecLamIT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ViecLamIT', N'ON'
GO
USE [ViecLamIT]
GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 6/19/2020 9:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[MaChucVu] [int] IDENTITY(1,1) NOT NULL,
	[TenChucVu] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ChucVu] PRIMARY KEY CLUSTERED 
(
	[MaChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KyNang]    Script Date: 6/19/2020 9:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KyNang](
	[MakyNang] [int] IDENTITY(1,1) NOT NULL,
	[TenKyNang] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_KyNang] PRIMARY KEY CLUSTERED 
(
	[MakyNang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KyNang_TuyenDung]    Script Date: 6/19/2020 9:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KyNang_TuyenDung](
	[MaTuyenDung] [int] NOT NULL,
	[MaKyNang] [int] NOT NULL,
 CONSTRAINT [PK_KyNang_TuyenDung_1] PRIMARY KEY CLUSTERED 
(
	[MaTuyenDung] ASC,
	[MaKyNang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguoiDung_TuyenDung]    Script Date: 6/19/2020 9:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung_TuyenDung](
	[MaNguoiDung] [int] NOT NULL,
	[MaTuyenDung] [int] NOT NULL,
	[NgayNopDon] [datetime] NULL,
 CONSTRAINT [PK_NguoiDung_TuyenDung] PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC,
	[MaTuyenDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 6/19/2020 9:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[TenTaiKhoan] [nvarchar](20) NULL,
	[MatKhau] [nvarchar](20) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThongTinNguoiDung]    Script Date: 6/19/2020 9:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinNguoiDung](
	[MaNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[HoVaTen] [nvarchar](30) NOT NULL,
	[MaTaiKhoan] [int] NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[NgaySinh] [datetime] NULL,
	[QueQuan] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[SoDienThoai] [nvarchar](20) NULL,
	[ViTriChucVu] [nvarchar](50) NULL,
	[SoNamKinhNghiem] [int] NULL,
	[CapBac] [nvarchar](20) NULL,
	[TrinhDoHocVan] [nvarchar](20) NULL,
 CONSTRAINT [PK_ThongTinNguoiDung] PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThongTinNhaTuyenDung]    Script Date: 6/19/2020 9:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinNhaTuyenDung](
	[MaCongTy] [nvarchar](50) NOT NULL,
	[TenCongTy] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](100) NULL,
	[ThanhPho] [nvarchar](50) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_ThongTinNhaTuyenDung] PRIMARY KEY CLUSTERED 
(
	[MaCongTy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThongTinTuyenDung]    Script Date: 6/19/2020 9:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinTuyenDung](
	[MaTuyenDung] [int] IDENTITY(1,1) NOT NULL,
	[MaCongTy] [nvarchar](50) NULL,
	[MaChucVu] [int] NULL,
	[CapBac] [nvarchar](20) NULL,
	[MoTaCongViec] [nvarchar](1000) NULL,
	[YeuCauCongTy] [nvarchar](1000) NULL,
	[MucLuong] [nvarchar](20) NULL,
	[HanNopDon] [datetime] NULL,
 CONSTRAINT [PK_ThongTinTuyenDung] PRIMARY KEY CLUSTERED 
(
	[MaTuyenDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ChucVu] ON 

INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (1, N'Project Manager')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (2, N'Tester QA QC')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (3, N'Senior Mobile Developer')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (4, N'Software Engineer')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (5, N'Backend Developer')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (6, N'Web Developer')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (7, N'.NET Developer')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (8, N'Android Developer')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (9, N'Frontend Developer')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (10, N'Full Stack Developer')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (11, N'iOS Developer')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (12, N'Java Developer')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (13, N'Database Administrator')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (14, N'System Admin')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (15, N'PHP Web Developer  ')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (16, N'Product Owner')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (17, N'Ruby On Rails Developer')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (18, N'Unity Game Developer')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (19, N'UX UI Designer')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (20, N'NodeJS Developer')
SET IDENTITY_INSERT [dbo].[ChucVu] OFF
SET IDENTITY_INSERT [dbo].[KyNang] ON 

INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (1, N'Android')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (2, N'AngularJS')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (3, N'ASP.NET')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (4, N'AWS')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (5, N'Blockchain')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (6, N'Business Analyst')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (7, N'C#')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (8, N'C++')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (9, N'C language')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (10, N'CSS')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (11, N'Database')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (12, N'Designer')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (13, N'English')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (14, N'Games')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (15, N'HTML5')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (16, N'iOS')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (17, N'IT Support')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (18, N'J2EE')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (19, N'Java')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (20, N'JavaScript')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (21, N'JQuery')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (22, N'Laravel')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (23, N'Linux')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (24, N'MVC')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (25, N'MySQL')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (26, N'.NET')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (27, N'Networking')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (28, N'NodeJS')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (29, N'Objective C')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (30, N'OOP')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (31, N'Oracle')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (32, N'PHP')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (33, N'Python')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (34, N'QA QC')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (35, N'ReactJS')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (36, N'React Native')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (37, N'Ruby on Rails')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (38, N'Spring')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (39, N'SQL')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (40, N'Swift')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (41, N'Tester')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (42, N'UI-UX
')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (43, N'Unity')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (44, N'VueJS')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (45, N'Wordpress')
INSERT [dbo].[KyNang] ([MakyNang], [TenKyNang]) VALUES (46, N'Kotlin')
SET IDENTITY_INSERT [dbo].[KyNang] OFF
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (1, 22)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (1, 32)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (1, 45)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (2, 34)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (2, 41)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (3, 10)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (3, 15)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (3, 20)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (4, 12)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (4, 42)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (5, 19)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (5, 33)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (5, 39)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (6, 9)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (6, 11)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (6, 23)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (7, 11)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (7, 25)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (7, 31)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (8, 1)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (8, 7)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (8, 26)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (9, 20)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (9, 28)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (9, 32)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (10, 1)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (10, 19)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (10, 46)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (11, 16)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (11, 29)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (11, 40)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (12, 19)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (12, 25)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (12, 38)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (13, 17)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (13, 25)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (13, 31)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (14, 7)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (14, 14)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (14, 43)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (15, 15)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (15, 20)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (15, 35)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (16, 28)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (16, 33)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (16, 39)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (17, 4)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (17, 19)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (17, 28)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (18, 19)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (18, 20)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (18, 35)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (19, 26)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (19, 39)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (20, 13)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (20, 32)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (21, 20)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (21, 28)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (21, 35)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (22, 15)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (22, 20)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (22, 37)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (23, 1)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (23, 16)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (23, 36)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (24, 15)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (24, 20)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (24, 32)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (25, 12)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (25, 15)
INSERT [dbo].[KyNang_TuyenDung] ([MaTuyenDung], [MaKyNang]) VALUES (25, 42)
INSERT [dbo].[NguoiDung_TuyenDung] ([MaNguoiDung], [MaTuyenDung], [NgayNopDon]) VALUES (1, 3, CAST(N'2020-03-24 00:00:00.000' AS DateTime))
INSERT [dbo].[NguoiDung_TuyenDung] ([MaNguoiDung], [MaTuyenDung], [NgayNopDon]) VALUES (1, 15, CAST(N'2020-04-16 00:00:00.000' AS DateTime))
INSERT [dbo].[NguoiDung_TuyenDung] ([MaNguoiDung], [MaTuyenDung], [NgayNopDon]) VALUES (3, 5, CAST(N'2020-03-15 00:00:00.000' AS DateTime))
INSERT [dbo].[NguoiDung_TuyenDung] ([MaNguoiDung], [MaTuyenDung], [NgayNopDon]) VALUES (16, 6, CAST(N'2020-03-27 00:00:00.000' AS DateTime))
INSERT [dbo].[NguoiDung_TuyenDung] ([MaNguoiDung], [MaTuyenDung], [NgayNopDon]) VALUES (17, 24, CAST(N'2020-04-07 00:00:00.000' AS DateTime))
INSERT [dbo].[NguoiDung_TuyenDung] ([MaNguoiDung], [MaTuyenDung], [NgayNopDon]) VALUES (19, 8, CAST(N'2020-04-20 00:00:00.000' AS DateTime))
INSERT [dbo].[NguoiDung_TuyenDung] ([MaNguoiDung], [MaTuyenDung], [NgayNopDon]) VALUES (23, 11, CAST(N'2020-04-04 00:00:00.000' AS DateTime))
INSERT [dbo].[NguoiDung_TuyenDung] ([MaNguoiDung], [MaTuyenDung], [NgayNopDon]) VALUES (24, 9, CAST(N'2020-04-08 00:00:00.000' AS DateTime))
INSERT [dbo].[NguoiDung_TuyenDung] ([MaNguoiDung], [MaTuyenDung], [NgayNopDon]) VALUES (24, 18, CAST(N'2020-04-15 00:00:00.000' AS DateTime))
INSERT [dbo].[NguoiDung_TuyenDung] ([MaNguoiDung], [MaTuyenDung], [NgayNopDon]) VALUES (26, 24, CAST(N'2020-03-20 00:00:00.000' AS DateTime))
INSERT [dbo].[NguoiDung_TuyenDung] ([MaNguoiDung], [MaTuyenDung], [NgayNopDon]) VALUES (27, 3, CAST(N'2020-03-21 00:00:00.000' AS DateTime))
INSERT [dbo].[NguoiDung_TuyenDung] ([MaNguoiDung], [MaTuyenDung], [NgayNopDon]) VALUES (28, 7, CAST(N'2020-04-10 00:00:00.000' AS DateTime))
INSERT [dbo].[NguoiDung_TuyenDung] ([MaNguoiDung], [MaTuyenDung], [NgayNopDon]) VALUES (30, 16, CAST(N'2020-03-30 00:00:00.000' AS DateTime))
INSERT [dbo].[NguoiDung_TuyenDung] ([MaNguoiDung], [MaTuyenDung], [NgayNopDon]) VALUES (31, 13, CAST(N'2020-03-28 00:00:00.000' AS DateTime))
INSERT [dbo].[NguoiDung_TuyenDung] ([MaNguoiDung], [MaTuyenDung], [NgayNopDon]) VALUES (32, 14, CAST(N'2020-04-13 00:00:00.000' AS DateTime))
INSERT [dbo].[NguoiDung_TuyenDung] ([MaNguoiDung], [MaTuyenDung], [NgayNopDon]) VALUES (36, 13, CAST(N'2020-04-25 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau]) VALUES (1, N'tranvana123', N'123456')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau]) VALUES (2, N'nguyenvanb123', N'123456')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau]) VALUES (3, N'lethic123', N'123456')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau]) VALUES (4, N'doanthid123', N'123456')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau]) VALUES (5, N'trinhvane123', N'123456')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau]) VALUES (6, N'ngoducg123', N'123456')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau]) VALUES (7, N'daothih123', N'123456')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau]) VALUES (8, N'tonnuk123', N'123456')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau]) VALUES (9, N'nguyenthii123', N'123456')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau]) VALUES (10, N'tranthim123', N'123456')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau]) VALUES (11, N'levann123', N'123456')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau]) VALUES (12, N'tonkieuo123', N'123456')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau]) VALUES (13, N'doanthip123', N'123456')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau]) VALUES (14, N'dinhtienq123', N'123456')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau]) VALUES (15, N'caovanr123', N'123456')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau]) VALUES (16, N'trinhvans123', N'123456')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau]) VALUES (17, N'tranvant123', N'123456')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau]) VALUES (18, N'lethiu123', N'123456')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau]) VALUES (19, N'nguyenvanv123', N'123456')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau]) VALUES (20, N'ngothix123', N'123456')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau]) VALUES (21, N'caobay123', N'123456')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau]) VALUES (22, N'tonngoch123', N'123456')
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
SET IDENTITY_INSERT [dbo].[ThongTinNguoiDung] ON 

INSERT [dbo].[ThongTinNguoiDung] ([MaNguoiDung], [HoVaTen], [MaTaiKhoan], [GioiTinh], [NgaySinh], [QueQuan], [DiaChi], [SoDienThoai], [ViTriChucVu], [SoNamKinhNghiem], [CapBac], [TrinhDoHocVan]) VALUES (1, N'Trần Văn A', 1, N'Nam', CAST(N'1990-01-01 00:00:00.000' AS DateTime), N'Phú Yên', N'01 Nguyễn Văn Lương, Phường 10, Gò Vấp,Hồ Chí Minh', N'034 562 7513', N'Frontend Developer', 7, N'Trưởng phòng', N'Tiến sĩ')
INSERT [dbo].[ThongTinNguoiDung] ([MaNguoiDung], [HoVaTen], [MaTaiKhoan], [GioiTinh], [NgaySinh], [QueQuan], [DiaChi], [SoDienThoai], [ViTriChucVu], [SoNamKinhNghiem], [CapBac], [TrinhDoHocVan]) VALUES (2, N'Nguyễn Văn B', 2, N'Nam', CAST(N'1991-01-02 00:00:00.000' AS DateTime), N'TP HCM', N'100 Trần Huy Liệu, Phường 15, Phú Nhuận, Hồ Chí Minh', N'093 628 2615', N'Android Developer', 4, N'Trưởng phòng', N'Thạc sĩ')
INSERT [dbo].[ThongTinNguoiDung] ([MaNguoiDung], [HoVaTen], [MaTaiKhoan], [GioiTinh], [NgaySinh], [QueQuan], [DiaChi], [SoDienThoai], [ViTriChucVu], [SoNamKinhNghiem], [CapBac], [TrinhDoHocVan]) VALUES (3, N'Lê Thị C', 3, N'Nữ', CAST(N'1992-01-03 00:00:00.000' AS DateTime), N'Thanh Hóa', N'162 Quang Trung, Phường 10, Gò Vấp, Hồ Chí Minh', N'021 871 8244', N'Backend Developer', 5, N'Trưởng phòng', N'Tiến sĩ')
INSERT [dbo].[ThongTinNguoiDung] ([MaNguoiDung], [HoVaTen], [MaTaiKhoan], [GioiTinh], [NgaySinh], [QueQuan], [DiaChi], [SoDienThoai], [ViTriChucVu], [SoNamKinhNghiem], [CapBac], [TrinhDoHocVan]) VALUES (16, N'Đoàn Thị D ', 4, N'Nữ', CAST(N'1990-02-05 00:00:00.000' AS DateTime), N'Hòa Bình', N'98F Phố Nguyễn Thái Học, Điên Bàn, Đống Đa, Hà Nội', N'031 689 4219', N'Software Engineer', 3, N'Nhân Viên', N'Thạc sĩ')
INSERT [dbo].[ThongTinNguoiDung] ([MaNguoiDung], [HoVaTen], [MaTaiKhoan], [GioiTinh], [NgaySinh], [QueQuan], [DiaChi], [SoDienThoai], [ViTriChucVu], [SoNamKinhNghiem], [CapBac], [TrinhDoHocVan]) VALUES (17, N'Trịnh Văn E', 5, N'Nam', CAST(N'1994-02-10 00:00:00.000' AS DateTime), N'Sơn La', N'07 Duy Tân, Hoà Cường Bắc, Hải Châu, Đà Nẵng', N'091 784 2917', N'PHP Developer  ', 6, N'Trưởng phòng', N'Tiến sĩ')
INSERT [dbo].[ThongTinNguoiDung] ([MaNguoiDung], [HoVaTen], [MaTaiKhoan], [GioiTinh], [NgaySinh], [QueQuan], [DiaChi], [SoDienThoai], [ViTriChucVu], [SoNamKinhNghiem], [CapBac], [TrinhDoHocVan]) VALUES (18, N'Ngô Đức G', 6, N'Nam', CAST(N'1995-03-15 00:00:00.000' AS DateTime), N'Điện Biên', N'34 Nguyễn Hữu Thọ, Hòa Thuận Nam, Hải Châu, Đà Nẵng', N'026 192 1815', N'Backend Developer', 1, N'Nhân viên', N'Cử nhân')
INSERT [dbo].[ThongTinNguoiDung] ([MaNguoiDung], [HoVaTen], [MaTaiKhoan], [GioiTinh], [NgaySinh], [QueQuan], [DiaChi], [SoDienThoai], [ViTriChucVu], [SoNamKinhNghiem], [CapBac], [TrinhDoHocVan]) VALUES (19, N'Đào Thị H', 7, N'Nữ', CAST(N'1995-10-15 00:00:00.000' AS DateTime), N'Lai Châu', N'102 Đường Trần Văn Kiểu, Phường 10, Quận 6, Hồ Chí Minh', N'037 721 2123', N'.NET Developer', 2, N'Nhân viên', N'Thạc sĩ')
INSERT [dbo].[ThongTinNguoiDung] ([MaNguoiDung], [HoVaTen], [MaTaiKhoan], [GioiTinh], [NgaySinh], [QueQuan], [DiaChi], [SoDienThoai], [ViTriChucVu], [SoNamKinhNghiem], [CapBac], [TrinhDoHocVan]) VALUES (20, N'Tôn Nữ K', 8, N'Nữ', CAST(N'1992-12-01 00:00:00.000' AS DateTime), N'Lào Cai', N'14 Trần Bình Trọng, Trần Hưng Đạo, Hoàn Kiếm, Hà Nội', N'095 129 6219', N'Java Developer', 4, N'Trưởng phòng', N'Thạc sĩ')
INSERT [dbo].[ThongTinNguoiDung] ([MaNguoiDung], [HoVaTen], [MaTaiKhoan], [GioiTinh], [NgaySinh], [QueQuan], [DiaChi], [SoDienThoai], [ViTriChucVu], [SoNamKinhNghiem], [CapBac], [TrinhDoHocVan]) VALUES (21, N'Nguyễn Thị I', 9, N'Nữ', CAST(N'1993-04-10 00:00:00.000' AS DateTime), N'Yên Bái', N'156 Nguyễn Hữu Thọ, Hòa Thuận Nam, Hải Châu, Đà Nẵng', N'027 192 4162', N'Frontend Developer', 6, N'Trưởng phòng', N'Tiến sĩ')
INSERT [dbo].[ThongTinNguoiDung] ([MaNguoiDung], [HoVaTen], [MaTaiKhoan], [GioiTinh], [NgaySinh], [QueQuan], [DiaChi], [SoDienThoai], [ViTriChucVu], [SoNamKinhNghiem], [CapBac], [TrinhDoHocVan]) VALUES (22, N'Trần Thị M', 10, N'Nữ', CAST(N'1991-07-21 00:00:00.000' AS DateTime), N'Phú Yên', N'371 Nguyễn Kiệm, Phường 3, Gò Vấp, Hồ Chí Minh', N'025 876 5791', N'Software Engineer', 4, N'Trưởng phòng', N'Thạc sĩ')
INSERT [dbo].[ThongTinNguoiDung] ([MaNguoiDung], [HoVaTen], [MaTaiKhoan], [GioiTinh], [NgaySinh], [QueQuan], [DiaChi], [SoDienThoai], [ViTriChucVu], [SoNamKinhNghiem], [CapBac], [TrinhDoHocVan]) VALUES (23, N'Lê Văn N', 11, N'Nam', CAST(N'1997-08-11 00:00:00.000' AS DateTime), N'TP HCM', N'170 Nguyễn Văn Linh, Vĩnh Trung, Thanh Khê, Đà Nẵng', N'096 715 7182', N'
iOS Developer', 0, N'Mới tốt nghiệp', N'Cử nhân')
INSERT [dbo].[ThongTinNguoiDung] ([MaNguoiDung], [HoVaTen], [MaTaiKhoan], [GioiTinh], [NgaySinh], [QueQuan], [DiaChi], [SoDienThoai], [ViTriChucVu], [SoNamKinhNghiem], [CapBac], [TrinhDoHocVan]) VALUES (24, N'Tôn Kiều O', 12, N'Nữ', CAST(N'1990-02-22 00:00:00.000' AS DateTime), N'TP HCM', N'170A Nơ Trang Long, Phường 12, Bình Thạnh, Hồ Chí Minh', N'029 283 0163', N'Full Stack Developer', 5, N'Trưởng phòng', N'Tiến sĩ')
INSERT [dbo].[ThongTinNguoiDung] ([MaNguoiDung], [HoVaTen], [MaTaiKhoan], [GioiTinh], [NgaySinh], [QueQuan], [DiaChi], [SoDienThoai], [ViTriChucVu], [SoNamKinhNghiem], [CapBac], [TrinhDoHocVan]) VALUES (25, N'Đoàn Thị P ', 13, N'Nữ', CAST(N'1997-11-11 00:00:00.000' AS DateTime), N'Đà Nẵng', N'56 Phan Văn Trị, Quốc Tử Giám, Đống Đa, Hà Nội', N'027 915 3571', N'Software Engineer', 0, N'Mới tốt nghiệp', N'Cử nhân')
INSERT [dbo].[ThongTinNguoiDung] ([MaNguoiDung], [HoVaTen], [MaTaiKhoan], [GioiTinh], [NgaySinh], [QueQuan], [DiaChi], [SoDienThoai], [ViTriChucVu], [SoNamKinhNghiem], [CapBac], [TrinhDoHocVan]) VALUES (26, N'Đinh Tiến Q', 14, N'Nam', CAST(N'1995-01-21 00:00:00.000' AS DateTime), N'Khánh Hòa', N'227 Nguyễn Văn Linh, Thạc Gián, Thanh Khê, Đà Nẵng', N'032 628 2819', N'PHP Web Developer  ', 3, N'Nhân viên', N'Thạc sĩ')
INSERT [dbo].[ThongTinNguoiDung] ([MaNguoiDung], [HoVaTen], [MaTaiKhoan], [GioiTinh], [NgaySinh], [QueQuan], [DiaChi], [SoDienThoai], [ViTriChucVu], [SoNamKinhNghiem], [CapBac], [TrinhDoHocVan]) VALUES (27, N'Cao Văn R', 15, N'Nam', CAST(N'1996-07-16 00:00:00.000' AS DateTime), N'Hà Nội', N'330 Âu Dương Lân, Phường 3, Quận 8, Hồ Chí Minh', N'096 271 3261', N'Frontend Developer', 2, N'Nhân viên', N'Thạc sĩ')
INSERT [dbo].[ThongTinNguoiDung] ([MaNguoiDung], [HoVaTen], [MaTaiKhoan], [GioiTinh], [NgaySinh], [QueQuan], [DiaChi], [SoDienThoai], [ViTriChucVu], [SoNamKinhNghiem], [CapBac], [TrinhDoHocVan]) VALUES (28, N'Trinh Văn S', 16, N'Nam', CAST(N'1990-12-11 00:00:00.000' AS DateTime), N'Quy Nhơn', N'351A Lạc Long Quân, Phường 5, Quận 11, Hồ Chí Minh', N'038 279 2831', N'Database Administrator', 6, N'Trưởng phòng', N'Tiến sĩ')
INSERT [dbo].[ThongTinNguoiDung] ([MaNguoiDung], [HoVaTen], [MaTaiKhoan], [GioiTinh], [NgaySinh], [QueQuan], [DiaChi], [SoDienThoai], [ViTriChucVu], [SoNamKinhNghiem], [CapBac], [TrinhDoHocVan]) VALUES (29, N'Trần Văn T', 17, N'Nam', CAST(N'1991-09-01 00:00:00.000' AS DateTime), N'Hà Nội', N'137 Lê Đình Lý, Bình Thuận, Hải Châu, Đà Nẵng', N'023 549 2134', N'.NET Developer', 5, N'Trưởng phòng', N'Tiến sĩ')
INSERT [dbo].[ThongTinNguoiDung] ([MaNguoiDung], [HoVaTen], [MaTaiKhoan], [GioiTinh], [NgaySinh], [QueQuan], [DiaChi], [SoDienThoai], [ViTriChucVu], [SoNamKinhNghiem], [CapBac], [TrinhDoHocVan]) VALUES (30, N'Lê Thị U', 18, N'Nữ', CAST(N'1996-03-17 00:00:00.000' AS DateTime), N'Hòa Bình', N'142 Hai Bà Trưng, Đa Kao, Quận 1, Hồ Chí Minh', N'034 728 2612', N'Backend Developer', 0, N'Mới tốt nghiệp', N'Cử nhân')
INSERT [dbo].[ThongTinNguoiDung] ([MaNguoiDung], [HoVaTen], [MaTaiKhoan], [GioiTinh], [NgaySinh], [QueQuan], [DiaChi], [SoDienThoai], [ViTriChucVu], [SoNamKinhNghiem], [CapBac], [TrinhDoHocVan]) VALUES (31, N'Nguyễn Văn V', 19, N'Nam', CAST(N'1993-01-25 00:00:00.000' AS DateTime), N'Hà Nội', N'1126 Đường La Thành, Ngọc Khánh, Ba Đình, Hà Nội', N'096 137 3168', N'System Admin', 4, N'Trưởng phòng', N'Thạc sĩ')
INSERT [dbo].[ThongTinNguoiDung] ([MaNguoiDung], [HoVaTen], [MaTaiKhoan], [GioiTinh], [NgaySinh], [QueQuan], [DiaChi], [SoDienThoai], [ViTriChucVu], [SoNamKinhNghiem], [CapBac], [TrinhDoHocVan]) VALUES (32, N'Ngô Thị X', 20, N'Nữ', CAST(N'1997-10-17 00:00:00.000' AS DateTime), N'Đà Nẵng', N'207 Giải Phóng, Đồng Tâm, Hai Bà Trưng, Hà Nội', N'093 316 8685', N'Unity Game Developer', 1, N'Nhân viên', N'Cử nhân')
INSERT [dbo].[ThongTinNguoiDung] ([MaNguoiDung], [HoVaTen], [MaTaiKhoan], [GioiTinh], [NgaySinh], [QueQuan], [DiaChi], [SoDienThoai], [ViTriChucVu], [SoNamKinhNghiem], [CapBac], [TrinhDoHocVan]) VALUES (33, N'Cao Bá Y', 21, N'Nam', CAST(N'1996-12-22 00:00:00.000' AS DateTime), N'TP HCM', N'591 Phạm Thế Hiển, Phường 8, Quận 8, Hồ Chí Minh', N'026 861 1923', N'Full Stack Developer', 1, N'Nhân viên', N'Cử nhân')
INSERT [dbo].[ThongTinNguoiDung] ([MaNguoiDung], [HoVaTen], [MaTaiKhoan], [GioiTinh], [NgaySinh], [QueQuan], [DiaChi], [SoDienThoai], [ViTriChucVu], [SoNamKinhNghiem], [CapBac], [TrinhDoHocVan]) VALUES (36, N'Tôn Ngọc H', 22, N'Nữ', CAST(N'1991-07-10 00:00:00.000' AS DateTime), N'Hà Nội', N'251 Nguyễn Khang, Yên Hoà, Cầu Giấy, Hà Nội', N'026 821 2619', N'System Admin', 6, N'Trưởng phòng', N'Tiến sĩ')
SET IDENTITY_INSERT [dbo].[ThongTinNguoiDung] OFF
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'ABIVIN', N'ABIVIN', N'Phạm Hùng, Mễ Trì, Nam Từ Liêm', N'Hà Nội', N'097 663 8008', N'info@abivin.com')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'ABTEM', N'AdNovum Vietnam', N'98 Đường Ngô Tất Tố, Phường 19, Bình Thạnh', N'Hồ Chí Minh', N'028 381 68200', N'info@adnovum.vn')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'AITS', N'AITS Vietnam Airlines', N'270 Đường Bùi Hữu Nghĩa, Phường 1, Bình Thạnh', N'Hồ Chí Minh', N'190 098 9866', N'helpdesk.aits@vietnamairlines.com 
')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'ALCVN', N'Allexceed Viet Nam', N'566 Núi Thành, Hoà Cường Nam, Hải Châu', N'Đà Nẵng', N'028 3823 3202', N'info@allexceed.vn')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'ALIVN', N'ALI Viet Nam', N'438 Nguyễn Kiệm, Phường 3, Phú Nhuận', N'Hồ Chí Minh', N'037 501 1688', N'admin@alimex.vn')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'ALTCA', N'Alticast', N'54 Liễu Giai, Cống Vị, Ba Đình', N'Hà Nội', N'022 007 7700', N'help@alicast.com')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'ALTNL', N'Amela Technology
', N'51 Thăng Long, Phường 4, Tân Bình', N'Hồ Chí Minh', N'024 2282 9933', N'info@amela.vn')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'ANIVM', N'An Nhi Investment', N'171 Trung Kính, Yên Hoà, Cầu Giấy', N'Hà Nội', N'093 848 5358', N'info@annhi.vn')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'ASVCL', N'Aperia Solutions Vietnam Co Ltd', N'448 Hoàng Văn Thụ, Phường 4, Tân Bình', N'Hồ Chí Minh', N'028 3547 1694', N'hr@aperia.vn')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'ATSVN', N'AltSource Viet Nam', N'270 Lý Thường Kiệt, Phường 14, Quận 10', N'Hồ Chí Minh', N'971 373 8449', N'info@altsourceoftware.com')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'AVDIST', N'Advesa Digital Solutions', N'44 Hồng Hà, Phường 2, Tân Bình', N'Hồ Chí Minh', N'042 273 9366', N'info@advesa.com')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'AVSTL', N'AMI Vietnam Solution Technology', N'91 Ngô Thì Sỹ, Vạn Phúc, Hà Đông', N'Hà Nội', N'024 6675 6325', N'info@amisolution.com')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'BOYVN', N'Cong Ty TNHH Dich Vu Boxyz VN', N'305 Núi Thành, Hoà Cường Bắc, Hải Châu', N'Đà Nẵng', N'090 565 3147', N'boxyzvietnam@gmail.com')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'CDBSL', N'Codebox Solutions', N'539A Cách Mạng Tháng Tám, Phường 15, Quận 10', N'Hồ Chí Minh', N'028 6289 4388', N'contact@codebox.vn')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'DLODL', N'Deliveree On-Demand Logistics', N'3 Phan Đăng Lưu, Phường 3, Bình Thạnh', N'Hồ Chí Minh', N'028 3547 1279', N'admin@ondemand.com')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'DRJVN', N'Dr.JOY Viet Nam', N'104 Nguyễn Tri Phương, Chính Gián, Thanh Khê', N'Đà Nẵng', N'028 5627 3396', N'recruitment@drjoy.vn')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'DTPEJ', N'Dai Truong Phat Education JSC', N'412 Tôn Đức Thắng, Hoà Minh, Liên Chiểu', N'Đà Nẵng', N'1800 6242', N'info@dtp-education.com')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'FPTSW', N'FPT Software', N'212 Kim Mã, Ba Đình', N'Hà Nội', N'024 3768 9048', N' fsoft.contact@fsoft.com.vn')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'FTCCN', N'F88 Tai Chinh Ca Nhan', N'148 Kim Hoa, Phương Liên, Đống Đa', N'Hà Nội', N'1800 6388', N'info@f88.com')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'GHNTQ', N'GHN Giao Hang Nhanh Toan Quoc', N'242 Nguyễn Hữu Thọ, Khuêõ Trung, Hải Châu', N'Đà Nẵng', N'1800 6328', N'cskh@ghn.vn')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'ICDVN', N'ICD Vietnam', N'787 Lũy Bán Bích, Hoà Thanh, Tân Phú', N'Hồ Chí Minh', N'028 3823 1227', N'Sales@icdvietnam.com.vn')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'ITVNC', N'Innotech Vietnam Corporation', N'115/1 Trần Quốc Thảo, Phường 7, Quận 3', N'Hồ Chí Minh', N'028 3999 1895', N'info@innotech-vn.com')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'LGDCV', N'LG Development Center Vietnam', N'73 Phạm Thế Hiển, Khuêõ Trung, Cẩm Lệ, Đà Nẵng', N'Đà Nẵng', N'024 3275 3173', N'info@lgcenter.com')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'MGMTP', N'MGM Technology Partners Vietnam', N'168 Trần Thanh Mại, Tân Tạo A, Bình Tân', N'Hồ Chí Minh', N'0236 3531 773', N'info@mgmpartners.com')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'NEESI', N'NEETEK Systems Integration', N'110 Điện Biên Phủ, Đa Kao, Quận 1', N'Hồ Chí Minh', N'041 5946 2390', N'info@neetek.com')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'NFQAS', N'NFQ Asia', N'180 Hai Bà Trưng, Đa Kao, Quận 1', N'Hồ Chí Minh', N'286 681 2733', N'info@nfq.com')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'NHNVN', N'NHN Vietnam', N'Mạc Thái Tổ, Yên Hoà, Cầu Giấy', N'Hà Nội', N'087 309 8179', N'contact.vn@nhn.com')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'RDWVN', N'redWeb Viet Nam', N'87 Láng Hạ, Chợ Dừa, Ba Đình', N'Hà Nội', N'028 3838 9052', N'solutions@redweb.vn')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'SEIVN', N'Seldat Inc Vietnam', N'265 Hòa Bình, Hiệp Tân, Tân Phú', N'Hồ Chí Minh', N'028 6650 8626', N'info@seldatinc.com')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'SGTSL', N'Saigon Technology Solutions', N'19 Nguyễn Đình Chiểu, Đa Kao, Quận 1', N'Hồ Chí Minh', N'028 3811 0001', N'sales@saigontechnology.com')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'TCBVN', N'Techcombank', N'108 Bàu Cát 2, Phường 12, Tân Bình', N'Hồ Chí Minh', N'024 3944 6368', N'info@techcombank.com')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'TOHSW', N'Tower Of Hanoi Software', N'407 Trưng Nữ Vương, Hòa Thuận Nam, Hải Châu', N'Đà Nẵng', N'098 472 5043', N'info@tohsoft.com')
INSERT [dbo].[ThongTinNhaTuyenDung] ([MaCongTy], [TenCongTy], [DiaChi], [ThanhPho], [SoDienThoai], [Email]) VALUES (N'VINCE', N'Vincere', N'320 Lê Thanh Nghị, Hoà Cường Nam, Hải Châu', N'Đà Nẵng', N'098 327 9842', N'info@vincere.com')
SET IDENTITY_INSERT [dbo].[ThongTinTuyenDung] ON 

INSERT [dbo].[ThongTinTuyenDung] ([MaTuyenDung], [MaCongTy], [MaChucVu], [CapBac], [MoTaCongViec], [YeuCauCongTy], [MucLuong], [HanNopDon]) VALUES (1, N'ALIVN', 15, N'Trưởng phòng', N'Xây dựng các chức năng chạy đa nền tảng (website, mobile, ipad). Phân tích người dùng, tìm hiểu và tìm ra đặc điểm của đối tượng. Hiểu và đề xuất các ứng dụng khác có thể giải quyết nhu cầu của doanh nghiệp.', N'Có kinh nghiệm sử dụng các Framework PHP: Laravel, Wordpress. Có kinh nghiệm sử dụng NodeJS, Python. Có kinh nghiệm sử dụng NodeJS, Python. Có kinh nghiệm làm việc với MySQL. Thao tác tốt với HTML, CSS, JavaScript (Jquery, Ajax), Bootstrap, JSON, XML. Thành thạo các công cụ quản lý mã nguồn: GIT, SVN.', N'20000000', CAST(N'2020-07-30 00:00:00.000' AS DateTime))
INSERT [dbo].[ThongTinTuyenDung] ([MaTuyenDung], [MaCongTy], [MaChucVu], [CapBac], [MoTaCongViec], [YeuCauCongTy], [MucLuong], [HanNopDon]) VALUES (2, N'ALTCA', 2, N'Nhân viên', N'Xác minh các sản phẩm của chúng tôi được nhúng trong nhiều loại thiết bị, chẳng hạn như hộp Set-Top, thiết bị di động, hệ thống máy chủ, v.v. Kiểm tra và xác minh sửa lỗi. Chạy các yêu cầu kiểm tra được chỉ định và xác định các sự cố phần mềm. Xem xét các yêu cầu của từng dự án được giao để hiểu kỹ về Dự án Kỳ vọng.', N'Bằng cử nhân về CNTT hoặc kinh nghiệm làm việc liên quan đến ngành Kiểm tra hoặc Phát thanh truyền hình. Thành thạo với MS office. Có thể làm theo chỉ dẫn và hoàn thành nhiệm vụ được giao một cách kịp thời. Kỹ năng tổ chức tốt, khả năng duy trì sự tập trung.', N'15000000', CAST(N'2020-10-01 00:00:00.000' AS DateTime))
INSERT [dbo].[ThongTinTuyenDung] ([MaTuyenDung], [MaCongTy], [MaChucVu], [CapBac], [MoTaCongViec], [YeuCauCongTy], [MucLuong], [HanNopDon]) VALUES (3, N'ASVCL', 9, N'Nhân viên', N'Làm việc cùng với đội ngũ kiến trúc để thiết kế các giải pháp kỹ thuật. Giúp phát triển và tuân thủ - các hướng dẫn và tiêu chuẩn kỹ thuật phần mềm. Làm việc với nhóm UI / UX để đảm bảo kết quả tốt nhất có thể kịp thời. Đảm bảo khả năng mở rộng, tính nhất quán, các mẫu có thể tái sử dụng, cải thiện quy trình xây dựng và xem xét các công nghệ mới để tiếp tục các mục tiêu này.', N'Hiểu rõ về bộ xử lý trước HTML / CSS và CSS (SCSS). Hiểu biết sâu sắc về công cụ JavaScript, NodeJS và CLI (Cấp cao). Trải nghiệm với các công nghệ và khung Frontend . Viết mã hiệu suất cao, có thể tái sử dụng cho các thành phần UI.', N'18000000', CAST(N'2020-09-10 00:00:00.000' AS DateTime))
INSERT [dbo].[ThongTinTuyenDung] ([MaTuyenDung], [MaCongTy], [MaChucVu], [CapBac], [MoTaCongViec], [YeuCauCongTy], [MucLuong], [HanNopDon]) VALUES (4, N'DLODL', 19, N'Nhân viên', N'Làm việc chặt chẽ với các nhóm kinh doanh và sản phẩm và dịch các yêu cầu để thiết kế sản phẩm cao cấp. Phát triển toàn bộ UX, phân phối giao diện người dùng, từ personas & bảng phân cảnh đến thiết kế kiến trúc và tương tác thông tin, từ khung dây đến thiết kế giao diện người dùng. Tiếp cận tất cả các dự án với sự đồng cảm và nguyên tắc thiết kế cảm xúc. Phối hợp chặt chẽ với đội ngũ phát triển và QC để tạo và cung cấp các sản phẩm được tối ưu hóa chất lượng UX.', N'Kiến thức làm việc về Phác thảo, Zeplin, nền tảng tạo mẫu được lựa chọn, Adobe Photoshop và Illustrator. 1-3 năm UX, kinh nghiệm thiết kế UI được ưa thích. Có khả năng quản lý thành công một số dự án cùng một lúc. Kỹ năng giải quyết vấn đề chiến lược và ra quyết định xuất sắc trong lĩnh vực trải nghiệm và thiết kế người dùng.', N'22000000', CAST(N'2020-09-20 00:00:00.000' AS DateTime))
INSERT [dbo].[ThongTinTuyenDung] ([MaTuyenDung], [MaCongTy], [MaChucVu], [CapBac], [MoTaCongViec], [YeuCauCongTy], [MucLuong], [HanNopDon]) VALUES (5, N'AVDIST', 5, N'Trưởng phòng', N'Tạo và duy trì mô hình dữ liệu & API có tổ chức và hiệu quả. Lập trình kết thúc theo vòng đời phát triển phần mềm. Tài liệu mã nguồn bên trong và bên ngoài. Khắc phục sự cố các ứng dụng đã triển khai. Phối hợp với nhiều bộ phận trong tổ chức để thiết kế, xây dựng, thử nghiệm và vận chuyển phần mềm chất lượng cao.', N'Kinh nghiệm cấp cao (~ 5 năm +) xây dựng các hệ thống back-end hiện đại. Ít nhất hơn 3 năm kinh nghiệm sử dụng Python. Kinh nghiệm xuất bản và tiêu thụ API. Kỹ năng cơ sở dữ liệu SQL và NoQuery.', N'25000000', CAST(N'2020-08-15 00:00:00.000' AS DateTime))
INSERT [dbo].[ThongTinTuyenDung] ([MaTuyenDung], [MaCongTy], [MaChucVu], [CapBac], [MoTaCongViec], [YeuCauCongTy], [MucLuong], [HanNopDon]) VALUES (6, N'FPTSW', 4, N'Nhân viên', N'Tham gia vào việc thiết kế, phát triển, thử nghiệm và tài liệu cho phần mềm nhúng của các ứng dụng IoT, cung cấp hỗ trợ kỹ thuật tư vấn cho người dùng cuối. Chịu trách nhiệm phân phối phần mềm, giao tiếp với lãnh đạo, quản lý dự án hoặc khách hàng.', N'Kỹ năng ngôn ngữ C mạnh. Hơn 2 năm kinh nghiệm trong phát triển phần mềm nhúng. Bằng cử nhân Kỹ thuật hoặc Khoa học Máy tính. Kinh nghiệm với vòng đời phát triển phần mềm đầy đủ bao gồm các yêu cầu, thiết kế, triển khai, thử nghiệm và triển khai.', N'21000000', CAST(N'2020-11-01 00:00:00.000' AS DateTime))
INSERT [dbo].[ThongTinTuyenDung] ([MaTuyenDung], [MaCongTy], [MaChucVu], [CapBac], [MoTaCongViec], [YeuCauCongTy], [MucLuong], [HanNopDon]) VALUES (7, N'SEIVN', 13, N'Nhân viên', N'Quản trị tất cả các đối tượng cơ sở dữ liệu, bao gồm bảng, dạng xem, chỉ mục, gói, thủ tục được lưu trữ. Phối hợp với các nhà phát triển web để hoàn thành phát triển ứng dụng từ phối cảnh phía sau. Phối hợp với các nhà quản lý để xem xét, thiết kế và thực hiện cơ sở dữ liệu. Tối ưu hóa cơ sở dữ liệu cho hiệu suất.', N'Ít nhất 4 năm kinh nghiệm trong quản trị và phát triển cơ sở dữ liệu.  Kinh nghiệm mạnh mẽ với một trong những MySQL, MS Server, Oracle. Kiến thức về Mongo DB, PostgreSQL. Phải có kinh nghiệm để viết các thủ tục lưu trữ.', N'15000000', CAST(N'2020-12-10 00:00:00.000' AS DateTime))
INSERT [dbo].[ThongTinTuyenDung] ([MaTuyenDung], [MaCongTy], [MaChucVu], [CapBac], [MoTaCongViec], [YeuCauCongTy], [MucLuong], [HanNopDon]) VALUES (8, N'NEESI', 7, N'Nhân viên', N'Tham gia vào các dự án phần mềm với các đối tác trong và ngoài nước. Đặc biệt là phát triển sản phẩm phần mềm của công ty.. Chịu trách nhiệm về tiến độ và chất lượng công việc, báo cáo hàng ngày trực tiếp cho người quản lý.', N'Kinh nghiệm Ít nhất 1 năm kinh nghiệm lập trình trên nền tảng ngôn ngữ .NET (C #, Framework 4.5 trở lên). Có kiến thức và kỹ năng lập trình trên nền tảng Ứng dụng web. Có kinh nghiệm trong các khuôn khổ như AngularJS, Angular 2 trở lên.', N'20000000', CAST(N'2020-07-30 00:00:00.000' AS DateTime))
INSERT [dbo].[ThongTinTuyenDung] ([MaTuyenDung], [MaCongTy], [MaChucVu], [CapBac], [MoTaCongViec], [YeuCauCongTy], [MucLuong], [HanNopDon]) VALUES (9, N'ICDVN', 10, N'Nhân viên', N'Có tư duy hệ thống, tư duy logic tốt, tiếp thu kiến thức mới nhanh. Có khả năng làm việc độc lập, làm việc nhóm, chủ động giải quyết vấn đề. ', N'Sử dụng thành thạo ngôn ngữ như PHP, NodeJS. Có kiến thức về lập trình hướng đối tượng OOP và mô hình MVC. Có kiến thức về Front-end, bao gồm HTML5, CSS3, JavaScript, JQuery, Bootstrap... Có kinh nghiệm làm việc với các api google, twitter.', N'10000000', CAST(N'2020-09-10 00:00:00.000' AS DateTime))
INSERT [dbo].[ThongTinTuyenDung] ([MaTuyenDung], [MaCongTy], [MaChucVu], [CapBac], [MoTaCongViec], [YeuCauCongTy], [MucLuong], [HanNopDon]) VALUES (10, N'DRJVN', 8, N'Nhân viên', N'Môi trường thiết lập để phát triển. Yêu cầu nghiên cứu, nghiên cứu công nghệ liên quan đến dự án. Xử lý các tính năng ứng dụng. Kiểm tra đơn vị viết. Hỗ trợ & bảo trì (Kiểm tra và sửa lỗi)', N'Kinh nghiệm phát triển bản địa Android thông qua sử dụng Kotlin: 3 năm trở lên. Có kinh nghiệm về lập trình phản ứng RxJava / RxAndroid. Trải nghiệm phát triển các ứng dụng sử dụng giao tiếp HTTP. Kinh nghiệm kiểm tra đơn vị, kiểm tra giao diện người dùng. Khả năng lập kế hoạch cơ sở dữ liệu, định nghĩa yêu cầu, phát triển, vận hành, bảo trì', N'15000000', CAST(N'2020-08-30 00:00:00.000' AS DateTime))
INSERT [dbo].[ThongTinTuyenDung] ([MaTuyenDung], [MaCongTy], [MaChucVu], [CapBac], [MoTaCongViec], [YeuCauCongTy], [MucLuong], [HanNopDon]) VALUES (11, N'GHNTQ', 11, N'Nhân viên', N'Xây dựng sản phẩm iOS hàng đầu và tạo ảnh hưởng đến một cơ sở người dùng lớn, làm việc với một đội ngũ quốc tế tuyệt vời và hơn thế nữa. Làm việc và cộng tác trong một môi trường nhanh nhẹn với Trưởng nhóm kỹ thuật, Trưởng nhóm sản phẩm, Nhóm phụ trợ và UX để tăng tốc phân phối sản phẩm. ', N'Có ít nhất 2 năm kinh nghiệm trong vai trò phát triển iOS gốc. Phát triển ứng dụng di động bản địa trên iOS với sự lưu loát trong Swift, Core Foundation, UIKit, Cocoa Touch, Core Animation và các khung khác do Apple cung cấp. Làm quen với JSON, API dựa trên REST, XML, JavaScript và kết nối các ứng dụng iPhone / iPad với API phía máy chủ. Kinh nghiệm với quản lý bộ nhớ và hồ sơ hiệu năng / bộ nhớ. Làm quen với nhiều mẫu kiến trúc như MVC và MVVM.', N'19000000', CAST(N'2020-12-30 00:00:00.000' AS DateTime))
INSERT [dbo].[ThongTinTuyenDung] ([MaTuyenDung], [MaCongTy], [MaChucVu], [CapBac], [MoTaCongViec], [YeuCauCongTy], [MucLuong], [HanNopDon]) VALUES (12, N'NHNVN', 12, N'Trưởng phòng', N'Phát triển ứng dụng phần mềm trong JAVA. Theo các tiêu chuẩn mã hóa, xây dựng các bài kiểm tra đơn vị phù hợp, kiểm tra tích hợp và tập lệnh triển khai. Viết có thể sử dụng lại, có thể kiểm tra và thực thi mã hiệu quả về bảo mật và bảo vệ dữ liệu. Góp phần cải tiến liên tục bằng cách đề xuất cải tiến giao diện người dùng, kiến trúc phần mềm hoặc công nghệ mới.', N'3-5 năm kinh nghiệm làm việc có liên quan trong Phần mềm Java. Kiến thức về JAVA, JVM , Đa luồng. Hiểu biết tốt với OOP, API. Kiến thức với Máy chủ Web, Máy chủ ứng dụng Web , Khung công tác Spring hoặc khung MVC khác, RESTful , MySQL hoặc RDB. Làm quen với Git, Maven, IntelliJ IDEA hoặc IDE khác.', N'25000000', CAST(N'2020-10-07 00:00:00.000' AS DateTime))
INSERT [dbo].[ThongTinTuyenDung] ([MaTuyenDung], [MaCongTy], [MaChucVu], [CapBac], [MoTaCongViec], [YeuCauCongTy], [MucLuong], [HanNopDon]) VALUES (13, N'FTCCN', 14, N'Nhân viên', N'Triển khai, Quản trị các hệ thống CNTT của Công ty. Xử lý ứng cứu các lỗi trong hệ thống máy chủ, hệ thống mạng. Phân tích, viết tài liệu trình bày giải pháp, hướng dẫn sử dụng để thực hiện các dự án CNTT của Công ty. Cập nhật thông tin, phân tích các giải pháp công nghệ, sản phẩm mới liên quan đến công việc được giao. Quản lý, phối hợp với các đơn vị cung cấp để quản trị hệ thống máy chủ, phần mềm đang thuê dịch vụ.', N'Có kinh nghiệm triển khai, quản trị các hệ thống máy chủ tại các nhà cung cấp dịch vụ Amazon EC2, RDS, S3…, VCCloud, Viettel Cloud. Có kiến thức chuyên môn về các hệ điều hành Open Source (Ubutu, CentOS), hệ diều hành Windows Server. Kinh nghiệm triển khai các dịch vụ trên nền tảng Open Source như HA Proxy, MailServer, LDAP, DHCP, DNS, VPN... Có kiến thức về cài đặt, quản trị, backup cơ sở dữ liệu: MySQL, PostgreSQL, MS SQL Server, Oracle… Có kinh nghiệm làm cài đặt, quản trị các hệ thống phục vụ cho quản lý, phát triển phần mềm như Gerrit, Jira, Ci-Jenkin, Git.', N'18000000', CAST(N'2020-06-30 00:00:00.000' AS DateTime))
INSERT [dbo].[ThongTinTuyenDung] ([MaTuyenDung], [MaCongTy], [MaChucVu], [CapBac], [MoTaCongViec], [YeuCauCongTy], [MucLuong], [HanNopDon]) VALUES (14, N'RDWVN', 18, N'Nhân viên', N'Sử dụng Unity để phát triển game di động chất lượng cao cho các nền tảng Android, IOS hướng đến các thị trường phát triển.', N'Có ít nhất 1 năm kinh nghiệm lập trình mobile game bằng Unity. Có tư duy lập trình và tư duy hệ thống tốt. Có kiến thức tốt về thuật toán, cấu trúc dữ liệu. Hiểu biết về tối ưu sản phẩm cho di động.', N'15000000', CAST(N'2020-09-01 00:00:00.000' AS DateTime))
INSERT [dbo].[ThongTinTuyenDung] ([MaTuyenDung], [MaCongTy], [MaChucVu], [CapBac], [MoTaCongViec], [YeuCauCongTy], [MucLuong], [HanNopDon]) VALUES (15, N'AVDIST', 9, N'Nhân viên', N'Xây dựng giao diện phần mềm mới cho trải nghiệm người dùng nâng cao. Xây dựng các thành phần / mô-đun có thể tái sử dụng cho các trang web tĩnh với thiết kế đáp ứng. Làm việc với các điểm cuối API để cập nhật nội dung động. Đảm bảo UI / UX của các trang và phần mềm được phát triển với thiết kế gần hoàn hảo pixel. Phát triển và tối ưu hóa giao diện người dùng phía trước để đảm bảo ứng dụng được hiển thị nhất quán trong môi trường trình duyệt chéo.', N'Hiểu biết nâng cao về Javascript es5 & es6 +. Thành thạo ngăn xếp React. Kiến thức chuyên môn với HTML5, CSS3, SASS / SCSS. Chuyên gia với việc phát triển bố cục đáp ứng tận dụng các truy vấn CSS và phương tiện. Thiết kế và triển khai các giải pháp phía máy khách mạnh mẽ với API RESTful. Năng lực mạnh mẽ trong các bố cục đáp ứng, di động đầu tiên tận dụng các truy vấn phương tiện và CSS.', N'10000000', CAST(N'2020-12-31 00:00:00.000' AS DateTime))
INSERT [dbo].[ThongTinTuyenDung] ([MaTuyenDung], [MaCongTy], [MaChucVu], [CapBac], [MoTaCongViec], [YeuCauCongTy], [MucLuong], [HanNopDon]) VALUES (16, N'TCBVN', 5, N'Nhân viên', N'Phát triển các tính năng back-end bằng cách sử dụng các công nghệ ngăn xếp Restful API, microservice, AWS. Phát triển các công cụ nội bộ để hỗ trợ người dùng sản xuất và điều tra các vấn đề kỹ thuật. Thiết kế và triển khai các tính năng hỗ trợ phía máy khách và cải thiện tính khả dụng, khả năng mở rộng, độ trễ và hiệu quả bằng cách sử dụng Java, Python. Viết mã chất lượng cao, được kiểm tra tốt, sạch sẽ, đơn giản và có thể bảo trì; xây dựng thư viện chung.', N'Ít nhất 1 năm kinh nghiệm làm việc có liên quan với các nguyên tắc cơ bản của Khoa học máy tính mạnh mẽ trong các thuật toán và cấu trúc dữ liệu. Kiến thức về các khung API đầy đủ. Kiến thức về lập trình cơ sở dữ liệu hoặc kỹ năng thiết kế, bao gồm các kỹ năng cơ sở dữ liệu quan hệ (SQL, v.v.) và các kỹ năng cơ sở dữ liệu không liên quan. Kiến thức về bộ nhớ cache trong bộ nhớ. ', N'18000000', CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[ThongTinTuyenDung] ([MaTuyenDung], [MaCongTy], [MaChucVu], [CapBac], [MoTaCongViec], [YeuCauCongTy], [MucLuong], [HanNopDon]) VALUES (17, N'ITVNC', 5, N'Trưởng phòng', N'Đóng góp trong tất cả các giai đoạn của vòng đời phát triển phần mềm. Đảm bảo thiết kế phù hợp với thông số kỹ thuật. Viết mã được thiết kế tốt, có thể kiểm tra, mã nguồn hiệu quả. Đảm bảo hiệu suất, chất lượng và khả năng đáp ứng tốt nhất có thể của các ứng dụng. Hỗ trợ cải tiến liên tục bằng cách điều tra các lựa chọn và công nghệ và trình bày chúng để xem xét kiến trúc. ', N'Ít nhất 3 năm kinh nghiệm trở lên  với NodeJS. Có 2 năm kinh nghiệm về Java. Hiểu biết về AWS. Có kinh nghiệm trong lĩnh vực ngân hàng hoặc Fintech là Plus. Có kinh nghiệm về phương pháp Agile', N'25000000', CAST(N'2020-12-10 00:00:00.000' AS DateTime))
INSERT [dbo].[ThongTinTuyenDung] ([MaTuyenDung], [MaCongTy], [MaChucVu], [CapBac], [MoTaCongViec], [YeuCauCongTy], [MucLuong], [HanNopDon]) VALUES (18, N'MGMTP', 10, N'Nhân viên', N'Thiết kế, thực hiện và thử nghiệm các ứng dụng web. Phối hợp phân tích yêu cầu và thông số kỹ thuật. Chịu trách nhiệm cho sự thành công của dự án của bạn.', N'Hiểu biết về các công cụ, quy trình và kiến trúc phát triển phần mềm. Bạn sử dụng các công nghệ tiên tiến: Java, TypeScript, React, SQL. Bằng kỹ sư hoặc khoa học tự nhiên. Nếu bạn làm DevOps hoặc .NET / C #, chúng tôi cũng tò mò muốn biết về bạn ', N'16000000', CAST(N'2020-08-30 00:00:00.000' AS DateTime))
INSERT [dbo].[ThongTinTuyenDung] ([MaTuyenDung], [MaCongTy], [MaChucVu], [CapBac], [MoTaCongViec], [YeuCauCongTy], [MucLuong], [HanNopDon]) VALUES (19, N'DTPEJ', 16, N'Trưởng phòng', N'Quản lý nhóm, hỗ trợ các thành viên với mục tiêu là sự thành công của dự án. Nghiên cứu công nghệ mới theo yêu cầu của quản lý hoặc dự án. Training công nghệ mới cho tất cả thành viên.  Thực hiện các chức năng chính, chức năng phức tạp trong dự án. Review code của các thành viên trong nhóm để cải thiện kỹ năng lập trình. ', N'Có ít nhất 3 kinh nghiệm lập trình web, di động, thiết kế Database, thiết kế cấu trúc hệ thống. Có kinh nghiệm quản lý nhóm với 3 thành viên trở lên. Tư duy, logic tốt. Sáng tạo, cẩn thận, tỉ mỉ, kiên nhẫn.', N'25000000', CAST(N'2020-12-12 00:00:00.000' AS DateTime))
INSERT [dbo].[ThongTinTuyenDung] ([MaTuyenDung], [MaCongTy], [MaChucVu], [CapBac], [MoTaCongViec], [YeuCauCongTy], [MucLuong], [HanNopDon]) VALUES (20, N'NFQAS', 1, N'Nhân viên', N'Xây dựng kế hoạch dự án chi tiết và phân công công việc cho các thành viên dự án. Là cầu nối giữa quản lý dự án bên khách hàng và các bên liên quan để xử lý công việc của toàn dự án. Tham gia hỗ trợ các dự án chạy, dự báo, đánh giá, đưa ra các giải pháp kỹ thuật cho dự án; đảm bảo dự án được triển khai đúng tiến độ với chất lượng cao. Làm tài liệu, design, quản lý và đào tạo hướng dẫn cho các thành viên trong dự án.', N'Quản lý dự án ít nhất 3 năm về phát triển phần mềm và web, kinh nghiệm lãnh đạo kỹ thuật là một lợi thế.  Có nền tảng kỹ thuật (lý tưởng là PHP, JavaScript). Mong muốn làm việc với một cơ quan kỹ thuật số để quản lý nhiều danh mục dự án. Kỹ năng tổ chức và phân tích tuyệt vời với khả năng kỹ thuật mạnh mẽ để hiểu nhu cầu và vấn đề thực sự của khách hàng của bạn. Phương pháp Agile / SCRUM. ', N'20000000', CAST(N'2020-10-10 00:00:00.000' AS DateTime))
INSERT [dbo].[ThongTinTuyenDung] ([MaTuyenDung], [MaCongTy], [MaChucVu], [CapBac], [MoTaCongViec], [YeuCauCongTy], [MucLuong], [HanNopDon]) VALUES (21, N'ICDVN', 20, N'Nhân viên', N'Phát triển / duy trì hệ thống , công cụ cho dịch vụ truyền phát video của chúng tôi. Cung cấp đầu ra với chất lượng, tốc độ, tuân thủ mong đợi để mang lại giá trị tốt nhất cho người dùng cuối của sản phẩm / dịch vụ. Mentor hoặc huấn luyện viên thành viên cơ sở để đạt được một mức độ năng lực hoặc hiệu suất nhất định để đáp ứng các mục tiêu của dự án', N'Khắc phục sự cố, kiểm tra và bảo trì phần mềm và cơ sở dữ liệu cốt lõi để đảm bảo tối ưu hóa mạnh mẽ và chức năng. Giải quyết vấn đề tốt, kỹ năng tổ chức và quản lý thời gian. Quan tâm đến việc học các ngăn xếp và khung công nghệ mới. Viết mã duy trì, ổn định và có thể mở rộng. Kỹ năng tuyệt vời về JavaScript, NodeJS ; hiểu microservice là một lợi thế lớn', N'15000000', CAST(N'2020-07-17 00:00:00.000' AS DateTime))
INSERT [dbo].[ThongTinTuyenDung] ([MaTuyenDung], [MaCongTy], [MaChucVu], [CapBac], [MoTaCongViec], [YeuCauCongTy], [MucLuong], [HanNopDon]) VALUES (22, N'SGTSL', 17, N'Nhân viên', N'Phát triển sản phẩm và xem các tính năng và ý tưởng của bạn đang được thực hiện và sử dụng bởi hàng ngàn người dùng hàng ngày. Tham gia một đội ngũ trẻ, chiến thắng và khu vực làm việc trên các công nghệ đột phá. Phối hợp chặt chẽ với các nhóm khu vực (sản phẩm, doanh nghiệp) để xem phản hồi của người dùng và nhóm doanh nghiệp và cung cấp giải pháp để cải thiện sản phẩm của chính bạn. Bạn sẽ làm việc trong môi trường Agile / Scrum.', N'Trải nghiệm với tư cách là nhà phát triển Ruby on Rails (All Level). rải nghiệm với giao diện người dùng web như HTML, JavaScript, CoffeeScript, CSS, SASS, jQuery. Trải nghiệm với API RESTful. Trải nghiệm với hệ thống cơ sở dữ liệu (Postgres, MongoDB). Trải nghiệm với Git.', N'18000000', CAST(N'2020-12-30 00:00:00.000' AS DateTime))
INSERT [dbo].[ThongTinTuyenDung] ([MaTuyenDung], [MaCongTy], [MaChucVu], [CapBac], [MoTaCongViec], [YeuCauCongTy], [MucLuong], [HanNopDon]) VALUES (23, N'GHNTQ', 3, N'Nhân viên', N'Thực hiện phân tích kỹ thuật các yêu cầu. Sản xuất một thiết kế kỹ thuật vững chắc, chi tiết. Viết mã sạch, mô-đun, mạnh mẽ để thực hiện các yêu cầu mong muốn với ít hoặc không có sự giám sát. Làm việc với các đối tác khác để phân loại và sửa lỗi với tốc độ quay vòng nhanh. Đóng góp ý tưởng để làm cho ứng dụng tốt hơn và dễ sử dụng hơn. Phát triển và duy trì ứng dụng bằng React Native.', N'Ít nhất 2 năm kinh nghiệm với React Native. Ít nhất 1 năm với mã gốc (iOS hoặc Android). Kiến thức chuyên sâu về ít nhất một ngôn ngữ lập trình như Swift và Java (Kotlin). Làm quen với các nguyên tắc thiết kế OOP. Kiến thức tốt với JavaScript và mạnh về thuật toán. Trải nghiệm với quy trình công việc React.js phổ biến (như Flux hoặc Redux). ', N'20000000', CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[ThongTinTuyenDung] ([MaTuyenDung], [MaCongTy], [MaChucVu], [CapBac], [MoTaCongViec], [YeuCauCongTy], [MucLuong], [HanNopDon]) VALUES (24, N'TOHSW', 15, N'Nhân viên', N'Đọc hiểu (hoặc xây dựng) các tài liệu giải pháp, tài liệu thiết kế. Phát triển các ứng dụng web, xây dựng website, API theo giải pháp.  Thiết lập môi trường, chuyển giao sản phẩm cho nhóm Kiểm thử. Phối hợp với nhóm Kiểm thử kiểm tra và sửa lỗi. Phối hợp, hỗ trợ nhóm Triển khai để triển khai sản phẩm hoàn thành.', N'Ít nhất 2 năm kinh nghiệm thực tế với PHP web development. Sử dụng được một trong các frameworks: CakePHP, Codeigniter, Laravel,... Hiểu rõ về mô hình MVC, giao thức SOAP, RESTful, bản tin JSON, XML.  Có kinh nghiệm làm về HTML, CSS, JavaScript, jQuery.  Nắm rõ kiến thức về CSDL (MySQL, Oracle,...), Apache.', N'17000000', CAST(N'2020-10-30 00:00:00.000' AS DateTime))
INSERT [dbo].[ThongTinTuyenDung] ([MaTuyenDung], [MaCongTy], [MaChucVu], [CapBac], [MoTaCongViec], [YeuCauCongTy], [MucLuong], [HanNopDon]) VALUES (25, N'VINCE', 19, N'Nhân viên', N'Tham gia lên concept, thiết kế web, web app. Đưa ra định hướng cải tiến UI/UX để tăng tỉ lệ chốt đơn trên trang web (conversion rate). Thiết kế các ấn phẩm, banner, …. theo yêu cầu từ bộ phận Marketing. Đồng thời định hướng, tư vấn các thiết kế cho Marketing.', N'Ít nhất 1 năm kinh nghiệm ở vị trí UI/UX designer. Sáng tạo đa dạng, định hình concept, thiết kế chủ đạo và thay đổi phù hợp với từng yêu cầu thiết kế. Kiến thức về design các website và web app. Đã từng làm trên nhiều version và screensize khác nhau. Chuyên nghiệp về chất lượng, cùng kỹ năng quản lý thời gian tốt - đúng hạn dự án.', N'16000000', CAST(N'2020-11-11 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ThongTinTuyenDung] OFF
/****** Object:  Index [Unique_tk]    Script Date: 6/19/2020 9:16:40 PM ******/
ALTER TABLE [dbo].[ThongTinNguoiDung] ADD  CONSTRAINT [Unique_tk] UNIQUE NONCLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KyNang_TuyenDung]  WITH CHECK ADD  CONSTRAINT [FK_KyNang_TuyenDung_KyNang] FOREIGN KEY([MaKyNang])
REFERENCES [dbo].[KyNang] ([MakyNang])
GO
ALTER TABLE [dbo].[KyNang_TuyenDung] CHECK CONSTRAINT [FK_KyNang_TuyenDung_KyNang]
GO
ALTER TABLE [dbo].[KyNang_TuyenDung]  WITH CHECK ADD  CONSTRAINT [FK_KyNang_TuyenDung_ThongTinTuyenDung] FOREIGN KEY([MaTuyenDung])
REFERENCES [dbo].[ThongTinTuyenDung] ([MaTuyenDung])
GO
ALTER TABLE [dbo].[KyNang_TuyenDung] CHECK CONSTRAINT [FK_KyNang_TuyenDung_ThongTinTuyenDung]
GO
ALTER TABLE [dbo].[NguoiDung_TuyenDung]  WITH CHECK ADD  CONSTRAINT [FK_NguoiDung_TuyenDung_ThongTinNguoiDung] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[ThongTinNguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[NguoiDung_TuyenDung] CHECK CONSTRAINT [FK_NguoiDung_TuyenDung_ThongTinNguoiDung]
GO
ALTER TABLE [dbo].[NguoiDung_TuyenDung]  WITH CHECK ADD  CONSTRAINT [FK_NguoiDung_TuyenDung_ThongTinTuyenDung] FOREIGN KEY([MaTuyenDung])
REFERENCES [dbo].[ThongTinTuyenDung] ([MaTuyenDung])
GO
ALTER TABLE [dbo].[NguoiDung_TuyenDung] CHECK CONSTRAINT [FK_NguoiDung_TuyenDung_ThongTinTuyenDung]
GO
ALTER TABLE [dbo].[ThongTinNguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_ThongTinNguoiDung_TaiKhoan] FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([MaTaiKhoan])
GO
ALTER TABLE [dbo].[ThongTinNguoiDung] CHECK CONSTRAINT [FK_ThongTinNguoiDung_TaiKhoan]
GO
ALTER TABLE [dbo].[ThongTinTuyenDung]  WITH CHECK ADD  CONSTRAINT [FK_ThongTinTuyenDung_ChucVu] FOREIGN KEY([MaChucVu])
REFERENCES [dbo].[ChucVu] ([MaChucVu])
GO
ALTER TABLE [dbo].[ThongTinTuyenDung] CHECK CONSTRAINT [FK_ThongTinTuyenDung_ChucVu]
GO
ALTER TABLE [dbo].[ThongTinTuyenDung]  WITH CHECK ADD  CONSTRAINT [FK_ThongTinTuyenDung_ThongTinNhaTuyenDung] FOREIGN KEY([MaCongTy])
REFERENCES [dbo].[ThongTinNhaTuyenDung] ([MaCongTy])
GO
ALTER TABLE [dbo].[ThongTinTuyenDung] CHECK CONSTRAINT [FK_ThongTinTuyenDung_ThongTinNhaTuyenDung]
GO
/****** Object:  StoredProcedure [dbo].[TKTheoTenChucVuVaTenCongTy]    Script Date: 6/19/2020 9:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
--run exec TKTheoTenChucVuVaTenCongTy 'Full Stack Developer'  --xuat thong tin khi tim kiem theo ten chuc vu
--run exec TKTheoTenChucVuVaTenCongTy 'Advesa Digital Solutions'  --xuat thong tin khi tim kiem theo ten cong ty
-- =============================================
CREATE PROCEDURE [dbo].[TKTheoTenChucVuVaTenCongTy] 
	-- Add the parameters for the stored procedure here
	@keywork nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select a.MaTuyenDung ,b.MaCongTy,b.TenCongTy,c.TenChucVu,b.ThanhPho,a.MucLuong,a.HanNopDon 
	from ThongTinTuyenDung a inner join ThongTinNhaTuyenDung b on a.MaCongTy = b.MaCongTy inner join ChucVu c on a.MaChucVu = c.MaChucVu
	where c.TenChucVu like '%'+@keywork+'%' or b.TenCongTy like '%'+@keywork+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[TKThongTinTuyenDungTheoMaTuyenDung]    Script Date: 6/19/2020 9:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
--run exec TKThongTinTuyenDungTheoMaTuyenDung 3
-- =============================================
CREATE PROCEDURE [dbo].[TKThongTinTuyenDungTheoMaTuyenDung]
	-- Add the parameters for the stored procedure here
	@key int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select a.MaTuyenDung,b.MaCongTy,b.TenCongTy,c.TenChucVu,b.ThanhPho,a.MucLuong,a.HanNopDon 
	from ThongTinTuyenDung a inner join ThongTinNhaTuyenDung b on a.MaCongTy = b.MaCongTy inner join ChucVu c on a.MaChucVu = c.MaChucVu
	where a.MaTuyenDung = @key
END

GO
/****** Object:  StoredProcedure [dbo].[XuatMaTuyenDungTheoTenKyNang]    Script Date: 6/19/2020 9:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- run exec XuatMaTuyenDungTheoTenKyNang 'HTML5'
-- =============================================
CREATE PROCEDURE [dbo].[XuatMaTuyenDungTheoTenKyNang] 
	-- Add the parameters for the stored procedure here
	@keywork nvarchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select a.MaTuyenDung,b.MakyNang,b.TenKyNang
	from KyNang_TuyenDung a inner join KyNang b on a.MaKyNang = b.MakyNang
	where b.TenKyNang = @keywork
END


GO
/****** Object:  StoredProcedure [dbo].[XuatTTinKyNangTheoMaTuyenDung]    Script Date: 6/19/2020 9:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
--run exec XuatTTinKyNangTheoMaTuyenDung 3
-- =============================================
CREATE PROCEDURE [dbo].[XuatTTinKyNangTheoMaTuyenDung] 
	-- Add the parameters for the stored procedure here
	@key int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select a.MaTuyenDung,b.MakyNang,b.TenKyNang
	from KyNang_TuyenDung a inner join KyNang b on a.MaKyNang = b.MakyNang
	where a.MaTuyenDung = @key
END


GO
USE [master]
GO
ALTER DATABASE [ViecLamIT] SET  READ_WRITE 
GO
