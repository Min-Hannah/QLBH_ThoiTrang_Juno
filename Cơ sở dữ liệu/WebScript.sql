USE [master]
GO
/****** Object:  Database [WebFashion]   */
CREATE DATABASE [WebFashion]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebFashion', FILENAME = N'c:\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WebFashion.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebFashion_log', FILENAME = N'A:\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WebFashion_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebFashion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebFashion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebFashion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebFashion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebFashion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebFashion] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebFashion] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebFashion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebFashion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebFashion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebFashion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebFashion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebFashion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebFashion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebFashion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebFashion] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebFashion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebFashion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebFashion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebFashion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebFashion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebFashion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebFashion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebFashion] SET RECOVERY FULL 
GO
ALTER DATABASE [WebFashion] SET  MULTI_USER 
GO
ALTER DATABASE [WebFashion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebFashion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebFashion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebFashion] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebFashion] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebFashion] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebFashion', N'ON'
GO
ALTER DATABASE [WebFashion] SET QUERY_STORE = ON
GO
ALTER DATABASE [WebFashion] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [WebFashion]
GO
/****** Object:  Table [dbo].[Account]  **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Email] [nvarchar](250) NOT NULL,
	[Password] [nvarchar](max) NULL,
	[Active] [bit] NULL,
	[RoleId] [int] NULL,
	[CreateDate] [date] NULL,
	[AccountId] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]   */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]   **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[CusId] [int] NULL,
	[Paid] [bit] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetail]   **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetail](
	[CartId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[CreateDate] [date] NULL,
	[Price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CatId] [int] IDENTITY(1,1) NOT NULL,
	[Catname] [nvarchar](max) NULL,
	[Published] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]   **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CusId] [int] NOT NULL,
	[Fullname] [nvarchar](max) NULL,
	[Birthday] [date] NULL,
	[Address] [nvarchar](max) NULL,
	[Email] [nvarchar](250) NULL,
	[Phone] [nvarchar](max) NULL,
	[CreateDate] [date] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]   ***/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderId] [nvarchar](50) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]   */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [nvarchar](50) NOT NULL,
	[CustomerId] [int] NULL,
	[OrderDate] [date] NULL,
	[TransactionStatus] [nvarchar](50) NULL,
	[Deleted] [bit] NULL,
	[Paid] [bit] NULL,
	[PaymentDate] [date] NULL,
	[Amount] [decimal](18, 0) NULL,
 CONSTRAINT [PK__Orders__C3905BCF8A47A5D5] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

drop table Product

CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Productname] [nvarchar](max) NULL,
	[ShortDesc] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[CatId] [int] NULL,
	[Price] [int] NULL,
	[Discount] [int] NULL,
	[Thumb] [nvarchar](max) NULL,
	[DateCreated] [date] NULL,
	[DateModified] [date] NULL,
	[BestSellers] [bit] NULL,
	[Homeflag] [bit] NULL,
	[Active] [bit] NULL,
	[Tags] [nvarchar](max) NULL,
	[Stock] [int] NULL,
	[Title] [nvarchar](max) NULL,
	[BrandId] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role] */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Account] ([Email], [Password], [Active], [RoleId], [CreateDate], [AccountId]) VALUES (N'admin', N'12345', 1, 1, CAST(N'2024-03-15' AS Date), 2)
