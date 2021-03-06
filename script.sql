USE [master]
GO
/****** Object:  Database [FurnitureDB]    Script Date: 1.09.2021 16:56:21 ******/
CREATE DATABASE [FurnitureDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FurnitureDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FurnitureDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FurnitureDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FurnitureDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FurnitureDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FurnitureDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FurnitureDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FurnitureDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FurnitureDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FurnitureDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FurnitureDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FurnitureDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FurnitureDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FurnitureDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FurnitureDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FurnitureDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FurnitureDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FurnitureDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FurnitureDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FurnitureDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FurnitureDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FurnitureDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FurnitureDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FurnitureDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FurnitureDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FurnitureDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FurnitureDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FurnitureDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FurnitureDB] SET RECOVERY FULL 
GO
ALTER DATABASE [FurnitureDB] SET  MULTI_USER 
GO
ALTER DATABASE [FurnitureDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FurnitureDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FurnitureDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FurnitureDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FurnitureDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FurnitureDB', N'ON'
GO
ALTER DATABASE [FurnitureDB] SET QUERY_STORE = OFF
GO
USE [FurnitureDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1.09.2021 16:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](70) NOT NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1.09.2021 16:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](80) NOT NULL,
	[productFeatures] [nvarchar](500) NOT NULL,
	[productPrice] [decimal](19, 4) NOT NULL,
	[categoryID] [int] NOT NULL,
	[imageUrl] [nvarchar](120) NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (1, N'Koltuk & Kanepe')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (2, N'Sandalye')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (3, N'Berjer')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (4, N'Sehpa')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productID], [productName], [productFeatures], [productPrice], [categoryID], [imageUrl]) VALUES (1, N'Hasır Ahşap Sandalye', N'Masif Ahşap. Kadife kumaş kullanılmıştır. MDF malzeme üzerine döşeme yapılarak üretilmiştir.', CAST(547.0000 AS Decimal(19, 4)), 2, N'productImg\ahsap_hasir_sandalye.png')
INSERT [dbo].[Product] ([productID], [productName], [productFeatures], [productPrice], [categoryID], [imageUrl]) VALUES (2, N'Kahverengi Bahçe Sandalyesi', N'Polipropilen ve cam elyaf karışımdan üretilmiştir. Oturum yüksekliği: 45cm', CAST(129.0000 AS Decimal(19, 4)), 2, N'productImg\bahce_sandalyesi_129.png                   ')
INSERT [dbo].[Product] ([productID], [productName], [productFeatures], [productPrice], [categoryID], [imageUrl]) VALUES (4, N'Dörtlü Ahşap Sehpa', N'Gürgen ağacı malzemeden üretilmiştir.', CAST(356.0000 AS Decimal(19, 4)), 4, N'productImg\dortlu_sehpa_356.jpg')
INSERT [dbo].[Product] ([productID], [productName], [productFeatures], [productPrice], [categoryID], [imageUrl]) VALUES (5, N'Gül Kurusu Berjer', N'Poliüretan ve akrilik türevlerinden oluşan polyester içerikli kumaş kullanılmıştır. Flamlı kadife kumaş kullanılmıştır. Ayaklar metal malzemeden üretilmiştir.', CAST(1299.0000 AS Decimal(19, 4)), 3, N'productImg\gul_kurusu_berjer_1299.jpg                                                                         ')
INSERT [dbo].[Product] ([productID], [productName], [productFeatures], [productPrice], [categoryID], [imageUrl]) VALUES (6, N'Kiremit Berjer', N'Keten dokulu kumaş kullanılmıştır. Ayaklar masif ahşap malzemedir.', CAST(1439.0000 AS Decimal(19, 4)), 3, N'productImg\kiremit_berjer_1439.jpg                                                                            ')
INSERT [dbo].[Product] ([productID], [productName], [productFeatures], [productPrice], [categoryID], [imageUrl]) VALUES (7, N'Madrid Koltuk Takımı', N'1 adet üçlü koltuk , 1 adet berjer içerir. Poliüretan ve akrilik türevlerinden oluşan polyester içerikli kumaş kullanılmıştır.', CAST(2350.0000 AS Decimal(19, 4)), 1, N'productImg\koyu_gri_sari_koltuk_takimi_2350.jpg                     ')
INSERT [dbo].[Product] ([productID], [productName], [productFeatures], [productPrice], [categoryID], [imageUrl]) VALUES (8, N'Lacivert Koltuk Takımı', N'1 adet üçlü koltuk , 1 adet berjer içerir. İskelet ve ayak malzemesi gürgen ağacıdır. Poliüretan ve akrilik türevlerinden oluşan polyester içerikli kumaş kullanılmıştır.', CAST(2390.0000 AS Decimal(19, 4)), 1, N'productImg\lacivert_koltuk_takimi_2390.png                                                                    ')
INSERT [dbo].[Product] ([productID], [productName], [productFeatures], [productPrice], [categoryID], [imageUrl]) VALUES (9, N'Metal Sandalye', N'Ürün metal gövde üzerine statik boyalı olup döşemeli kısımlar siyah suni deriyle kaplanmıştır.', CAST(650.0000 AS Decimal(19, 4)), 2, N'productImg\metal_sandalye_650.jpg                                                                ')
INSERT [dbo].[Product] ([productID], [productName], [productFeatures], [productPrice], [categoryID], [imageUrl]) VALUES (10, N'Mor Berjer', N'Kumaş %100 polyesterdir. Ayaklar ahşap malzemedir.', CAST(1090.0000 AS Decimal(19, 4)), 3, N'productImg\mor_berjer.jpg                                                                                     ')
INSERT [dbo].[Product] ([productID], [productName], [productFeatures], [productPrice], [categoryID], [imageUrl]) VALUES (11, N'Mutfak Sandalyesi', N'Ayak rengi cevizdir.', CAST(419.0000 AS Decimal(19, 4)), 2, N'productImg\mutfak_sandalyesi_419.jpg                                                                          ')
INSERT [dbo].[Product] ([productID], [productName], [productFeatures], [productPrice], [categoryID], [imageUrl]) VALUES (12, N'Ofis Sandalyesi', N'Plastik malzemeden üretilmiştir. Ayak malzemesi metal malzemeden üretilmiştir.', CAST(439.0000 AS Decimal(19, 4)), 2, N'productImg\ofis_sandalyesi_439.jpg                                                                            ')
INSERT [dbo].[Product] ([productID], [productName], [productFeatures], [productPrice], [categoryID], [imageUrl]) VALUES (13, N'Ahşap Orta Sehpa', N'Ayak sert plastik malzemeden üretilmiştir.	Tamamı 1. kalite suntalam malzemeden üretilmiştir. Üst yüzey malzemesi Suntalam.', CAST(659.0000 AS Decimal(19, 4)), 4, N'productImg\orta_sehpa_659.jpg                                                                                 ')
INSERT [dbo].[Product] ([productID], [productName], [productFeatures], [productPrice], [categoryID], [imageUrl]) VALUES (14, N'Üçlü Koltuk Antrasit', N'Poliüretan ve akrilik türevlerinden oluşan polyester içerikli kumaş kullanılmıştır.', CAST(1690.0000 AS Decimal(19, 4)), 1, N'productImg\uclu_koltuk_antrasit_1690.jpg                                                                      ')
INSERT [dbo].[Product] ([productID], [productName], [productFeatures], [productPrice], [categoryID], [imageUrl]) VALUES (15, N'yeniürünadı', N'zsdxfcgv', CAST(234.0000 AS Decimal(19, 4)), 2, N'productImg\default.jpg')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([categoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [FurnitureDB] SET  READ_WRITE 
GO
