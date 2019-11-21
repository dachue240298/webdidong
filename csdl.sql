USE [master]
GO
/****** Object:  Database [Products]    Script Date: 11/21/2019 3:29:35 PM ******/
CREATE DATABASE [Products]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Products', FILENAME = N'D:\Web\WEB-DTFULL\Web_DTFULL\san pham\App_Data\Products.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Products_log', FILENAME = N'D:\Web\WEB-DTFULL\Web_DTFULL\san pham\App_Data\Products_log.ldf' , SIZE = 4224KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Products] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Products].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Products] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Products] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Products] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Products] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Products] SET ARITHABORT OFF 
GO
ALTER DATABASE [Products] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Products] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Products] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Products] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Products] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Products] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Products] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Products] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Products] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Products] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Products] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Products] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Products] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Products] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Products] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Products] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Products] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Products] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Products] SET  MULTI_USER 
GO
ALTER DATABASE [Products] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Products] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Products] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Products] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Products] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Products] SET QUERY_STORE = OFF
GO
USE [Products]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Products]
GO
/****** Object:  Table [dbo].[Banners]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banners](
	[BannerID] [varchar](10) NOT NULL,
	[BannerName] [nvarchar](100) NULL,
	[Picture] [varchar](255) NOT NULL,
	[Link] [varchar](255) NOT NULL,
	[PostDate] [datetime] NOT NULL,
	[Location] [varchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Banners] PRIMARY KEY CLUSTERED 
(
	[BannerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [varchar](10) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[Email] [varchar](150) NOT NULL,
	[Number] [varchar](20) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Firms]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Firms](
	[FirmID] [varchar](3) NOT NULL,
	[FirmName] [nvarchar](50) NOT NULL,
	[Picture] [varchar](255) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[FirmID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[OrderID] [varchar](10) NOT NULL,
	[PhoneID] [varchar](20) NOT NULL,
	[Quantity] [int] NOT NULL,
	[SalePrice] [float] NOT NULL,
 CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[PhoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [varchar](10) NOT NULL,
	[CustomerID] [varchar](10) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[RequireDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
	[ShipAddress] [nvarchar](200) NOT NULL,
	[Status] [int] NULL,
	[Total] [float] NULL,
	[Notes] [nvarchar](500) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phones]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phones](
	[PhoneID] [varchar](20) NOT NULL,
	[PhoneName] [nvarchar](100) NOT NULL,
	[FirmID] [varchar](3) NOT NULL,
	[Picture] [varchar](255) NULL,
	[ImportDate] [datetime] NULL,
	[Quantity] [nvarchar](50) NULL,
	[Price] [float] NULL,
	[Warranty] [nvarchar](50) NULL,
	[FamousInfomation] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[Design] [nvarchar](1000) NULL,
	[Languages] [nvarchar](250) NULL,
	[Sound] [nvarchar](500) NULL,
	[Memory] [nvarchar](500) NULL,
	[WebConnection] [nvarchar](1000) NULL,
	[Browsers] [nvarchar](400) NULL,
	[Camera] [nvarchar](500) NULL,
	[MusicPlayer] [nvarchar](500) NULL,
	[MoviesPlayer] [nvarchar](500) NULL,
	[Games] [nvarchar](350) NULL,
	[OrtherInfomations] [nvarchar](4000) NULL,
	[Battery] [nvarchar](500) NULL,
	[NumVisited] [int] NULL,
 CONSTRAINT [PK_Phones] PRIMARY KEY CLUSTERED 
(
	[PhoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Polls]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Polls](
	[PollID] [varchar](10) NOT NULL,
	[PhoneID] [varchar](20) NOT NULL,
	[Commentator] [nvarchar](100) NOT NULL,
	[Email] [varchar](250) NULL,
	[PostDate] [datetime] NULL,
	[Comments] [nvarchar](max) NULL,
	[VoteCount] [int] NULL,
 CONSTRAINT [PK_Polls] PRIMARY KEY CLUSTERED 
(
	[PollID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions](
	[PromotionID] [varchar](10) NOT NULL,
	[PhoneID] [varchar](20) NOT NULL,
	[Percentage] [int] NOT NULL,
 CONSTRAINT [PK_Promotons] PRIMARY KEY CLUSTERED 
(
	[PromotionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Banners] ([BannerID], [BannerName], [Picture], [Link], [PostDate], [Location], [Status]) VALUES (N'B080411001', N'Banner quảng cáo', N'05_04_2011_09_40_24_500_180MOI.jpg', N'http://thegioididong.com/promotion/may-tinh-bang-win-7.aspx', CAST(N'2011-08-04T00:00:00.000' AS DateTime), N'', 0)
INSERT [dbo].[Banners] ([BannerID], [BannerName], [Picture], [Link], [PostDate], [Location], [Status]) VALUES (N'B080411002', N'Banner quảng cáo', N'05_04_2011_09_40_24_500_180MOI.jpg', N'http://thegioididong.com/promotion/may-tinh-bang-win-7.aspx', CAST(N'2011-08-04T00:00:00.000' AS DateTime), N'', 0)
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [Address], [Email], [Number]) VALUES (N'K240511001', N'Nguyễn Đắc Huề', N'An Ninh - Quỳnh Phụ - Thái Bình', N'Nguyendachue@gamil.com', N'0335173777')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [Address], [Email], [Number]) VALUES (N'K240511002', N'Nguyễn Ngọc Lâm', N'Bắc Ninh', N'ngoclam98@gmail.com', N'0335173777')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [Address], [Email], [Number]) VALUES (N'K260511001', N'Nguyễn Quang Linh', N'Bình Định', N'qlinh98@gmail.com', N'0335173777')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [Address], [Email], [Number]) VALUES (N'K280511001', N'admin', N'admin - Quảng Nam', N'admin@admin.com', N'0192918311')
INSERT [dbo].[Firms] ([FirmID], [FirmName], [Picture], [Description], [Status]) VALUES (N'H01', N'Acer', N'Acer-mini152.jpg', N'Sản phẩm của hãng Acer.', 1)
INSERT [dbo].[Firms] ([FirmID], [FirmName], [Picture], [Description], [Status]) VALUES (N'H02', N'Dell', N'Dell-mini146.jpg', N'Sản phẩm của hãng Dell', 0)
INSERT [dbo].[Firms] ([FirmID], [FirmName], [Picture], [Description], [Status]) VALUES (N'H03', N'F-mobile', N'F-mobile-mini364.jpg', N'Sản phẩm của hãng F-mobile', 0)
INSERT [dbo].[Firms] ([FirmID], [FirmName], [Picture], [Description], [Status]) VALUES (N'H04', N'Hitech', N'Hittech-mini230.jpg', N'Sản phẩm của hãng Hitech', 0)
INSERT [dbo].[Firms] ([FirmID], [FirmName], [Picture], [Description], [Status]) VALUES (N'H06', N'I-phone', N'banner-iPhone-(Apple)42-b_16.jpg', N'Sản phẩm của hãng I-phone', 1)
INSERT [dbo].[Firms] ([FirmID], [FirmName], [Picture], [Description], [Status]) VALUES (N'H07', N'Lenovo', N'Lenovo-mini153.jpg', N'Sản phẩm của hãng Lenovo', 0)
INSERT [dbo].[Firms] ([FirmID], [FirmName], [Picture], [Description], [Status]) VALUES (N'H08', N'LG', N'LG-mini120.jpg', N'Sản phẩm của hãng LG', 0)
INSERT [dbo].[Firms] ([FirmID], [FirmName], [Picture], [Description], [Status]) VALUES (N'H10', N'Motorola', N'Motorola-mini227.jpg', N'Sản phẩm của hãng Motorola', 0)
INSERT [dbo].[Firms] ([FirmID], [FirmName], [Picture], [Description], [Status]) VALUES (N'H11', N'Nokia', N'Nokia-mini122.jpg', N'Sản phẩm của hãng Nokia', 1)
INSERT [dbo].[Firms] ([FirmID], [FirmName], [Picture], [Description], [Status]) VALUES (N'H12', N'Q-Mobile', N'Qmobile-mini229.jpg', N'Sản phẩm của hãng Q-mobile', 0)
INSERT [dbo].[Firms] ([FirmID], [FirmName], [Picture], [Description], [Status]) VALUES (N'H13', N'Samsung', N'Samsung-mini121.jpg', N'Sản phẩm của hãng Samsung', 1)
INSERT [dbo].[Firms] ([FirmID], [FirmName], [Picture], [Description], [Status]) VALUES (N'H14', N'Sony_Ericssion', N'Sony-Ericsson-mini228.jpg', N'Sản phẩm Sony Ericsion', 0)
INSERT [dbo].[Firms] ([FirmID], [FirmName], [Picture], [Description], [Status]) VALUES (N'H15', N'Vinaphone', N'Vinaphone-mini324.jpg', N'Sản phẩm của Vinaphone', 0)
INSERT [dbo].[Firms] ([FirmID], [FirmName], [Picture], [Description], [Status]) VALUES (N'H16', N'K-touch', N'K-Touch.jpg', N'Sản phẩm K-touch', 0)
INSERT [dbo].[Firms] ([FirmID], [FirmName], [Picture], [Description], [Status]) VALUES (N'H17', N'Xiaomi', N'banner-Xiaomi42-b_31.png', N'Hãng điện thoại mới', 1)
INSERT [dbo].[Order_Details] ([OrderID], [PhoneID], [Quantity], [SalePrice]) VALUES (N'D120611001', N'Phone01', 1, 790000)
INSERT [dbo].[Order_Details] ([OrderID], [PhoneID], [Quantity], [SalePrice]) VALUES (N'D120611001', N'Phone03', 1, 1250000)
INSERT [dbo].[Order_Details] ([OrderID], [PhoneID], [Quantity], [SalePrice]) VALUES (N'D120611001', N'Phone35', 1, 1500000)
INSERT [dbo].[Order_Details] ([OrderID], [PhoneID], [Quantity], [SalePrice]) VALUES (N'D120611001', N'Phone42', 1, 1350000)
INSERT [dbo].[Order_Details] ([OrderID], [PhoneID], [Quantity], [SalePrice]) VALUES (N'D120611002', N'Phone01', 1, 790000)
INSERT [dbo].[Order_Details] ([OrderID], [PhoneID], [Quantity], [SalePrice]) VALUES (N'D120611002', N'Phone35', 1, 1500000)
INSERT [dbo].[Order_Details] ([OrderID], [PhoneID], [Quantity], [SalePrice]) VALUES (N'D120611002', N'Phone49', 1, 940000)
INSERT [dbo].[Order_Details] ([OrderID], [PhoneID], [Quantity], [SalePrice]) VALUES (N'D120611003', N'Phone01', 1, 790000)
INSERT [dbo].[Order_Details] ([OrderID], [PhoneID], [Quantity], [SalePrice]) VALUES (N'D120611003', N'Phone02', 1, 1050000)
INSERT [dbo].[Order_Details] ([OrderID], [PhoneID], [Quantity], [SalePrice]) VALUES (N'D120611004', N'Phone01', 1, 790000)
INSERT [dbo].[Order_Details] ([OrderID], [PhoneID], [Quantity], [SalePrice]) VALUES (N'D120611004', N'Phone64', 1, 2590000)
INSERT [dbo].[Order_Details] ([OrderID], [PhoneID], [Quantity], [SalePrice]) VALUES (N'D120611006', N'Phone03', 1, 1250000)
INSERT [dbo].[Order_Details] ([OrderID], [PhoneID], [Quantity], [SalePrice]) VALUES (N'D120611006', N'Phone10', 1, 7600000)
INSERT [dbo].[Order_Details] ([OrderID], [PhoneID], [Quantity], [SalePrice]) VALUES (N'D130611001', N'Phone03', 1, 1250000)
INSERT [dbo].[Order_Details] ([OrderID], [PhoneID], [Quantity], [SalePrice]) VALUES (N'D130611001', N'Phone18', 1, 9150000)
INSERT [dbo].[Order_Details] ([OrderID], [PhoneID], [Quantity], [SalePrice]) VALUES (N'D130611002', N'Phone03', 1, 1250000)
INSERT [dbo].[Order_Details] ([OrderID], [PhoneID], [Quantity], [SalePrice]) VALUES (N'D130611003', N'Phone02', 1, 1050000)
INSERT [dbo].[Order_Details] ([OrderID], [PhoneID], [Quantity], [SalePrice]) VALUES (N'D130611003', N'Phone42', 1, 1350000)
INSERT [dbo].[Order_Details] ([OrderID], [PhoneID], [Quantity], [SalePrice]) VALUES (N'D130611004', N'Phone02', 1, 1050000)
INSERT [dbo].[Order_Details] ([OrderID], [PhoneID], [Quantity], [SalePrice]) VALUES (N'D130611004', N'Phone05', 1, 1600000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequireDate], [ShippedDate], [ShipAddress], [Status], [Total], [Notes]) VALUES (N'D120611001', N'K240511001', CAST(N'2019-10-20T00:00:00.000' AS DateTime), CAST(N'2019-10-21T00:00:00.000' AS DateTime), CAST(N'2019-10-22T00:00:00.000' AS DateTime), N'Duy Trung - Duy Xuyên - Quảng Nam ', NULL, 4890000, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequireDate], [ShippedDate], [ShipAddress], [Status], [Total], [Notes]) VALUES (N'D120611002', N'K240511001', CAST(N'2019-10-20T00:00:00.000' AS DateTime), CAST(N'2019-10-21T00:00:00.000' AS DateTime), CAST(N'2019-10-22T00:00:00.000' AS DateTime), N'Duy Trung - Duy Xuyên - Quảng Nam ', NULL, 3230000, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequireDate], [ShippedDate], [ShipAddress], [Status], [Total], [Notes]) VALUES (N'D120611003', N'K240511001', CAST(N'2019-10-20T00:00:00.000' AS DateTime), CAST(N'2019-10-21T00:00:00.000' AS DateTime), CAST(N'2019-10-22T00:00:00.000' AS DateTime), N'Duy Trung - Duy Xuyên - Quảng Nam ', NULL, 1840000, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequireDate], [ShippedDate], [ShipAddress], [Status], [Total], [Notes]) VALUES (N'D120611004', N'K240511001', CAST(N'2019-10-20T00:00:00.000' AS DateTime), CAST(N'2019-10-21T00:00:00.000' AS DateTime), CAST(N'2019-10-22T00:00:00.000' AS DateTime), N'Duy Trung - Duy Xuyên - Quảng Nam ', NULL, 3380000, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequireDate], [ShippedDate], [ShipAddress], [Status], [Total], [Notes]) VALUES (N'D120611005', N'K240511001', CAST(N'2019-10-20T00:00:00.000' AS DateTime), CAST(N'2019-10-21T00:00:00.000' AS DateTime), CAST(N'2019-10-22T00:00:00.000' AS DateTime), N'Duy Trung - Duy Xuyên - Quảng Nam ', NULL, 0, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequireDate], [ShippedDate], [ShipAddress], [Status], [Total], [Notes]) VALUES (N'D120611006', N'K240511001', CAST(N'2019-10-20T00:00:00.000' AS DateTime), CAST(N'2019-10-21T00:00:00.000' AS DateTime), CAST(N'2019-10-22T00:00:00.000' AS DateTime), N'Duy Trung - Duy Xuyên - Quảng Nam ', NULL, 8850000, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequireDate], [ShippedDate], [ShipAddress], [Status], [Total], [Notes]) VALUES (N'D130611001', N'K240511001', CAST(N'2019-10-20T00:00:00.000' AS DateTime), CAST(N'2019-10-21T00:00:00.000' AS DateTime), CAST(N'2019-10-22T00:00:00.000' AS DateTime), N'Duy Trung - Duy Xuyên - Quảng Nam ', NULL, 10400000, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequireDate], [ShippedDate], [ShipAddress], [Status], [Total], [Notes]) VALUES (N'D130611002', N'K240511002', CAST(N'2019-10-20T00:00:00.000' AS DateTime), CAST(N'2019-10-21T00:00:00.000' AS DateTime), CAST(N'2019-10-22T00:00:00.000' AS DateTime), N'Bình Định', NULL, 1250000, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequireDate], [ShippedDate], [ShipAddress], [Status], [Total], [Notes]) VALUES (N'D130611003', N'K240511002', CAST(N'2019-10-20T00:00:00.000' AS DateTime), CAST(N'2019-10-21T00:00:00.000' AS DateTime), CAST(N'2019-10-22T00:00:00.000' AS DateTime), N'Bình Định', NULL, 2400000, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequireDate], [ShippedDate], [ShipAddress], [Status], [Total], [Notes]) VALUES (N'D130611004', N'K240511001', CAST(N'2019-10-20T00:00:00.000' AS DateTime), CAST(N'2019-10-21T00:00:00.000' AS DateTime), CAST(N'2019-10-22T00:00:00.000' AS DateTime), N'Quãng Ngãi', NULL, 2650000, NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone01', N'Nokia_5030', N'H11', N'Nokia_5030.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'16', 790000, N'12 tháng', N'Màu Đỏ, Xám
- Nghe đài Stereo FM (ăng ten ngầm bên trong) - Nghe FM không cần gắn tai nghe
- Ghi âm giọng nói ', 1, N'Ra mắt Tháng 5/2009', N'Ngôn ngữ Có tiếng Việt ', N'- Nhạc chuông đa âm sắc, MP3, Video
- Rung Có', N'Bộ nhớ Lưu trong máy 1.000 mục, danh bạ hình ảnh
- Các số đã gọi 20
- Cuộc gọi đã nhận 20
- Cuộc gọi nhỡ 20 ', N'Không hỗ trợ', N'Không hỗ trợ', N'Không hỗ trợ', N'Không hỗ trợ', N'Không hỗ trợ', N'Trò chơi Có sẵn trong máy ', N'Kích thước 108 x 45 x 15 mm, 62 cc
- Trọng lượng 82 g
- Màn hình TFT, 65.536 màu', N'- Pin chuẩn, Li-Ion 1020 mAh (BL-5C)
- Thời gian chờ Lên đến 525 giờ
- Thời gian đàm thoại Lên đến 10 giờ
', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone02', N'Nokia_2220', N'H11', N'Nokia 2220.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'17', 1050000, N'12 tháng ', N'không', 1, N'Kích thước 97.4 x 47 x 15.9 mm, 75 cc
- Trọng lượng 93.5 g
- Màn hình TFT, 65k màu ', N'Ngôn ngữ Có tiếng Việt', N'Nhạc chuông đa âm sắc, MP3
- Rung Có ', N'Bộ nhớ Lưu trong máy 1.000 mục, danh bạ hình ảnh
- Các số đã gọi 20
- Cuộc gọi đã nhận 20
- Cuộc gọi nhỡ 20
- 32 MB bộ nhớ trong ', N'Java, MIDP 2.0', N'Trình duyệt WAP 2.0/xHTML, HTML ', N'Máy ảnh VGA, 640x480 pixels ', N'Nghe nhạc MP3', N'có hỗ trợ', N'Trò chơi Có sẵn trong máy', N'- Đồng hồ Có
- Báo thức Có
- Dữ liệu GPRS Class 10 (4+1/3+2 slots), 32 - 48 kbps
- Hồng ngoại Không
- Bluetooth Không ', N'Pin chuẩn Li-Ion 860 mAh (BL-4C)
- Thời gian chờ Lên đến 480 giờ
- Thời gian đàm thoại Lên đến 5 giờ 20 phút', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone03', N'Nokia_2690', N'H11', N'Nokia 2690.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'16', 1250000, N'12 tháng ', N'Nokia 2690 chạy trên giao diện S40, máy có camera VGA, tích hợp đài FM với RDS, giắc cắm tai nghe 3,5 mm. Phiên bản này chạy trên 4 băng tần GSM/GPRS/EDGE, tương thích với các mạng trên toàn cầu, tích hợp khe cắm thẻ nhớ microSD, cho phép mở rộng dung lượng tối đa tới 8GB. Điện thoại mới của Nokia có màn hình LCD 1,8 inch, 262 nghìn màu với độ phân giải chỉ 128 x 160 pixel', 1, N'Kích thước 107.5 x 45.5 x 13.8 mm, 58.8 cc
- Trọng lượng 80.7 g
- Màn hình TFT, 262,144 màu ', N'tiếng anh, tiếng việt', N'Nhạc chuông đa âm sắc, MP3
- Loa ngoài Có ', N'Danh bạ 2.000 mục
- Các số đã gọi 20 cuộc gọi đến, 20 cuộc gọi đi, 20 cuộc gọi nhỡ
- Khe cắm thẻ nhớ microSD (TransFlash), hỗ trợ lên đến 8GB ', N'Java Có, MIDP 2.1', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera VGA 640x480 pixels ', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay phim Có QCIF @ 15fps', N'Trò chơi Có sẵn trong máy', N'Màu sắc Graphite, White silver, Hot pink, Blue ', N'Pin chuẩn Li-Ion 860 mAh (BL-4C)
- Chờ Lên đến 312 giờ
- Đàm thoại 4 giờ 30 phút', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone04', N'Nokia_2730', N'H11', N'Nokia_2730.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1930000, N'12 tháng', N'3G: 384 kbps
- Bluetooth v2.0 with A2DP
- USB: microUSB v2.0 ', 1, N'Kích thước 109.6 x 46.9 x 14.4 mm, 65 cc
- Trọng lượng 87.7 g
- Màn hình TFT, 262.144 màu
- Kích cở 240 x 320 pixels, 2.0 inches ', N'Ngôn ngữ Có tiếng Việt ', N'Nhạc chuông đa âm sắc, MP3
- Rung Có', N'Bộ nhớ Lưu trong máy 1.000 mục, danh bạ hình ảnh
- Các số đã gọi 20
- Cuộc gọi đã nhận 20
- Cuộc gọi nhỡ 20
- 30 MB bộ nhớ trong
- Khe cắm thẻ nhớ microSD (TransFlash), hỗ trợ lên đến 2GB ', N'Windows Live Messenger (MSN)
- Java MIDP 2.0', N'Trình duyệt WAP 2.0/xHTML', N'Máy ảnh số 2 MP, 1600x1200 pixels', N'Máy nghe nhạc MP3/MPEG4 player ', N'Có hỗ trợ', N'Trò chơi Có 4, có thể tải thêm', N'Mạng GSM 850 / 900 / 1800 / 1900; UMTS 900 / 2100 ', N'- Pin chuẩn, Li-Ion (BL-5C)
- Thời gian chờ Lên đến 396h(2G)/408h(3G)
- Thời gian đàm thoại Lên đến 7 h 20 min (2G) / Lên đến 3 h 30 min (3G) / Nghe nhạc 12h ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone05', N'Nokia_2700', N'H11', N'Nokia_2700.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'19', 1600000, N'12 tháng', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Kích thước: 109.2 x 46 x 14 mm, 62 cc
- Trọng lượng: 85 g
- Màn hình: TFT, 262.144 màu, Kích cở 240 x 320 pixels, 2.0 inches', N'Ngôn ngữ Có tiếng Việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones
- Rung Có', N'Bộ nhớ Lưu trong máy 1.000 mục
- Các số đã gọi 20
- Cuộc gọi đã nhận 20
- Cuộc gọi nhỡ 20
- 64 MB bộ nhớ trong
- Khe cắm thẻ nhớ microSD (TransFlash), hỗ trợ lên đến 2GB', N'HSCSD
- EDGE Class 10, 236.8 kbps
- Bluetooth v2.0 ', N'Trình duyệt WAP 2.0/xHTML', N'Máy ảnh số 2 MP, 1600x1200 pixels', N'Máy nghe nhạc MP3/MP- EG4 ', N'video (CIF@15fps)', N'Trò chơi Rally Star, Soduko, Snake III, Diamond Rush', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Thời gian hoạt động pin Pin chuẩn, Li-Ion 1020 mAh (BL-5C), thời gian chờ Lên đến 288 giờ, thời gian đàm thoại Lên đến 6 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone06', N'Nokia_2760', N'H11', N'Nokia_2760.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1200000, N'12 tháng', N'Không', 1, N'Hình dáng: Máy gập Anten ngầm.
- Kích thước: 87 x 44.8 x 20.7 mm
- Trọng lượng: 81 gam
- Màn hình mầu: Loại hiển thị TFT 65k, 128 x 160 pixels, màn hình ngoài mono 96 x 68 pixels', N'Ngôn ngữ: Có Tiếng việt', N'Rung: Có
Loa ngoài: Có
- Nhạc chuông: 24 âm sắc, Mp3..', N'Bộ nhớ: 10 Mb bộ nhớ trong, Không hỗ trợ thẻ nhớ', N'GPRS: có Class 10', N'Wap: trình duyệt 2.0/xHTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Chơi Mp3: có MP3, nhung bộ nhớ trong không hỗ trợ thẻ nhớ cho lên khả năng nghe nhạc ít bài hát', N'video 128 x 96 pixels', N'Có hỗ trợ', N'Không', N'Pin: Li-Ion theo tiêu chuẩn chính hãng', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone07', N'Nokia_E5', N'H11', N'Nokia _E5.JPG', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 4620000, N'12 tháng ', N'HĐH: Sybiam v9.3. S60, OVI
- Tính năng: Office ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Tiếng việt có', N'NHạc chuông: Đa âm sắc', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'HSDPA cat9, tốc độ tối đa lên tới 10,2 Mbps
- HSUPA cat5, tốc độ tối đa lên tới 2 Mbps
- Tri-band WCDMA
- GSM GPRS data class 32
- GSM EGPRS data class 32
- DTM32
- EDGE Rel. 4: MSC 32 (RX+TX: 5+1, 4+2, 3+3)
- GPRS: MSC 32 (RX+TX: 5+1, 4+2, 3+3 - cl. B+C)
- WLAN ', N'xHTML/HTML', N'Chụp ảnh: 5.0 zoom lên đến 3x, có đèn LED', N'MP3', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone08', N'Nokia_X3', N'H11', N'nokia-X3tc.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 2790000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Chơi Mp3: có MP3, nhung bộ nhớ trong không hỗ trợ thẻ nhớ cho lên khả năng nghe nhạc ít bài hát', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone09', N'Nokia_E71', N'H11', N'Nokia _E71.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 5480000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Chơi Mp3: có MP3, nhung bộ nhớ trong không hỗ trợ thẻ nhớ cho lên khả năng nghe nhạc ít bài hát', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone10', N'Nokia_C7', N'H11', N'Nokia C7.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'19', 7600000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Chơi Mp3: có MP3, nhung bộ nhớ trong không hỗ trợ thẻ nhớ cho lên khả năng nghe nhạc ít bài hát', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone100', N'se-t700-1', N'H14', N'se-t700-1.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 2950000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone101', N'se-t715-1', N'H14', N'se-t715-1.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 4480000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone102', N'se-w205-01', N'H14', N'se-w205-01.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1690000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone103', N'se-xperia-x10-new-1', N'H14', N'se-xperia-x10-new-1.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 7990000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone104', N'sony_w395', N'H14', N'sony_w395.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 2250000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone105', N'sony-ericsson-w395-grey', N'H14', N'sony-ericsson-w395-grey.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 2250000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone106', N'sony-ericsson-xperia-x12-arc-all', N'H14', N'sony-ericsson-xperia-x12-arc-all.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 12990000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone107', N'sonyericsson-zylo-stealth_black', N'H14', N'sonyericsson-zylo-stealth_black.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 3390000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone108', N'XperiaX10White', N'H14', N'XperiaX10White.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 8500000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone109', N'acer_s100', N'H01', N'acer_s100.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 7990000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone11', N'Nokia_X2', N'H11', N'Nokia X2.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 2330000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Chơi Mp3: có MP3, nhung bộ nhớ trong không hỗ trợ thẻ nhớ cho lên khả năng nghe nhạc ít bài hát', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone110', N'acer_s120', N'H01', N'acer_s120.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 8990000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone111', N'dell-streak-3', N'H02', N'dell-streak-3.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 10250000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone112', N'lenovo_a310_pink', N'H07', N'lenovo_a310_pink.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1090000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone113', N'lenovo_a312_pink', N'H07', N'lenovo_a312_pink.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1250000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone114', N'lenovo_a330', N'H07', N'lenovo_a330.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 860000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone115', N'lenovo_e268', N'H07', N'lenovo_e268.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 690000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone116', N'lenovo_e268_black', N'H07', N'lenovo_e268_black.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 690000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone117', N'lenovo_i350', N'H07', N'lenovo_i350.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1350000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone118', N'lenovo_p629', N'H07', N'lenovo_p629.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1720000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone119', N'lenovo_p629_gold', N'H07', N'lenovo_p629_gold.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1890000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone12', N'Nokia_X6', N'H11', N'Nokia_ X6.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 6100000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone120', N'lenovo_p629_silver', N'H07', N'lenovo_p629_silver.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1720000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone121', N'lenovo_s520_black', N'H07', N'lenovo_s520_black.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1690000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone122', N'lenovo_s520_purple', N'H07', N'lenovo_s520_purple.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1690000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone123', N'ktouch_a7722', N'H16', N'ktouch_a7722.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 780000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone124', N'ktouch_b922', N'H16', N'ktouch_b922.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1220000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone125', N'ktouch_c201', N'H16', N'ktouch_c201.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 800000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone126', N'ktouch_e62', N'H16', N'ktouch_e62.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1650000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone127', N'ktouch_H234_1', N'H16', N'ktouch_H234_1.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 840000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone128', N'ktouch_h330', N'H16', N'ktouch_h330.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1040000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone129', N'ktouch_h677', N'H16', N'ktouch_h677.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 690000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone13', N'Nokia_X2.01', N'H11', N'Nokia_X2-01_2.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1690000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Chơi Mp3: có MP3, nhung bộ nhớ trong không hỗ trợ thẻ nhớ cho lên khả năng nghe nhạc ít bài hát', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone130', N'ktouch_h677_blue', N'H16', N'ktouch_h677_blue.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 690000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone131', N'ktouch_h677_red', N'H16', N'ktouch_h677_red.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 690000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone132', N'ktouch_h677_white', N'H16', N'ktouch_h677_white.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 690000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone133', N'ktouch_h688', N'H16', N'ktouch_h688.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 750000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone134', N'ktouch_h699', N'H16', N'ktouch_h699.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 750000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone135', N'ktouch_h777', N'H16', N'ktouch_h777.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1290000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone136', N'ktouch_h877', N'H16', N'ktouch_h877.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1290000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone137', N'ktouch_h888', N'H16', N'ktouch_h888.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 8500000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone138', N'ktouch_h899', N'H16', N'ktouch_h899.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 8500000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone139', N'ktouch_m600', N'H16', N'ktouch_m600.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1630000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone14', N'Nokia_E63', N'H11', N'Nokia_E63.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 3720000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Chơi Mp3: có MP3, nhung bộ nhớ trong không hỗ trợ thẻ nhớ cho lên khả năng nghe nhạc ít bài hát', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone140', N'ktouch_m606', N'H16', N'ktouch_m606.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1630000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone141', N'ktouch_m608', N'H16', N'ktouch_m608.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1050000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone142', N'k-touch_t33_1', N'H16', N'k-touch_t33_1.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 690000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone143', N'ktouch_v320', N'H16', N'ktouch_v320.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1390000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone144', N'ktouch_v388', N'H16', N'ktouch_v388.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1190000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone145', N'ktouch_x9_red', N'H16', N'ktouch_x9_red.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1490000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone146', N'ktouch_x90', N'H16', N'ktouch_x90.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1490000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone147', N'ktouch_x90_white', N'H16', N'ktouch_x90_white.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1490000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Máy nghe nhạc MP3/MPEG4 player ', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone148', N'Acer-be-Touch-E400-thum18676_1', N'H01', N'Dien-thoai-Acer-be-Touch-E400-thum18676_1.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 4990000, N'', N'', 1, N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone149', N'Acer-Liquid-E-Ferrari-mau-do-thum16597_1', N'H01', N'Dien-thoai-Acer-Liquid-E-Ferrari-mau-do-thum16597_1.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 13990000, N'', N'', 1, N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone15', N'Nokia_E66', N'H11', N'Nokia_E66.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 5190000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Chơi Mp3: có MP3, nhung bộ nhớ trong không hỗ trợ thẻ nhớ cho lên khả năng nghe nhạc ít bài hát', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone150', N'Acer-Liquid-E-S100E-thum18677_1', N'H01', N'Dien-thoai-Acer-Liquid-E-S100E-thum18677_1.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 6499000, N'', N'', 1, N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone151', N'iPhone 6s', N'H15', N'iphone-6s-plus-32gb.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'10', 8990000, N'24 tháng', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Hệ điều hành: iOS 12', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ trong:32 GB, RAM: 2 GB, Thẻ nhớ ngoài Không', N'3G, 4G LTE Cat 6', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera sau:Độ phân giải 12 MP,Quay phim: Quay phim 4K 2160p@30fps,Camera trước: Độ phân giải 5 MP ', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone152', N'Iphone 7 plus', N'H06', N'iphone-7-plus-32gb-gold.jpg', CAST(N'2019-11-21T00:00:00.000' AS DateTime), N'5', 11990000, N'24 tháng', N'Thiết kế mới', 1, N'Cảm biến, mỏng nhẹ', N'Có hỗ trợ: Tiếng Việt', N'Lightning', N'RAM: 3 GB
Bộ nhớ trong: 32 GB', N'Mạng di động:3G, 4G LTE Cat 9
SIM: 1 Nano SIM
Wi-Fi 802.11 a/b/g/n/ac, Dual-band, Wi-Fi hotspot', N'Đa dụng', N'Camera sau:
Độ phân giải Chính 12 MP & Phụ 12 MP
Camera trước:
Độ phân giải :7 MP', N'Đa dụng', N'Quay phim: Quay phim 4K 2160p@30fps', N'Đa dụng', N'Thời điểm ra mắt	11/2016', N'Dung lượng pin: 2900 mAh
Loại pin: Pin chuẩn Li-Ion', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone16', N'Nokia_C61', N'H11', N'Nokia_C61.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 5950000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Chơi Mp3: có MP3, nhung bộ nhớ trong không hỗ trợ thẻ nhớ cho lên khả năng nghe nhạc ít bài hát', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone17', N'Nokia_E72', N'H11', N'Nokia_E72.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 6790000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Chơi Mp3: có MP3, nhung bộ nhớ trong không hỗ trợ thẻ nhớ cho lên khả năng nghe nhạc ít bài hát', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone18', N'Nokia_N8', N'H11', N'Nokia_N8_01-420x0.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'19', 9150000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Chơi Mp3: có MP3, nhung bộ nhớ trong không hỗ trợ thẻ nhớ cho lên khả năng nghe nhạc ít bài hát', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone19', N'Nokia_E7', N'H11', N'NokiaE7.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 10550000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Chơi Mp3: có MP3, nhung bộ nhớ trong không hỗ trợ thẻ nhớ cho lên khả năng nghe nhạc ít bài hát', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone20', N'Nokia_N97', N'H11', N'Nokia_N97.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 8950000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Chơi Mp3: có MP3, nhung bộ nhớ trong không hỗ trợ thẻ nhớ cho lên khả năng nghe nhạc ít bài hát', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone21', N'Nokia_6303', N'H11', N'Nokia_6303.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 2690000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Chơi Mp3: có MP3, nhung bộ nhớ trong không hỗ trợ thẻ nhớ cho lên khả năng nghe nhạc ít bài hát', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone22', N'Nokia_7230', N'H11', N'Nokia_7230.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 2650000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Chơi Mp3: có MP3, nhung bộ nhớ trong không hỗ trợ thẻ nhớ cho lên khả năng nghe nhạc ít bài hát', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone23', N'Nokia_C5', N'H11', N'Nokia_C5.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 3350000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Chơi Mp3: có MP3, nhung bộ nhớ trong không hỗ trợ thẻ nhớ cho lên khả năng nghe nhạc ít bài hát', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone24', N'Nokia_6120C', N'H11', N'Nokia 6120C.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 2970000, N'12 tháng ', N'Nokia 2690 chạy trên giao diện S40, máy có camera VGA, tích hợp đài FM với RDS, giắc cắm tai nghe 3,5 mm. Phiên bản này chạy trên 4 băng tần GSM/GPRS/EDGE, tương thích với các mạng trên toàn cầu, tích hợp khe cắm thẻ nhớ microSD, cho phép mở rộng dung lượng tối đa tới 8GB. Điện thoại mới của Nokia có màn hình LCD 1,8 inch, 262 nghìn màu với độ phân giải chỉ 128 x 160 pixel', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'Java Có, MIDP 2.1', N'Wap: trình duyệt 2.0/xHTML', N'Máy ảnh VGA, 640x480 pixels ', N'Chơi Mp3: có MP3, nhung bộ nhớ trong không hỗ trợ thẻ nhớ cho lên khả năng nghe nhạc ít bài hát', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'có hỗ trợ, có thể tải thêm', N'Máy có nhiều màu thời trang như đen, trắng, nâu đồng, xám bạc và xanh da trời. E5 dùng bàn phím QWERTY cổ điển, máy ảnh 5 megapixel zoom kỹ thuật số 3x, đèn LED flash tầm chiếu sáng 1 m', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone25', N'Fmobile B520', N'H03', N'Fmobile B520.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1500000, N'12 tháng ', N'Nokia 2690 chạy trên giao diện S40, máy có camera VGA, tích hợp đài FM với RDS, giắc cắm tai nghe 3,5 mm. Phiên bản này chạy trên 4 băng tần GSM/GPRS/EDGE, tương thích với các mạng trên toàn cầu, tích hợp khe cắm thẻ nhớ microSD, cho phép mở rộng dung lượng tối đa tới 8GB. Điện thoại mới của Nokia có màn hình LCD 1,8 inch, 262 nghìn màu với độ phân giải chỉ 128 x 160 pixel', 1, N'Kích thước: 109.2 x 46 x 14 mm, 62 cc', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone26', N'F680', N'H03', N'F680.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1940000, N'12 tháng ', N'Nokia 2690 chạy trên giao diện S40, máy có camera VGA, tích hợp đài FM với RDS, giắc cắm tai nghe 3,5 mm. Phiên bản này chạy trên 4 băng tần GSM/GPRS/EDGE, tương thích với các mạng trên toàn cầu, tích hợp khe cắm thẻ nhớ microSD, cho phép mở rộng dung lượng tối đa tới 8GB. Điện thoại mới của Nokia có màn hình LCD 1,8 inch, 262 nghìn màu với độ phân giải chỉ 128 x 160 pixel', 1, N'Kích thước: 109.2 x 46 x 14 mm, 62 cc', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone27', N'Fmobile B700', N'H03', N'Fmobile B700_tiencuongmobile.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1220000, N'12 tháng ', N'Nokia 2690 chạy trên giao diện S40, máy có camera VGA, tích hợp đài FM với RDS, giắc cắm tai nghe 3,5 mm. Phiên bản này chạy trên 4 băng tần GSM/GPRS/EDGE, tương thích với các mạng trên toàn cầu, tích hợp khe cắm thẻ nhớ microSD, cho phép mở rộng dung lượng tối đa tới 8GB. Điện thoại mới của Nokia có màn hình LCD 1,8 inch, 262 nghìn màu với độ phân giải chỉ 128 x 160 pixel', 1, N'Kích thước: 109.2 x 46 x 14 mm, 62 cc', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone28', N'Fmobile B720', N'H03', N'Fmobile B720_Tiencuong MOBILE.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1200000, N'12 tháng ', N'Nokia 2690 chạy trên giao diện S40, máy có camera VGA, tích hợp đài FM với RDS, giắc cắm tai nghe 3,5 mm. Phiên bản này chạy trên 4 băng tần GSM/GPRS/EDGE, tương thích với các mạng trên toàn cầu, tích hợp khe cắm thẻ nhớ microSD, cho phép mở rộng dung lượng tối đa tới 8GB. Điện thoại mới của Nokia có màn hình LCD 1,8 inch, 262 nghìn màu với độ phân giải chỉ 128 x 160 pixel', 1, N'Kích thước: 109.2 x 46 x 14 mm, 62 cc', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone29', N'Fmobile b750', N'H03', N'Fmobile b750.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1280000, N'12 tháng ', N'Nokia 2690 chạy trên giao diện S40, máy có camera VGA, tích hợp đài FM với RDS, giắc cắm tai nghe 3,5 mm. Phiên bản này chạy trên 4 băng tần GSM/GPRS/EDGE, tương thích với các mạng trên toàn cầu, tích hợp khe cắm thẻ nhớ microSD, cho phép mở rộng dung lượng tối đa tới 8GB. Điện thoại mới của Nokia có màn hình LCD 1,8 inch, 262 nghìn màu với độ phân giải chỉ 128 x 160 pixel', 1, N'Kích thước: 109.2 x 46 x 14 mm, 62 cc', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone30', N'Fmobile B800', N'H03', N'Fmobile B800.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1000000, N'12 tháng ', N'Nokia 2690 chạy trên giao diện S40, máy có camera VGA, tích hợp đài FM với RDS, giắc cắm tai nghe 3,5 mm. Phiên bản này chạy trên 4 băng tần GSM/GPRS/EDGE, tương thích với các mạng trên toàn cầu, tích hợp khe cắm thẻ nhớ microSD, cho phép mở rộng dung lượng tối đa tới 8GB. Điện thoại mới của Nokia có màn hình LCD 1,8 inch, 262 nghìn màu với độ phân giải chỉ 128 x 160 pixel', 1, N'Kích thước: 109.2 x 46 x 14 mm, 62 cc', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone31', N'Fmobile F99', N'H03', N'Fmobile F99.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1680000, N'12 tháng ', N'Nokia 2690 chạy trên giao diện S40, máy có camera VGA, tích hợp đài FM với RDS, giắc cắm tai nghe 3,5 mm. Phiên bản này chạy trên 4 băng tần GSM/GPRS/EDGE, tương thích với các mạng trên toàn cầu, tích hợp khe cắm thẻ nhớ microSD, cho phép mở rộng dung lượng tối đa tới 8GB. Điện thoại mới của Nokia có màn hình LCD 1,8 inch, 262 nghìn màu với độ phân giải chỉ 128 x 160 pixel', 1, N'Kích thước: 109.2 x 46 x 14 mm, 62 cc', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone32', N'Fmobile F99i', N'H03', N'Fmobile F99i.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 13800000, N'12 tháng ', N'Nokia 2690 chạy trên giao diện S40, máy có camera VGA, tích hợp đài FM với RDS, giắc cắm tai nghe 3,5 mm. Phiên bản này chạy trên 4 băng tần GSM/GPRS/EDGE, tương thích với các mạng trên toàn cầu, tích hợp khe cắm thẻ nhớ microSD, cho phép mở rộng dung lượng tối đa tới 8GB. Điện thoại mới của Nokia có màn hình LCD 1,8 inch, 262 nghìn màu với độ phân giải chỉ 128 x 160 pixel', 1, N'Kích thước: 109.2 x 46 x 14 mm, 62 cc', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone33', N'fmobile_b168', N'H03', N'fmobile_b168.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 500000, N'12 tháng ', N'Nokia 2690 chạy trên giao diện S40, máy có camera VGA, tích hợp đài FM với RDS, giắc cắm tai nghe 3,5 mm. Phiên bản này chạy trên 4 băng tần GSM/GPRS/EDGE, tương thích với các mạng trên toàn cầu, tích hợp khe cắm thẻ nhớ microSD, cho phép mở rộng dung lượng tối đa tới 8GB. Điện thoại mới của Nokia có màn hình LCD 1,8 inch, 262 nghìn màu với độ phân giải chỉ 128 x 160 pixel', 1, N'Kích thước: 109.2 x 46 x 14 mm, 62 cc', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone34', N'fmobile_b850', N'H03', N'fmobile_b850.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1350000, N'12 tháng ', N'Nokia 2690 chạy trên giao diện S40, máy có camera VGA, tích hợp đài FM với RDS, giắc cắm tai nghe 3,5 mm. Phiên bản này chạy trên 4 băng tần GSM/GPRS/EDGE, tương thích với các mạng trên toàn cầu, tích hợp khe cắm thẻ nhớ microSD, cho phép mở rộng dung lượng tối đa tới 8GB. Điện thoại mới của Nokia có màn hình LCD 1,8 inch, 262 nghìn màu với độ phân giải chỉ 128 x 160 pixel', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone35', N'fmobile_b930', N'H03', N'fmobile_b930.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'18', 1500000, N'12 tháng ', N'Nokia 2690 chạy trên giao diện S40, máy có camera VGA, tích hợp đài FM với RDS, giắc cắm tai nghe 3,5 mm. Phiên bản này chạy trên 4 băng tần GSM/GPRS/EDGE, tương thích với các mạng trên toàn cầu, tích hợp khe cắm thẻ nhớ microSD, cho phép mở rộng dung lượng tối đa tới 8GB. Điện thoại mới của Nokia có màn hình LCD 1,8 inch, 262 nghìn màu với độ phân giải chỉ 128 x 160 pixel', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone36', N'LG_GB270', N'H08', N'LG_GB270.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1190000, N'12 tháng ', N'Nokia 2690 chạy trên giao diện S40, máy có camera VGA, tích hợp đài FM với RDS, giắc cắm tai nghe 3,5 mm. Phiên bản này chạy trên 4 băng tần GSM/GPRS/EDGE, tương thích với các mạng trên toàn cầu, tích hợp khe cắm thẻ nhớ microSD, cho phép mở rộng dung lượng tối đa tới 8GB. Điện thoại mới của Nokia có màn hình LCD 1,8 inch, 262 nghìn màu với độ phân giải chỉ 128 x 160 pixel', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone37', N'LG_KP175red', N'H08', N'LG_KP175red.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 950000, N'12 tháng ', N'Nokia 2690 chạy trên giao diện S40, máy có camera VGA, tích hợp đài FM với RDS, giắc cắm tai nghe 3,5 mm. Phiên bản này chạy trên 4 băng tần GSM/GPRS/EDGE, tương thích với các mạng trên toàn cầu, tích hợp khe cắm thẻ nhớ microSD, cho phép mở rộng dung lượng tối đa tới 8GB. Điện thoại mới của Nokia có màn hình LCD 1,8 inch, 262 nghìn màu với độ phân giải chỉ 128 x 160 pixel', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone38', N'LG-E900', N'H08', N'LG-E900.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 5500000, N'12 tháng ', N'Nokia 2690 chạy trên giao diện S40, máy có camera VGA, tích hợp đài FM với RDS, giắc cắm tai nghe 3,5 mm. Phiên bản này chạy trên 4 băng tần GSM/GPRS/EDGE, tương thích với các mạng trên toàn cầu, tích hợp khe cắm thẻ nhớ microSD, cho phép mở rộng dung lượng tối đa tới 8GB. Điện thoại mới của Nokia có màn hình LCD 1,8 inch, 262 nghìn màu với độ phân giải chỉ 128 x 160 pixel', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone39', N'lg-gt505', N'H08', N'lg-gt505-tiencuong.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 3280000, N'12 tháng ', N'Nokia 2690 chạy trên giao diện S40, máy có camera VGA, tích hợp đài FM với RDS, giắc cắm tai nghe 3,5 mm. Phiên bản này chạy trên 4 băng tần GSM/GPRS/EDGE, tương thích với các mạng trên toàn cầu, tích hợp khe cắm thẻ nhớ microSD, cho phép mở rộng dung lượng tối đa tới 8GB. Điện thoại mới của Nokia có màn hình LCD 1,8 inch, 262 nghìn màu với độ phân giải chỉ 128 x 160 pixel', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone40', N'LG-GU285', N'H08', N'LG-GU285.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1600000, N'12 tháng ', N'Nokia 2690 chạy trên giao diện S40, máy có camera VGA, tích hợp đài FM với RDS, giắc cắm tai nghe 3,5 mm. Phiên bản này chạy trên 4 băng tần GSM/GPRS/EDGE, tương thích với các mạng trên toàn cầu, tích hợp khe cắm thẻ nhớ microSD, cho phép mở rộng dung lượng tối đa tới 8GB. Điện thoại mới của Nokia có màn hình LCD 1,8 inch, 262 nghìn màu với độ phân giải chỉ 128 x 160 pixel', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone41', N'lg-gw300', N'H08', N'lg-gw300.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1580000, N'12 tháng ', N'Nokia 2690 chạy trên giao diện S40, máy có camera VGA, tích hợp đài FM với RDS, giắc cắm tai nghe 3,5 mm. Phiên bản này chạy trên 4 băng tần GSM/GPRS/EDGE, tương thích với các mạng trên toàn cầu, tích hợp khe cắm thẻ nhớ microSD, cho phép mở rộng dung lượng tối đa tới 8GB. Điện thoại mới của Nokia có màn hình LCD 1,8 inch, 262 nghìn màu với độ phân giải chỉ 128 x 160 pixel', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone42', N'LG-GX200', N'H08', N'LG-GX200.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'18', 1350000, N'12 tháng ', N'Nokia 2690 chạy trên giao diện S40, máy có camera VGA, tích hợp đài FM với RDS, giắc cắm tai nghe 3,5 mm. Phiên bản này chạy trên 4 băng tần GSM/GPRS/EDGE, tương thích với các mạng trên toàn cầu, tích hợp khe cắm thẻ nhớ microSD, cho phép mở rộng dung lượng tối đa tới 8GB. Điện thoại mới của Nokia có màn hình LCD 1,8 inch, 262 nghìn màu với độ phân giải chỉ 128 x 160 pixel', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone43', N'lg-kf350-41', N'H08', N'lg-kf350-41.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 2350000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone44', N'QM73.jpg', N'H12', N'QM73.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1840000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone45', N'Q-M20', N'H12', N'Q-M20-tiencuong.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1240000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone46', N'Qmobile215_127', N'H12', N'Qmobile215_127.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 790000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone47', N'Qmobile 128_T', N'H12', N'Qmobile 128_T.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 540000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
GO
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone48', N'Qmobile KIM', N'H12', N'Qmobile KIM.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1260000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone49', N'Qmobile M12', N'H12', N'Qmobile M12.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'19', 940000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone50', N'Qmobile M22i', N'H12', N'Qmobile M22i-Tiencuongmobile.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1200000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone51', N'Qmobile M45', N'H12', N'Qmobile M45.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1320000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone52', N'Qmobile M46', N'H12', N'Qmobile M46.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1400000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone53', N'Qmobile M55', N'H12', N'Qmobile M55.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1600000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone54', N'Qmobile me114', N'H12', N'Qmobile me114.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 820000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone55', N'Qmobile P4', N'H12', N'Qmobile P4.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1360000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone56', N'Qmobile P5', N'H12', N'Qmobile P5.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1680000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone57', N'Qmobile Q266', N'H12', N'Qmobile Q266.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 980000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone58', N'Qmobile QUY', N'H12', N'Qmobile QUY.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 2150000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone59', N'Qmobile SUN', N'H12', N'Qmobile SUN.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1790000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone60', N'Qmobile X1', N'H12', N'Qmobile X1.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1990000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone61', N'qmobile_q130', N'H12', N'qmobile_q130.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 540000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêmTrò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone62', N'qmobile_q131', N'H12', N'qmobile_q131.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 540000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone63', N'Qmobile_S10.jpg', N'H12', N'Qmobile_S10.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 3750000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone64', N'qmobile_she', N'H12', N'qmobile_she.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'19', 2590000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone65', N'q-mobile-m56', N'H12', N'q-mobile-m56.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1320000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone66', N'S3653W1', N'H13', N'S3653W1.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 2350000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone67', N'S3600', N'H13', N'S3600_tiencuongmobile.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1660000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone68', N'S5233', N'H13', N'S5233.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 2780000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone69', N'S5233w', N'H13', N'S5233w_tiencuongmobile.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 2350000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêmTrò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone70', N'Samsung 5350', N'H13', N'Samsung 5350.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 2280000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone71', N'samsung B5722', N'H13', N'samsung B5722.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 3300000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone72', N'Samsung C3222', N'H13', N'Samsung C3222.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1680000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone73', N'Samsung C3303', N'H13', N'Samsung C3303-tiencuongmobile.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1350000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone74', N'Samsung E1150', N'H13', N'Samsung E1150.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 560000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone75', N'Samsung E1175t', N'H13', N'Samsung E1175t.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 490000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone76', N'Samsung E2530', N'H13', N'Samsung E2530.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1540000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone77', N'Samsung I5700', N'H13', N'Samsung I5700.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1200000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone78', N'Samsung Nexus S', N'H13', N'Samsung Nexus S.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 2350000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone79', N'Samsung S4150', N'H13', N'Samsung S4150 -tiencuong.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1600000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone80', N'Samsung S5560', N'H13', N'Samsung S5560_tiencuong.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 2350000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone81', N'samsung-galaxy-mini-s5570', N'H13', N'samsung-galaxy-mini-s5570.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 4900000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 0, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone82', N'samsung-galaxy-tab', N'H13', N'samsung-galaxy-tab.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1350000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone83', N'Samsung Wave II', N'H13', N'Samsung Wave II.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1600000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone84', N'samsung-Lindy.jpg', N'H13', N'samsung-Lindy.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1680000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone85', N'samsung-i9003-galaxy-s-sl-1', N'H13', N'samsung-i9003-galaxy-s-sl-1.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1050000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone86', N'samsung-i9100-galaxy-s-ii-16gb', N'H13', N'samsung-i9100-galaxy-s-ii-16gb.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 3720000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone87', N'samsung-m7600', N'H13', N'samsung-m7600.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1350000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone88', N'se-w595-2', N'H13', N'se-w595-2.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 2350000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone89', N'ss_e2652', N'H13', N'ss_e2652.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1200000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone92', N'w200_tc', N'H10', N'w200_tc.jpg', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'20', 1600000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone94', N'W270_tc', N'H10', N'W270_tc.jpg', CAST(N'2011-06-11T00:00:00.000' AS DateTime), N'20', 1600000, N'12 tháng ', N'Chiếc di động giá rẻ này chạy trên 4 băng tần GSM, hỗ trợ kết nối GPRS/EDGE. 2700 Classic cũng tích hợp đài FM, khe cắm thẻ nhớ microSD và Bluetooth. ', 1, N'Máy chạy hệ điều hành Symbian phiên bản v.9.3, kích thước 115 x 58,9 x 12,8 mm, nặng khoảng 126 g.', N'Ngôn ngữ: Có Tiếng việt', N'Tùy chọn Kiểu chuông Nhạc chuông 32 âm sắc, MP3, video tones', N'Bộ nhớ" 256 Mb, hỗ trợ khe cắm thẻ nhớ Micro SD lên đến 32gb', N'GPRS: có Class 10', N'Trình duyệt WAP 2.0/xHTML, HTML', N'Camera: Chụp hình VGA, 4x, 640 x 480 pixels', N'Nghe nhạc MP3/eAAC+/WAV/WMA', N'Quay video VGA với tốc độ 15 fps, Độ phân giải 176 x 144 (QCIF), 320 x 240 (QVGA) hoặc 640 x 480 pixels (VGA) ', N'Trò chơi Có 4, có thể tải thêm', N'Màu Jet Black, Mahogany Red, Frost Gray', N'Pin Pin BL-4D 1200 mAh Li-Ion Thời gian chờ 635 giờ', NULL)
INSERT [dbo].[Polls] ([PollID], [PhoneID], [Commentator], [Email], [PostDate], [Comments], [VoteCount]) VALUES (N'V120611001', N'Phone04', N'Đắc Huề', N'nguyendachue240298@gamil.com', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'', 4)
INSERT [dbo].[Polls] ([PollID], [PhoneID], [Commentator], [Email], [PostDate], [Comments], [VoteCount]) VALUES (N'V120611002', N'Phone03', N'Đắc Huề', N'nguyendachue240298@gamil.com', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'', 4)
INSERT [dbo].[Polls] ([PollID], [PhoneID], [Commentator], [Email], [PostDate], [Comments], [VoteCount]) VALUES (N'V120611003', N'Phone81', N'Đắc Huề', N'nguyendachue240298@gamil.com', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'', 4)
INSERT [dbo].[Polls] ([PollID], [PhoneID], [Commentator], [Email], [PostDate], [Comments], [VoteCount]) VALUES (N'V120611004', N'Phone75', N'Đắc Huề', N'nguyendachue240298@gamil.com', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'', 4)
INSERT [dbo].[Polls] ([PollID], [PhoneID], [Commentator], [Email], [PostDate], [Comments], [VoteCount]) VALUES (N'V120611005', N'Phone38', N'Đắc Huề', N'nguyendachue240298@gamil.com', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'', 4)
INSERT [dbo].[Polls] ([PollID], [PhoneID], [Commentator], [Email], [PostDate], [Comments], [VoteCount]) VALUES (N'V120611006', N'Phone41', N'Đắc Huề', N'nguyendachue240298@gamil.com', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'', 4)
INSERT [dbo].[Polls] ([PollID], [PhoneID], [Commentator], [Email], [PostDate], [Comments], [VoteCount]) VALUES (N'V120611007', N'Phone94', N'Đắc Huề', N'nguyendachue240298@gamil.com', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'', 4)
INSERT [dbo].[Polls] ([PollID], [PhoneID], [Commentator], [Email], [PostDate], [Comments], [VoteCount]) VALUES (N'V120611008', N'Phone92', N'Đắc Huề', N'nguyendachue240298@gamil.com', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'', 4)
INSERT [dbo].[Polls] ([PollID], [PhoneID], [Commentator], [Email], [PostDate], [Comments], [VoteCount]) VALUES (N'V120611009', N'Phone21', N'Đắc Huề', N'nguyendachue240298@gamil.com', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'', 4)
INSERT [dbo].[Polls] ([PollID], [PhoneID], [Commentator], [Email], [PostDate], [Comments], [VoteCount]) VALUES (N'V120611010', N'Phone19', N'Đắc Huề', N'nguyendachue240298@gamil.com', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'', 4)
INSERT [dbo].[Polls] ([PollID], [PhoneID], [Commentator], [Email], [PostDate], [Comments], [VoteCount]) VALUES (N'V120611011', N'Phone17', N'Đắc Huề', N'nguyendachue240298@gamil.com', CAST(N'2019-10-20T00:00:00.000' AS DateTime), N'', 5)
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_Order_Details_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_Order_Details_Orders]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_Order_Details_Phones] FOREIGN KEY([PhoneID])
REFERENCES [dbo].[Phones] ([PhoneID])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_Order_Details_Phones]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Phones]  WITH CHECK ADD  CONSTRAINT [FK_Phones_Categories] FOREIGN KEY([FirmID])
REFERENCES [dbo].[Firms] ([FirmID])
GO
ALTER TABLE [dbo].[Phones] CHECK CONSTRAINT [FK_Phones_Categories]
GO
ALTER TABLE [dbo].[Polls]  WITH CHECK ADD  CONSTRAINT [FK_Polls_Phones] FOREIGN KEY([PhoneID])
REFERENCES [dbo].[Phones] ([PhoneID])
GO
ALTER TABLE [dbo].[Polls] CHECK CONSTRAINT [FK_Polls_Phones]
GO
ALTER TABLE [dbo].[Promotions]  WITH CHECK ADD  CONSTRAINT [FK_Promotons_Phones] FOREIGN KEY([PhoneID])
REFERENCES [dbo].[Phones] ([PhoneID])
GO
ALTER TABLE [dbo].[Promotions] CHECK CONSTRAINT [FK_Promotons_Phones]
GO
/****** Object:  StoredProcedure [dbo].[AdvancedSearch]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AdvancedSearch]
(
  @Design nvarchar(450),
  @Memory nvarchar(500),
  @WebConnection nvarchar(400),
  @Browsers nvarchar(250),
  @Camera nvarchar(500),
  @MusicPlayer nvarchar(250),
  @MoviesPlayer nvarchar(250),
  @currpage int,
  @recordperpage int,
  @totalrecord int output
)
AS
BEGIN
/*
kiểm tra xem nếu các đối số truyền vào đều rỗng thì select tất cả các sp có trong kho
ngược lại thì tìm kiếm sp tùy theo điều truyền vào
*/
 if(@Design is null and @Memory is null and @WebConnection is null and @Browsers is null and @Camera is null and @MusicPlayer is null and @MoviesPlayer is null)
	   begin
			 select @totalrecord =  count(*)
									from  (select row_number() over (order by Price desc) as rowindex,FamousInfomation,PhoneName,Picture,Price
										   from Phones 
										   ) advancesearch1
	                                
			  print N'Có'+@totalrecord +'sản phẩm'
			 
			  select FamousInfomation,PhoneName,Picture,Price
			  from  (select row_number() over (order by Price desc) as rowindex,FamousInfomation,PhoneName,Picture,Price
					 from Phones 
					) advancesearch2
			 where rowindex between (@currpage -1)*@recordperpage+1 and (@currpage * @recordperpage)
	   end
 else
   begin
		select @totalrecord  =  count(*)
							   from  (select row_number() over (order by Price desc) as rowindex,FamousInfomation,PhoneName,Picture,Price
									  from Phones 
									  where Design like ('%'+@Design+'%') or Memory like('%'+@Memory+'%') or WebConnection like ('%'+@WebConnection+'%')or Browsers like ('%'+@Browsers+'%') or Camera like('%'+@Camera+'%') or MusicPlayer like('%'+@MusicPlayer+'%') or MoviesPlayer like ('%'+@MoviesPlayer+'%')
									  ) advancesearch3

		print N'Có'+@totalrecord +'sản phẩm'  
	    
		select FamousInfomation,PhoneName,Picture,Price
		from  (select row_number() over (order by Price desc) as rowindex,FamousInfomation,PhoneName,Picture,Price
									  from Phones 
									  where Design like ('%'+@Design+'%') or Memory like('%'+@Memory+'%') or WebConnection like ('%'+@WebConnection+'%')or Browsers like ('%'+@Browsers+'%') or Camera like('%'+@Camera+'%') or MusicPlayer like('%'+@MusicPlayer+'%') or MoviesPlayer like ('%'+@MoviesPlayer+'%')
									  ) advancesearch4
		where rowindex between (@currpage -1)*@recordperpage+1 and (@currpage * @recordperpage)
   end
	
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteBanner]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[DeleteBanner]
(
 @BannerID varchar(5)
)
As
Begin
  Delete from Banners where BannerID=@BannerID
