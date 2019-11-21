USE [master]
GO
/****** Object:  Database [Products]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  Table [dbo].[Banners]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  Table [dbo].[Firms]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  Table [dbo].[Order_Details]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  Table [dbo].[Phones]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  Table [dbo].[Polls]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  Table [dbo].[Promotions]    Script Date: 11/21/2019 4:19:22 PM ******/
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
INSERT [dbo].[Firms] ([FirmID], [FirmName], [Picture], [Description], [Status]) VALUES (N'H01', N'Acer', N'Acer-mini152.jpg', N'Sản phẩm của hãng Acer.', 1)
INSERT [dbo].[Firms] ([FirmID], [FirmName], [Picture], [Description], [Status]) VALUES (N'H02', N'Dell', N'Dell-mini146.jpg', N'Sản phẩm của hãng Dell', 0)
INSERT [dbo].[Firms] ([FirmID], [FirmName], [Picture], [Description], [Status]) VALUES (N'H03', N'Xiaomi', N'banner-Xiaomi42-b_31.png', N'Sản phẩm của hãng Xiaomi', 1)
INSERT [dbo].[Firms] ([FirmID], [FirmName], [Picture], [Description], [Status]) VALUES (N'H04', N'Realme', N'bannerRealme42-b_37.png', N'Sản phẩm của Readme', 1)
INSERT [dbo].[Firms] ([FirmID], [FirmName], [Picture], [Description], [Status]) VALUES (N'H06', N'I-phone', N'banner-iPhone-(Apple)42-b_16.jpg', N'Sản phẩm của hãng I-phone', 1)
INSERT [dbo].[Firms] ([FirmID], [FirmName], [Picture], [Description], [Status]) VALUES (N'H11', N'Nokia', N'Nokia-mini122.jpg', N'Sản phẩm của hãng Nokia', 1)
INSERT [dbo].[Firms] ([FirmID], [FirmName], [Picture], [Description], [Status]) VALUES (N'H13', N'Samsung', N'Samsung-mini121.jpg', N'Sản phẩm của hãng Samsung', 1)
INSERT [dbo].[Firms] ([FirmID], [FirmName], [Picture], [Description], [Status]) VALUES (N'H17', N'Xiaomi', N'banner-Xiaomi42-b_31.png', N'Hãng điện thoại mới', 1)
INSERT [dbo].[Phones] ([PhoneID], [PhoneName], [FirmID], [Picture], [ImportDate], [Quantity], [Price], [Warranty], [FamousInfomation], [Status], [Design], [Languages], [Sound], [Memory], [WebConnection], [Browsers], [Camera], [MusicPlayer], [MoviesPlayer], [Games], [OrtherInfomations], [Battery], [NumVisited]) VALUES (N'Phone01', N'Xiaomi Redmi 8A', N'H17', N'xiaomi-redmi-8a-red-18thangbh.jpg', CAST(N'2019-11-21T00:00:00.000' AS DateTime), N'10', 2590000, N'12 tháng', N'Bảo mật nâng cao: Mở khoá khuôn mặt
Tính năng đặc biệt	Sạc pin nhanh
Chặn cuộc gọi
Chặn tin nhắn', 1, N'Công nghệ màn hình: IPS LCD
Độ phân giải: HD+ (720 x 1520 Pixels)
Màn hình rộng: 6.22"
Mặt kính cảm ứng: Kính cường lực Corning Gorilla Glass 5', N'Có ngôn ngữ Tiếng Việt', N'MP3, WAV, AAC, FLAC', N'RAM: 2 GB
Bộ nhớ trong: 32 GB', N'Mạng di động: Hỗ trợ 4G
SIM: 2 Nano SIM
Wifi: Wi-Fi 802.11 b/g/n, Wi-Fi Direct, Wi-Fi hotspot', N'Đa dụng', N'Camera trước:Độ phân giải	8 MP
Camera sau: Độ phân giải	12 MP', N'Đa dụng', N'	Quay phim HD 720p@30fps, Quay phim FullHD 1080p@30fps', N'Tất cả', N'Thời điểm ra mắt	10/2019', N'Dung lượng pin	5000 mAh
Loại pin: Pin chuẩn Li-Po', NULL)
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
/****** Object:  StoredProcedure [dbo].[AdvancedSearch]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteBanner]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteCustomer]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteFirm]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteOrder]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeletePhone]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeletePoll]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeletePromotion]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DisplayBanner]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DisPlayFavouriteProduct]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DisplaymMarketableProduct]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DisplayNewProduct]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DisplayOrderbyDate]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DisplayPollperPhone]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DisplayProductDetail]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetSameProducts]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[IncreaseBannerID]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[IncreaseCusID]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[IncreaseFirmID]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[IncreaseOrderID]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[IncreasePhoneID]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[IncreasePollID]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[IncreasePromotionID]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertBanner]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertCustomer]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertFirm]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertOrder]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertOrder_Detail]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertPhone]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertPoll]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertPromotion]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SearchByFirm]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SearchByName]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SearchByPrice]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SearchCustomerByAddress]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SearchCustomerByName]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SearchFirmByName]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateBanner]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateCustomer]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateFirm]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateOrder]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateOrder_Detail]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdatePhone]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdatePoll]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdatePromotion]    Script Date: 11/21/2019 4:19:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateQuantityProduct]    Script Date: 11/21/2019 4:19:22 PM ******/
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
