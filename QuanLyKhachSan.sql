USE [master]
GO
  
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'QuanLyKhachSan2')
BEGIN
	CREATE DATABASE QuanLyKhachSan2 ON PRIMARY (
	  NAME = QuanLyKhachSan2
	, FILENAME='D:\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS_2008\MSSQL\DATA\QuanLyKhachSan2.MDF'
) ;
END

USE [QuanLyKhachSan2]
GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 15/04/2022 9:46:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu](
	[ID_DichVu] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](45) NOT NULL,
	[Gia] [float] NULL,
	[Loai] [nvarchar](45) NOT NULL,
	[Anh] [varchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_DichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 15/04/2022 9:46:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[ID_HD] [int] IDENTITY(1,1) NOT NULL,
	[NgayThu] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_HD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon_DichVu]    Script Date: 15/04/2022 9:46:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon_DichVu](
	[ID_HD] [int] NOT NULL,
	[ID_DichVu] [int] NOT NULL,
 CONSTRAINT [HD_DV_PK] PRIMARY KEY CLUSTERED 
(
	[ID_HD] ASC,
	[ID_DichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon_Phong]    Script Date: 15/04/2022 9:46:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon_Phong](
	[ID_HD] [int] NOT NULL,
	[ID_Phong] [int] NOT NULL,
	[NgayDen] [datetime] NULL,
	[NgayDi] [datetime] NULL,
 CONSTRAINT [HD_Phong_PK] PRIMARY KEY CLUSTERED 
(
	[ID_HD] ASC,
	[ID_Phong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiPhong]    Script Date: 15/04/2022 9:46:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiPhong](
	[ID_LoaiPhong] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](45) NOT NULL,
	[Gia] [float] NULL,
	[SoGiuong] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_LoaiPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanHoi]    Script Date: 15/04/2022 9:46:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanHoi](
	[ID_PH] [int] IDENTITY(1,1) NOT NULL,
	[NoiDung] [varchar](512) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_PH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phong]    Script Date: 15/04/2022 9:46:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phong](
	[ID_Phong] [int] IDENTITY(1,1) NOT NULL,
	[TenPhong] [nvarchar](45) NOT NULL,
	[Anh] [varchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Phong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phong_LoaiPhong]    Script Date: 15/04/2022 9:46:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phong_LoaiPhong](
	[ID_Phong] [int] NOT NULL,
	[ID_LoaiPhong] [int] NOT NULL,
 CONSTRAINT [Phong_LoaiPhong_PK] PRIMARY KEY CLUSTERED 
(
	[ID_Phong] ASC,
	[ID_LoaiPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 15/04/2022 9:46:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID_ROLE] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_ROLE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 15/04/2022 9:46:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[ID_TK] [int] IDENTITY(1,1) NOT NULL,
	[TenTK] [varchar](45) NOT NULL,
	[MatKhau] [varchar](256) NOT NULL,
	[Salt] [varchar](256) NOT NULL,
	[Anh] [varchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_TK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan_HoaDon]    Script Date: 15/04/2022 9:46:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan_HoaDon](
	[ID_TK] [int] NOT NULL,
	[ID_HD] [int] NOT NULL,
 CONSTRAINT [TK_HD_PK] PRIMARY KEY CLUSTERED 
(
	[ID_TK] ASC,
	[ID_HD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan_PhanHoi]    Script Date: 15/04/2022 9:46:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan_PhanHoi](
	[ID_TK] [int] NOT NULL,
	[ID_PH] [int] NOT NULL,
 CONSTRAINT [TK_PH_PK] PRIMARY KEY CLUSTERED 
(
	[ID_TK] ASC,
	[ID_PH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan_Role]    Script Date: 15/04/2022 9:46:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan_Role](
	[ID_TK] [int] NOT NULL,
	[ID_ROLE] [int] NOT NULL,
 CONSTRAINT [TK_ROLE_PK] PRIMARY KEY CLUSTERED 
(
	[ID_TK] ASC,
	[ID_ROLE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DichVu] ON 

INSERT [dbo].[DichVu] ([ID_DichVu], [Ten], [Gia], [Loai], [Anh]) VALUES (1, N'Spa', 50000, N'Sức khỏe', N'massage.png')
INSERT [dbo].[DichVu] ([ID_DichVu], [Ten], [Gia], [Loai], [Anh]) VALUES (2, N'Karaoke', 100000, N'Giải trí', N'pepsi.png')
INSERT [dbo].[DichVu] ([ID_DichVu], [Ten], [Gia], [Loai], [Anh]) VALUES (3, N'Fitness Center', 15000, N'Thể thao', N'bia.png')
INSERT [dbo].[DichVu] ([ID_DichVu], [Ten], [Gia], [Loai], [Anh]) VALUES (4, N'Fitness Center', 15000, N'Thể thao', N'hoaqua.png')
INSERT [dbo].[DichVu] ([ID_DichVu], [Ten], [Gia], [Loai], [Anh]) VALUES (5, N'Tennis', 200000, N'Thể Thao', N'pepsi.png')
INSERT [dbo].[DichVu] ([ID_DichVu], [Ten], [Gia], [Loai], [Anh]) VALUES (6, N'Golf', 200000, N'Thể Thao', N'coca.png')
INSERT [dbo].[DichVu] ([ID_DichVu], [Ten], [Gia], [Loai], [Anh]) VALUES (7, N'Casino', 100000, N'Giải trí', N'pepsi.png')
INSERT [dbo].[DichVu] ([ID_DichVu], [Ten], [Gia], [Loai], [Anh]) VALUES (8, N'Bơi', 20000, N'Thể thao', N'hoaqua.png')
INSERT [dbo].[DichVu] ([ID_DichVu], [Ten], [Gia], [Loai], [Anh]) VALUES (9, N'Bar', 12000, N'Giải trí', N'hoaqua.png')
INSERT [dbo].[DichVu] ([ID_DichVu], [Ten], [Gia], [Loai], [Anh]) VALUES (10, N'Massage', 100000, N'Giải trí', N'massage.png')
INSERT [dbo].[DichVu] ([ID_DichVu], [Ten], [Gia], [Loai], [Anh]) VALUES (11, N'Giặt ủi quần áo', 25000, N'Vệ sinh', N'giala.png')
INSERT [dbo].[DichVu] ([ID_DichVu], [Ten], [Gia], [Loai], [Anh]) VALUES (12, N'Trông trẻ', 20000, N'Giáo dục', N'pepsi.png')
INSERT [dbo].[DichVu] ([ID_DichVu], [Ten], [Gia], [Loai], [Anh]) VALUES (13, N'Tổ chức sự kiện', 50000000, N'Giải trí', N'fanta.png')
INSERT [dbo].[DichVu] ([ID_DichVu], [Ten], [Gia], [Loai], [Anh]) VALUES (14, N'Thuê xe', 2500000, N'Vận tải', N'pepsi.png')
INSERT [dbo].[DichVu] ([ID_DichVu], [Ten], [Gia], [Loai], [Anh]) VALUES (15, N'Bowling', 125000, N'Giải trí', N'bia.png')
SET IDENTITY_INSERT [dbo].[DichVu] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (1, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (2, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (3, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (4, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (5, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (6, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (7, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (8, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (9, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (10, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (11, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (12, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (13, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (14, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (15, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (16, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (17, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (18, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (19, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (20, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (21, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (22, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (23, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (24, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (25, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (26, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (27, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (28, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (29, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (30, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (31, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (32, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (33, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (34, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (35, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (36, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (37, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (38, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (39, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (40, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (41, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (42, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (43, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (44, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (45, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (46, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (47, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (48, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (49, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (50, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (51, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (52, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (53, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (54, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (55, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (56, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (57, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (58, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (59, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (60, CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (61, CAST(N'2022-04-14T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (62, CAST(N'2022-04-14T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([ID_HD], [NgayThu]) VALUES (63, CAST(N'2022-04-14T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (5, 2)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (5, 3)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (10, 3)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (12, 3)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (13, 3)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (20, 3)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (28, 3)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (29, 6)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (30, 4)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (31, 1)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (33, 3)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (34, 2)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (35, 5)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (36, 2)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (37, 2)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (38, 1)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (39, 1)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (40, 1)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (41, 1)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (42, 1)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (43, 1)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (44, 2)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (45, 2)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (46, 2)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (47, 2)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (48, 2)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (49, 2)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (50, 2)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (51, 2)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (52, 3)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (53, 2)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (54, 2)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (55, 2)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (56, 3)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (57, 3)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (58, 3)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (59, 3)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (60, 2)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (61, 1)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (62, 1)
INSERT [dbo].[HoaDon_DichVu] ([ID_HD], [ID_DichVu]) VALUES (63, 2)
GO
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (5, 2, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (10, 3, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (12, 3, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (13, 3, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (14, 17, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (15, 17, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (16, 17, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (17, 17, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (18, 17, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (19, 17, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (20, 3, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (21, 17, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (22, 17, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (23, 17, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (24, 17, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (25, 17, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (26, 17, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (27, 17, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (28, 17, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (29, 4, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (30, 2, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (31, 2, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (33, 2, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (34, 4, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (35, 2, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (36, 2, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (37, 3, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (38, 3, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (39, 2, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (40, 2, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (41, 2, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (42, 2, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (43, 2, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (44, 3, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (45, 3, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (46, 3, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (47, 3, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (48, 3, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (49, 3, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (50, 3, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (51, 3, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (52, 3, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (53, 6, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (54, 3, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (55, 4, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (56, 4, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (57, 2, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (58, 13, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-17T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (59, 13, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-17T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (60, 13, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-17T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (61, 13, CAST(N'2022-04-18T00:00:00.000' AS DateTime), CAST(N'2022-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (62, 2, CAST(N'2022-04-15T00:00:00.000' AS DateTime), CAST(N'2022-04-16T00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon_Phong] ([ID_HD], [ID_Phong], [NgayDen], [NgayDi]) VALUES (63, 2, CAST(N'2022-04-17T00:00:00.000' AS DateTime), CAST(N'2022-04-18T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[LoaiPhong] ON 

INSERT [dbo].[LoaiPhong] ([ID_LoaiPhong], [TenLoai], [Gia], [SoGiuong]) VALUES (1, N'Thường', 500000, 2)
INSERT [dbo].[LoaiPhong] ([ID_LoaiPhong], [TenLoai], [Gia], [SoGiuong]) VALUES (2, N'VIP', 1200000, 3)
SET IDENTITY_INSERT [dbo].[LoaiPhong] OFF
GO
SET IDENTITY_INSERT [dbo].[PhanHoi] ON 

INSERT [dbo].[PhanHoi] ([ID_PH], [NoiDung]) VALUES (5, N'U3R1ZGVudHMgYXJlIGVuY291cmFnZWQgdG8gdXNlIEVuZ2xpc2ggYXMgbXVjaCBhcyBwb3NzaWJsZSBpbiB0aGVpciBsaXZlcyBkdXJpbmcgYW5kIGFmdGVyIHNjaG9vbCwgYXQgbWVhbCB0aW1lcywgYW5kIHRocm91Z2ggZXh0cmFjdXJyaWN1bGFyIGFjdGl2aXRpZXMgc3VjaCBhcyBzcG9ydHMsIG91dGRvb3IgYWN0aXZpdGllcywgdHJpcHMsIGFuZCB0aGVhdGVyIHByb2R1Y3Rpb25zLg==')
INSERT [dbo].[PhanHoi] ([ID_PH], [NoiDung]) VALUES (6, N'VGhlIGdvYWxzIG9mIHRoZSBFU0wgUHJvZ3JhbSBhcmUgdG8gaW1wcm92ZSBzdHVkZW50c+KAmSBFbmdsaXNoIGluIGV2ZXJ5IHdheSwgdG8gaGVscCB0aGVtIGNvbW11bmljYXRlIGNsZWFybHkgYW5kIGNvbWZvcnRhYmx5IHdpdGggbmF0aXZlIEVuZ2xpc2ggc3BlYWtlcnMsIHRvIHN1cHBvcnQgdGhlbSBpbiB0aGUgYWNoaWV2ZW1lbnQgb2YgdGhlaXIgYWNhZGVtaWMgZ29hbHMsIGFuZCBzZXQgdGhlbSB1cCBmb3Igc3VjY2VzcyBpbiB1bml2ZXJzaXR5Lg==')
INSERT [dbo].[PhanHoi] ([ID_PH], [NoiDung]) VALUES (7, N'QmFzZWQgb24gdGhlc2UgYXNzZXNzbWVudHMsIHN0dWRlbnRzIGFyZSBwbGFjZWQgaW4gY2xhc3NlcyBhcHByb3ByaWF0ZSB0byB0aGVpciBuZWVkcy4gU3ByaW5nIFN0cmVldCBvZmZlcnMgRVNMIGNsYXNzZXMgYXQgdGhyZWUgbGV2ZWxzOiAxKSBFU0wgQmVnaW5uZXIsIDIpIEludGVybWVkaWF0ZSwgYW5kICgzKSBhZHZhbmNlZC4=')
INSERT [dbo].[PhanHoi] ([ID_PH], [NoiDung]) VALUES (8, N'QXMgdGhlaXIgRW5nbGlzaCBwcm9ncmVzc2VzLCB0aGV5IGFyZSBtYWluc3RyZWFtZWQgaW4gNS02IGNsYXNzZXMgd2l0aCBBZHZhbmNlZCBFU0wgc3VwcG9ydCBhZnRlciBzY2hvb2wuIFR1dG9yaW5nIGFmdGVyIHNjaG9vbCBhbmQgb24gd2Vla2VuZHMgYWxsb3dzIGZvciBvbmUtb24tb25lIGluc3RydWN0aW9uIGFuZCBzdXBwb3J0Lg==')
SET IDENTITY_INSERT [dbo].[PhanHoi] OFF
GO
SET IDENTITY_INSERT [dbo].[Phong] ON 

INSERT [dbo].[Phong] ([ID_Phong], [TenPhong], [Anh]) VALUES (2, N'Phòng 101', N'hero_3.jpg')
INSERT [dbo].[Phong] ([ID_Phong], [TenPhong], [Anh]) VALUES (3, N'Phòng 103', N'img_3.jpg')
INSERT [dbo].[Phong] ([ID_Phong], [TenPhong], [Anh]) VALUES (4, N'Phòng 104', N'img_4.jpg')
INSERT [dbo].[Phong] ([ID_Phong], [TenPhong], [Anh]) VALUES (5, N'Phòng 201', N'img_4.jpg')
INSERT [dbo].[Phong] ([ID_Phong], [TenPhong], [Anh]) VALUES (6, N'Phòng 202', N'img_1.jpg')
INSERT [dbo].[Phong] ([ID_Phong], [TenPhong], [Anh]) VALUES (7, N'Phòng 203', N'img_2.jpg')
INSERT [dbo].[Phong] ([ID_Phong], [TenPhong], [Anh]) VALUES (8, N'Phòng 204', N'img_3.jpg')
INSERT [dbo].[Phong] ([ID_Phong], [TenPhong], [Anh]) VALUES (9, N'Phòng 205', N'img_1.jpg')
INSERT [dbo].[Phong] ([ID_Phong], [TenPhong], [Anh]) VALUES (10, N'Phòng 206', N'img_1.jpg')
INSERT [dbo].[Phong] ([ID_Phong], [TenPhong], [Anh]) VALUES (11, N'Phòng 207', N'img_3.jpg')
INSERT [dbo].[Phong] ([ID_Phong], [TenPhong], [Anh]) VALUES (12, N'Phòng 301', N'img_3.jpg')
INSERT [dbo].[Phong] ([ID_Phong], [TenPhong], [Anh]) VALUES (13, N'Phòng 302', N'img_2.jpg')
INSERT [dbo].[Phong] ([ID_Phong], [TenPhong], [Anh]) VALUES (14, N'Phòng 303', N'img_4.jpg')
INSERT [dbo].[Phong] ([ID_Phong], [TenPhong], [Anh]) VALUES (15, N'Phòng 304', N'img_1.jpg')
INSERT [dbo].[Phong] ([ID_Phong], [TenPhong], [Anh]) VALUES (16, N'Phòng 305', N'img_2.jpg')
INSERT [dbo].[Phong] ([ID_Phong], [TenPhong], [Anh]) VALUES (17, N'Phòng 306', N'img_1.jpg')
SET IDENTITY_INSERT [dbo].[Phong] OFF
GO
INSERT [dbo].[Phong_LoaiPhong] ([ID_Phong], [ID_LoaiPhong]) VALUES (2, 1)
INSERT [dbo].[Phong_LoaiPhong] ([ID_Phong], [ID_LoaiPhong]) VALUES (3, 2)
INSERT [dbo].[Phong_LoaiPhong] ([ID_Phong], [ID_LoaiPhong]) VALUES (4, 1)
INSERT [dbo].[Phong_LoaiPhong] ([ID_Phong], [ID_LoaiPhong]) VALUES (5, 2)
INSERT [dbo].[Phong_LoaiPhong] ([ID_Phong], [ID_LoaiPhong]) VALUES (6, 2)
INSERT [dbo].[Phong_LoaiPhong] ([ID_Phong], [ID_LoaiPhong]) VALUES (7, 2)
INSERT [dbo].[Phong_LoaiPhong] ([ID_Phong], [ID_LoaiPhong]) VALUES (8, 2)
INSERT [dbo].[Phong_LoaiPhong] ([ID_Phong], [ID_LoaiPhong]) VALUES (9, 1)
INSERT [dbo].[Phong_LoaiPhong] ([ID_Phong], [ID_LoaiPhong]) VALUES (10, 2)
INSERT [dbo].[Phong_LoaiPhong] ([ID_Phong], [ID_LoaiPhong]) VALUES (11, 1)
INSERT [dbo].[Phong_LoaiPhong] ([ID_Phong], [ID_LoaiPhong]) VALUES (12, 2)
INSERT [dbo].[Phong_LoaiPhong] ([ID_Phong], [ID_LoaiPhong]) VALUES (13, 1)
INSERT [dbo].[Phong_LoaiPhong] ([ID_Phong], [ID_LoaiPhong]) VALUES (14, 1)
INSERT [dbo].[Phong_LoaiPhong] ([ID_Phong], [ID_LoaiPhong]) VALUES (15, 1)
INSERT [dbo].[Phong_LoaiPhong] ([ID_Phong], [ID_LoaiPhong]) VALUES (16, 2)
INSERT [dbo].[Phong_LoaiPhong] ([ID_Phong], [ID_LoaiPhong]) VALUES (17, 2)
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID_ROLE], [Ten]) VALUES (1, N'user')
INSERT [dbo].[Role] ([ID_ROLE], [Ten]) VALUES (2, N'admin')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([ID_TK], [TenTK], [MatKhau], [Salt], [Anh]) VALUES (1, N'admin', N'$2a$10$CcKKRDE1llda31nMEuTpKOJkFCPJeJ5347z5tNuUMQEajfZY6RMPG', N'$2a$10$CcKKRDE1llda31nMEuTpKO', NULL)
INSERT [dbo].[TaiKhoan] ([ID_TK], [TenTK], [MatKhau], [Salt], [Anh]) VALUES (4, N'user', N'$2a$10$kcdnxMjlVUpTxpkBfhXOJuNuQM9wwY6PWcOQrHJGf2f/byv4kSZOe', N'$2a$10$kcdnxMjlVUpTxpkBfhXOJu', NULL)
INSERT [dbo].[TaiKhoan] ([ID_TK], [TenTK], [MatKhau], [Salt], [Anh]) VALUES (5, N'huy', N'$2a$10$OAZUq5I2je1cVuPfsxyIx.adifOVL598NGucPzVKP7rAVe2mZdMZu', N'$2a$10$OAZUq5I2je1cVuPfsxyIx.', NULL)
INSERT [dbo].[TaiKhoan] ([ID_TK], [TenTK], [MatKhau], [Salt], [Anh]) VALUES (6, N'quyen', N'$2a$10$.LjlBgj1DC/T5nrYnryK5ewxO9.ktXRNcxYCy43i6E65mAshKDo/2', N'$2a$10$.LjlBgj1DC/T5nrYnryK5e', NULL)
INSERT [dbo].[TaiKhoan] ([ID_TK], [TenTK], [MatKhau], [Salt], [Anh]) VALUES (7, N'demo', N'$2a$10$tscoo2GlSXJcLLjbnppObOxZ.Txv4FWSpsTwGdBjDnQwYEUWHQ.Wm', N'$2a$10$tscoo2GlSXJcLLjbnppObO', NULL)
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (1, 31)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (1, 33)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (1, 34)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (1, 35)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (1, 36)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (1, 38)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (1, 39)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (1, 40)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (1, 41)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (1, 42)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (1, 43)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (1, 44)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (1, 51)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (1, 52)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (1, 53)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (1, 54)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (1, 55)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (1, 56)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (1, 57)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (1, 58)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (1, 59)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (1, 60)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (1, 61)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (4, 10)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 5)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 12)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 13)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 14)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 15)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 16)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 17)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 18)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 19)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 20)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 21)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 22)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 23)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 24)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 25)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 26)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 27)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 28)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 29)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 30)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 45)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 46)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 47)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 48)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 49)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 50)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 62)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (5, 63)
INSERT [dbo].[TaiKhoan_HoaDon] ([ID_TK], [ID_HD]) VALUES (7, 37)
GO
INSERT [dbo].[TaiKhoan_PhanHoi] ([ID_TK], [ID_PH]) VALUES (1, 5)
INSERT [dbo].[TaiKhoan_PhanHoi] ([ID_TK], [ID_PH]) VALUES (4, 6)
INSERT [dbo].[TaiKhoan_PhanHoi] ([ID_TK], [ID_PH]) VALUES (5, 7)
INSERT [dbo].[TaiKhoan_PhanHoi] ([ID_TK], [ID_PH]) VALUES (6, 8)
GO
INSERT [dbo].[TaiKhoan_Role] ([ID_TK], [ID_ROLE]) VALUES (1, 2)
INSERT [dbo].[TaiKhoan_Role] ([ID_TK], [ID_ROLE]) VALUES (4, 1)
INSERT [dbo].[TaiKhoan_Role] ([ID_TK], [ID_ROLE]) VALUES (5, 1)
INSERT [dbo].[TaiKhoan_Role] ([ID_TK], [ID_ROLE]) VALUES (6, 1)
INSERT [dbo].[TaiKhoan_Role] ([ID_TK], [ID_ROLE]) VALUES (7, 1)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [TK_UNIQUE]    Script Date: 15/04/2022 9:46:40 AM ******/
ALTER TABLE [dbo].[TaiKhoan] ADD  CONSTRAINT [TK_UNIQUE] UNIQUE NONCLUSTERED 
(
	[TenTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DichVu] ADD  DEFAULT ((0)) FOR [Gia]
GO
ALTER TABLE [dbo].[HoaDon] ADD  DEFAULT (getdate()) FOR [NgayThu]
GO
ALTER TABLE [dbo].[HoaDon_Phong] ADD  DEFAULT (getdate()) FOR [NgayDen]
GO
ALTER TABLE [dbo].[LoaiPhong] ADD  DEFAULT ((0)) FOR [Gia]
GO
ALTER TABLE [dbo].[LoaiPhong] ADD  DEFAULT ((0)) FOR [SoGiuong]
GO
ALTER TABLE [dbo].[HoaDon_DichVu]  WITH CHECK ADD  CONSTRAINT [HD_DV_FK1] FOREIGN KEY([ID_HD])
REFERENCES [dbo].[HoaDon] ([ID_HD])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon_DichVu] CHECK CONSTRAINT [HD_DV_FK1]
GO
ALTER TABLE [dbo].[HoaDon_DichVu]  WITH CHECK ADD  CONSTRAINT [HD_DV_FK2] FOREIGN KEY([ID_DichVu])
REFERENCES [dbo].[DichVu] ([ID_DichVu])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon_DichVu] CHECK CONSTRAINT [HD_DV_FK2]
GO
ALTER TABLE [dbo].[HoaDon_Phong]  WITH CHECK ADD  CONSTRAINT [HD_Phong_FK1] FOREIGN KEY([ID_HD])
REFERENCES [dbo].[HoaDon] ([ID_HD])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon_Phong] CHECK CONSTRAINT [HD_Phong_FK1]
GO
ALTER TABLE [dbo].[HoaDon_Phong]  WITH CHECK ADD  CONSTRAINT [HD_Phong_FK2] FOREIGN KEY([ID_Phong])
REFERENCES [dbo].[Phong] ([ID_Phong])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon_Phong] CHECK CONSTRAINT [HD_Phong_FK2]
GO
ALTER TABLE [dbo].[Phong_LoaiPhong]  WITH CHECK ADD  CONSTRAINT [Phong_LoaiPhong_FK1] FOREIGN KEY([ID_Phong])
REFERENCES [dbo].[Phong] ([ID_Phong])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Phong_LoaiPhong] CHECK CONSTRAINT [Phong_LoaiPhong_FK1]
GO
ALTER TABLE [dbo].[Phong_LoaiPhong]  WITH CHECK ADD  CONSTRAINT [Phong_LoaiPhong_FK2] FOREIGN KEY([ID_LoaiPhong])
REFERENCES [dbo].[LoaiPhong] ([ID_LoaiPhong])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Phong_LoaiPhong] CHECK CONSTRAINT [Phong_LoaiPhong_FK2]
GO
ALTER TABLE [dbo].[TaiKhoan_HoaDon]  WITH CHECK ADD  CONSTRAINT [TK_HD_FK1] FOREIGN KEY([ID_TK])
REFERENCES [dbo].[TaiKhoan] ([ID_TK])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TaiKhoan_HoaDon] CHECK CONSTRAINT [TK_HD_FK1]
GO
ALTER TABLE [dbo].[TaiKhoan_HoaDon]  WITH CHECK ADD  CONSTRAINT [TK_HD_FK2] FOREIGN KEY([ID_HD])
REFERENCES [dbo].[HoaDon] ([ID_HD])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TaiKhoan_HoaDon] CHECK CONSTRAINT [TK_HD_FK2]
GO
ALTER TABLE [dbo].[TaiKhoan_PhanHoi]  WITH CHECK ADD  CONSTRAINT [TK_PH_FK1] FOREIGN KEY([ID_TK])
REFERENCES [dbo].[TaiKhoan] ([ID_TK])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TaiKhoan_PhanHoi] CHECK CONSTRAINT [TK_PH_FK1]
GO
ALTER TABLE [dbo].[TaiKhoan_PhanHoi]  WITH CHECK ADD  CONSTRAINT [TK_PH_FK2] FOREIGN KEY([ID_PH])
REFERENCES [dbo].[PhanHoi] ([ID_PH])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TaiKhoan_PhanHoi] CHECK CONSTRAINT [TK_PH_FK2]
GO
ALTER TABLE [dbo].[TaiKhoan_Role]  WITH CHECK ADD  CONSTRAINT [TK_ROLE_FK1] FOREIGN KEY([ID_TK])
REFERENCES [dbo].[TaiKhoan] ([ID_TK])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TaiKhoan_Role] CHECK CONSTRAINT [TK_ROLE_FK1]
GO
ALTER TABLE [dbo].[TaiKhoan_Role]  WITH CHECK ADD  CONSTRAINT [TK_ROLE_FK2] FOREIGN KEY([ID_ROLE])
REFERENCES [dbo].[Role] ([ID_ROLE])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TaiKhoan_Role] CHECK CONSTRAINT [TK_ROLE_FK2]
GO
USE [master]
GO
ALTER DATABASE [QuanLyKhachSan1] SET  READ_WRITE 
GO