INSERT [dbo].[Account] ([Email], [Password], [Active], [RoleId], [CreateDate], [AccountId]) VALUES (N'minhy111@gmail.com', N'123123', 1, 2, CAST(N'2024-04-21' AS Date), 898599936)
INSERT [dbo].[Account] ([Email], [Password], [Active], [RoleId], [CreateDate], [AccountId]) VALUES (N'minhy123@mail.com', N'123123', 1, 2, CAST(N'2024-04-21' AS Date), 1835417835)
INSERT [dbo].[Account] ([Email], [Password], [Active], [RoleId], [CreateDate], [AccountId]) VALUES (N'minhyminhy@gmail.com', N'123123', 1, 2, CAST(N'2024-04-21' AS Date), 806724838)
INSERT [dbo].[Account] ([Email], [Password], [Active], [RoleId], [CreateDate], [AccountId]) VALUES (N'nguyenhominhy@gmail.com', N'minhy123', 0, 2, CAST(N'2024-03-15' AS Date), 1)
INSERT [dbo].[Account] ([Email], [Password], [Active], [RoleId], [CreateDate], [AccountId]) VALUES (N'test@gmail.com', N'123123', 1, 2, CAST(N'2024-04-20' AS Date), 3)
INSERT [dbo].[Account] ([Email], [Password], [Active], [RoleId], [CreateDate], [AccountId]) VALUES (N'test123@gmail.com', N'123123', 1, 2, CAST(N'2024-04-21' AS Date), 931829716)
INSERT [dbo].[Account] ([Email], [Password], [Active], [RoleId], [CreateDate], [AccountId]) VALUES (N'user@gmail.com', N'123123', 1, 2, CAST(N'2024-04-21' AS Date), 215339190)
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([BrandId], [BrandName], [Description]) VALUES (1, N'MLB', N'MLB Brand là một thương hiệu thời trang mang tính thể thao, kèm phong cách đường phố nổi tiếng ở châu Á, được thành lập bởi tập đoàn thời trang F&F theo đầy đủ giấy phép hợp pháp của liên đoàn bóng chày MLB – Major League Baseball vào năm 1997. Lấy cảm hứng từ Major League Baseball, kết hợp giữa thời trang đường phố với văn hóa thời thượng và cung cấp toàn diện các danh mục sản phẩm bao gồm hàng may mặc và phụ kiện dành cho các giới tính và lứa tuổi khác nhau. Thương hiệu truyền tải quan điểm thời trang “độc đáo, không tuân thủ và độc lập” và được công nhận là một trong những nguồn khơi, tạo ra xu hướng thời trang ở châu Á. ')
INSERT [dbo].[Brand] ([BrandId], [BrandName], [Description]) VALUES (2, N'H&M', N'H&M là một thương hiệu thời trang Thụy Điển, nổi tiếng với việc cung cấp các sản phẩm thời trang phong cách và giá cả phải chăng cho mọi lứa tuổi.')
INSERT [dbo].[Brand] ([BrandId], [BrandName], [Description]) VALUES (3, N'Gucci', N'Gucci là một trong những thương hiệu thời trang hàng đầu thế giới, nổi tiếng với các sản phẩm cao cấp và phong cách độc đáo.')
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([CartId], [CusId], [Paid]) VALUES (1, 1, 0)
INSERT [dbo].[Cart] ([CartId], [CusId], [Paid]) VALUES (8, 215339190, 0)
INSERT [dbo].[Cart] ([CartId], [CusId], [Paid]) VALUES (11, 1835417835, 0)
INSERT [dbo].[Cart] ([CartId], [CusId], [Paid]) VALUES (12, 898599936, 0)
INSERT [dbo].[Cart] ([CartId], [CusId], [Paid]) VALUES (18, 931829716, 0)
INSERT [dbo].[Cart] ([CartId], [CusId], [Paid]) VALUES (20, 806724838, 0)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
INSERT [dbo].[CartDetail] ([CartId], [ProductId], [Quantity], [CreateDate], [Price]) VALUES (11, 11, 1, CAST(N'2024-04-21' AS Date), CAST(1431000.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CatId], [Catname], [Published]) VALUES (1, N'Áo', 1)
INSERT [dbo].[Category] ([CatId], [Catname], [Published]) VALUES (2, N'Quần', 1)
INSERT [dbo].[Category] ([CatId], [Catname], [Published]) VALUES (3, N'Váy', 1)
INSERT [dbo].[Category] ([CatId], [Catname], [Published]) VALUES (4, N'Áo Khoác', 1)
INSERT [dbo].[Category] ([CatId], [Catname], [Published]) VALUES (5, N'Giày', 1)
INSERT [dbo].[Category] ([CatId], [Catname], [Published]) VALUES (6, N'Phụ kiện', 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[Customer] ([CusId], [Fullname], [Birthday], [Address], [Email], [Phone], [CreateDate], [Active]) VALUES (1, N'Nguyễn Hồ Minh Ý', CAST(N'2003-08-12' AS Date), N'HCM', N'nguyenhominhy@gmail.com', N'123456789', CAST(N'2024-04-17' AS Date), 1)
INSERT [dbo].[Customer] ([CusId], [Fullname], [Birthday], [Address], [Email], [Phone], [CreateDate], [Active]) VALUES (215339190, N'minh y', CAST(N'2024-04-01' AS Date), N'Hồ Chí Minh', N'user@gmail.com', N'0123456789', CAST(N'2024-04-21' AS Date), 1)
INSERT [dbo].[Customer] ([CusId], [Fullname], [Birthday], [Address], [Email], [Phone], [CreateDate], [Active]) VALUES (806724838, N'Nguyen ho minh y', CAST(N'2003-08-12' AS Date), N'Hồ Chí Minh', N'minhyminhy@gmail.com', N'0123456789', CAST(N'2024-04-21' AS Date), 1)
INSERT [dbo].[Customer] ([CusId], [Fullname], [Birthday], [Address], [Email], [Phone], [CreateDate], [Active]) VALUES (898599936, N'minh y', CAST(N'2003-08-12' AS Date), N'Hồ Chí Minh', N'minhy111@gmail.com', N'0123456789', CAST(N'2024-04-21' AS Date), 1)
INSERT [dbo].[Customer] ([CusId], [Fullname], [Birthday], [Address], [Email], [Phone], [CreateDate], [Active]) VALUES (931829716, N'Nguyen ho minh y', CAST(N'2003-08-12' AS Date), N'Hồ Chí Minh', N'test123@gmail.com', N'0123456789', CAST(N'2024-04-21' AS Date), 1)
INSERT [dbo].[Customer] ([CusId], [Fullname], [Birthday], [Address], [Email], [Phone], [CreateDate], [Active]) VALUES (1835417835, N'minh y', CAST(N'2003-08-12' AS Date), N'Hồ Chí Minh', N'minhy123@mail.com', N'0123456789', CAST(N'2024-04-21' AS Date), 1)
GO
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (N'638493028836182359', 1, 1, CAST(3890000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (N'638493028836182359', 5, 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (N'638493196038094007', 11, 2, CAST(2862000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (N'638493199162562997', 11, 2, CAST(2862000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (N'638493199819108310', 11, 2, CAST(2862000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (N'638493200467726388', 11, 2, CAST(2862000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (N'638493209033226805', 5, 2, CAST(2000000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (N'638493209033226805', 11, 2, CAST(2862000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (N'638493213582055275', 8, 1, CAST(2590000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (N'638493213582055275', 11, 1, CAST(1431000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (N'638493224367304146', 1, 1, CAST(3890000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (N'638493224367304146', 5, 4, CAST(4000000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (N'638493232909105387', 10, 5, CAST(8950000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (N'638493236097960968', 3, 1, CAST(3890000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (N'638493236097960968', 7, 1, CAST(8990000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [TransactionStatus], [Deleted], [Paid], [PaymentDate], [Amount]) VALUES (N'638493028836182359', 1, CAST(N'2024-04-21' AS Date), N'14386316', 0, 1, CAST(N'2024-04-21' AS Date), CAST(3890100 AS Decimal(18, 0)))
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [TransactionStatus], [Deleted], [Paid], [PaymentDate], [Amount]) VALUES (N'638493196038094007', 898599936, CAST(N'2024-04-21' AS Date), N'0', 1, 0, CAST(N'2024-04-21' AS Date), CAST(3180000 AS Decimal(18, 0)))
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [TransactionStatus], [Deleted], [Paid], [PaymentDate], [Amount]) VALUES (N'638493199162562997', 898599936, CAST(N'2024-04-21' AS Date), N'0', 1, 0, CAST(N'2024-04-21' AS Date), CAST(3180000 AS Decimal(18, 0)))
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [TransactionStatus], [Deleted], [Paid], [PaymentDate], [Amount]) VALUES (N'638493199819108310', 898599936, CAST(N'2024-04-21' AS Date), N'0', 1, 0, CAST(N'2024-04-21' AS Date), CAST(3180000 AS Decimal(18, 0)))
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [TransactionStatus], [Deleted], [Paid], [PaymentDate], [Amount]) VALUES (N'638493200467726388', 898599936, CAST(N'2024-04-21' AS Date), N'14386575', 0, 1, CAST(N'2024-04-21' AS Date), CAST(2862000 AS Decimal(18, 0)))
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [TransactionStatus], [Deleted], [Paid], [PaymentDate], [Amount]) VALUES (N'638493209033226805', 898599936, CAST(N'2024-04-21' AS Date), N'14386579', 1, 0, CAST(N'2024-04-21' AS Date), CAST(4862000 AS Decimal(18, 0)))
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [TransactionStatus], [Deleted], [Paid], [PaymentDate], [Amount]) VALUES (N'638493213582055275', 1, CAST(N'2024-04-21' AS Date), N'14386580', 0, 1, CAST(N'2024-04-21' AS Date), CAST(4021000 AS Decimal(18, 0)))
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [TransactionStatus], [Deleted], [Paid], [PaymentDate], [Amount]) VALUES (N'638493224367304146', 1, CAST(N'2024-04-21' AS Date), N'14386589', 0, 1, CAST(N'2024-04-21' AS Date), CAST(7890000 AS Decimal(18, 0)))
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [TransactionStatus], [Deleted], [Paid], [PaymentDate], [Amount]) VALUES (N'638493232909105387', 806724838, CAST(N'2024-04-21' AS Date), N'14386594', 0, 1, CAST(N'2024-04-21' AS Date), CAST(8950000 AS Decimal(18, 0)))
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [TransactionStatus], [Deleted], [Paid], [PaymentDate], [Amount]) VALUES (N'638493236097960968', 806724838, CAST(N'2024-04-21' AS Date), N'14386596', 1, 0, CAST(N'2024-04-21' AS Date), CAST(12880000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [Productname], [ShortDesc], [Description], [CatId], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Stock], [Title], [BrandId]) VALUES (1, N'MLB - Áo Thun Unisex Cổ Tròn Tay Ngắn Varsity New York Yankees', N'Áo MLB', N'Áo MLB chất lượng cao', 1, 3890000, 0, N'mlb-ao-thun-unusex-c-trn-tau-ngn-uarsutu-new-uork-uankees.jpg', CAST(N'2024-03-16' AS Date), CAST(N'2024-04-20' AS Date), 1, 1, 1, N'Ao,AoMLB', 8, N'Ao', 1)
INSERT [dbo].[Product] ([ProductId], [Productname], [ShortDesc], [Description], [CatId], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Stock], [Title], [BrandId]) VALUES (2, N'MLB - Áo Sơ Mi Denim Unisex Tay Ngắn Basic Multi Mega Logo Prints', N'Short description 1', N'Description 1', 1, 3890000, 0, N'mlb-ao-s-mu-denum-unusex-tau-ngn-basuc-multu-mega-logo-prunts.jpg', CAST(N'2024-03-16' AS Date), CAST(N'2024-04-21' AS Date), 0, 0, 1, N'tag1', 10, N'Title 1', 1)
INSERT [dbo].[Product] ([ProductId], [Productname], [ShortDesc], [Description], [CatId], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Stock], [Title], [BrandId]) VALUES (3, N'MLB - Áo Thun Unisex Cổ Tròn Tay Ngắn Phối Logo Nhỏ New York Yankees', N'Short description 1', N'Description 1', 1, 3890000, 0, N'mlb-ao-thun-unusex-c-trn-tau-ngn-phu-logo-nh-new-uork-uankees.jpg', CAST(N'2024-03-16' AS Date), CAST(N'2024-04-21' AS Date), 0, 1, 1, N'tag1', 10, N'Title 1', 1)
INSERT [dbo].[Product] ([ProductId], [Productname], [ShortDesc], [Description], [CatId], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Stock], [Title], [BrandId]) VALUES (5, N'MLB - Áo Polo Unisex Cổ Bẻ Tay Ngắn Phối Sọc Varsity Over New York Yankees', N'Short description 1', N'Description 1', 1, 1000000, 0, N'mlb-ao-polo-unusex-c-b-tau-ngn-phu-sc-uarsutu-ouer-new-uork-uankees.jpg', CAST(N'2024-03-16' AS Date), CAST(N'2024-04-13' AS Date), 0, 1, 1, N'tag1', 5, N'Title 1', 1)
INSERT [dbo].[Product] ([ProductId], [Productname], [ShortDesc], [Description], [CatId], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Stock], [Title], [BrandId]) VALUES (6, N'MLB - Quần Jogger Unisex Lưng Thun Varsity Logo', N'Short description 1', N'Description 1', 2, 500000, 0, N'mlb-qun-jogger-unusex-lung-thun-uarsutu-logo.jpg', CAST(N'2024-03-16' AS Date), CAST(N'2024-04-21' AS Date), 1, 1, 0, N'tag1', 10, N'Title 1', 1)
INSERT [dbo].[Product] ([ProductId], [Productname], [ShortDesc], [Description], [CatId], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Stock], [Title], [BrandId]) VALUES (7, N'Áo Khoác Phao Unisex Tay Dài Varisity', N'áo khoác', N'áo khoác lông', 4, 8990000, 0, N'ao-khoac-phao-unusex-tau-dau-uarusutu.png', CAST(N'2024-04-21' AS Date), CAST(N'2024-04-21' AS Date), 1, 1, 1, N'aokhoac', 10, N'aokhoac', 2)
INSERT [dbo].[Product] ([ProductId], [Productname], [ShortDesc], [Description], [CatId], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Stock], [Title], [BrandId]) VALUES (8, N'Quần Shorts Unisex Ống Rộng Classic Monogram All Over Jacquard', N'qu?n short', N'quần', 2, 2590000, 0, N'qun-shorts-unusex-ng-rng-classuc-monogram-all-ouer-jacquard.png', CAST(N'2024-04-21' AS Date), CAST(N'2024-04-21' AS Date), 0, 0, 1, N'quan', 4, N'quanshort', 2)
INSERT [dbo].[Product] ([ProductId], [Productname], [ShortDesc], [Description], [CatId], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Stock], [Title], [BrandId]) VALUES (10, N'Quần Shorts Unisex Ống Rộng Lưng Thun Trẻ Trung', N'qu?n short', N'quần', 2, 1790000, 0, N'qun-shorts-unusex-ng-rng-lung-thun-tr-trung.png', CAST(N'2024-04-21' AS Date), CAST(N'2024-04-21' AS Date), 1, 0, 1, N'quan', 5, N'quanshort', 2)
INSERT [dbo].[Product] ([ProductId], [Productname], [ShortDesc], [Description], [CatId], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Stock], [Title], [BrandId]) VALUES (11, N'Quần Shorts Unisex Ống Rộng Lưng Thun Basic Cotton Touch 5 Part', N'qu?n short', N'quần', 2, 1590000, 10, N'qun-shorts-unusex-ng-rng-lung-thun-basuc-cotton-touch-5-part.png', CAST(N'2024-04-21' AS Date), CAST(N'2024-04-21' AS Date), 0, 0, 1, N'quan', 7, N'quanshort', 2)
INSERT [dbo].[Product] ([ProductId], [Productname], [ShortDesc], [Description], [CatId], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Stock], [Title], [BrandId]) VALUES (12, N'Chân Váy Denim Mini Phom Chữ A Basic Multi Megalogo Print', N'chân váy', N'chân váy', 3, 3290000, 0, N'chn-uau-denum-munu-phom-chu-a-basuc-multu-megalogo-prunt.png', CAST(N'2024-04-21' AS Date), CAST(N'2024-04-21' AS Date), 0, 0, 1, N'chanvay', 10, N'chanvay', 3)
INSERT [dbo].[Product] ([ProductId], [Productname], [ShortDesc], [Description], [CatId], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Stock], [Title], [BrandId]) VALUES (13, N'Chân Váy Xếp Li Mini Classic Sports Striped Knit Pleated', N'chân váy', N'chân váy', 3, 4690000, 10, N'chn-uau-xp-lu-munu-classuc-sports-struped-knut-pleated.png', CAST(N'2024-04-21' AS Date), CAST(N'2024-04-21' AS Date), 0, 0, 0, N'chanvay', 20, N'chanvay', 3)
INSERT [dbo].[Product] ([ProductId], [Productname], [ShortDesc], [Description], [CatId], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Stock], [Title], [BrandId]) VALUES (14, N'Chân Váy Xếp Li Mini Classic Sports Accordion Pleated', N'chân váy', N'chân váy', 3, 3290000, 0, N'chn-uau-xp-lu-munu-classuc-sports-accorduon-pleated.png', CAST(N'2024-04-21' AS Date), CAST(N'2024-04-21' AS Date), 1, 1, 1, N'chanvay', 100, N'chanvay', 3)
INSERT [dbo].[Product] ([ProductId], [Productname], [ShortDesc], [Description], [CatId], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Stock], [Title], [BrandId]) VALUES (15, N'Sản Phẩm Được Thêm', N's?n ph?m thêm', N'sản phẩm thêm', 6, 2000000, 0, N'sn-phm-duc-them.png', CAST(N'2024-04-21' AS Date), CAST(N'2024-04-21' AS Date), 1, 1, 1, N'them', 10, N'them', 1)
INSERT [dbo].[Product] ([ProductId], [Productname], [ShortDesc], [Description], [CatId], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Stock], [Title], [BrandId]) VALUES (16, N'Sản Phẩm Thêm 2', N's?n ph?m thêm', N'sản phẩm thêm', 1, 200000, 10, N'sn-phm-them-2.png', CAST(N'2024-04-21' AS Date), CAST(N'2024-04-21' AS Date), 1, 1, 1, N'them', 10, N'them', 2)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleName], [Description]) VALUES (1, N'Admin', N'Quản trị ')
INSERT [dbo].[Role] ([RoleId], [RoleName], [Description]) VALUES (2, N'Khách hàng', N'Khách hàng')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CusId])
REFERENCES [dbo].[Customer] ([CusId])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order1] FOREIGN KEY([CartId])
REFERENCES [dbo].[Cart] ([CartId])
GO
ALTER TABLE [dbo].[CartDetail] CHECK CONSTRAINT [FK_OrderDetail_Order1]
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product1] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[CartDetail] CHECK CONSTRAINT [FK_OrderDetail_Product1]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Account] FOREIGN KEY([Email])
REFERENCES [dbo].[Account] ([Email])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Account]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders1] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders1]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CusId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([BrandId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CatId])
REFERENCES [dbo].[Category] ([CatId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [WebFashion] SET  READ_WRITE 
GO