End
GO
/****** Object:  StoredProcedure [dbo].[DeleteCustomer]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[DeleteCustomer]
(
 @CusID varchar(10)
)
As
Begin
  if exists (select CustomerID from Orders where CustomerID = @CusID)
     return -1
  else
     delete from Customers where CustomerID=@CusID
  return 0
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteFirm]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[DeleteFirm]
(
 @FirmID varchar(3)
)
As
begin
  if(@FirmID is null)
     return -1
 else
  begin
     if exists (select FirmID from Phones where FirmID = @FirmID)
       return
     else
       Delete from Firms where FirmID =@FirmID
  end
return 0
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteOrder]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[DeleteOrder]
(
 @OrderID nchar(10)
)
As
Begin
 if(@OrderID is null)
    return -1
 else
   begin
	 Delete from Order_Details where OrderID=@OrderID
	 Delete from Orders where OrderID=@OrderID
   end
return 0
End
GO
/****** Object:  StoredProcedure [dbo].[DeletePhone]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeletePhone]
(
  @PhoneID varchar(20)
 )
As
Begin
   if(@PhoneID is null)
       return -1
   else
      begin
            if not exists(select PhoneID from Order_Details where PhoneID = @PhoneID)
              delete from Phones where PhoneID = @PhoneID
           else
               return
      end
  return 0
End
GO
/****** Object:  StoredProcedure [dbo].[DeletePoll]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[DeletePoll]
(
  @PollID nchar(10)
)
As
Begin
  if(@PollID is null)
     return -1
  else
        Delete from Polls where PollID=@PollID
   return 0
end
GO
/****** Object:  StoredProcedure [dbo].[DeletePromotion]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeletePromotion] 
(
  @PromotionID varchar(10)
)
AS
BEGIN

    if(@PromotionID is null)
        return 0
    else
       delete from Promotions where PromotionID = @PromotionID
      return 1
END
GO
/****** Object:  StoredProcedure [dbo].[DisplayBanner]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DisplayBanner]
(
 @Link varchar(255), 
 @currpage int,
 @recordperpage int,
 @totalrecord int output
)
AS
BEGIN
    ---Nếu đối số @Link truyền vào rỗng thì select tất cả
    if(@Link is null)
		begin
			select @totalrecord = count(*) from (select row_number() over ( order by BannerID) as rowindex,
												 BannerID,BannerName,Picture,Link,PostDate,Location,Status
												 from Banners
												 ) showBanner1
			select BannerID,BannerName,Picture,Link,PostDate,Location,Status
			from (select row_number()over( order by BannerID) as rowindex,
											 BannerID,BannerName,Picture,Link,PostDate,Location,Status
											 from Banners
											 ) showBanner2
            where rowindex between (@currpage - 1)*@recordperpage and @currpage * @recordperpage
	    end
--Ngược lại sẽ hiển thị thông tin của Banner tùy theo đường link liên kết tới
     else
          begin
				  select @totalrecord = count(*) from (select row_number() over ( order by BannerID) as rowindex,
														 BannerID,BannerName,Picture,Link,PostDate,Location,Status
														 from Banners
	                                                     where Link like '%'+@Link+'%'
													 ) showBanner3
                  
                  --kiểm tra xem có bản ghi nào k(@totalrecord =0)
                  if(@totalrecord = 0)
                       Print N'không có Banner nào phù hợp '
                  --Ngược lại nếu @totalrecord <>0
                  else
                       begin
							
							select BannerID,BannerName,Picture,Link,PostDate,Location,Status
							from (select row_number()over( order by BannerID) as rowindex,
															 BannerID,BannerName,Picture,Link,PostDate,Location,Status
															 from Banners
															 where Link like '%'+@Link+'%'
															 ) showBanner4
							where rowindex between (@currpage - 1)*@recordperpage and @currpage * @recordperpage
                            
                       end
                  
          end
END
GO
/****** Object:  StoredProcedure [dbo].[DisPlayFavouriteProduct]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DisPlayFavouriteProduct]
--(
-- @currpage int,
-- @recordperpage int,
-- @totalrecord int output
--)
AS
BEGIN
--  select @totalrecord = count(*)
--                        from (select top 10 row_number() over (order by round(sum(VoteCount)/count(po.PhoneID),0) DESC) as rowindex,
--                              po.PhoneID,PhoneName,Picture,Price,round(sum(VoteCount)/count(po.PhoneID),0) as BC
--                              from Phones p,Polls po
--                              where p.PhoneID = po.PhoneID
--                              group by po.PhoneID,PhoneName,Picture,Price
--                              ) Favourite1

		--Lấy ra 10 sản phẩm có trung bình số lần bình chọn nhiều nhất
	 select top 12 PhoneID,PhoneName,Picture,Price
	 from (select row_number() over (order by round(sum(VoteCount)/count(po.PhoneID),0) DESC) as rowindex,
			  po.PhoneID,PhoneName,Picture,Price,round(sum(VoteCount)/count(po.PhoneID),0) as BC
		  from Phones p,Polls po
		  where p.PhoneID = po.PhoneID
		  group by po.PhoneID,PhoneName,Picture,Price
		  ) Favourite2
--		 where rowindex between (@currpage - 1)* @recordperpage + 1 and (@currpage * @recordperpage)

END
GO
/****** Object:  StoredProcedure [dbo].[DisplaymMarketableProduct]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DisplaymMarketableProduct]
--(
-- @currpage int,
-- @recordperpage int,
-- @totalrecord int output
--)
AS
BEGIN
--	select @totalrecord =  count(*)
--						   from  (select top 10 row_number() over (order by count(od.PhoneID) desc) as rowindex,PhoneName,Picture,Price,count(od.PhoneID) as SL
--								  from Phones p,Orders o,Order_Details od
--                                  where p.PhoneID = od.PhoneID and od.OrderID = o.OrderID
--                                  group by PhoneName,Picture,Price
--								  )MarketableProduct1
--	                                
--
--			 
	  select top 12 PhoneID,PhoneName,Picture,Price
	  from  (select row_number() over (order by count(od.PhoneID) desc) as rowindex,
                    p.PhoneID,PhoneName,Picture,Price,count(od.PhoneID) as SL
			  from Phones p,Orders o,Order_Details od
			  where p.PhoneID = od.PhoneID and od.OrderID = o.OrderID
			  group by p.PhoneID,PhoneName,Picture,Price
			 )MarketableProduct2
--	 where rowindex between (@currpage -1)*@recordperpage+1 and (@currpage * @recordperpage)
END
GO
/****** Object:  StoredProcedure [dbo].[DisplayNewProduct]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DisplayNewProduct]
--(
-- @currpage int,
-- @recordperpage int
---- @totalrecord int output
--)
AS
BEGIN
		--dựa vào ngày nhập sp mà xét sp nào mới nhất
		-- Lấy ra 10 sản phẩm nhập gần đây nhất
--	 select @total = count(*) 
--					 from (select top 10 row_number() over(order by ImportDate desc) as rowindex,
--						   PhoneName,Picture,Price
--						   from Phones
--						   where ImportDate <= getdate()) NewProduct1
	 select PhoneID,PhoneName,Picture,Price
from ( select top 12 row_number() over(order by ImportDate desc) as rowindex,
   PhoneID,PhoneName,Picture,Price
   from Phones
   where ImportDate <= getdate()
           order by ImportDate desc
         ) NewProduct2
--	where rowindex between (@currpage - 1)*@recordperpage and @currpage*@recordperpage 
END

GO
/****** Object:  StoredProcedure [dbo].[DisplayOrderbyDate]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DisplayOrderbyDate]
(
 @OrderDate datetime,
 @currpage int,
 @recordperpage int,
 @totalrecord int output
)
AS
BEGIN
    select @totalrecord = count(*) 
                             from ( select CustomerName,OrderID,ShipAddress,PhoneName,SalePrice,Quantity
									from (select p.PhoneName,d.*
										  from (select o.OrderID,ShipAddress,CustomerID,PhoneID,SalePrice,Quantity
												from Orders o,Order_Details od
												where o.OrderDate = @OrderDate and o.OrderID = od.OrderID
											   ) d
										  join Phones p on p.PhoneID = d.PhoneID 
										 )dh
								   join Customers c on c.CustomerID = dh.CustomerID
                                  ) orderdate1
 declare @kt int
  if (@totalrecord = 0)
      set @kt = 0
  else
    begin
        set @kt =1
        select PhoneName,OrderID,CustomerName,ShipAddress,SalePrice,Quantity,Amount
		from( select row_number() over (order by CustomerName) as rowindex,
					CustomerName,OrderID,ShipAddress,PhoneName,SalePrice,Quantity,sum(SalePrice*Quantity) as Amount
			  from  ( select p.PhoneName,d.*
					  from (  select o.OrderID,ShipAddress,CustomerID,PhoneID,SalePrice,Quantity
							 from Orders o,Order_Details od
							 where o.OrderDate = @OrderDate and o.OrderID = od.OrderID
						   ) d
					  join Phones p on p.PhoneID = d.PhoneID 
					)dh
			  join Customers c on c.CustomerID = dh.CustomerID
             group by PhoneName,OrderID,CustomerName,ShipAddress,SalePrice,Quantity
			 ) orderdate2
        where rowindex between (@currpage - 1)*@recordperpage and @currpage*@recordperpage
    end
   return @kt
END
GO
/****** Object:  StoredProcedure [dbo].[DisplayPollperPhone]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DisplayPollperPhone]
(
 @PhoneID varchar(6),
 @currpage int,
 @recordperpage int,
 @totalrecord int output
---@currpage :trang hiện hành
---@recordperpage:số bản ghi hiển thị trên 1 trang
---@total:tổng số bản ghi lấy được
)
AS
BEGIN
    if ((select count (*) from Polls where PhoneID = @PhoneID)=0)
        return 0
    else
       begin
            
			select @totalrecord = count(*)
			from ( select row_number() over(order by PostDate desc) as rowindex,
					Commentator,Email,PostDate,VoteCount,Comments
					from Polls
					where PhoneID = @PhoneID ) feddback
            
            select * from ( select row_number() over(order by PostDate desc) as rowindex,
							Commentator,Email,PostDate,VoteCount,Comments
							from Polls
							where PhoneID = @PhoneID ) feddback2
            where rowindex between (@currpage -1)*@recordperpage+1 and @currpage * @recordperpage
       end
       return 1
END
GO
/****** Object:  StoredProcedure [dbo].[DisplayProductDetail]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DisplayProductDetail] 
(
 @PhoneName varchar(6),
 @currstatus varchar(50) output
 --@Currstatus:thông báo tình trạng còn hay hết hàng trong kho của sản phẩm
)
AS
BEGIN
    declare @SL int
    set @SL = (select Quantity from Phones where PhoneName = @PhoneName)
	if(@SL > 0)
      set @currstatus = N'Đang còn hàng'
    else
      set @currstatus = N'Đã hết hàng'
    select PhoneName,
           FirmName,
           p.Picture,
           Quantity,
           Price,
           Warranty,
           FamousInfomation,
           Design, 
           Languages,
           Sound,
           Memory,
           WebConnection,
           Browsers,
           Camera,
           MusicPlayer,
           MoviesPlayer,
           Games,
           OrtherInfomations,
           Battery
    from Phones p , Firms f
    where p.FirmID = f.FirmID and p.PhoneName = @PhoneName and p.Status = 1
END
GO
/****** Object:  StoredProcedure [dbo].[GetSameProducts]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSameProducts] 
(
  @FirmName nvarchar(50),
  @PhoneName nvarchar(100),
---@PhoneName:Tên sản phẩm đang được xem
  @currpage int,
  @recordperpage int
---@currpage :trang hiện hành
---@recordperpage:số bản ghi hiển thị trên 1 trang
---@total:tổng số bản ghi lấy được
)
AS
BEGIN
	declare @pagesize int,  @totalrecord int 
    select @totalrecord = count(*) from 
                                       (select row_number() over (order by Price asc) as rowindex,PhoneName,p.Picture,Price
                                        from Phones p,Firms f
                                        where FirmName = @FirmName and PhoneName <> @PhoneName
                                        ) SameProduct
    
    select * from  (select row_number() over (order by Price asc) as rowindex,PhoneName,p.Picture,Price
                    from Phones p,Firms f
                    where FirmName = @FirmName and PhoneName <> @PhoneName
                    ) SameProduct2
    where rowindex between (@currpage -1)*@recordperpage+1 and (@currpage * @recordperpage)
                                            
END
GO
/****** Object:  StoredProcedure [dbo].[IncreaseBannerID]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IncreaseBannerID]
(
  @BannerID varchar(10) output
)
AS
BEGIN
	
	  Declare @intID int,@charID varchar(10)
	  set @BannerID = 'B'+ Replace( convert(varchar,getdate(),3),'/','')
	  if not exists (select top 1 BannerID
					 from Banners
					 where BannerID like (@BannerID +'%')
					 )
		set @BannerID = Rtrim(@BannerID)+'001'
	   else
		  begin
			 select @charID = (select top 1 Substring(BannerID,8,len(BannerID)-7)
							   from Banners
							   where BannerID like (@BannerID +'%')
							   order by BannerID DESC
							   )
			 set @intID = convert(int,@charID)+1
			 select @charID = case
								  when @intID >=1 and @intID <=9 then '00'+convert(varchar,@intID)
								  when @intID >9 and @intID <=99 then '0'+convert(varchar,@intID)
							   end
			 set @BannerID = Rtrim(@BannerID)+@charID
		  end
END
GO
/****** Object:  StoredProcedure [dbo].[IncreaseCusID]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IncreaseCusID]
(
  @CusID varchar(10) output
)
AS
BEGIN
  Declare @intID int,@charID varchar(10)
  set @CusID = 'K'+ Replace( convert(varchar,getdate(),3),'/','')
  if not exists (select top 1 CustomerID
				 from Customers
				 where CustomerID like (@CusID +'%')
				 )
	set @CusID = Rtrim(@CusID)+'001'
   else
	  begin
		 select @charID = (select top 1 Substring(CustomerID,8,len(CustomerID)-7)
						   from Customers
						   where CustomerID like (@CusID +'%')
						   order by CustomerID DESC
						   )
		 set @intID = convert(int,@charID)+1
		 select @charID = case
							  when @intID >=1 and @intID <=9 then '00'+convert(varchar,@intID)
							  when @intID >9 and @intID <=99 then '0'+convert(varchar,@intID)
						   end
		 set @CusID = Rtrim(@CusID)+@charID
	  end
END
GO
/****** Object:  StoredProcedure [dbo].[IncreaseFirmID]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IncreaseFirmID] 
(
  @FirmID varchar(3) output
)
AS
BEGIN
	Declare @intID int,@charID varchar(2)
   Set @FirmID ='H'
   if not exists (select top 1 FirmID 
                  from Firms
                  where FirmID like 'H%')
       set @FirmID = Rtrim(@FirmID)+'01'
   else
      begin
           Set @charID = (select top 1 Substring(FirmID,2,2)
                          from Firms
                          where FirmID like 'H%'
                          order by FirmID DESC )
           set @intID= convert(int,@charID)+1
           select @charID = case
                                when @intID >=1 and @intID <=9 then '0'+convert(varchar,@intID)
                                when @intID>9 and @intID<=99 then convert(varchar,@intID)
                             end
           set @FirmID = Rtrim(@FirmID)+@charID
       end
END
GO
/****** Object:  StoredProcedure [dbo].[IncreaseOrderID]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IncreaseOrderID] 
(
  @OrderID varchar(10) output
)
AS
BEGIN
	 Declare @intID int,@charID nchar(5)
	 set @OrderID = 'D'+ Replace( convert(varchar,getdate(),3),'/','')
	 if not exists (select top 1 OrderID
					 from Orders
					 where OrderID like (@OrderID +'%')
					 )
		set @OrderID = Rtrim(@OrderID)+'001'
	   else
		  begin
			 select @charID = (select top 1 Substring(OrderID,8,len(OrderID)-7)
							   from Orders
							   where OrderID like (@OrderID +'%')
							   order by OrderID DESC
							   )
			 set @intID = convert(int,@charID)+1
			 select @charID = case
								  when @intID >=1 and @intID <=9 then '00'+convert(varchar,@intID)
								  when @intID >9 and @intID <=99 then '0'+convert(varchar,@intID)
							   end
			 set @OrderID = Rtrim(@OrderID)+@charID
		  end
END
GO
/****** Object:  StoredProcedure [dbo].[IncreasePhoneID]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IncreasePhoneID]
(
  @FirmID varchar(3),
  @PhoneID  varchar(6) output
)
AS
BEGIN
	if not exists (select top 1 PhoneID from Products where FirmID =@FirmID)
      set @PhoneID = RTrim(@FirmID)+'0001'
    else
       begin
			  declare @intID int,@charID varchar(10)
			  select @charID =(select top 1 substring(PhoneID,4,len(PhoneID)-len(@FirmID))
							   from Phones
							   where FirmID =@FirmID
							   group by FirmID,PhoneID
							   order by PhoneID desc)
			 set @intID = convert(int,@charID) + 1 
			 select @charID = case
									when @intID >=1 and @intID <=9 then '000' +convert(varchar,@intID)
									when @intID >9 and @intID <=99 then '00' +convert(varchar,@intID)
									when @intID >99 and @intID <=999 then '0'+convert(varchar,@intID)
                                    when @intID >999 and @intID <=9999 then convert(varchar,@intID)
							  end
			 set @PhoneID = RTrim(@FirmID)+@charID
      end
END
GO
/****** Object:  StoredProcedure [dbo].[IncreasePollID]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IncreasePollID]
(
 @PollID varchar(10) output
)
AS
BEGIN
  Declare @intID int,@charID nchar(5)
  set @PollID = 'V'+ Replace( convert(varchar,getdate(),3),'/','')
  if not exists (select top 1 PollID
                 from Polls
                 where PollID like (@PollID +'%')
                 )
    set @PollID = Rtrim(@PollID)+'001'
   else
      begin
         select @charID = (select top 1 Substring(PollID,8,len(PollID)-7)
                           from Polls
                           where PollID like (@PollID +'%')
                           order by PollID DESC
                           )
         set @intID = convert(int,@charID)+1
         select @charID = case
                              when @intID >=1 and @intID <=9 then '00'+convert(varchar,@intID)
                              when @intID >9 and @intID <=99 then '0'+convert(varchar,@intID)
                           end
         set @PollID = Rtrim(@PollID)+@charID
      end
END
GO
/****** Object:  StoredProcedure [dbo].[IncreasePromotionID]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IncreasePromotionID]
(
  @PromotionID varchar (10) output
)
AS
BEGIN
 
 Declare @intID int,@charID varchar(5)
 set  @PromotionID = 'P'+ Replace( convert(varchar,getdate(),3),'/','')
 if not exists (select top 1  PromotionID
                 from  Promotions
                 where  Promotions like ( @PromotionID +'%')
                 )
      set  @PromotionID = Rtrim( @PromotionID)+'001'
   else
      begin
         select @charID = (select top 1 Substring( PromotionID,8,len( PromotionID)-7)
                           from  Promotions
                           where  PromotionID like ( @PromotionID +'%')
                           order by  PromotionID DESC
                           )
         set @intID = convert(int,@charID)+1
         select @charID = case
                              when @intID >=1 and @intID <=9 then '00'+convert(varchar,@intID)
                              when @intID >9 and @intID <=99 then '0'+convert(varchar,@intID)
                           end
         set  @PromotionID = Rtrim( @PromotionID)+@charID
      end
END
GO
/****** Object:  StoredProcedure [dbo].[InsertBanner]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertBanner]
(
 @BannerName nvarchar(100),
 @Picture varchar(255),
 @Link varchar(255),
 @PostDate datetime,
 @Location varchar(50),
 @Status int
)
As
Begin
--chèn thông tin vào trong bảng Banners
--nếu thông tin cơ bản thiếu thì sẽ trả về giá trị là:0
--nếu tồn tại mã banner trong csdl thì trả về là 1
--ngược lại  và chèn thông tin vào trong bảng
Declare @kt int
 if ((@Picture is null) or (@Link is  null) or (@PostDate is  null))	
       set @kt = 0
  else
     begin
         Declare @BannerID varchar(10)
         Declare @ID varchar(10)
         exec IncreaseBannerID @BannerID output
         select @ID = @BannerID
         if((select count(BannerID) from Banners where BannerID = @ID)>0)
             return 1
         else
	          insert into Banners values(@ID,@BannerName,@Picture,@Link,@Postdate,@Location,@Status)
     end
   return @kt
End
GO
/****** Object:  StoredProcedure [dbo].[InsertCustomer]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertCustomer]
( 
  @CusName nvarchar(50),
  @Address nvarchar(250),
  @Email varchar(150),
  @Number varchar(20)
)
As
Begin
--chèn thông tin vào trong bảng Customers
--nếu thông tin cơ bản thiếu thì sẽ trả về giá trị là:1
--nếu CustomerID đã có rồi thì sẽ trả về giá trị là:2
--ngược lại chèn thông tin vào trong bảng
  declare @kt int
  set @kt=0
  if( @CusName is null or @Address is null or @Email is null)
     set @kt=1
  else
      begin
            declare @CusID varchar(10),@ID varchar(10)
            exec IncreaseCusID @ID output
            select @CusID = @ID
			if ((select count(*) from Customers where CustomerID = @CusID)>0)
			  set @kt =2
			else	
			  insert into Customers values(@CusID,@CusName,@Address,@Email,@Number) 
      end
   return @kt
End
GO
/****** Object:  StoredProcedure [dbo].[InsertFirm]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertFirm]
( 
  
  @FirmName nvarchar(50),
  @Picture varchar(255),
  @Description nvarchar(500),
  @Status int
)
As
Begin
--chèn thông tin vào trong bảng Firms
--nếu thông tin cơ bản thiếu thì sẽ trả về giá trị là:0
--ngược lại sẽ trả về giá trị là 1 và chèn thông tin vào trong bảng
   declare @kt int
   if( @FirmName is null)
      set @kt=0
   else
      begin
         declare @ID varchar(3),@FirmID varchar(3)
         exec IncreaseFirmID @ID output
         select @FirmID = @ID
         if((select count(FirmID) from Firms where FirmID = @FirmID)>0)
            set @kt =1
         else
            insert into Firms values (@FirmID,@FirmName,@Picture,@Description,@Status)
      end
   return @kt
end
GO
/****** Object:  StoredProcedure [dbo].[InsertOrder]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[InsertOrder]
(
 @Name nvarchar(50),
 @Email varchar(150),
 @Number varchar(20),
 @OrderDate datetime,
 @RequireDate datetime,
 @ShippedDate datetime,
 @ShipAddress nvarchar(200),
 @total float
)
As
Begin
--chèn thông tin vào trong bảng Orders
--nếu thông tin cơ bản thiếu thì sẽ trả về giá trị là:1
--kiểm tra khách hàng nếu chưa có trong csdl thì sẽ trả về giá trị là 2 vàthếm KH vào bảng Customer
--sau khi kiểm tra KH tiến hàng kiểm tra đơn ĐH
--nếu OrderID đã có rồi thì sẽ trả về giá trị là:3
--ngược lại thì chèn thông tin vào bảng
   declare @kt int,@OrderID varchar(10),@ID varchar(10)
   declare @CustomerID varchar(10)
   set @kt =0
   if(@OrderDate is null or @ShipAddress is null)
     set @kt= 1
   else
     begin
         if ((select count(*) from Customers where CustomerName = @Name and Address = @ShipAddress)=0)
            begin
                set @kt =2
                exec IncreaseCusID @CustomerID output
--                select @CusID = @CustomerID
                exec InsertCustomer @Name,@ShipAddress,@Email,@Number
                exec IncreaseOrderID @ID output
                select @OrderID = @ID
                if((select count(*) from Orders where OrderID = @OrderID)>0)
                     set @kt =3
                else
                    insert into Orders (OrderID,CustomerID,OrderDate,RequireDate,ShippedDate,ShipAddress,Total)
                    values(@OrderID,@CustomerID,@OrderDate,@RequireDate,@ShippedDate,@ShipAddress,@Total)
            end
         else
             begin
                  
                  exec IncreaseOrderID @ID output
                  select @OrderID = @ID
                  select @CustomerID =(select CustomerID from Customers where CustomerName=@Name and Address=@ShipAddress)
                  if((select count(*) from Orders where OrderID = @OrderID)>0)
                     set @kt =3
                  else
                    insert into Orders (OrderID,CustomerID,OrderDate,RequireDate,ShippedDate,ShipAddress,Total)
                    values(@OrderID,@CustomerID,@OrderDate,@RequireDate,@ShippedDate,@ShipAddress,@Total)
             end
     end
   return @kt
end


GO
/****** Object:  StoredProcedure [dbo].[InsertOrder_Detail]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[InsertOrder_Detail]
(
 @OrderID nchar(10),
 @PhoneID varchar(8),
 @Quantity int,
 @SalePrice float
)
As
Begin
--chèn thông tin vào trong bảng Order_Details
--nếu thông tin cơ bản thiếu thì sẽ trả về giá trị là:1
--nếu tồn tại mã sp có trong bảng Phones mà sl bằng 0 sẽ trả về giá trị là:2
--ngược lại chèn thông tin vào trong bảng
 declare @kt int
 set @kt =0
 if (@OrderID is null or @PhoneID is null or @Quantity is null or @SalePrice is null)
    set @kt =1
 else
   begin
      if ((select count(PhoneID) from Phones where PhoneID = @PhoneID and Quantity = 0) <> 0)
         set @kt=2
      else
         begin
			  Insert into Order_Details values (@OrderID,@PhoneID,@Quantity,@SalePrice)
			  Declare @Total float
--			  set @Total=sum(@Quantity*@SalePrice)
--			  update Orders set Total = @Total where OrderID = @OrderID
               exec UpdateQuantityProduct @PhoneID,@Quantity
         end
   end
return @kt
end


GO
/****** Object:  StoredProcedure [dbo].[InsertPhone]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertPhone]
(
 @PhoneID varchar(8),
 @PhoneName nvarchar(100),
 @FirmName nvarchar(50),
 @FirmID varchar(3),
 @Picture varchar(255),
 @ImportDate datetime,
 @Quantity int,
 @Price float,
 @Warranty nvarchar(50),
 @FamousInfo nvarchar(max),
 @Status int,
 @Design nvarchar(1000),
 @Languages nvarchar(250),
 @Sound nvarchar(500),
 @Memory nvarchar(500),
 @WebConnection nvarchar(1000),
 @Browser nvarchar(400),
 @Camera nvarchar(500),
 @Music nvarchar(500),
 @Movies nvarchar(500),
 @Game nvarchar(350),
 @Orther nvarchar(4000),
 @Battery nvarchar(500)
)
As
Begin
--chèn thông tin vào trong bảng Phones
--nếu thông tin cơ bản thiếu thì sẽ trả về giá trị là:1
-- Nếu tồn tại mã sp sẽ trả về giá trị là 2 
--Nếu chưa tồn tại mã hãng sx thì trả về là 3 và thêm hãng vào bảng Firms
--ngược lạithì chèn thông tin vào bảng
   declare @kt int,@ID varchar(3)
   set @kt=0
   if(@PhoneID is null or @FirmID is null or @PhoneName is null)
       set @kt=1
   else 
      begin
          if ((select count(FirmID) from Firms where FirmName = @FirmName)=0)
              begin
					 set @kt=2
					 exec IncreaseFirmID @ID output
					 select @FirmID = @ID
					 insert into Firms (FirmID,FirmName) values (@FirmID,@FirmName)
                     if((select count(PhoneID) from Phones where PhoneID = @PhoneID)>0)
                           set @kt =3
                     else
					       insert into Phones (PhoneID,PhoneName,FirmID,Picture,ImportDate,Quantity,Price,Warranty,FamousInfomation,Status ,Design ,Languages,Sound,Memory ,WebConnection,Browsers ,Camera,MusicPlayer,MoviesPlayer,Games,OrtherInfomations ,Battery)
					        values (@PhoneID,@PhoneName,@FirmID,@Picture,@ImportDate,@Quantity,@Price,@Warranty,@FamousInfo,@Status ,@Design ,@Languages,@Sound,@Memory ,@WebConnection,@Browser ,@Camera,@Music,@Movies,@Game,@Orther ,@Battery)
			  end
         else
            begin
                 if((select count(PhoneID) from Phones where PhoneID = @PhoneID)>0)
                       set @kt =3
                 else
					insert into Phones (PhoneID,PhoneName,FirmID,Picture,ImportDate,Quantity,Price,Warranty,FamousInfomation,Status ,Design ,Languages,Sound,Memory ,WebConnection,Browsers ,Camera,MusicPlayer,MoviesPlayer,Games,OrtherInfomations ,Battery)
					values (@PhoneID,@PhoneName,@FirmID,@Picture,@ImportDate,@Quantity,@Price,@Warranty,@FamousInfo,@Status ,@Design ,@Languages,@Sound,@Memory ,@WebConnection,@Browser ,@Camera,@Music,@Movies,@Game,@Orther ,@Battery )
            end
      end
    return @kt
end
GO
/****** Object:  StoredProcedure [dbo].[InsertPoll]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertPoll]
(
 @PhoneID varchar(8),
 @Commentator nvarchar(50),
 @Email varchar(250),
 @PostDate datetime,
 @Comments nvarchar(max),
 @VoteCount int
)
As
Begin
 --chèn thông tin vào trong bảng Polls
--nếu thông tin cơ bản thiếu thì sẽ trả về giá trị là:0
--ngược lạisẽ trả về giá trị là:1 và chèn thông tin vào trong bảng
 declare @kt int
 set @kt =0
   if( @PhoneID is null or @Commentator is null)
       set @kt =1
   else
     begin
           declare  @PollID varchar(10),@ID varchar(10)
           exec IncreasePollID @ID output
           select @PollID = @ID
           if((select count(PollID) from Polls where PollID = @PollID)>0)
                set @kt=2
           else
              begin
				   if ((select count (*)from Phones where PhoneID =@PhoneID)= 0)
					  set @kt =3 
				   else
					  insert into Polls values(@PollID,@PhoneID,@Commentator,@Email,@PostDate,@Comments,@VoteCount)
              end
     end
    return @kt
end
GO
/****** Object:  StoredProcedure [dbo].[InsertPromotion]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertPromotion]
(
  @PhoneID varchar(5),
  @Percentage int
)
AS
BEGIN

--nếu thông tin cơ bản thiếu thì sẽ trả về giá trị là:1
--nếu PromontionID đã có rồi thì sẽ trả về giá trị là:2
--nếu PhoneID có SL >0 mà không có trong bảng Phones thì trả về 3
--ngược lại chèn thông tin vào trong bảng
declare @kt int
set @kt =0
if( @PhoneID is null or @Percentage is null)
    set @kt=1
else
   begin
      declare @PromotionID varchar(10),@ID varchar(10)
      exec IncreasePromotionID @ID output
      select @PromotionID = @ID
      if((select count(PromotionID) from Promotions where PromotionID = @PromotionID)>0)
          set @kt=2
       else
          begin
              if ((select count(PhoneID) from Phones where PhoneID = @PhoneID and Quantity >0)=0)
                  set @kt=3
              else
                  insert into Promotions values (@PromotionID,@PhoneID,@Percentage)
          end    
   end
  return @kt
END
GO
/****** Object:  StoredProcedure [dbo].[SearchByFirm]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchByFirm]
(
 @FirmName nvarchar(20),
 @currpage int,
 @recordperpage int
 --@totalrecord int output
 --@firmname:tên hãng sx
---@currpage :trang hiện hành
---@recordperpage:số bản ghi hiển thị trên 1 trang
---@total:tổng số bản ghi lấy được
)

AS
BEGIN
declare @totalrecord int
--nếu tìm kiếm sp của tất cả các hãng SX
    if(@FirmName = N'Tất cả các hãng')
        begin
             select @totalrecord = count(*) from 
									   (select row_number() over (order by Price asc) as rowindex,PhoneName,Picture,Price,FirmID
										from Phones 
										) searchall
	
			select * from  (select row_number() over (order by Price asc) as rowindex,PhoneID,PhoneName,Picture,Price,FirmID
							from Phones 
							) searchall2
			where rowindex between (@currpage -1)*@recordperpage+1 and (@currpage * @recordperpage) 
        end
----Ngược lại tìm kiếm theo một hãng cụ thể
--kiểm tra xem có sp nào thuộc hãng sx như đã nhập vào hay k
--nếu k có thì trả về giá trị là 0
--ngược lại trả về giá trị là 1 và hiển thị các sản phẩm thỏa mãn đk
    else
        begin
            ---nếu k có sp nào thuộc hãng nhập vào
            if((select count(*) from Phones p ,Firms f where FirmName like '%'+@FirmName+'%' and p.FirmID = f.FirmID )=0)
                 return 0
           --ngược lại 
            else
               begin
					select @totalrecord = count(*) from 
											   (select row_number() over (order by Price asc) as rowindex,PhoneName,p.Picture,Price,p.FirmID
												from Phones p,Firms f
												where  FirmName like '%'+@FirmName+'%' and p.FirmID = f.FirmID 
												) searchfirm
					
					select * from  (select row_number() over (order by Price asc) as rowindex,PhoneID,PhoneName,p.Picture,Price,p.FirmID
									from Phones p,Firms f
									where  FirmName like '%'+@FirmName+'%' and p.FirmID = f.FirmID 
									) searchfirm2
					where rowindex between (@currpage -1)*@recordperpage+1 and (@currpage * @recordperpage)
               
               end
                return 1
        end

END
GO
/****** Object:  StoredProcedure [dbo].[SearchByName]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchByName]
(
 @Name nvarchar(100),
 @currpage int,
 @recordperpage int,
 @totalrecord int output
 --@name:tên sp
---@currpage :trang hiện hành
---@recordperpage:số bản ghi hiển thị trên 1 trang
---@total:tổng số bản ghi lấy được
)
AS
BEGIN
	--kiểm tra xem có sp nào có tên giống như dữ liệu giống như đL mà người dùng nhập vào
--nếu k có thì trả về giá trị là 0
--ngược lại trả về giá trị là 1 và hiển thị các sản phẩm thỏa mãn đk
    if((select count(*) from Phones where PhoneName like '%'+@Name+'%')=0)
        return 0
    else
       begin
			
			select @totalrecord = count(*) from 
									   (select row_number() over (order by Price asc) as rowindex,PhoneName,Picture,Price
										from Phones 
										where PhoneName like '%'+@Name+'%'
										) searchname

			select * from  (select row_number() over (order by Price asc) as rowindex,PhoneName,Picture,Price
							from Phones 
							where PhoneName like '%'+@Name+'%'
							) searchname2
			where rowindex between (@currpage -1)*@recordperpage+1 and (@currpage * @recordperpage)
      end
     return 1
END
GO
/****** Object:  StoredProcedure [dbo].[SearchByPrice]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchByPrice]
(
 @Min float,
 @Max float,
 @currpage int,
 @recordperpage int
 --@totalrecord int output
 --Giá của sp nằm trong khoảng [@Min,@Max]
---@currpage :trang hiện hành
---@recordperpage:số bản ghi hiển thị trên 1 trang
---@total:tổng số bản ghi lấy được
) 

AS
BEGIN
--kiểm tra xem có sp nào có giá thuộc khoảng trên không?
--nếu k có thì trả về giá trị là 0
--ngược lại trả về giá trị là 1 và hiển thị các sản phẩm thỏa mãn đk
    if((select count(*) from Phones where Price >=@Min and Price <=@Max)=0)
        return 0
    else
       begin
			declare @pagesize int 
			--select @totalrecord = count(*) from 
			--(select row_number() over (order by Price asc) as rowindex,PhoneName,Picture,Price
			--from Phones 
			--where Price >= @Min and Price <=@Max
			--) resultsearch
			
			select * from  (select row_number() over (order by Price asc) as rowindex,PhoneName,Picture,Price
							from Phones 
							where Price >=@Min and Price <=@Max
							) resultsearch2
			where rowindex between (@currpage -1)*@recordperpage+1 and (@currpage * @recordperpage)
      end
     return 1
END
GO
/****** Object:  StoredProcedure [dbo].[SearchCustomerByAddress]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchCustomerByAddress]
(
 @Address nvarchar(250)
)
AS
BEGIN
	select * from Customers
    where Address like'%'+@Address+'%'
    order by CustomerName
END
GO
/****** Object:  StoredProcedure [dbo].[SearchCustomerByName]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchCustomerByName]
(
 @CusName nvarchar(50)
)	
AS
BEGIN
	select * from Customers
    where CustomerName like '%'+@CusName+'%'
    order by CustomerName asc
END
GO
/****** Object:  StoredProcedure [dbo].[SearchFirmByName]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchFirmByName]
(
 @Name nvarchar(50)
)
AS
BEGIN
	select * from Firms
    where FirmName like '%'+@Name+'%'
    order by FirmName
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateBanner]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[UpdateBanner]
(
 @BannerID varchar(5),
 @BannerName nvarchar(100),
 @Picture varchar(255),
 @Link varchar(255),
 @PostDate datetime,
 @Location varchar(50),
 @Status int
)
As
Begin
  update Banners 
  set BannerName = @BannerName,Picture=@Picture,Link=@Link,Location=@Location,Status=@Status
  where BannerID = @BannerID
End
GO
/****** Object:  StoredProcedure [dbo].[UpdateCustomer]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[UpdateCustomer]
( 
 @CusID varchar(10),
 @CusName nvarchar(50),
 @Address nvarchar(250),
 @Email varchar(150),
 @Number varchar(20)
)
As
Begin
  if exists(select CustomerID from Orders where CustomerID = @CusID)
     return -1
  else
     begin
	    if (isnumeric(@Number)= 0)
            return
        else
            update Customers
			set CustomerName = @CusName,Address = @Address,Email=@Email,Number=@Number
			where CustomerID = @CusID
     end
    return 0
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateFirm]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[UpdateFirm]
(
  @FirmID varchar(20),
  @FirmName nvarchar(50),
  @Picture varchar(255),
  @Description ntext,
  @Status int
)
AS
Begin 
   if not exists (select FirmID from Phones where FirmID = @FirmID)
      return -1
   else
     begin
		  if(@FirmID is null or @FirmName is null)
			 return
		  else
			  Update Firms
			  set FirmName = @FirmName,Picture=@Picture,Description = @Description,Status=@Status
			  where FirmID=@FirmID
     end
   return 0
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateOrder]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[UpdateOrder]
(
 @OrderID nchar(10),
 @CusID varchar(10),
 @OrderDate datetime,
 @RequireDate datetime,
 @ShippedDate datetime,
 @ShipAddress nvarchar(200),
 @Status int,
 @Note nvarchar(500)
)
As
begin
   if(@OrderID is null or @CusID is null or @OrderDate is null or @ShipAddress is null)
     return -1
   else
      begin
		  Declare @Total float
		  Set @Total = (select sum(Quantity * SalePrice)
						from Order_Details
						where orderID =@OrderID )
		  update Orders
		  set CustomerID=@CusID,OrderDate=@OrderDate,RequireDate=@RequireDate,ShippedDate=@ShippedDate,ShipAddress=@ShipAddress,Status=@Status,Total=@Total,Notes=@Note
		  where OrderID=@OrderID
      end
  return 0
End
GO
/****** Object:  StoredProcedure [dbo].[UpdateOrder_Detail]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[UpdateOrder_Detail]
(
  @OrderID nchar(10),
  @PhoneID nchar(10),
  @Quantity int,
  @SalePrice float
)
As
Begin
   if (@OrderID is null or @PhoneID is null or @Quantity is null or @SalePrice is null)
    return -1
 else
		  Update Order_Details
		  set PhoneID = @PhoneID,Quantity=@Quantity,SalePrice=@SalePrice
		  where OrderID=@OrderID
 return 0
End
GO
/****** Object:  StoredProcedure [dbo].[UpdatePhone]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[UpdatePhone]
(
 @PhoneID varchar(5),
 @PhoneName nvarchar(100),
 @FirmID varchar(3),
 @Picture varchar(255),
 @PostDate datetime,
 @Quantity int,
 @Price float,
 @Warranty int,
 @FamousInfo nvarchar(max),
 @Status nvarchar(20),
 @Design nvarchar(250),
 @Languages nvarchar(200),
 @Sound nvarchar(500),
 @Memory nvarchar(500),
 @WebConnection nvarchar(400),
 @Browser nvarchar(250),
 @Camera nvarchar(250),
 @Music nvarchar(250),
 @Movies nvarchar(250),
 @Game nvarchar(250),
 @Orther nvarchar(4000),
 @Battery nvarchar(500)
)
As
Begin
    if(@PhoneID is null or @FirmID is null or @PhoneName is null)
       return -1
   else 
       begin
           if not exists(select PhoneID from Order_Details where PhoneID = @PhoneID)
              update Phones
               set PhoneName=@PhoneName,FirmID=@FirmID,Picture=@Picture,PostDate=@PostDate,Quantity=@Quantity,Price=@Price,Warranty=@Warranty,FamousInfomation=@FamousInfo,Status=@Status ,Design=@Design ,Languages=@Languages,Sound=@Sound,Memory=@Memory ,WebConnection=@WebConnection,Browsers=@Browser ,Camera=@Camera,MusicPlayer=@Music,MoviesPlayer=@Movies,Games=@Game,OrtherInfomations=@Orther ,Battery=@Battery 
               where PhoneID = @PhoneID
           else
               return
       end
   return 0
End 
GO
/****** Object:  StoredProcedure [dbo].[UpdatePoll]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[UpdatePoll]
(
 @PollID nchar(10),
 @PhoneID nchar(10),
 @VoteCount int,
@dateTime datetime,
@comment nvarchar(MAX)
)
As
Begin
  if(@PollID is null or @PhoneID is null)
       return -1
   else  
	  update Polls
	  set PhoneID=@PhoneID,VoteCount=@VoteCount,PostDate=@dateTime,Comments=@comment
	  where PollID=@PollID 
		
return 0
End
GO
/****** Object:  StoredProcedure [dbo].[UpdatePromotion]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePromotion]
(
  @PromotionID varchar(10),
  @PhoneID varchar(5),
  @Percentage int
)
AS
BEGIN
	
	 declare @kt int
	 set @kt =0
	 if(@PromotionID is null or @PhoneID is null or @Percentage is null)
		set @kt=1
	 else
		begin
		  if ((select count(PhoneID) from Phones where PhoneID = @PhoneID and Quantity >0)=0)
                  set @kt=2
		   else
				  
             update Promotions 
             set PhoneID=@PhoneID,Percentage=@Percentage
             where PromotionID=@PromotionID
              
	   end
 return @kt
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateQuantityProduct]    Script Date: 11/21/2019 3:29:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateQuantityProduct]
(
 @PhoneID varchar(8),
 @QuantitySale int
)
AS
-----------Thủ tục update lại SL của sp khi lập đơn đặt hàng
BEGIN
	Declare @SL int
    select @SL =(select Quantity from Phones where PhoneID=@PhoneID)
    Update Phones set Quantity = @SL - @QuantitySale
    where PhoneID=@PhoneID
END
GO
USE [master]
GO
ALTER DATABASE [Products] SET  READ_WRITE 
GO
