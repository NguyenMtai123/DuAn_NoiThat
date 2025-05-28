CREATE DATABASE [WebNoiThat_64132077]
GO
USE [WebNoiThat_64132077]
GO

/****** Object:  Table [dbo].[About]    Script Date: 1/6/2025 9:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Detail] [ntext] NULL,
	[Status] [bit] NOT NULL,
	[CreateBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 1/6/2025 9:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Detail] [ntext] NULL,
	[Map] [ntext] NULL,
	[Status] [bit] NOT NULL,
	[CreateBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK__Contact__3214EC27FD322F53] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 1/6/2025 9:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Email] [varchar](250) NULL,
	[Phone] [varchar](20) NULL,
	[Address] [nvarchar](250) NULL,
	[Detail] [ntext] NULL,
	[Status] [bit] NOT NULL,
	[CreateBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 1/6/2025 9:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Link] [nvarchar](250) NULL,
	[Target] [varchar](50) NULL,
	[TypeID] [int] NULL,
	[Status] [bit] NOT NULL,
	[Position] [int] NULL,
	[CreateBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK__Menu__3214EC2714F06B51] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 1/6/2025 9:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](250) NULL,
 CONSTRAINT [PK_MenuType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 1/6/2025 9:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderID] [bigint] NULL,
	[ProductID] [bigint] NULL,
	[ProductCode] [varchar](50) NULL,
	[Price] [decimal](18, 0) NULL,
	[ProductName] [nvarchar](250) NULL,
	[ImageProduct] [nvarchar](max) NULL,
	[Quantity] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK__OrderDet__3214EC27A52833BB] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 1/6/2025 9:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[OrderDate] [datetime] NULL,
	[Status] [int] NOT NULL,
	[EmployeeName] [nvarchar](250) NULL,
	[CustomerName] [nvarchar](250) NULL,
	[CustomerID] [bigint] NULL,
	[Ship] [decimal](18, 0) NOT NULL,
	[AddressShip] [nvarchar](max) NULL,
	[TotalAmount] [decimal](18, 0) NULL,
	[TypePayment] [int] NOT NULL,
	[Note] [ntext] NULL,
 CONSTRAINT [PK__Orders__3214EC27712BACD1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 1/6/2025 9:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[SeoTitle] [varchar](500) NULL,
	[Status] [bit] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Detail] [ntext] NULL,
	[ViewCount] [int] NOT NULL,
	[CatePostID] [bigint] NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescription] [nvarchar](max) NULL,
	[CreateBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostCategory]    Script Date: 1/6/2025 9:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[SeoTitle] [varchar](150) NULL,
	[Status] [bit] NOT NULL,
	[Sort] [int] NOT NULL,
	[ParentID] [int] NULL,
	[Image] [nvarchar](max) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescription] [nvarchar](max) NULL,
	[CreateBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK__PostCate__3214EC27BB7FE769] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/6/2025 9:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[Name] [nvarchar](500) NULL,
	[SeoTitle] [varchar](500) NULL,
	[Status] [bit] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Price] [decimal](18, 0) NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[VAT] [bit] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Warranty] [int] NULL,
	[Hot] [datetime] NULL,
	[IsSale] [bit] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Detail] [ntext] NULL,
	[ViewCount] [int] NOT NULL,
	[CategoryID] [bigint] NULL,
	[SupplierID] [bigint] NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescription] [nvarchar](max) NULL,
	[CreateBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK__Product__3214EC27F85779B6] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 1/6/2025 9:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[SeoTitle] [varchar](100) NULL,
	[Status] [bit] NOT NULL,
	[Sort] [int] NOT NULL,
	[ParentID] [int] NULL,
	[Image] [nvarchar](max) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescription] [nvarchar](max) NULL,
	[CreateBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK__ProductC__3214EC27BFDC01B4] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 1/6/2025 9:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Path] [nvarchar](max) NULL,
	[IsDefault] [bit] NOT NULL,
	[CreateBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 1/6/2025 9:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[Username] [varchar](250) NULL,
	[EmailRate] [varchar](250) NULL,
	[Rate] [int] NULL,
	[Detail] [ntext] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 1/6/2025 9:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Image] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[Position] [int] NULL,
	[CreateBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 1/6/2025 9:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Phone] [varchar](20) NULL,
	[Address] [nvarchar](250) NULL,
	[CreateBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 1/6/2025 9:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[ID] [varchar](20) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[CreateBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/6/2025 9:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](250) NULL,
	[Password] [varchar](500) NULL,
	[Fullname] [nvarchar](250) NULL,
	[Email] [varchar](500) NULL,
	[Image] [nvarchar](max) NULL,
	[Gender] [bit] NOT NULL,
	[Address] [nvarchar](500) NULL,
	[Phone] [varchar](50) NULL,
	[GroupID] [varchar](20) NULL,
	[Status] [bit] NOT NULL,
	[CreateBy] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](250) NULL,
	[UpdateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 1/6/2025 9:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[Username] [varchar](250) NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[About] ON 
GO
INSERT [dbo].[About] ([ID], [Name], [Detail], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (2, N'Giới thiệu', N'<h3><strong>Giao diện trang chủ ấn tượng</strong></h3>

<p>Trang chủ l&agrave; yếu tố đầu ti&ecirc;n m&agrave; kh&aacute;ch h&agrave;ng nh&igrave;n thấy khi v&agrave;o website, v&igrave; vậy cần phải tạo ấn tượng mạnh mẽ từ ban đầu. Một trang chủ tốt n&ecirc;n bao gồm:</p>

<ul>
	<li><strong>H&igrave;nh ảnh chất lượng cao của sản phẩm</strong>: Hiển thị c&aacute;c m&oacute;n đồ nội thất nổi bật v&agrave; c&oacute; sức h&uacute;t. H&igrave;nh ảnh đẹp gi&uacute;p kh&aacute;ch h&agrave;ng h&igrave;nh dung r&otilde; hơn về sản phẩm.</li>
	<li><strong>Banner quảng c&aacute;o</strong>: Đặt c&aacute;c chương tr&igrave;nh khuyến m&atilde;i hoặc c&aacute;c sản phẩm đặc biệt nổi bật ngay tr&ecirc;n đầu trang để thu h&uacute;t sự ch&uacute; &yacute;.</li>
	<li><strong>Thanh t&igrave;m kiếm tiện dụng</strong>: Thanh t&igrave;m kiếm n&ecirc;n được đặt ở vị tr&iacute; dễ thấy để kh&aacute;ch h&agrave;ng c&oacute; thể nhanh ch&oacute;ng t&igrave;m sản phẩm m&agrave; họ muốn.</li>
</ul>

<h3><strong>Danh mục sản phẩm đa dạng v&agrave; dễ điều hướng</strong></h3>

<p>Danh mục sản phẩm l&agrave; nơi kh&aacute;ch h&agrave;ng t&igrave;m thấy c&aacute;c loại sản phẩm kh&aacute;c nhau. Danh mục n&agrave;y n&ecirc;n được thiết kế khoa học v&agrave; r&otilde; r&agrave;ng để dễ d&agrave;ng điều hướng. C&aacute;c danh mục cần c&oacute; thể bao gồm:</p>

<ul>
	<li><strong>Sofa</strong>: Sofa g&oacute;c, sofa đơn, sofa giường, v.v.</li>
	<li><strong>B&agrave;n ghế ph&ograve;ng kh&aacute;ch</strong>: B&agrave;n cafe, b&agrave;n tr&agrave;, ghế thư gi&atilde;n.</li>
	<li><strong>Nội thất ph&ograve;ng ngủ</strong>: Giường, tủ quần &aacute;o, b&agrave;n trang điểm.</li>
	<li><strong>Nội thất ph&ograve;ng ăn</strong>: B&agrave;n ăn, ghế ăn, tủ đựng ch&eacute;n b&aacute;t.</li>
	<li><strong>Trang tr&iacute; nh&agrave; cửa</strong>: Đ&egrave;n trang tr&iacute;, thảm, tranh treo tường, gối tựa.</li>
</ul>

<p>Ngo&agrave;i ra, c&aacute;c danh mục c&oacute; thể được bổ sung theo phong c&aacute;ch (hiện đại, cổ điển, tối giản, v.v.) để đ&aacute;p ứng sở th&iacute;ch đa dạng của kh&aacute;ch h&agrave;ng.</p>

<h3><strong>Trang chi tiết sản phẩm đầy đủ v&agrave; hấp dẫn</strong></h3>

<p>Trang chi tiết sản phẩm l&agrave; nơi kh&aacute;ch h&agrave;ng t&igrave;m hiểu th&ecirc;m về sản phẩm, v&igrave; vậy cần cung cấp đầy đủ th&ocirc;ng tin, bao gồm:</p>

<ul>
	<li><strong>H&igrave;nh ảnh sắc n&eacute;t</strong>: Cung cấp h&igrave;nh ảnh từ nhiều g&oacute;c độ kh&aacute;c nhau để kh&aacute;ch h&agrave;ng h&igrave;nh dung r&otilde; r&agrave;ng sản phẩm.</li>
	<li><strong>M&ocirc; tả chi tiết</strong>: M&ocirc; tả cần bao gồm k&iacute;ch thước, chất liệu, m&agrave;u sắc, v&agrave; t&iacute;nh năng của sản phẩm.</li>
	<li><strong>Gi&aacute; v&agrave; ch&iacute;nh s&aacute;ch giảm gi&aacute; (nếu c&oacute;)</strong>: Hiển thị r&otilde; r&agrave;ng gi&aacute; gốc v&agrave; gi&aacute; sau khi giảm để tạo sự hấp dẫn.</li>
	<li><strong>Ch&iacute;nh s&aacute;ch bảo h&agrave;nh v&agrave; vận chuyển</strong>: Gi&uacute;p kh&aacute;ch h&agrave;ng an t&acirc;m về chất lượng v&agrave; hậu m&atilde;i.</li>
	<li><strong>N&uacute;t th&ecirc;m v&agrave;o giỏ h&agrave;ng</strong>: N&uacute;t n&agrave;y n&ecirc;n được đặt ở vị tr&iacute; dễ thấy để kh&aacute;ch h&agrave;ng c&oacute; thể dễ d&agrave;ng thực hiện thao t&aacute;c mua h&agrave;ng.</li>
</ul>

<h3><strong>Chức năng giỏ h&agrave;ng v&agrave; thanh to&aacute;n tiện lợi</strong></h3>

<p>Một website b&aacute;n đồ nội thất chuy&ecirc;n nghiệp kh&ocirc;ng thể thiếu chức năng giỏ h&agrave;ng v&agrave; thanh to&aacute;n tiện lợi:</p>

<ul>
	<li><strong>Giỏ h&agrave;ng trực quan</strong>: Hiển thị sản phẩm, gi&aacute; v&agrave; số lượng trong giỏ h&agrave;ng để kh&aacute;ch h&agrave;ng dễ d&agrave;ng quản l&yacute; đơn h&agrave;ng.</li>
	<li><strong>Quy tr&igrave;nh thanh to&aacute;n đơn giản</strong>: Cho ph&eacute;p kh&aacute;ch h&agrave;ng thanh to&aacute;n nhanh ch&oacute;ng, kh&ocirc;ng phải trải qua qu&aacute; nhiều bước phức tạp.</li>
	<li><strong>Nhiều phương thức thanh to&aacute;n</strong>: Bao gồm thanh to&aacute;n qua thẻ, chuyển khoản, hoặc thanh to&aacute;n khi nhận h&agrave;ng (COD).</li>
	<li><strong>T&iacute;nh năng lưu th&ocirc;ng tin đơn h&agrave;ng</strong>: Để kh&aacute;ch h&agrave;ng c&oacute; thể dễ d&agrave;ng theo d&otilde;i v&agrave; kiểm tra trạng th&aacute;i đơn h&agrave;ng.</li>
</ul>

<h3><strong>Trang giới thiệu về c&ocirc;ng ty v&agrave; ch&iacute;nh s&aacute;ch bảo h&agrave;nh</strong></h3>

<p>Để tăng độ tin cậy, trang giới thiệu cần thể hiện r&otilde; th&ocirc;ng tin về c&ocirc;ng ty, sứ mệnh, gi&aacute; trị v&agrave; cam kết với kh&aacute;ch h&agrave;ng. B&ecirc;n cạnh đ&oacute;, c&aacute;c ch&iacute;nh s&aacute;ch bảo h&agrave;nh v&agrave; ho&agrave;n trả cũng n&ecirc;n được hiển thị r&otilde; r&agrave;ng, gi&uacute;p kh&aacute;ch h&agrave;ng an t&acirc;m hơn khi mua sắm.</p>

<ul>
	<li><strong>Th&ocirc;ng tin về c&ocirc;ng ty</strong>: Giới thiệu sơ lược về lịch sử, th&agrave;nh tựu, v&agrave; triết l&yacute; của cửa h&agrave;ng.</li>
	<li><strong>Ch&iacute;nh s&aacute;ch bảo h&agrave;nh</strong>: Cung cấp th&ocirc;ng tin chi tiết về thời gian bảo h&agrave;nh, điều kiện &aacute;p dụng, v&agrave; hướng dẫn bảo tr&igrave; sản phẩm.</li>
	<li><strong>Ch&iacute;nh s&aacute;ch ho&agrave;n trả</strong>: Nếu kh&aacute;ch h&agrave;ng kh&ocirc;ng h&agrave;i l&ograve;ng, ch&iacute;nh s&aacute;ch ho&agrave;n trả cần hỗ trợ kh&aacute;ch h&agrave;ng dễ d&agrave;ng thực hiện thủ tục trả lại h&agrave;ng.</li>
</ul>

<h3><strong>Blog chia sẻ kiến thức v&agrave; mẹo trang tr&iacute; nội thất</strong></h3>

<p>Blog gi&uacute;p kh&aacute;ch h&agrave;ng nhận được những lời khuy&ecirc;n, &yacute; tưởng về trang tr&iacute; v&agrave; b&agrave;i tr&iacute; nội thất. Ngo&agrave;i ra, đ&acirc;y cũng l&agrave; cơ hội để website thu h&uacute;t th&ecirc;m lượt truy cập qua SEO.</p>

<ul>
	<li><strong>Nội dung blog</strong>: C&aacute;c b&agrave;i viết như &ldquo;C&aacute;ch chọn sofa ph&ugrave; hợp cho ph&ograve;ng kh&aacute;ch,&rdquo; &ldquo;Xu hướng nội thất năm nay,&rdquo; hoặc &ldquo;5 mẹo trang tr&iacute; nh&agrave; nhỏ th&ecirc;m rộng r&atilde;i.&rdquo;</li>
	<li><strong>Video hướng dẫn</strong>: Bổ sung video gi&uacute;p kh&aacute;ch h&agrave;ng c&oacute; c&aacute;i nh&igrave;n trực quan v&agrave; dễ hiểu hơn về sản phẩm.</li>
	<li><strong>C&aacute;c b&agrave;i viết đ&aacute;nh gi&aacute; sản phẩm</strong>: Cung cấp những b&agrave;i đ&aacute;nh gi&aacute; chi tiết về c&aacute;c sản phẩm b&aacute;n chạy, tạo niềm tin cho kh&aacute;ch h&agrave;ng.</li>
</ul>

<h3><strong>T&iacute;ch hợp c&ocirc;ng cụ hỗ trợ v&agrave; chăm s&oacute;c kh&aacute;ch h&agrave;ng</strong></h3>

<p>Một trong những yếu tố quan trọng để duy tr&igrave; v&agrave; chăm s&oacute;c kh&aacute;ch h&agrave;ng tốt hơn l&agrave; hỗ trợ v&agrave; tương t&aacute;c thường xuy&ecirc;n:</p>

<ul>
	<li><strong>Chat trực tuyến</strong>: T&iacute;ch hợp t&iacute;nh năng live chat để kh&aacute;ch h&agrave;ng dễ d&agrave;ng li&ecirc;n hệ với nh&acirc;n vi&ecirc;n hỗ trợ khi c&oacute; thắc mắc.</li>
	<li><strong>Form li&ecirc;n hệ</strong>: Cung cấp form li&ecirc;n hệ v&agrave; địa chỉ email để kh&aacute;ch h&agrave;ng c&oacute; thể gửi y&ecirc;u cầu hỗ trợ bất kỳ l&uacute;c n&agrave;o.</li>
	<li><strong>FAQ</strong>: Trang c&aacute;c c&acirc;u hỏi thường gặp gi&uacute;p kh&aacute;ch h&agrave;ng tự giải đ&aacute;p những thắc mắc phổ biến.</li>
</ul>
', 0, N'admin', CAST(N'2025-01-03T20:00:19.903' AS DateTime), N'admin', CAST(N'2025-01-03T20:00:19.903' AS DateTime))
GO
INSERT [dbo].[About] ([ID], [Name], [Detail], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (3, N'Hay', N'<h2>C&ocirc;ng ty Cổ Phần Gỗ Miền Nam</h2>

<p><strong>C&Ocirc;NG TY CỔ PHẦN GỖ MIỀN NAM</strong>&nbsp;l&agrave; một đơn vị chuy&ecirc;n Tư vấn &ndash; Thiết kế nội thất &ndash; Thi c&ocirc;ng trang tr&iacute; nội thất. Sản xuất thi c&ocirc;ng đồ gỗ: giường, tủ &aacute;o, bếp,cửa gỗ,tủ bếp,cầu thang,s&agrave;n gỗ&hellip;theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng.</p>

<p><strong>C&Ocirc;NG TY CỔ PHẦN GỖ MIỀN NAM</strong>&nbsp;l&agrave; tập hợp c&aacute;c kiến tr&uacute;c sư, kỹ sư, designer, năng động v&agrave; chuy&ecirc;n nghiệp c&ugrave;ng với đội ngũ nghệ nh&acirc;n đầy kinh nghiệm trong lĩnh vực Thiết kế nội thất, Thi c&ocirc;ng nội thất, Sản xuất đồ gỗ,được đ&agrave;o tạo ch&iacute;nh quy trong v&agrave; ngo&agrave;i nước.</p>

<p>Sự đa dạng, s&aacute;ng tạo trong phong c&aacute;ch, &yacute; tưởng kiến tr&uacute;c, thiết kế kết hợp với sức mạnh c&ocirc;ng nghệ, kỹ thuật ti&ecirc;n tiến v&agrave; kinh nghiệm, tay nghề l&agrave; thế mạnh của&nbsp;<strong>GỖ MIỀN NAM</strong>.</p>

<p>Sự tận tụy với kh&aacute;ch h&agrave;ng, s&aacute;ng tạo v&agrave; say m&ecirc; với c&ocirc;ng việc l&agrave; phương ch&acirc;m hoạt động của ch&uacute;ng t&ocirc;i. C&ugrave;ng với sự t&iacute;n nhiệm v&agrave; quan hệ ng&agrave;y c&agrave;ng được mở rộng với kh&aacute;ch h&agrave;ng đ&atilde; tạo n&ecirc;n động lực th&uacute;c đẩy&nbsp;<strong>C&ocirc;ng Ty Gỗ Miền Nam</strong>&nbsp;kh&ocirc;ng ngừng vươn l&ecirc;n nhằm cung cấp những dịch vụ tốt nhất phục vụ hoạt động của c&aacute;c văn ph&ograve;ng, c&aacute;c cơ quan, c&aacute;c doanh nghiệp với mục đ&iacute;ch duy nhất l&agrave; san sẻ những vất vả về c&ugrave;ng với kh&aacute;ch h&agrave;ng.</p>
', 1, N'admin', CAST(N'2025-01-03T20:16:03.847' AS DateTime), N'admin', CAST(N'2025-01-03T20:16:03.847' AS DateTime))
GO
INSERT [dbo].[About] ([ID], [Name], [Detail], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (5, N'Giới thiệu', N'<h2>Về Ch&uacute;ng T&ocirc;i</h2>

<p>C&ocirc;ng ty Cổ phần Kiến tr&uacute;c v&agrave; Nội thất Art Home được th&agrave;nh lập từ năm 2010 với hai thế mạnh ch&iacute;nh l&agrave; chuy&ecirc;n s&acirc;u về thiết kế nội thất v&agrave; sản xuất thi c&ocirc;ng trực tiếp c&aacute;c c&ocirc;ng tr&igrave;nh. Ch&uacute;ng t&ocirc;i lu&ocirc;n mang đến những giải ph&aacute;p bố tr&iacute; kh&ocirc;ng gian th&ocirc;ng minh nhất c&ugrave;ng t&iacute;nh thẩm mỹ cao nhất cho c&aacute;c kh&aacute;ch h&agrave;ng của m&igrave;nh bằng sự hăng say với nghề m&agrave; tại Art Home, ch&uacute;ng t&ocirc;i gọi l&agrave;&nbsp;<b>&ldquo;Mang nghệ thuật v&agrave;o kh&ocirc;ng gian sống&rdquo;</b>.<br />
<br />
Địa chỉ : 65 ng&otilde; 1295 Đường Giải Ph&oacute;ng - Thịnh Liệt - Ho&agrave;ng Mai - H&agrave; Nội<br />
<br />
M&atilde; số doanh nghiệp : 01 0606 8777<br />
<br />
Số t&agrave;i khoản c&ocirc;ng ty : 7979 6666 666 Ng&acirc;n H&agrave;ng Ti&ecirc;n Phong Bank CN Ho&agrave;ng Mai<br />
<br />
T&agrave;i Khoản c&aacute; nh&acirc;n : Nguyễn Trung Th&agrave;nh<br />
0835 333 333 Ng&acirc;n H&agrave;ng Qu&acirc;n đội MB bank CN Ho&agrave;ng Mai<br />
9835 333 333 Ng&acirc;n H&agrave;ng Vietcombank CN Ho&agrave;ng Mai<br />
7968 9999 999 Ng&acirc;n H&agrave;ng Ti&ecirc;n Phong Bank CN Ho&agrave;ng Mai<br />
<br />
Hotline : 0835 333 333 - 09 3535 1616</p>
', 0, N'admin', CAST(N'2025-01-06T20:27:37.577' AS DateTime), N'admin', CAST(N'2025-01-06T20:27:37.577' AS DateTime))
GO
INSERT [dbo].[About] ([ID], [Name], [Detail], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (6, N'About 1', N'<p><img alt="Sodotochuc.jpg" src="https://arthome.vn/attachments/sodotochuc-jpg.329/" /></p>
', 0, N'admin', CAST(N'2025-01-06T20:28:13.073' AS DateTime), N'admin', CAST(N'2025-01-06T20:28:13.073' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[About] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 
GO
INSERT [dbo].[Contact] ([ID], [Name], [Detail], [Map], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (1, N'Liên hệ 1', N'<p>Tên: Hoàng</p>
<p>SDT: 0986.993.748</p>
<p>Email: ngohoang29@gmail.com</p>
<p>Địa chỉ: Hùng Vuong - Ho chi Minh</p>', N'                <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d52679.38188534867!2d109.15122956770409!3d12.052253621901228!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1svi!2s!4v1735721673343!5m2!1svi!2s" width="600" height="400" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
', 1, N'admin', CAST(N'2025-01-01T15:51:19.290' AS DateTime), N'admin', CAST(N'2025-01-01T15:51:19.290' AS DateTime))
GO
INSERT [dbo].[Contact] ([ID], [Name], [Detail], [Map], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (3, N'Liên hệ 2', N'<p>Số t&agrave;i khoản c&ocirc;ng ty : 7979 6666 666 Ng&acirc;n H&agrave;ng Ti&ecirc;n Phong Bank CN Ho&agrave;ng Mai<br />
<br />
T&agrave;i Khoản c&aacute; nh&acirc;n : Nguyễn Trung Th&agrave;nh<br />
0835 333 333 Ng&acirc;n H&agrave;ng Qu&acirc;n đội MB bank CN Ho&agrave;ng Mai<br />
9835 333 333 Ng&acirc;n H&agrave;ng Vietcombank CN Ho&agrave;ng Mai<br />
7968 9999 999 Ng&acirc;n H&agrave;ng Ti&ecirc;n Phong Bank CN Ho&agrave;ng Mai</p>
', N'<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d24261.383791651413!2d109.19686823556053!3d12.27907975928155!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1svi!2s!4v1736170174485!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>', 0, N'admin', CAST(N'2025-01-06T20:29:44.220' AS DateTime), N'admin', CAST(N'2025-01-06T20:29:44.220' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 
GO
INSERT [dbo].[Feedback] ([ID], [Name], [Email], [Phone], [Address], [Detail], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (1, N'Nguyen Minh Tai', N'tuyetchungkhoi@gmail.com', N'0702347998', N'Khánh Hòa', N'1234', 1, NULL, CAST(N'2025-01-01T16:51:23.323' AS DateTime), NULL, CAST(N'2025-01-01T16:51:23.323' AS DateTime))
GO
INSERT [dbo].[Feedback] ([ID], [Name], [Email], [Phone], [Address], [Detail], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (2, N'Nguyen Minh Tai', N'tuyetchungkhoi@gmail.com', N'0702347998', N'Khánh Hòa', N'33333', 1, NULL, CAST(N'2025-01-01T16:52:47.943' AS DateTime), NULL, CAST(N'2025-01-01T16:52:47.943' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 
GO
INSERT [dbo].[Menu] ([ID], [Name], [Link], [Target], [TypeID], [Status], [Position], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (1, N'Trang chủ', N'/', N'_self', 1, 1, 1, N'admin', CAST(N'2024-12-29T17:30:30.120' AS DateTime), N'admin', CAST(N'2024-12-29T17:30:30.120' AS DateTime))
GO
INSERT [dbo].[Menu] ([ID], [Name], [Link], [Target], [TypeID], [Status], [Position], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (3, N'Sản phẩm', N'/san-pham', N'_self', 1, 1, 2, N'admin', CAST(N'2024-12-29T17:36:37.053' AS DateTime), N'admin', CAST(N'2024-12-29T17:36:37.053' AS DateTime))
GO
INSERT [dbo].[Menu] ([ID], [Name], [Link], [Target], [TypeID], [Status], [Position], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (4, N'Tin tức', N'/tin-tuc', N'_self', 1, 1, 3, N'admin', CAST(N'2024-12-29T17:37:32.850' AS DateTime), N'admin', CAST(N'2024-12-29T17:37:32.850' AS DateTime))
GO
INSERT [dbo].[Menu] ([ID], [Name], [Link], [Target], [TypeID], [Status], [Position], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (5, N'Giới thiệu', N'/gioi-thieu', N'_self', 1, 1, 4, N'admin', CAST(N'2024-12-29T17:38:38.213' AS DateTime), N'admin', CAST(N'2024-12-29T17:38:38.213' AS DateTime))
GO
INSERT [dbo].[Menu] ([ID], [Name], [Link], [Target], [TypeID], [Status], [Position], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (6, N'Liên hệ', N'/Lien-he', N'_self', 1, 1, 5, N'admin', CAST(N'2024-12-29T19:01:17.163' AS DateTime), N'admin', CAST(N'2024-12-29T19:01:17.163' AS DateTime))
GO
INSERT [dbo].[Menu] ([ID], [Name], [Link], [Target], [TypeID], [Status], [Position], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (7, N'Khuyến mãi hot', N'/khuyen-mai-hot', N'_self', 2, 0, 1, N'admin', CAST(N'2024-12-29T19:05:26.680' AS DateTime), N'admin', CAST(N'2024-12-29T19:05:26.680' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (1, N'Menu Chính')
GO
INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (2, N'Menu Top')
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [ProductCode], [Price], [ProductName], [ImageProduct], [Quantity], [Status]) VALUES (3, 2, 23, N'SP087', CAST(120000 AS Decimal(18, 0)), N'Đồng hồ TT', N'/Data/Images/SanPham/dongho.jpg', 2, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [ProductCode], [Price], [ProductName], [ImageProduct], [Quantity], [Status]) VALUES (5, 2, 22, N'SP040', CAST(160000 AS Decimal(18, 0)), N'Tranh cảnh hồ', N'/Data/Images/banner/tranh-treo-tuong-phong-canh-thien-nhien-25092.jpg', 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [ProductCode], [Price], [ProductName], [ImageProduct], [Quantity], [Status]) VALUES (6, 3, 4, N'SP01', CAST(80000 AS Decimal(18, 0)), N'Ghế Tre', N'/Data/Images/SanPham/ghetre.jpg', 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [ProductCode], [Price], [ProductName], [ImageProduct], [Quantity], [Status]) VALUES (7, 3, 5, N'SP04', CAST(70000 AS Decimal(18, 0)), N'Ghế mây', N'/Data/Images/SanPham/mdc-8004-n.jpg', 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [ProductCode], [Price], [ProductName], [ImageProduct], [Quantity], [Status]) VALUES (11, 5, 23, N'SP087', CAST(120000 AS Decimal(18, 0)), N'Đồng hồ TT', N'/Data/Images/SanPham/dongho.jpg', 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [ProductCode], [Price], [ProductName], [ImageProduct], [Quantity], [Status]) VALUES (12, 5, 22, N'SP040', CAST(160000 AS Decimal(18, 0)), N'Tranh cảnh hồ', N'/Data/Images/banner/tranh-treo-tuong-phong-canh-thien-nhien-25092.jpg', 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [ProductCode], [Price], [ProductName], [ImageProduct], [Quantity], [Status]) VALUES (13, 6, 23, N'SP087', CAST(120000 AS Decimal(18, 0)), N'Đồng hồ TT', N'/Data/Images/SanPham/dongho.jpg', 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [ProductCode], [Price], [ProductName], [ImageProduct], [Quantity], [Status]) VALUES (14, 6, 22, N'SP040', CAST(160000 AS Decimal(18, 0)), N'Tranh cảnh hồ', N'/Data/Images/banner/tranh-treo-tuong-phong-canh-thien-nhien-25092.jpg', 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [ProductCode], [Price], [ProductName], [ImageProduct], [Quantity], [Status]) VALUES (15, 7, 22, N'SP040', CAST(160000 AS Decimal(18, 0)), N'Tranh cảnh hồ', N'/Data/Images/banner/tranh-treo-tuong-phong-canh-thien-nhien-25092.jpg', 2, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [ProductCode], [Price], [ProductName], [ImageProduct], [Quantity], [Status]) VALUES (16, 7, 21, N'SP039', CAST(150000 AS Decimal(18, 0)), N'Tranh cảnh biển', N'/Data/Images/banner/tranh-treo-tuong-phong-canh-non-nuoc-25084.jpg', 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [ProductCode], [Price], [ProductName], [ImageProduct], [Quantity], [Status]) VALUES (17, 8, 4, N'SP01', CAST(80000 AS Decimal(18, 0)), N'Ghế Tre', N'/Data/Images/SanPham/ghetre.jpg', 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [ProductCode], [Price], [ProductName], [ImageProduct], [Quantity], [Status]) VALUES (18, 8, 7, N'SP08', CAST(80000 AS Decimal(18, 0)), N'Ghế sofa gỗ', N'/Data/Images/SanPham/Ghe-sofa-go-don.jpg', 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [ProductCode], [Price], [ProductName], [ImageProduct], [Quantity], [Status]) VALUES (19, 9, 12, N'SP022', CAST(40000 AS Decimal(18, 0)), N'Thảm  hoa', N'/Data/Images/banner/tham-lot-san-nha-cao-cap%20(3).jpg', 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [ProductCode], [Price], [ProductName], [ImageProduct], [Quantity], [Status]) VALUES (20, 9, 13, N'SP024', CAST(70000 AS Decimal(18, 0)), N'Thảm tròn', N'/Data/Images/banner/tham-tron-2m-bong-hoa-3.jpg', 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [ProductCode], [Price], [ProductName], [ImageProduct], [Quantity], [Status]) VALUES (21, 10, 21, N'SP039', CAST(150000 AS Decimal(18, 0)), N'Tranh cảnh biển', N'/Data/Images/banner/tranh-treo-tuong-phong-canh-non-nuoc-25084.jpg', 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [ProductCode], [Price], [ProductName], [ImageProduct], [Quantity], [Status]) VALUES (22, 10, 22, N'SP040', CAST(160000 AS Decimal(18, 0)), N'Tranh cảnh hồ', N'/Data/Images/banner/tranh-treo-tuong-phong-canh-thien-nhien-25092.jpg', 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [ProductCode], [Price], [ProductName], [ImageProduct], [Quantity], [Status]) VALUES (25, 12, 25, N'SP055', CAST(190000 AS Decimal(18, 0)), N'Tủ khách', N'/Data/Images/SanPham/tu-ke-trang-tri-phong-khach-2927.jpg', 3, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [ProductCode], [Price], [ProductName], [ImageProduct], [Quantity], [Status]) VALUES (26, 12, 24, N'SP046', CAST(180000 AS Decimal(18, 0)), N'Tủ trưng bày', N'/Data/Images/SanPham/phong_khach_ksg268.jpg', 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [ProductCode], [Price], [ProductName], [ImageProduct], [Quantity], [Status]) VALUES (27, 13, 15, N'SP034', CAST(80000 AS Decimal(18, 0)), N'Bàn gỗ', N'/Data/Images/banner/ban-go-van-phong.jpg', 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [ProductCode], [Price], [ProductName], [ImageProduct], [Quantity], [Status]) VALUES (28, 14, 24, N'SP046', CAST(180000 AS Decimal(18, 0)), N'Tủ trưng bày', N'/Data/Images/SanPham/phong_khach_ksg268.jpg', 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [ProductCode], [Price], [ProductName], [ImageProduct], [Quantity], [Status]) VALUES (29, 14, 23, N'SP087', CAST(120000 AS Decimal(18, 0)), N'Đồng hồ TT', N'/Data/Images/SanPham/dongho.jpg', 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [ProductCode], [Price], [ProductName], [ImageProduct], [Quantity], [Status]) VALUES (30, 15, 22, N'SP040', CAST(160000 AS Decimal(18, 0)), N'Tranh cảnh hồ', N'/Data/Images/banner/tranh-treo-tuong-phong-canh-thien-nhien-25092.jpg', 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [ProductCode], [Price], [ProductName], [ImageProduct], [Quantity], [Status]) VALUES (31, 15, 21, N'SP039', CAST(150000 AS Decimal(18, 0)), N'Tranh cảnh biển', N'/Data/Images/banner/tranh-treo-tuong-phong-canh-non-nuoc-25084.jpg', 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [ProductCode], [Price], [ProductName], [ImageProduct], [Quantity], [Status]) VALUES (32, 16, 25, N'SP055', CAST(190000 AS Decimal(18, 0)), N'Tủ khách', N'/Data/Images/SanPham/tu-ke-trang-tri-phong-khach-2927.jpg', 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [ProductCode], [Price], [ProductName], [ImageProduct], [Quantity], [Status]) VALUES (33, 16, 13, N'SP024', CAST(70000 AS Decimal(18, 0)), N'Thảm tròn', N'/Data/Images/banner/tham-tron-2m-bong-hoa-3.jpg', 1, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [ProductCode], [Price], [ProductName], [ImageProduct], [Quantity], [Status]) VALUES (34, 16, 7, N'SP08', CAST(80000 AS Decimal(18, 0)), N'Ghế sofa gỗ', N'/Data/Images/SanPham/Ghe-sofa-go-don.jpg', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([ID], [Code], [OrderDate], [Status], [EmployeeName], [CustomerName], [CustomerID], [Ship], [AddressShip], [TotalAmount], [TypePayment], [Note]) VALUES (2, N'OD20250101110207', CAST(N'2025-01-01T11:02:07.170' AS DateTime), 3, N'admin', NULL, 4, CAST(0 AS Decimal(18, 0)), N'Khánh Hòa', CAST(580000 AS Decimal(18, 0)), 1, N'')
GO
INSERT [dbo].[Orders] ([ID], [Code], [OrderDate], [Status], [EmployeeName], [CustomerName], [CustomerID], [Ship], [AddressShip], [TotalAmount], [TypePayment], [Note]) VALUES (3, N'OD20250101113742', CAST(N'2025-01-01T11:37:42.540' AS DateTime), 1, NULL, NULL, 4, CAST(0 AS Decimal(18, 0)), N'Khánh Hòa', CAST(150000 AS Decimal(18, 0)), 2, N'')
GO
INSERT [dbo].[Orders] ([ID], [Code], [OrderDate], [Status], [EmployeeName], [CustomerName], [CustomerID], [Ship], [AddressShip], [TotalAmount], [TypePayment], [Note]) VALUES (5, N'DH0453', CAST(N'2025-01-01T15:13:20.580' AS DateTime), 3, N'admin', NULL, 4, CAST(0 AS Decimal(18, 0)), N'Khánh Hòa', CAST(280000 AS Decimal(18, 0)), 1, N'')
GO
INSERT [dbo].[Orders] ([ID], [Code], [OrderDate], [Status], [EmployeeName], [CustomerName], [CustomerID], [Ship], [AddressShip], [TotalAmount], [TypePayment], [Note]) VALUES (6, N'DH9645', CAST(N'2025-01-01T15:15:08.690' AS DateTime), 3, N'admin', NULL, 4, CAST(0 AS Decimal(18, 0)), N'Khánh Hòa', CAST(280000 AS Decimal(18, 0)), 1, N'')
GO
INSERT [dbo].[Orders] ([ID], [Code], [OrderDate], [Status], [EmployeeName], [CustomerName], [CustomerID], [Ship], [AddressShip], [TotalAmount], [TypePayment], [Note]) VALUES (7, N'DH5570', CAST(N'2025-01-01T15:19:19.670' AS DateTime), 1, NULL, NULL, 4, CAST(0 AS Decimal(18, 0)), N'Khánh Hòa', CAST(470000 AS Decimal(18, 0)), 1, N'')
GO
INSERT [dbo].[Orders] ([ID], [Code], [OrderDate], [Status], [EmployeeName], [CustomerName], [CustomerID], [Ship], [AddressShip], [TotalAmount], [TypePayment], [Note]) VALUES (8, N'DH6780', CAST(N'2025-04-01T15:24:21.067' AS DateTime), 1, N'admin', NULL, 4, CAST(0 AS Decimal(18, 0)), N'Khánh Hòa', CAST(160000 AS Decimal(18, 0)), 1, N'')
GO
INSERT [dbo].[Orders] ([ID], [Code], [OrderDate], [Status], [EmployeeName], [CustomerName], [CustomerID], [Ship], [AddressShip], [TotalAmount], [TypePayment], [Note]) VALUES (9, N'DH6917', CAST(N'2025-01-01T15:32:03.127' AS DateTime), 1, NULL, NULL, 4, CAST(0 AS Decimal(18, 0)), N'Khánh Hòa', CAST(110000 AS Decimal(18, 0)), 1, N'')
GO
INSERT [dbo].[Orders] ([ID], [Code], [OrderDate], [Status], [EmployeeName], [CustomerName], [CustomerID], [Ship], [AddressShip], [TotalAmount], [TypePayment], [Note]) VALUES (10, N'DH7251', CAST(N'2025-01-01T15:38:10.853' AS DateTime), 3, N'admin', NULL, 1, CAST(0 AS Decimal(18, 0)), N'Khánh Hòa', CAST(310000 AS Decimal(18, 0)), 1, N'')
GO
INSERT [dbo].[Orders] ([ID], [Code], [OrderDate], [Status], [EmployeeName], [CustomerName], [CustomerID], [Ship], [AddressShip], [TotalAmount], [TypePayment], [Note]) VALUES (12, N'DH4988', CAST(N'2025-04-02T05:59:01.153' AS DateTime), 3, NULL, N'Nguyễn Minh Thọ', 4, CAST(0 AS Decimal(18, 0)), N'Khánh Hòa', CAST(750000 AS Decimal(18, 0)), 1, N'')
GO
INSERT [dbo].[Orders] ([ID], [Code], [OrderDate], [Status], [EmployeeName], [CustomerName], [CustomerID], [Ship], [AddressShip], [TotalAmount], [TypePayment], [Note]) VALUES (13, N'DH4205', CAST(N'2025-03-02T15:48:55.407' AS DateTime), 3, NULL, N'Nguyen Minh Tai', 2, CAST(0 AS Decimal(18, 0)), N'Khánh Hòa', CAST(80000 AS Decimal(18, 0)), 1, N'')
GO
INSERT [dbo].[Orders] ([ID], [Code], [OrderDate], [Status], [EmployeeName], [CustomerName], [CustomerID], [Ship], [AddressShip], [TotalAmount], [TypePayment], [Note]) VALUES (14, N'DH8074', CAST(N'2025-02-05T13:31:36.450' AS DateTime), 3, NULL, N'Nguyễn Minh', 6, CAST(0 AS Decimal(18, 0)), N'Nguyễn', CAST(300000 AS Decimal(18, 0)), 1, N'')
GO
INSERT [dbo].[Orders] ([ID], [Code], [OrderDate], [Status], [EmployeeName], [CustomerName], [CustomerID], [Ship], [AddressShip], [TotalAmount], [TypePayment], [Note]) VALUES (15, N'DH0876', CAST(N'2025-05-05T13:37:14.937' AS DateTime), 3, N'employee', N'Nguyễn Minh', 6, CAST(5000 AS Decimal(18, 0)), N'Hue', CAST(315000 AS Decimal(18, 0)), 1, N'')
GO
INSERT [dbo].[Orders] ([ID], [Code], [OrderDate], [Status], [EmployeeName], [CustomerName], [CustomerID], [Ship], [AddressShip], [TotalAmount], [TypePayment], [Note]) VALUES (16, N'DH9595', CAST(N'2025-01-06T13:03:38.953' AS DateTime), 3, N'admin', N'Nguyễn Minh', 6, CAST(0 AS Decimal(18, 0)), N'Khánh Hòa', CAST(340000 AS Decimal(18, 0)), 1, N'')
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 
GO
INSERT [dbo].[Post] ([ID], [Name], [SeoTitle], [Status], [Image], [Description], [Detail], [ViewCount], [CatePostID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (1, N'Chương trình khuyến mãi nội thất hấp dẫn tại Index Living Mall', N'chuong-trinh-khuyen-mai-noi-that-hap-dan-tai-index-living-mall', 1, N'/Data/Images/blog/_1200x500_mb_2.jpg', N'Việc tìm kiếm Chương trình khuyến mãi nội thất nhằm tiết kiệm tối đa chi phí tân trang nhà cửa là điều mà rất nhiều người mong muốn. ', N'<h2>Tại sao bạn n&ecirc;n quan t&acirc;m đến chương tr&igrave;nh khuyến m&atilde;i nội thất?</h2>

<p>Trong việc t&acirc;n trang nh&agrave; cửa, chi ph&iacute; lu&ocirc;n l&agrave; một trở ngại lớn đối với hầu hết ch&uacute;ng ta. Tuy nhi&ecirc;n, việc t&igrave;m kiếm chương tr&igrave;nh khuyến m&atilde;i nội thất c&oacute; thể gi&uacute;p bạn tiết kiệm đ&aacute;ng kể v&agrave; c&ograve;n c&oacute; thể nhận được những sản phẩm chất lượng tốt nhất.</p>

<p>Kh&ocirc;ng chỉ tiết kiệm chi ph&iacute;, chương tr&igrave;nh khuyến m&atilde;i nội thất c&ograve;n cung cấp cho bạn cơ hội để trải nghiệm những sản phẩm mới nhất v&agrave; độc đ&aacute;o nhất trong lĩnh vực nội thất. Đ&oacute; l&agrave; l&yacute; do tại sao bạn n&ecirc;n quan t&acirc;m đến chương tr&igrave;nh khuyến m&atilde;i nội thất v&agrave; t&igrave;m hiểu th&ecirc;m về những ưu đ&atilde;i đang được cung cấp cho kh&aacute;ch h&agrave;ng.</p>

<p>Bạn sẽ kh&ocirc;ng muốn bỏ lỡ cơ hội để cải thiện vẻ đẹp của nh&agrave; cửa m&igrave;nh với chi ph&iacute; tối ưu, đồng thời c&ograve;n c&oacute; thể trải nghiệm những sản phẩm chất lượng cao với gi&aacute; cả hấp dẫn. Nhanh tay t&igrave;m hiểu về chương tr&igrave;nh khuyến m&atilde;i nội thất hiện tại v&agrave; trải nghiệm những ưu đ&atilde;i tuyệt vời n&agrave;y ngay h&ocirc;m nay!</p>

<p><img alt="Tại sao bạn nên quan tâm đến chương trình khuyến mãi nội thất?" src="https://indexlivingmallvn.com/media/wysiwyg/dxh.2.jpg" width="500" /></p>

<h2>Tại sao bạn n&ecirc;n chọn chương tr&igrave;nh khuyến m&atilde;i nội thất của Index Living Mall</h2>

<p>Đầu ti&ecirc;n, chương tr&igrave;nh khuyến m&atilde;i của ch&uacute;ng t&ocirc;i cung cấp cho bạn gi&aacute; cả hấp dẫn nhất tr&ecirc;n thị trường. Bạn sẽ c&oacute; cơ hội để trang tr&iacute; nh&agrave; cửa m&igrave;nh m&agrave; kh&ocirc;ng phải lo về chi ph&iacute;.</p>

<p>Thứ hai, ch&uacute;ng t&ocirc;i lu&ocirc;n cập nhật những sản phẩm nội thất mới nhất v&agrave; đẹp nhất tr&ecirc;n thị trường. Với chương tr&igrave;nh khuyến m&atilde;i của ch&uacute;ng t&ocirc;i, bạn sẽ c&oacute; cơ hội để tận hưởng những sản phẩm độc đ&aacute;o v&agrave; đỉnh cao của c&ocirc;ng nghệ.</p>

<p>Cuối c&ugrave;ng, ch&uacute;ng t&ocirc;i cung cấp dịch vụ tận t&igrave;nh v&agrave; chuy&ecirc;n nghiệp, gi&uacute;p bạn trải nghiệm mua sắm nội thất tuyệt vời nhất. Ch&uacute;ng t&ocirc;i sẽ gi&uacute;p bạn t&igrave;m kiếm sản phẩm ph&ugrave; hợp với nhu cầu v&agrave; phong c&aacute;ch của bạn.</p>

<p><img alt="Tại sao bạn nên chọn chương trình khuyến mãi nội thất của Index Living Mall" src="https://indexlivingmallvn.com/media/wysiwyg/dxh.3.jpg" width="500" /></p>

<h2>C&aacute;ch nhận lợi &iacute;ch&nbsp;từ chương tr&igrave;nh khuyến m&atilde;i nội thất</h2>

<p>+ H&atilde;y đăng k&yacute; ngay để trở th&agrave;nh một trong những kh&aacute;ch h&agrave;ng may mắn nhận được ưu đ&atilde;i trong c&aacute;c thời điểm của chương tr&igrave;nh khuyến m&atilde;i.</p>

<p>+ Điều kiện v&agrave; y&ecirc;u cầu để được tận hưởng chương tr&igrave;nh khuyến m&atilde;i, ch&uacute;ng t&ocirc;i đảm bảo rằng tất cả mọi người c&oacute; thể dễ d&agrave;ng tham gia.</p>

<p>+ Hướng dẫn chi tiết để gi&uacute;p bạn tối ưu h&oacute;a lợi &iacute;ch từ chương tr&igrave;nh khuyến m&atilde;i nội thất của Index Living Mall. Từ đăng k&yacute; đến việc mua sắm, ch&uacute;ng t&ocirc;i sẽ hỗ trợ bạn mỗi bước của qu&aacute; tr&igrave;nh.</p>

<p>Cảm ơn bạn đ&atilde; theo d&otilde;i b&agrave;i viết n&agrave;y, mong rằng bạn sẽ một kh&aacute;ch h&agrave;ng may mắn tại của Index Living Mall trong thời gian sắp tới. Li&ecirc;n hệ với ch&uacute;ng t&ocirc;i theo c&aacute;c th&ocirc;ng tin dưới đ&acirc;y nếu c&oacute; những thắc mắc li&ecirc;n quan:</p>

<p>__________________</p>

<p>Địa chỉ cửa h&agrave;ng:</p>

<p><strong>INDEX LIVING MALL - QUẬN 2:</strong>&nbsp;29-30 Song H&agrave;nh, Phường An Ph&uacute; ,Quận 2</p>

<p><strong>INDEX LIVING MALL - QUẬN 9:</strong>&nbsp;691 Đỗ Xu&acirc;n Hợp, Phường Phước Long B, Quận 9</p>

<p>__________________</p>

<p>Th&ocirc;ng tin li&ecirc;n hệ:</p>

<p><strong>* Zalo:&nbsp;<a href="https://zalo.me/2935571879636821961" rel="noopener" target="_blank" title="Zalo Index Living Mall">0967769300</a></strong></p>

<p><strong>* Facebook:&nbsp;<a href="https://www.messenger.com/t/103434507822625" rel="noopener" target="_blank" title="Messenger Index Living Mall">Index Living Mall Vietnam</a></strong></p>

<p><strong>*&nbsp;Hotline:<a href="tel:+841900636096" rel="noopener" target="_blank">1900 63 60 96</a></strong></p>

<p><strong>*&nbsp;Email:<a href="mailto:mail:cskh@vifurniture.com.vn">cskh@vifurniture.com.vn</a></strong></p>
', 3, 1, N'minh', N'Tai', N'admin', CAST(N'2024-12-26T10:55:32.080' AS DateTime), N'admin', CAST(N'2025-01-06T15:29:04.373' AS DateTime))
GO
INSERT [dbo].[Post] ([ID], [Name], [SeoTitle], [Status], [Image], [Description], [Detail], [ViewCount], [CatePostID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (2, N'TỔNG HỢP CÁC TRIỂN LÃM NGÀNH GỖ/ NỘI THẤT TẠI VIỆT NAM', N'tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam', 1, N'/Data/Images/blog/tin%20tuc.jpg', N'Tại Việt Nam, ngành gỗ/nội thất là ngành công nghiệp vô cùng tiềm năng và có những bước phát triển mạnh mẽ. ', N'<p>Mỗi triển l&atilde;m sẽ c&oacute; những chủ đề thế mạnh ri&ecirc;ng, h&atilde;y dựa v&agrave;o những chủ đề của hội chợ triển l&atilde;m v&agrave; chiến lược mục ti&ecirc;u của doanh nghiệp để lựa chọn đ&uacute;ng triển l&atilde;m ph&ugrave; hợp nhất v&agrave; đăng k&yacute; tham dự.&nbsp;</p>

<p>H&atilde;y c&ugrave;ng SDragon t&igrave;m hiểu s&acirc;u hơn về c&aacute;c triển l&atilde;m ng&agrave;nh gỗ/nội thất nổi bật nhất trong thời gian gần đ&acirc;y:</p>

<h3><strong>1.&nbsp;<a href="https://sdragon.com.vn/thiet-ke-thi-cong-gian-hang-trien-lam-vietbuild-ha-noi-lan-3/">Triển l&atilde;m VietBuild</a></strong></h3>

<p><strong>Triển l&atilde;m Vietbuild</strong>&nbsp;ng&agrave;y hội truyền thống, sự kiện lớn nhất tại Việt Nam trong ng&agrave;nh x&acirc;y dựng, bất động sản, vật liệu x&acirc;y dựng v&agrave;&nbsp;<em>trang tr&iacute; nội thất</em>. Triển l&atilde;m Vietbuild được tổ chức li&ecirc;n tục (khoảng 10 k&igrave; triển l&atilde;m trong một năm).</p>

<p>Vietbuild c&oacute; quy m&ocirc; lớn c&ugrave;ng với chủ đề rộng về bất động sản, x&acirc;y dựng v&agrave; trang tr&iacute; nội thất.. ch&iacute;nh v&igrave; thế triển l&atilde;m lu&ocirc;n thu h&uacute;t đ&ocirc;ng đảo sự tham gia của nhiều doanh nghiệp với nhiều loại h&igrave;nh kinh doanh kh&aacute;c nhau.</p>

<p>Triển l&atilde;m VietBuild lu&ocirc;n thu h&uacute;t rất nhiều kh&aacute;ch h&agrave;ng đến tham quan, tham dự triển l&atilde;m, th&iacute;ch hợp để th&uacute;c đẩy kinh doanh, tạo doanh số lớn, ph&aacute;t triển thương hiệu vươn tầm quốc tế.&nbsp;</p>

<p><img alt="thiết kế gian hàng triển lãm ngành gỗ nội thất" aria-describedby="caption-attachment-14771" height="600" sizes="(max-width: 800px) 100vw, 800px" src="https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-1-300x225.jpg" srcset="https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-1-300x225.jpg 300w, https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-1-768x576.jpg 768w, https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-1-1024x768.jpg 1024w, https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-1-600x450.jpg 600w, https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-1.jpg 1280w" title="thiết kế gian hàng triển lãm ngành gỗ nội thất" width="800" /></p>

<p id="caption-attachment-14771">Gian h&agrave;ng KimTin tại triển l&atilde;m VietBuild &ndash; thiết kế thi c&ocirc;ng trọn g&oacute;i bởi SDragon</p>

<blockquote>
<p><strong>&gt;&gt;&nbsp;<a href="https://sdragon.com.vn/cach-lua-chon-trien-lam-hoi-cho-thuong-mai-phu-hop-voi-doanh-nghiep/">C&aacute;ch lựa chọn triển l&atilde;m hội chợ thương mại ph&ugrave; hợp với doanh nghiệp</a></strong></p>

<p><strong>&gt;&gt;&nbsp;<a href="https://sdragon.com.vn/mau-thiet-ke-gian-hang-trung-bay-san-pham-an-tuong/">Mẫu Thiết Kế Gian H&agrave;ng Trưng B&agrave;y Sản Phẩm Ấn Tượng</a></strong></p>
</blockquote>

<h3><strong>2.&nbsp;<a href="https://sdragon.com.vn/vifa-expo-2020-tu-van-thiet-ke-thi-cong-gian-hang-trien-lam/">Triển l&atilde;m Vifa Expo</a></strong></h3>

<p>Triển l&atilde;m Vifa Expo &ndash; triển l&atilde;m đồ gỗ v&agrave; thủ c&ocirc;ng mỹ nghệ. C&aacute;c sản phẩm được trưng b&agrave;y chủ yếu tại triển l&atilde;m l&agrave; c&aacute;c vật&nbsp;<em>dụng trang tr&iacute; decor, c&aacute;c mặt h&agrave;ng thủ c&ocirc;ng mỹ nghệ</em>&nbsp;v&agrave; sơn m&agrave;i, c&aacute;c sản phẩm nội thất trong nh&agrave; v&agrave; c&aacute;c dịch vụ kiến tr&uacute;c&hellip;</p>

<p>Vifa Expo 2019 c&oacute; quy m&ocirc; l&ecirc;n đến 35000 m2, hơn 2000 gian h&agrave;ng tham dự trưng b&agrave;y sản phẩm.</p>

<p><img alt="triển lãm đồ gỗ nội thất " aria-describedby="caption-attachment-14772" height="530" loading="lazy" sizes="(max-width: 800px) 100vw, 800px" src="https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-2-300x199.jpg" srcset="https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-2-300x199.jpg 300w, https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-2-768x509.jpg 768w, https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-2-600x398.jpg 600w, https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-2.jpg 806w" width="800" /></p>

<p id="caption-attachment-14772">Triển l&atilde;m Vifa Expo &ndash; nơi so t&agrave;i về thiết kế gian h&agrave;ng cũng như trưng b&agrave;y c&aacute;c sản phẩm trang tr&iacute; nội thất của xu hướng.</p>

<h3><strong>3. Triển l&atilde;m Vifa Gu &ndash; triển l&atilde;m nội thất phong c&aacute;ch sống</strong></h3>

<p><strong>Vifa Gu</strong>&nbsp;&ndash; triển l&atilde;m về phong c&aacute;ch sống đầu ti&ecirc;n tại Việt Nam, triển l&atilde;m cập nhật khuynh hướng ti&ecirc;u d&ugrave;ng nội thất to&agrave;n diện v&agrave; mang đến những giải ph&aacute;p cho kh&ocirc;ng gian nội thất.</p>

<p>Năm 2019, triển l&atilde;m Vifa Gu lần đầu tổ chức tại Việt Nam, tuy l&agrave; lần đầu ti&ecirc;n những triển l&atilde;m đ&atilde; thu h&uacute;t sự tham gia của hơn 650 gian h&agrave;ng trong đ&oacute; 50% l&agrave; c&aacute;c gian h&agrave;ng đồ nội thất, sản phẩm trang tr&iacute; kh&ocirc;ng gian sống.</p>

<table>
	<tbody>
		<tr>
			<td><img alt="thiết kế gian hàng triển lãm ngành gỗ nội thất" height="600" loading="lazy" sizes="(max-width: 800px) 100vw, 800px" src="https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-3-300x225.jpg" srcset="https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-3-300x225.jpg 300w, https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-3-768x576.jpg 768w, https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-3-600x450.jpg 600w, https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-3.jpg 806w" width="800" /></td>
			<td><img alt="thiết kế gian hàng triển lãm ngành gỗ nội thất" height="600" loading="lazy" sizes="(max-width: 800px) 100vw, 800px" src="https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-4-300x225.jpg" srcset="https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-4-300x225.jpg 300w, https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-4-768x576.jpg 768w, https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-4-600x450.jpg 600w, https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-4.jpg 806w" width="800" /></td>
		</tr>
	</tbody>
</table>

<p><em>Gian h&agrave;ng Zago &ndash; doanh nghiệp h&agrave;ng đầu về nội thất v&agrave; trang tr&iacute; kh&ocirc;ng gian sống</em></p>

<h3><strong>4.&nbsp;<a href="https://sdragon.com.vn/vifa-home-2019-nha-thau-thi-cong-tron-goi-gia-tot/">Triển l&atilde;m Vifa Home</a></strong></h3>

<p><strong>Triển l&atilde;m Vifa Home</strong>&nbsp;&ndash; Hội chợ đồ gỗ v&agrave; trang tr&iacute; nội thất Việt Nam trưng b&agrave;y c&aacute;c sản phẩm về nội thất nh&agrave; ở, văn ph&ograve;ng, nh&agrave; h&agrave;ng, resort, trường học&hellip; ngoại thất v&agrave; c&aacute;c đồ d&ugrave;ng trong gia đ&igrave;nh, đồ trang tr&iacute; v&agrave; dịch vụ</p>

<p>Với chặng đường 10 năm ph&aacute;t triển, Vifa Home ng&agrave;y c&agrave;ng c&oacute; sự ph&aacute;t triển về quy m&ocirc; v&agrave; chất lượng, thu h&uacute;t nhiều doanh nghiệp nước ngo&agrave;i đăng k&yacute; tham dự c&ugrave;ng nhiều doanh nghiệp đầu ng&agrave;nh trong nước.</p>

<p>Triển l&atilde;m mang đến nhiều cơ hội th&uacute;c đẩy doanh số mạnh mẽ, ph&aacute;t triển thương hiệu vươn ra hơn v&agrave; mang sản phẩm dịch vụ doanh nghiệp đến gần hơn với đối tượng kh&aacute;ch h&agrave;ng tiềm năng.&nbsp;</p>

<p><img alt="thiết kế gian hàng triển lãm gỗ nội thất" aria-describedby="caption-attachment-14775" height="533" loading="lazy" sizes="(max-width: 800px) 100vw, 800px" src="https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-5-300x200.jpg" srcset="https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-5-300x200.jpg 300w, https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-5-768x512.jpg 768w, https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-5-600x400.jpg 600w, https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-5.jpg 815w" title="thiết kế gian hàng triển lãm gỗ nội thất" width="800" /></p>

<p id="caption-attachment-14775">Thiết kế v&agrave; thi c&ocirc;ng trọn g&oacute;i tại SDragon</p>

<h3><strong>5.&nbsp;<a href="https://sdragon.com.vn/vietnamwood-furnitec-2019-trien-lam-quoc-te-lan-thu-12-ve-may-moc-thiet-bi-chuyen-nganh-che-bien-go/">Triển l&atilde;m Vietnamwood &amp; furnitec</a></strong></h3>

<p><strong>Triển l&atilde;m Vietnamwood &amp; furnitec</strong>&nbsp;&ndash; Triển l&atilde;m về m&aacute;y m&oacute;c thiết bị chuy&ecirc;n ng&agrave;nh chế biến gỗ. Đ&acirc;y l&agrave; triển l&atilde;m về ng&agrave;nh gỗ lớn nhất Việt Nam trưng b&agrave;y c&aacute;c thiết bị c&ocirc;ng nghiệp chế biến gỗ.</p>

<p>Với quy m&ocirc; lớn v&agrave; tiếng tăm triển l&atilde;m ng&agrave;y c&agrave;ng thu h&uacute;t nhiều doanh nghiệp lớn tham dự mang đến nhiều cơ hội tiềm năng cho c&aacute;c doanh nghiệp trong nước.</p>

<p><img alt="thiết kế gian hàng triển lãm gỗ nội thất " aria-describedby="caption-attachment-14776" height="600" loading="lazy" sizes="(max-width: 800px) 100vw, 800px" src="https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-6-300x225.jpg" srcset="https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-6-300x225.jpg 300w, https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-6-768x576.jpg 768w, https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-6-600x450.jpg 600w, https://sdragon.com.vn/wp-content/uploads/2019/10/tong-hop-cac-trien-lam-nganh-go-noi-that-tai-viet-nam-6.jpg 870w" width="800" /></p>

<p id="caption-attachment-14776">Gian h&agrave;ng triển l&atilde;m trưng b&agrave;y c&aacute;c sản phẩm m&aacute;y m&oacute;c ng&agrave;nh chế biến gỗ tham dự triển l&atilde;m Vietnamwood</p>

<p>Tr&ecirc;n đ&acirc;y l&agrave; những triển l&atilde;m ti&ecirc;u biểu về ng&agrave;nh gỗ nội thất lớn nhất trong nước, mỗi triển l&atilde;m lại c&oacute; những thế mạnh ri&ecirc;ng, h&atilde;y lựa chọn triển l&atilde;m ph&ugrave; hợp nhất để c&oacute; thể mang đến nhiều cơ hội cũng như th&agrave;nh c&ocirc;ng cho doanh nghiệp.&nbsp;</p>
', 1, 2, N'minhtai', N'123', N'admin', CAST(N'2024-12-26T11:10:01.887' AS DateTime), N'admin', CAST(N'2025-01-06T15:41:20.530' AS DateTime))
GO
INSERT [dbo].[Post] ([ID], [Name], [SeoTitle], [Status], [Image], [Description], [Detail], [ViewCount], [CatePostID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (3, N'Xây nhà gạch nung để gợi nhớ về quê hương đất đỏ bazan', N'xay-nha-gach-nung-de-goi-nho-ve-que-huong-dat-do-bazan', 1, N'/Data/Images/blog/tin-tuc.jpg', N'TP HCM-Sự kết hợp của gạch nung tạo ra hình ảnh mô phỏng tầng đất bazan trên mặt đứng công trình, gợi nhắc về quê hương của gia chủ.', N'<p>Ng&ocirc;i nh&agrave; phố c&oacute; quy m&ocirc; 4 tầng, diện t&iacute;ch x&acirc;y dựng 219 m2, tọa lạc tại B&igrave;nh Thạnh (TP HCM).</p>

<p>C&ocirc;ng tr&igrave;nh được thiết kế dựa tr&ecirc;n h&igrave;nh ảnh đất đỏ bazan, những lớp đất gắn liền với Đồng Nai - qu&ecirc; hương của gia chủ. Từ ngoại thất đến nội thất đều nổi bật bởi vẻ đẹp tối giản, tone m&agrave;u n&oacute;ng chủ đạo.</p>

<p>Trong đ&oacute;, sự kết hợp của vật liệu gạch nung tạo ra h&igrave;nh ảnh m&ocirc; phỏng tầng đất bazan tr&ecirc;n mặt đứng c&ocirc;ng tr&igrave;nh. Gạch nung v&agrave; đất đỏ bazan c&oacute; c&ugrave;ng bản chất. V&igrave; vậy, nh&oacute;m KTS đ&atilde; sử dụng gạch đất nung để thể hiện &yacute; tưởng đất đỏ bazan.</p>

<p><img alt="" data-ll-status="loaded" data-src="https://i1-vnexpress.vnecdn.net/2024/12/16/353837466-236208085824343-4608084141171772203-n-1734336877.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=6OYo1xCdOZ7KSbu_R--NfQ" intrinsicsize="1200x0" itemprop="contentUrl" loading="lazy" src="https://i1-vnexpress.vnecdn.net/2024/12/16/353837466-236208085824343-4608084141171772203-n-1734336877.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=6OYo1xCdOZ7KSbu_R--NfQ" /></p>

<p>To&agrave;n bộ mặt tiền được ốp gạch thẻ mosaic để tạo điểm nhấn, kết hợp v&aacute;ch k&iacute;nh để tối ưu tầm nh&igrave;n v&agrave; &aacute;nh s&aacute;ng tự nhi&ecirc;n.</p>

<p><img alt="" data-ll-status="loaded" data-src="https://i1-vnexpress.vnecdn.net/2024/12/16/Thinh9246-1734335231.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=U_VbF-c9zT-odXazLuoAZw" intrinsicsize="1200x0" itemprop="contentUrl" loading="lazy" src="https://i1-vnexpress.vnecdn.net/2024/12/16/Thinh9246-1734335231.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=U_VbF-c9zT-odXazLuoAZw" /></p>

<p>Về th&ocirc;ng gi&oacute;, nh&oacute;m thiết kế chủ trương đưa d&ograve;ng kh&ocirc;ng kh&iacute; đối lưu tối đa x&acirc;m nhập v&agrave;o c&ocirc;ng tr&igrave;nh. L&otilde;i thang được thiết kế m&aacute;i k&iacute;nh, nhận trực tiếp bức xạ mặt trời nung n&oacute;ng phần kh&ocirc;ng kh&iacute; ở dưới, kết hợp với khe mở sẽ gi&uacute;p lượng kh&iacute; n&oacute;ng n&agrave;y tho&aacute;t ra ngo&agrave;i. Khi lượng kh&ocirc;ng kh&iacute; n&agrave;y tho&aacute;t ra ngo&agrave;i sẽ g&acirc;y giảm &aacute;p suất khu vực l&otilde;i thang, một phần kh&ocirc;ng kh&iacute; ở dưới sẽ được lấy l&ecirc;n để b&ugrave; v&agrave;o phần vừa mất đi. Qu&aacute; tr&igrave;nh n&agrave;y xảy ra li&ecirc;n tục theo một v&ograve;ng tuần ho&agrave;n đối lưu, r&uacute;t to&agrave;n bộ lượng kh&ocirc;ng kh&iacute; ở c&aacute;c tầng dưới l&ecirc;n tr&ecirc;n v&agrave; tho&aacute;t ra ngo&agrave;i, gi&uacute;p c&aacute;c kh&ocirc;ng gian sử dụng lu&ocirc;n c&oacute; kh&ocirc;ng kh&iacute; tươi</p>

<p>Tuy nhi&ecirc;n, khu vực n&oacute;c l&otilde;i thang rất n&oacute;ng, song đ&acirc;y l&agrave; khu vực kh&ocirc;ng c&oacute; người sử dụng.</p>

<p><img alt="" data-ll-status="loaded" data-src="https://i1-vnexpress.vnecdn.net/2024/12/16/MC-1734335232.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=WOvVCghJx85pvMyd7VrdZQ" intrinsicsize="1200x0" itemprop="contentUrl" loading="lazy" src="https://i1-vnexpress.vnecdn.net/2024/12/16/MC-1734335232.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=WOvVCghJx85pvMyd7VrdZQ" /></p>

<p>Mặt cắt c&ocirc;ng tr&igrave;nh.</p>

<p><img alt="" data-ll-status="loaded" data-src="https://i1-vnexpress.vnecdn.net/2024/12/16/Thinh2906-1734335233.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=0KXxaC-2Xvb4eYvQZ2qGDg" intrinsicsize="1200x0" itemprop="contentUrl" loading="lazy" src="https://i1-vnexpress.vnecdn.net/2024/12/16/Thinh2906-1734335233.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=0KXxaC-2Xvb4eYvQZ2qGDg" /></p>

<p>Một khoảng s&acirc;n rộng một m&eacute;t được bố tr&iacute; ở sau nh&agrave;, vừa đ&aacute;p ứng vai tr&ograve; tho&aacute;t hiểm trong ph&ograve;ng ch&aacute;y chữa ch&aacute;y, vừa đảm bảo luồng gi&oacute; khi đi v&agrave;o cửa trước sẽ h&uacute;t thẳng về ph&iacute;a sau gi&uacute;p kh&ocirc;ng gian trong nh&agrave; lu&ocirc;n m&aacute;t mẻ.</p>

<p><img alt="" data-ll-status="loaded" data-src="https://i1-vnexpress.vnecdn.net/2024/12/16/Thinh4975-1734335234.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=ILscCb9pT6P84wjNcbZ8ew" intrinsicsize="1200x0" itemprop="contentUrl" loading="lazy" src="https://i1-vnexpress.vnecdn.net/2024/12/16/Thinh4975-1734335234.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=ILscCb9pT6P84wjNcbZ8ew" /></p>

<p>M&agrave;u đỏ cam của bazan được kết hợp với t&ocirc;ng trầm tối của tổng thể, c&ugrave;ng với những bề mặt v&agrave; chi tiết kim loại đ&atilde; đẩy to&agrave;n bộ kh&ocirc;ng gian trở n&ecirc;n kh&aacute;c biệt.</p>

<p>Nền nh&agrave; được ốp đ&aacute; bazan, vừa gắn với &yacute; tưởng chung vừa tạo cảm gi&aacute;c rất thật khi người sử dụng đặt ch&acirc;n l&ecirc;n nền nh&agrave; v&agrave; cảm nhận được vật liệu tự nhi&ecirc;n.</p>
', 3, 5, NULL, NULL, N'admin', CAST(N'2024-12-26T12:19:58.390' AS DateTime), N'admin', CAST(N'2025-01-06T15:24:54.523' AS DateTime))
GO
INSERT [dbo].[Post] ([ID], [Name], [SeoTitle], [Status], [Image], [Description], [Detail], [ViewCount], [CatePostID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (6, N'Tập đoàn Austdoor ra mắt tấm tổ ong sinh thái Eracomb', N'tap-doan-austdoor-ra-mat-tam-to-ong-sinh-thai-eracomb', 1, N'/Data/Images/blog/tin-t.png', N'Tấm tổ ong sinh thái Eracomb có trọng lượng nhẹ, không thấm nước, cách nhiệt tốt, phù hợp nhiều không gian kiến trúc từ cổ điển đến hiện đại.', N'<p>Theo đại diện Austdoor, tấm tổ ong sinh th&aacute;i&nbsp;<a href="https://eracomb.vn/" rel="nofollow" target="_blank">Eracomb</a>&nbsp;l&agrave; giải ph&aacute;p vật liệu nội thất c&oacute; thể thay thế c&aacute;c vật liệu truyền thống như gỗ MDF hay nh&ocirc;m k&iacute;nh, với độ bền gấp 3-5 lần so với gỗ MDF trong m&ocirc;i trường độ ẩm cao v&agrave; trọng lượng nhẹ chỉ bằng 50 - 60% so với nh&ocirc;m k&iacute;nh th&ocirc;ng thường. Ngo&agrave;i ra, sản phẩm kh&ocirc;ng thấm nước, chống ch&aacute;y lan, hạn chế mối mọt, cong v&ecirc;nh, c&aacute;ch &acirc;m c&aacute;ch nhiệt hiệu quả, đồng thời c&oacute; thể t&aacute;i chế, th&acirc;n thiện với m&ocirc;i trường.</p>

<figure data-size="true" itemprop="associatedMedia image" itemscope="" itemtype="http://schema.org/ImageObject"><img alt="Cấu tạo tấm tổ ong sinh thái Eracomb." data-ll-status="loaded" data-src="https://i1-kinhdoanh.vnecdn.net/2024/12/30/s1-1735552670-8759-1735552875.png?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=hV58QJ8IgELzjYxe2CbJ7A" intrinsicsize="680x0" itemprop="contentUrl" loading="lazy" src="https://i1-kinhdoanh.vnecdn.net/2024/12/30/s1-1735552670-8759-1735552875.png?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=hV58QJ8IgELzjYxe2CbJ7A" />
<figcaption itemprop="description">
<p>Cấu tạo tấm tổ ong sinh th&aacute;i Eracomb. Ảnh:&nbsp;<em>Tập đo&agrave;n Austdoor</em></p>
</figcaption>
</figure>

<p>Với bảng m&agrave;u phong ph&uacute; v&agrave; thiết kế đa dạng, Eracomb ph&ugrave; hợp với nhiều kh&ocirc;ng gian kiến tr&uacute;c từ cổ điển đến hiện đại. Sản phẩm c&oacute; trọng lượng nhẹ nhưng vẫn đảm bảo khả năng chịu lực tốt, gi&uacute;p giảm tải trọng cho c&ocirc;ng tr&igrave;nh. Nhờ đặc t&iacute;nh n&agrave;y, sản phẩm c&oacute; thể ứng dụng linh hoạt trong nhiều lĩnh vực, từ nội thất, ngoại thất cho đến t&agrave;u thủy, h&agrave;ng kh&ocirc;ng v&agrave; c&aacute;c c&ocirc;ng tr&igrave;nh nh&agrave; xưởng.</p>

<p>Ba d&ograve;ng ch&iacute;nh của Eracomb gồm: carbon mật độ cao, than tre mật độ cao, composite đ&aacute; nhựa. Cấu tr&uacute;c dạng đối xứng qua lớp l&otilde;i nh&ocirc;m tổ ong gi&uacute;p sản phẩm c&oacute; nhiều ưu điểm về cơ l&yacute; t&iacute;nh.</p>

<p>Trong đ&oacute;, carbon mật độ cao (ECA10, ECA18, ECA41 với k&iacute;ch thước 930 x 2440 mm, 1220 x 2440 mm); composite đ&aacute; nhựa ECS18 với k&iacute;ch thước 1220 x 2440 mm; than tre mật độ cao (ECB41, ECB45) với k&iacute;ch thước 930 x 2440 mm, 1220 x 2440 mm. Với sự đa dạng về chủng loại v&agrave; k&iacute;ch thước, sản phẩm th&iacute;ch hợp để l&agrave;m cửa th&ocirc;ng ph&ograve;ng, cửa ch&iacute;nh, v&aacute;ch ngăn, tủ bếp, sản phẩm nội thất v&agrave; ngoại thất, đ&aacute;p ứng mọi nhu cầu sử dụng.</p>

<p>Gần đ&acirc;y, cửa nh&ocirc;m sinh th&aacute;i Eracomb đ&atilde; được Bệnh viện Đa khoa Văn Giang (Hưng Y&ecirc;n) lựa chọn lắp đặt tại khoa Ngoại, g&oacute;p phần n&acirc;ng cao chất lượng c&ocirc;ng tr&igrave;nh v&agrave; tạo ra m&ocirc;i trường l&agrave;m việc an to&agrave;n cho bệnh nh&acirc;n cũng như đội ngũ y tế.</p>

<figure data-size="true" itemprop="associatedMedia image" itemscope="" itemtype="http://schema.org/ImageObject"><img alt="Bệnh viện đa khoa Văn Giang (Hưng Yên) lắp đặt cửa nhôm sinh thái Eracomb" data-ll-status="loaded" data-src="https://i1-kinhdoanh.vnecdn.net/2024/12/30/s2-1735552677-7600-1735552875.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=rD0iwIs4TE6fi_VLHxY2RQ" intrinsicsize="680x0" itemprop="contentUrl" loading="lazy" src="https://i1-kinhdoanh.vnecdn.net/2024/12/30/s2-1735552677-7600-1735552875.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=rD0iwIs4TE6fi_VLHxY2RQ" />
<figcaption itemprop="description">
<p>Bệnh viện đa khoa Văn Giang (Hưng Y&ecirc;n) lắp đặt cửa nh&ocirc;m sinh th&aacute;i Eracomb. Ảnh:&nbsp;<em>Tập đo&agrave;n Austdoor</em></p>
</figcaption>
</figure>

<p>Eracomb sở hữu những bộ sưu tập cửa nh&ocirc;m phong ph&uacute;. Đơn cử, bộ sưu tập Fusionline của Eracomb c&oacute; thiết kế tinh tế, phối gh&eacute;p đa m&agrave;u sắc c&ugrave;ng nẹp chỉ trang tr&iacute;, tạo n&ecirc;n những c&aacute;nh cửa bắt mắt, l&agrave;m s&aacute;ng kh&ocirc;ng gian nội thất. Trong khi đ&oacute;, bộ sưu tập Monoframe của Eracomb mang phong c&aacute;ch tối giản, t&ocirc;n l&ecirc;n vẻ đẹp sang trọng nhờ sự đồng bộ giữa tấm v&agrave; khung cửa. Với bảng m&agrave;u như x&aacute;m đ&aacute;, cafe, căm xe, gỗ trắc, ghi xingfa, c&aacute;t &aacute;nh kim... Monoframe mang đến vẻ đẹp vượt thời gian, dễ d&agrave;ng kết hợp với mọi xu hướng thiết kế.</p>

<figure data-size="true" itemprop="associatedMedia image" itemscope="" itemtype="http://schema.org/ImageObject"><img alt="Mẫu cửa nhôm sinh thái thuộc BST Fusionline của Eracomb." data-ll-status="loaded" data-src="https://i1-kinhdoanh.vnecdn.net/2024/12/30/s3-1735552684-9527-1735552875.png?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=6ATh6M370fUu4a03hyiK6w" intrinsicsize="680x0" itemprop="contentUrl" loading="lazy" src="https://i1-kinhdoanh.vnecdn.net/2024/12/30/s3-1735552684-9527-1735552875.png?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=6ATh6M370fUu4a03hyiK6w" />
<figcaption itemprop="description">
<p>Mẫu cửa nh&ocirc;m sinh th&aacute;i thuộc bộ sưu tập Fusionline của Eracomb. Ảnh:&nbsp;<em>Tập đo&agrave;n Austdoor</em></p>
</figcaption>
</figure>

<p>Theo số liệu từ Li&ecirc;n Hợp Quốc, ng&agrave;nh x&acirc;y dựng hiện chiếm khoảng 39% tổng lượng ph&aacute;t thải CO2 to&agrave;n cầu, đặt ra nhu cầu cấp thiết về việc chuyển đổi sang c&aacute;c loại vật liệu th&acirc;n thiện với m&ocirc;i trường. Tại Việt Nam, thị trường vật liệu xanh ghi nhận mức tăng trưởng hơn 15% mỗi năm, cho thấy xu hướng sử dụng c&aacute;c giải ph&aacute;p thay thế bền vững ng&agrave;y c&agrave;ng được ưu ti&ecirc;n.</p>
', 3, 5, NULL, NULL, N'admin', CAST(N'2025-01-06T12:52:37.460' AS DateTime), N'admin', CAST(N'2025-01-06T15:22:45.580' AS DateTime))
GO
INSERT [dbo].[Post] ([ID], [Name], [SeoTitle], [Status], [Image], [Description], [Detail], [ViewCount], [CatePostID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (7, N'Căn hộ 110 m2 thiết kế gác lửng như không gian nghệ thuật', N'can-ho-110-m2-thiet-ke-gac-lung-nhu-khong-gian-nghe-thuat', 1, N'/Data/Images/blog/tin-tuc4.jpg', N'Khu vực thông tầng được bổ sung hệ đèn thả trần, cùng đường nét uốn cong mềm mại giúp tạo điểm nhấn cho không gian.', N'<p>Căn hộ c&oacute; diện t&iacute;ch 110 m2, tọa lạc tr&ecirc;n tầng cao nhất của một t&ograve;a chung cư thuộc TP Thủ Đức (TP HCM).</p>

<p>C&ocirc;ng tr&igrave;nh được b&agrave;n giao th&ocirc;, với một s&agrave;n trống, trần cao 5,9 m. Sau khảo s&aacute;t v&agrave; theo nhu cầu của gia chủ, nh&oacute;m KTS chọn phương &aacute;n thiết kế th&ecirc;m hệ s&agrave;n lửng để tăng diện t&iacute;ch sử dụng l&ecirc;n 180 m2. Căn hộ sau thiết kế lại c&oacute; 3 ph&ograve;ng ngủ, 3 vệ sinh v&agrave; một kh&ocirc;ng gian sinh hoạt chung rộng r&atilde;i.</p>

<p><img alt="" data-ll-status="loaded" data-src="https://i1-vnexpress.vnecdn.net/2024/12/17/116-1734433897.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=7R9sfnZ62iiImTrygHLOfg" intrinsicsize="1200x0" itemprop="contentUrl" loading="lazy" src="https://i1-vnexpress.vnecdn.net/2024/12/17/116-1734433897.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=7R9sfnZ62iiImTrygHLOfg" /></p>

<p>Phong c&aacute;ch thiết kế chủ đạo mang cảm hứng Nhật Bản (Japandi) với tone m&agrave;u s&aacute;ng, trắng v&agrave; nhấn m&agrave;u gỗ nhẹ nh&agrave;ng tạo cảm gi&aacute;c ấm c&uacute;ng.</p>

<p><img alt="" data-ll-status="loaded" data-src="https://i1-vnexpress.vnecdn.net/2024/12/17/34-1734433898.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=se48Q_T5vzQu-yGQhicTIQ" intrinsicsize="1200x0" itemprop="contentUrl" loading="lazy" src="https://i1-vnexpress.vnecdn.net/2024/12/17/34-1734433898.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=se48Q_T5vzQu-yGQhicTIQ" /></p>

<p>Khu vực th&ocirc;ng tầng được bố tr&iacute; hệ đ&egrave;n thả trần ấn tượng, hệ cầu thang xoắn ốc gi&uacute;p kh&ocirc;ng gian giống một nơi trưng b&agrave;y c&aacute;c t&aacute;c phẩm nghệ thuật.</p>

<p><img alt="" data-ll-status="loaded" data-src="https://i1-vnexpress.vnecdn.net/2024/12/17/16-1734433899.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=3EzLpvTlzwBex9ClMbetBA" intrinsicsize="1200x0" itemprop="contentUrl" loading="lazy" src="https://i1-vnexpress.vnecdn.net/2024/12/17/16-1734433899.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=3EzLpvTlzwBex9ClMbetBA" /></p>

<p>Ph&ograve;ng kh&aacute;ch li&ecirc;n th&ocirc;ng bếp - ăn để tối ưu diện t&iacute;ch sử dụng. Kh&ocirc;ng gian được tận dụng tối đa để l&agrave;m c&aacute;c hệ tủ đề đồ lớn gồm tủ quần &aacute;o, trang tr&iacute; v&agrave; để đồ.</p>
', 0, 3, NULL, NULL, N'admin', CAST(N'2025-01-06T20:37:04.340' AS DateTime), N'admin', CAST(N'2025-01-06T20:37:04.340' AS DateTime))
GO
INSERT [dbo].[Post] ([ID], [Name], [SeoTitle], [Status], [Image], [Description], [Detail], [ViewCount], [CatePostID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (8, N'Bốn đồ nội thất lỗi thời', N'bon-do-noi-that-loi-thoi', 1, N'/Data/Images/blog/post-3.jpg', N'Những món nội thất này thường chiếm không gian nhưng không mang nhiều công dụng và đang dần bị loại bỏ khỏi các gia đình.', N'<ul data-campaign="Header">
	<li><a data-itm-added="1" data-itm-source="#vn_source=Detail-DoiSong_TieuDung-4820717&amp;vn_campaign=Header&amp;vn_medium=Menu-DoiSong&amp;vn_term=Desktop" data-medium="Menu-DoiSong" href="https://vnexpress.net/doi-song" title="Đời sống">Đời sống</a></li>
	<li><a data-itm-added="1" data-itm-source="#vn_source=Detail-DoiSong_TieuDung-4820717&amp;vn_campaign=Header&amp;vn_medium=Menu-TieuDung&amp;vn_term=Desktop" data-medium="Menu-TieuDung" href="https://vnexpress.net/doi-song/tieu-dung" title="Tiêu dùng">Ti&ecirc;u d&ugrave;ng</a></li>
</ul>

<p>Thứ năm, 28/11/2024, 13:59 (GMT+7)</p>

<h1>Bốn đồ nội thất lỗi thời</h1>

<p>Những m&oacute;n nội thất n&agrave;y thường chiếm kh&ocirc;ng gian nhưng kh&ocirc;ng mang nhiều c&ocirc;ng dụng v&agrave; đang dần bị loại bỏ khỏi c&aacute;c gia đ&igrave;nh.</p>

<article lg-uid="lg0">
<p><strong>B&agrave;n ăn mặt đ&aacute;</strong></p>

<p>B&agrave;n ăn mặt đ&aacute; l&agrave; m&oacute;n đồ&nbsp;<a data-itm-added="1" data-itm-source="#vn_source=Detail-DoiSong_TieuDung-4820717&amp;vn_campaign=Box-InternalLink&amp;vn_medium=Link-NoiThat&amp;vn_term=Desktop&amp;vn_thumb=0" href="https://vnexpress.net/tag/noi-that-116518" rel="dofollow">nội thất</a>&nbsp;phổ biến trong c&aacute;c gia đ&igrave;nh trước đ&acirc;y v&igrave; cho rằng n&oacute; c&oacute; vẻ ngo&agrave;i đẹp v&agrave; sang trọng.</p>

<p>Tuy nhi&ecirc;n, sản phẩm n&agrave;y g&acirc;y kh&oacute; cho c&aacute;c gia đ&igrave;nh v&igrave; đ&ograve;i hỏi qu&aacute; tr&igrave;nh sử dụng rất cẩn thận để kh&ocirc;ng bị trầy xước, nứt, bị ố v&agrave;ng. Trong khi đ&oacute; gi&aacute; lại kh&ocirc;ng hề rẻ.</p>

<p>Tốt nhất n&ecirc;n chọn b&agrave;n ăn gỗ tự nhi&ecirc;n, chất liệu th&acirc;n thiện v&agrave; độ bền cao. B&agrave;n ăn gỗ tự nhi&ecirc;n ph&ugrave; hợp với nhiều phong c&aacute;ch trang tr&iacute; kh&aacute;c nhau, kh&ocirc;ng g&acirc;y lạc l&otilde;ng v&agrave; gi&aacute; cả phải chăng hơn.</p>

<figure data-size="true" itemprop="associatedMedia image" itemscope="" itemtype="http://schema.org/ImageObject"><img alt="Bàn bằng đá không đa năng và bền đẹp như bàn gỗ. Ảnh: Aboluowang" data-ll-status="loaded" data-src="https://i1-giadinh.vnecdn.net/2024/11/28/A-nh-ma-n-hi-nh-2024-11-26-lu-6058-3285-1732753780.png?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=cS9kwv72Dvvqdeaq9K3A_Q" intrinsicsize="680x0" itemprop="contentUrl" loading="lazy" src="https://i1-giadinh.vnecdn.net/2024/11/28/A-nh-ma-n-hi-nh-2024-11-26-lu-6058-3285-1732753780.png?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=cS9kwv72Dvvqdeaq9K3A_Q" />
<figcaption itemprop="description">
<p>B&agrave;n bằng đ&aacute; kh&ocirc;ng đa năng v&agrave; bền đẹp như b&agrave;n gỗ. Ảnh:&nbsp;<em>Aboluowang</em></p>
</figcaption>
</figure>

<p><strong>B&agrave;n tr&agrave; k&iacute;nh</strong></p>

<p>Nhiều người chọn b&agrave;n mặt k&iacute;nh gi&aacute; rẻ v&agrave; dễ lau ch&ugrave;i nhưng qu&ecirc;n mất rằng sau một thời gian k&iacute;nh sẽ bị mờ v&agrave; tr&ocirc;ng bẩn. Quan trọng nhất, b&agrave;n tr&agrave; k&iacute;nh c&oacute; nguy cơ vỡ, g&acirc;y nguy hiểm cho người sử dụng.</p>

<p>Nhiều gia đ&igrave;nh hiện nay sử dụng b&agrave;n nhỏ c&oacute; b&aacute;nh xe để l&agrave;m b&agrave;n tr&agrave;, dưới c&oacute; ngăn k&eacute;o để đựng đồ ăn vặt.</p>

<figure data-size="true" itemprop="associatedMedia image" itemscope="" itemtype="http://schema.org/ImageObject"><img alt="Chiếc ghế để đuôi giường thường chỉ đặt quần áo bẩn. Ảnh: Aboluowang" data-ll-status="loaded" data-src="https://i1-giadinh.vnecdn.net/2024/11/28/A-nh-ma-n-hi-nh-2024-11-26-lu-2176-3167-1732753780.png?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=IF9xN1QS_fKRx2karyNMJQ" intrinsicsize="680x0" itemprop="contentUrl" loading="lazy" src="https://i1-giadinh.vnecdn.net/2024/11/28/A-nh-ma-n-hi-nh-2024-11-26-lu-2176-3167-1732753780.png?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=IF9xN1QS_fKRx2karyNMJQ" />
<figcaption itemprop="description">
<p>Chiếc ghế để cuối giường thường chỉ đặt quần &aacute;o bẩn. Ảnh:&nbsp;<em>Aboluowang</em></p>
</figcaption>
</figure>

<p><strong>Chiếc ghế cuối giường</strong></p>

<p>Chiếc ghế cuối giường chiếm diện t&iacute;ch m&agrave; kh&ocirc;ng c&oacute; nhiều c&ocirc;ng dụng. Ngo&agrave;i việc đặt quần &aacute;o bẩn, hầu như kh&ocirc;ng được c&ocirc;ng dụng g&igrave; kh&aacute;c.</p>

<p>Diện t&iacute;ch ph&ograve;ng ngủ vốn đ&atilde; kh&ocirc;ng lớn, th&ecirc;m một ghế cuối giường chỉ l&agrave;m cho ph&ograve;ng ngủ chật chội hơn.</p>

<p>Bạn c&oacute; thể chuyển đổi th&agrave;nh một tủ đầu giường đa năng để vừa đựng quần &aacute;o sạch, vừa c&oacute; thể đặt quần &aacute;o bẩn. N&oacute; cũng l&agrave; nơi đặt một cốc nước v&agrave; chỗ sạc điện thoại, quan trọng l&agrave; chiếm rất &iacute;t diện t&iacute;ch.</p>

<figure data-size="true" itemprop="associatedMedia image" itemscope="" itemtype="http://schema.org/ImageObject"><img alt="Các gia đình trẻ hiện nay thích loại sofa module, loại ghế sofa có cấu trúc linh hoạt, được ghép lại từ nhiều mảnh ghép riêng lẻ. Ảnh: Aboluowang" data-ll-status="loaded" data-src="https://i1-giadinh.vnecdn.net/2024/11/28/A-nh-ma-n-hi-nh-2024-11-26-lu-3361-8153-1732753780.png?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=4yyy51luOC5oMjedHmB5cA" intrinsicsize="680x0" itemprop="contentUrl" loading="lazy" src="https://i1-giadinh.vnecdn.net/2024/11/28/A-nh-ma-n-hi-nh-2024-11-26-lu-3361-8153-1732753780.png?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=4yyy51luOC5oMjedHmB5cA" />
<figcaption itemprop="description">
<p>C&aacute;c gia đ&igrave;nh trẻ hiện nay đ&atilde; chuyển sang loại sofa module, loại ghế sofa c&oacute; cấu tr&uacute;c linh hoạt, được gh&eacute;p lại từ nhiều mảnh gh&eacute;p ri&ecirc;ng lẻ. Ảnh:&nbsp;<em>Aboluowang</em></p>
</figcaption>
</figure>

<p><strong>Ghế sofa &quot;qu&yacute; phi&quot;</strong></p>

<p>Trước đ&acirc;y nhiều người d&ugrave;ng sofa n&agrave;y, c&oacute; thể nằm v&agrave; ngồi, ph&ugrave; hợp cho sinh hoạt gia đ&igrave;nh. Tuy nhi&ecirc;n, ghế sofa &quot;qu&yacute; phi&quot; thực sự rất chiếm diện t&iacute;ch v&agrave; kh&ocirc;ng thoải m&aacute;i, ngồi l&acirc;u dễ đau lưng. Quan trọng nhất l&agrave; khi nằm xem TV mắt dễ bị lệch, giảm thị lực. Cần đặc biệt ch&uacute; &yacute; nếu trong nh&agrave; c&oacute; trẻ nhỏ. Kh&ocirc;ng n&ecirc;n để trẻ nằm xem TV trong thời gian d&agrave;i.</p>

<p>Hiện nay, giới trẻ th&iacute;ch loại sofa module, loại ghế c&oacute; cấu tr&uacute;c linh hoạt, được gh&eacute;p lại từ nhiều mảng ri&ecirc;ng lẻ, c&oacute; thể biến th&agrave;nh giường, hoặc mở rộng khi nh&agrave; c&oacute; đ&ocirc;ng kh&aacute;ch. Ghế n&agrave;y cũng linh hoạt với tựa lưng c&oacute; thể t&ugrave;y chỉnh. Nằm xem TV tr&ecirc;n đ&oacute; cũng rất thoải m&aacute;i.</p>
</article>
', 0, 5, NULL, NULL, N'admin', CAST(N'2025-01-06T20:38:06.680' AS DateTime), N'admin', CAST(N'2025-01-06T20:38:06.680' AS DateTime))
GO
INSERT [dbo].[Post] ([ID], [Name], [SeoTitle], [Status], [Image], [Description], [Detail], [ViewCount], [CatePostID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (9, N'Phú Khang Gia giới thiệu vật liệu ốp tường mới', N'phu-khang-gia-gioi-thieu-vat-lieu-op-tuong-moi', 1, N'/Data/Images/blog/tintuc.jpg', N'Đơn vị giới thiệu sản phẩm tấm ốp lam sóng thuộc bộ sưu tập sản phẩm mới của thương hiệu EURO Moulding.', N'<p>L&agrave; nh&agrave; ph&acirc;n phối vật liệu trang tr&iacute; nội - ngoại thất v&agrave; c&aacute;c hệ thống nh&agrave; th&ocirc;ng minh cao cấp, gần 20 năm qua, Ph&uacute; Khang Gia kh&ocirc;ng ngừng t&igrave;m kiếm v&agrave; giới thiệu đến kh&aacute;ch h&agrave;ng những sản phẩm mới, bắt kịp nhu cầu v&agrave; xu hướng thị trường. Lần n&agrave;y, thương hiệu tiếp tục giới thiệu&nbsp;<a href="https://phukhanggiacorp.com/tam-op-lam-song/" rel="nofollow" target="_blank">tấm ốp&nbsp;</a><a href="https://phukhanggiacorp.com/tam-op-lam-song/" rel="nofollow">lam</a><a href="https://phukhanggiacorp.com/tam-op-lam-song/" rel="nofollow">&nbsp;s&oacute;ng</a>&nbsp;của EURO Moulding với nhiều ưu điểm như gi&aacute; th&agrave;nh rẻ, thi c&ocirc;ng lắp đặt nhanh hơn, mẫu m&atilde; đa dạng ph&ugrave; hợp mọi thiết kế...</p>

<p>Tấm ốp n&agrave;y c&oacute; k&iacute;ch thước lớn với chiều rộng 30 cm v&agrave; d&agrave;i tới 600 cm, độ mỏng chỉ 0,4 cm. Nguy&ecirc;n liệu ch&iacute;nh l&agrave; nhựa tổng hợp với 75% l&agrave; nhựa PS, than hoạt t&iacute;nh v&agrave; c&aacute;c chất phụ gia kh&aacute;c<strong>,&nbsp;</strong>th&acirc;n thiện m&ocirc;i trường, độ bền cao, đa dạng mẫu m&atilde;, m&agrave;u sắc, kiểu d&aacute;ng.</p>

<figure data-size="true" itemprop="associatedMedia image" itemscope="" itemtype="http://schema.org/ImageObject"><img alt="Lam sóng nhuyễn tại Phú Khang Gia. Ảnh: Phú Khang Gia" data-ll-status="loaded" data-src="https://i1-kinhdoanh.vnecdn.net/2024/11/14/Picture1-3002-1731579608.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=8K7PDQFn2N7JgGmgqYAqBQ" intrinsicsize="680x0" itemprop="contentUrl" loading="lazy" src="https://i1-kinhdoanh.vnecdn.net/2024/11/14/Picture1-3002-1731579608.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=8K7PDQFn2N7JgGmgqYAqBQ" />
<figcaption itemprop="description">
<p>Lam s&oacute;ng nhuyễn tại Ph&uacute; Khang Gia. Ảnh:&nbsp;<em>Ph&uacute; Khang Gia</em></p>
</figcaption>
</figure>

<p><a href="https://phukhanggiacorp.com/tam-nhua-op-tuong/" rel="nofollow" target="_blank">Tấm nhựa ốp tường</a>&nbsp;với c&aacute;c s&oacute;ng nhuyễn nhỏ lạ mắt, đan xen giữa c&aacute;c s&oacute;ng to v&agrave; nhỏ tạo n&ecirc;n hiệu ứng về thị gi&aacute;c. Theo Ph&uacute; Khang Gia, mẫu lam s&oacute;ng &acirc;m b&aacute;n nguyệt v&agrave; lam b&aacute;n nguyệt đang được ưa chuộng tr&ecirc;n thị trường. C&aacute;c kiểu d&aacute;ng n&agrave;y mang tạo cảm gi&aacute;c mềm mại, h&agrave;i h&ograve;a v&agrave; dễ chịu, c&ugrave;ng c&aacute;c v&acirc;n đ&aacute; hay v&acirc;n gỗ, th&iacute;ch hợp với những kh&ocirc;ng gian y&ecirc;u cầu sự trang nh&atilde; v&agrave; thanh lịch như ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc hay ph&ograve;ng ngủ. Trong khi đ&oacute;, tấm ốp lam s&oacute;ng với c&aacute;c s&oacute;ng lớn nhất l&ecirc;n tới 10 cm, ph&ugrave; hợp thiết kế văn ph&ograve;ng, t&ograve;a nh&agrave; hay kh&aacute;ch sạn... Với thiết kế n&agrave;y, người d&ugrave;ng c&oacute; thể tiết kiệm được chi ph&iacute; vật liệu v&agrave; thời gian thi c&ocirc;ng, biến những bức tường nh&agrave; trở n&ecirc;n ấn tượng hơn.</p>

<p>Độ d&agrave;i v&agrave; độ d&agrave;y của từng lam s&oacute;ng được t&iacute;nh to&aacute;n tỉ mỉ để tạo hiệu ứng ba chiều, gi&uacute;p kh&ocirc;ng gian c&oacute; chiều s&acirc;u v&agrave; tạo cảm gi&aacute;c bề mặt sống động, đem lại trải nghiệm mới cho gia chủ.</p>

<figure data-size="true" itemprop="associatedMedia image" itemscope="" itemtype="http://schema.org/ImageObject"><img alt="Lam sóng bản lớn trong không gian phòng đọc sách. Ảnh: Phú Khang Gia" data-ll-status="loaded" data-src="https://i1-kinhdoanh.vnecdn.net/2024/11/14/Picture2-6181-1731579609.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=qRoM2ASd-vQYNx0V5k51NA" intrinsicsize="680x0" itemprop="contentUrl" loading="lazy" src="https://i1-kinhdoanh.vnecdn.net/2024/11/14/Picture2-6181-1731579609.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=qRoM2ASd-vQYNx0V5k51NA" />
<figcaption itemprop="description">
<p>Lam s&oacute;ng bản lớn trong kh&ocirc;ng gian ph&ograve;ng đọc s&aacute;ch. Ảnh:&nbsp;<em>Ph&uacute; Khang Gia</em></p>
</figcaption>
</figure>

<p>Về nguồn gốc sản phẩm, Ph&uacute; Khang Gia cho biết, đơn vị ph&acirc;n phối vật liệu trang tr&iacute; nội thất được sản xuất tại MiGa - H&agrave;n Quốc. &Ocirc;ng Sangcheol Noh - CEO MiGa cho biết, đơn vị n&agrave;y c&oacute; hơn 60 bằng s&aacute;ng chế với thiết kế v&agrave; chất lượng gia c&ocirc;ng đ&aacute;p ứng ti&ecirc;u chuẩn quốc tế, đ&atilde; xuất khẩu tới hơn 100 c&ocirc;ng ty tại c&aacute;c quốc gia kh&aacute;c nhau.</p>

<p>Ph&uacute; Khang Gia l&agrave; một trong những nh&agrave; ph&acirc;n phối h&agrave;ng đầu c&aacute;c sản phẩm cao cấp từ H&agrave;n Quốc. Đơn vị kh&ocirc;ng ngừng đa dạng h&oacute;a c&aacute;c d&ograve;ng sản phẩm nhằm mang lại nhiều lựa chọn phong ph&uacute; v&agrave; đ&aacute;p ứng nhu cầu của kh&aacute;ch h&agrave;ng. Ngo&agrave;i d&ograve;ng tấm ốp lam s&oacute;ng mới, Ph&uacute; Khang Gia c&ograve;n giới thiệu c&aacute;c vật liệu trang tr&iacute; nội thất hiện đại như ph&agrave;o chỉ, tấm ốp, v&agrave; gạch nhựa. được sản xuất từ nhựa PS -chất liệu th&acirc;n thiện với sức khỏe người d&ugrave;ng. Điểm nổi bật của c&aacute;c sản phẩm n&agrave;y l&agrave; chống thấm nước, chống ch&aacute;y lan, v&agrave; khả năng chống mối mọt g&oacute;p phần n&acirc;ng cao chất lượng v&agrave; tuổi thọ cho c&aacute;c kh&ocirc;ng gian nội thất.</p>

<p>Ngo&agrave;i vật liệu trang tr&iacute; nội thất, Ph&uacute; Khang Gia c&ograve;n c&oacute; c&aacute;c thiết bị nh&agrave; th&ocirc;ng minh như đ&egrave;n LED Colorex, chu&ocirc;ng cửa allLITE, hệ thống camera gi&aacute;m s&aacute;t, kh&oacute;a cửa .... , khung r&egrave;m cửa th&ocirc;ng minh,... Những sản phẩm n&agrave;y kh&ocirc;ng chỉ tiện nghi m&agrave; c&ograve;n mang đến sự an to&agrave;n v&agrave; thoải m&aacute;i cho gia đ&igrave;nh, tạo ra kh&ocirc;ng gian sống hiện đại, tối ưu.</p>

<figure data-size="true" itemprop="associatedMedia image" itemscope="" itemtype="http://schema.org/ImageObject"><img alt="Thiết bị nhà thông minh Phú Khang Gia. Ảnh: Phú Khang Gia" data-ll-status="loaded" data-src="https://i1-kinhdoanh.vnecdn.net/2024/11/14/image009-1731579545-8695-1731579609.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=3rtXL1PUNrz3ThGJh0SWjA" intrinsicsize="680x0" itemprop="contentUrl" loading="lazy" src="https://i1-kinhdoanh.vnecdn.net/2024/11/14/image009-1731579545-8695-1731579609.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=3rtXL1PUNrz3ThGJh0SWjA" />
<figcaption itemprop="description">
<p>Thiết bị nh&agrave; th&ocirc;ng minh Ph&uacute; Khang Gia. Ảnh:&nbsp;<em>Ph&uacute; Khang Gia</em></p>
</figcaption>
</figure>

<p>&quot;Với nỗ lực mang đến cho kh&aacute;ch h&agrave;ng những sản phẩm nội thất chất lượng cao cấp, ch&uacute;ng t&ocirc;i tin rằng mỗi kh&ocirc;ng gian sống đều đ&aacute;ng được trau chuốt v&agrave; sứ mệnh của Ph&uacute; Khang Gia l&agrave; đồng h&agrave;nh c&ugrave;ng kh&aacute;ch h&agrave;ng trong việc tạo n&ecirc;n những kh&ocirc;ng gian đẹp&quot;, CEO&nbsp;<a href="http://phukhanggiacorp.com/author/vuthihien/" rel="nofollow" target="_blank">Vũ Thị Hiền</a>&nbsp;chia sẻ.</p>
', 0, 3, NULL, NULL, N'admin', CAST(N'2025-01-06T20:39:08.567' AS DateTime), N'admin', CAST(N'2025-01-06T20:40:51.650' AS DateTime))
GO
INSERT [dbo].[Post] ([ID], [Name], [SeoTitle], [Status], [Image], [Description], [Detail], [ViewCount], [CatePostID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (10, N'Chi 3,5 tỷ đồng xây nhà 4 tầng có phòng chơi riêng cho mèo', N'chi-3-5-ty-dong-xay-nha-4-tang-co-phong-choi-rieng-cho-meo', 1, N'/Data/Images/blog/c1tint.jpg', N'Ngôi nhà có đủ công năng đáp ứng nhu cầu sinh hoạt của gia đình chủ nhà, cùng không gian chơi riêng cho 5 chú mèo', N'<p>Ng&ocirc;i nh&agrave; c&oacute; quy m&ocirc; 4 tầng, tổng diện t&iacute;ch x&acirc;y dựng 267 m2, tọa lạc tại một dự &aacute;n thuộc B&igrave;nh Dương, l&agrave; nơi sinh sống của nữ gia chủ độc th&acirc;n c&ugrave;ng 5 ch&uacute; m&egrave;o.</p>

<p>Từ hiện trạng c&ocirc;ng tr&igrave;nh được b&agrave;n giao th&ocirc;, nh&oacute;m KTS chọn phương &aacute;n thiết kế nội thất theo phong c&aacute;ch hiện đại, chia lại mặt bằng, bố tr&iacute; c&ocirc;ng năng theo nhu cầu v&agrave; th&oacute;i quen sinh hoạt của gia chủ. Nội thất ng&ocirc;i nh&agrave; mang tone m&agrave;u s&aacute;ng l&agrave;m chủ đạo, nhấn nh&aacute; bằng c&aacute;c chi tiết m&agrave;u gỗ tự nhi&ecirc;n v&agrave; n&acirc;u v&agrave;ng.</p>

<p><img alt="" data-ll-status="loaded" data-src="https://i1-vnexpress.vnecdn.net/2024/11/01/06-1730437215.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=4FYXB74Y4KonVhy7951dTw" intrinsicsize="1200x0" itemprop="contentUrl" loading="lazy" src="https://i1-vnexpress.vnecdn.net/2024/11/01/06-1730437215.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=4FYXB74Y4KonVhy7951dTw" /></p>

<p>Tầng một được bố tr&iacute; s&acirc;n trước, ph&ograve;ng kh&aacute;ch, bếp - ăn, s&acirc;n vườn sau. Tầng hai gồm ph&ograve;ng ngủ master, ph&ograve;ng thay đồ v&agrave; khu vệ sinh. Tầng ba gồm ph&ograve;ng cho m&egrave;o, ph&ograve;ng l&agrave;m việc, ph&ograve;ng thờ. Tầng 4 l&agrave; khu giặt phơi v&agrave; s&acirc;n thượng.</p>

<p><img alt="" data-ll-status="loaded" data-src="https://i1-vnexpress.vnecdn.net/2024/11/01/14-1730437216.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=8udUOZEPiTbC6VxG5rGoDw" intrinsicsize="1200x0" itemprop="contentUrl" loading="lazy" src="https://i1-vnexpress.vnecdn.net/2024/11/01/14-1730437216.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=8udUOZEPiTbC6VxG5rGoDw" /></p>

<p>Ph&ograve;ng bếp - ăn lu&ocirc;n ngập tr&agrave;n &aacute;nh s&aacute;ng tự nhi&ecirc;n nhờ nằm s&aacute;t s&acirc;n sau, liền kề kho&agrave;ng th&ocirc;ng tầng ki&ecirc;m giếng trời.</p>

<p><img alt="" data-ll-status="loaded" data-src="https://i1-vnexpress.vnecdn.net/2024/11/01/105-1730437436.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=7vM6xa_ddeAOYbyPunoQvg" intrinsicsize="1200x0" itemprop="contentUrl" loading="lazy" src="https://i1-vnexpress.vnecdn.net/2024/11/01/105-1730437436.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=7vM6xa_ddeAOYbyPunoQvg" /></p>

<p>S&acirc;n sau được bố tr&iacute; th&agrave;nh khu ngồi nghỉ ngơi, thư gi&atilde;n.</p>

<p><img alt="" data-ll-status="loaded" data-src="https://i1-vnexpress.vnecdn.net/2024/11/01/69-1730437289.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=QLYHPFHpN9voIs09xmcTrQ" intrinsicsize="1200x0" itemprop="contentUrl" loading="lazy" src="https://i1-vnexpress.vnecdn.net/2024/11/01/69-1730437289.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=QLYHPFHpN9voIs09xmcTrQ" /></p>

<p>Ph&ograve;ng d&agrave;nh cho 5 ch&uacute; m&egrave;o đặt ở tầng ba, c&oacute; bố tr&iacute; hệ thống khối hộp để th&uacute; cưng thỏa th&iacute;ch leo tr&egrave;o.</p>
', 0, 2, NULL, NULL, N'admin', CAST(N'2025-01-06T20:39:59.850' AS DateTime), N'admin', CAST(N'2025-01-06T20:40:42.387' AS DateTime))
GO
INSERT [dbo].[Post] ([ID], [Name], [SeoTitle], [Status], [Image], [Description], [Detail], [ViewCount], [CatePostID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (11, N'Nhà hai tầng nhỏ gọn cho gia đình trẻ, phí xây 1,3 tỷ đồng', N'nha-hai-tang-nho-gon-cho-gia-dinh-tre-phi-xay-1-3-ty-dong', 1, N'/Data/Images/blog/tin%20tiii.jpg', N'Các không gian có diện tích nhỏ gọn, giúp gia chủ sử dụng thoải mái nhưng vẫn tiết kiệm chi phí xây dựng', N'<p>Ng&ocirc;i nh&agrave; hai tầng, diện t&iacute;ch x&acirc;y dựng 70 m2, tọa lạc lại TP Bi&ecirc;n H&ograve;a (Đồng Nai), l&agrave; nơi sinh sống của một gia đ&igrave;nh trẻ.</p>

<p>Với mức ng&acirc;n s&aacute;ch đầu tư c&oacute; hạn, nh&oacute;m KTS chọn phương &aacute;n thiết kế ng&ocirc;i nh&agrave; c&oacute; diện t&iacute;ch nhỏ gọn nhất c&oacute; thể nhưng vẫn đ&aacute;p ứng đầy đủ c&ocirc;ng năng, gi&uacute;p gia chủ sử dụng thoải m&aacute;i. Chi ph&iacute; x&acirc;y dựng khoảng 1,3 tỷ đồng, chưa bao gồm trang thiết bị nội thất.</p>

<p>Về bố cục, khối nh&agrave; được bố tr&iacute; ở khoảng giữa l&ocirc; đất v&agrave; chừa s&acirc;n trước - sau, gi&uacute;p c&ocirc;ng tr&igrave;nh sở hữu hai mặt tho&aacute;ng, gi&uacute;p c&aacute;c kh&ocirc;ng gian b&ecirc;n trong đươc chiếu s&aacute;ng v&agrave; th&ocirc;ng gi&oacute; tự nhi&ecirc;n tốt.</p>

<p><img alt="" data-ll-status="loaded" data-src="https://i1-vnexpress.vnecdn.net/2024/10/29/1-1730175099.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=r9ybXT0r-hWCFFONY3hmvw" intrinsicsize="1200x0" itemprop="contentUrl" loading="lazy" src="https://i1-vnexpress.vnecdn.net/2024/10/29/1-1730175099.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=r9ybXT0r-hWCFFONY3hmvw" /></p>

<p>Mặt đứng trước v&agrave; sau kh&ocirc;ng bố tr&iacute; ban c&ocirc;ng để tiết kiệm diện t&iacute;ch, thay v&agrave;o đ&oacute; l&agrave; phần sảnh đ&oacute;n với m&aacute;i che h&igrave;nh v&ograve;m cong, hai b&ecirc;n v&ograve;m c&oacute; trồng c&acirc;y leo uốn theo.</p>

<p><img alt="" data-ll-status="loaded" data-src="https://i1-vnexpress.vnecdn.net/2024/10/29/3-1730175100.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=Ms3w-9A9TsGYQTxGUGOETA" intrinsicsize="1200x0" itemprop="contentUrl" loading="lazy" src="https://i1-vnexpress.vnecdn.net/2024/10/29/3-1730175100.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=Ms3w-9A9TsGYQTxGUGOETA" /></p>

<p>Điểm nhấn của c&ocirc;ng tr&igrave;nh l&agrave; hệ cửa v&ograve;m mềm mại, từ cửa ra v&agrave;o đến ngăn ph&ograve;ng.</p>

<p><img alt="" data-ll-status="loaded" data-src="https://i1-vnexpress.vnecdn.net/2024/10/29/6-1730175101.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=PMK5iZWJvHiHIXVGYrv3VA" intrinsicsize="1200x0" itemprop="contentUrl" loading="lazy" src="https://i1-vnexpress.vnecdn.net/2024/10/29/6-1730175101.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=PMK5iZWJvHiHIXVGYrv3VA" /></p>

<p>Khối nh&agrave; gồm hai tầng. Tầng một l&agrave; c&aacute;c kh&ocirc;ng gian chung gồm ph&ograve;ng kh&aacute;ch, bếp - ăn v&agrave; g&oacute;c thư gi&atilde;n. Cầu thang, nh&agrave; vệ sinh v&agrave; kho được bố tr&iacute; gọn về một ph&iacute;a, gi&uacute;p phần kh&ocirc;ng gian ch&iacute;nh được th&ocirc;ng tho&aacute;ng từ trước ra sau.</p>

<p><img alt="" data-ll-status="loaded" data-src="https://i1-vnexpress.vnecdn.net/2024/10/29/a-29-1730175228.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=Nr4fOocFQ8htLSXBCgKnrg" intrinsicsize="1200x0" itemprop="contentUrl" loading="lazy" src="https://i1-vnexpress.vnecdn.net/2024/10/29/a-29-1730175228.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=Nr4fOocFQ8htLSXBCgKnrg" /></p>

<p>S&acirc;n vườn nhỏ ngăn chia ph&ograve;ng kh&aacute;ch v&agrave; bếp - ăn, tạo cảm gi&aacute;c ri&ecirc;ng tư cho mỗi kh&ocirc;ng gian.</p>

<p><img alt="" data-ll-status="loaded" data-src="https://i1-vnexpress.vnecdn.net/2024/10/29/a-4-1730175102.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=i2WSQ33WbbBPXdCsCR3z1Q" intrinsicsize="1200x0" itemprop="contentUrl" loading="lazy" src="https://i1-vnexpress.vnecdn.net/2024/10/29/a-4-1730175102.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=i2WSQ33WbbBPXdCsCR3z1Q" /></p>

<p>Khu bếp thiết kế hệ tủ chữ I đơn giản, sử dụng tone trắng - gỗ tự nhi&ecirc;n nhằm tạo cảm gi&aacute;c gần gũi.</p>
', 0, NULL, NULL, NULL, N'admin', CAST(N'2025-01-06T20:41:31.677' AS DateTime), N'admin', CAST(N'2025-01-06T20:41:31.677' AS DateTime))
GO
INSERT [dbo].[Post] ([ID], [Name], [SeoTitle], [Status], [Image], [Description], [Detail], [ViewCount], [CatePostID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (12, N'Nhà 200 m2 với thiết kế mở giúp tăng gắn kết gia đình', N'nha-200-m2-voi-thiet-ke-mo-giup-tang-gan-ket-gia-dinh', 1, N'/Data/Images/blog/c1tint.jpg', N'Ngoài các phòng ngủ riêng tư, ngôi nhà vẫn có đủ không gian sinh hoạt chung rộng rãi giúp kết nối các thành viên.', N'<p>Ng&ocirc;i nh&agrave; c&oacute; quy m&ocirc; ba tầng, được x&acirc;y dựng tr&ecirc;n khu đất rộng 200 m2, tọa lạc tại một khu đ&ocirc; thị thuộc ngoại th&agrave;nh H&agrave; Nội. Với diện t&iacute;ch sử dụng khoảng 470 m2, c&ocirc;ng năng ch&iacute;nh gồm một khu sinh hoạt chung, 5 ph&ograve;ng ngủ v&agrave; s&acirc;n vườn.</p>

<p>Gia chủ mong muốn sở hữu nơi sống y&ecirc;n b&igrave;nh, gần gũi hơn với thi&ecirc;n nhi&ecirc;n sau 15 năm gắn b&oacute; c&ugrave;ng căn hộ ở trung t&acirc;m th&agrave;nh phố. V&igrave; vậy, nh&oacute;m KTS đ&atilde; chọn phương &aacute;n thiết kế kh&ocirc;ng gian theo hướng mở nhằm khắc phục yếu điểm của nh&agrave; đất th&ocirc;ng thường, tạo khu sinh hoạt chung rộng r&atilde;i nhưng vẫn đảm bảo c&oacute; đầy đủ g&oacute;c nghỉ ngơi ri&ecirc;ng tư cho từng th&agrave;nh vi&ecirc;n trong gia đ&igrave;nh.</p>

<p><img alt="" data-ll-status="loaded" data-src="https://i1-vnexpress.vnecdn.net/2024/10/17/ee2292cdf830416e182157-1729099643.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=3h5sYY3d_ut7FVo7ne7szw" intrinsicsize="1200x0" itemprop="contentUrl" loading="lazy" src="https://i1-vnexpress.vnecdn.net/2024/10/17/ee2292cdf830416e182157-1729099643.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=3h5sYY3d_ut7FVo7ne7szw" /></p>

<p>Cửa ra v&agrave;o thiết kế dạng v&ograve;m, tạo cảm gi&aacute;c mềm mại, kết nối kh&ocirc;ng gian trong - ngo&agrave;i.</p>

<p><img alt="" data-ll-status="loaded" data-src="https://i1-vnexpress.vnecdn.net/2024/10/17/b0c7ac38c6c57f9b26d468-1729099644.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=nFskI8WEDhG1yeaf0tXpMQ" intrinsicsize="1200x0" itemprop="contentUrl" loading="lazy" src="https://i1-vnexpress.vnecdn.net/2024/10/17/b0c7ac38c6c57f9b26d468-1729099644.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=nFskI8WEDhG1yeaf0tXpMQ" /></p>

<p>Ph&ograve;ng kh&aacute;ch mang tone kem, trắng v&agrave; v&agrave;ng l&agrave;m chủ đạo. Điểm nhấn đến từ bộ sofa v&agrave; b&agrave;n tr&agrave; với thiết kế h&igrave;nh th&ugrave; lạ mắt.</p>

<p><img alt="" data-ll-status="loaded" data-src="https://i1-vnexpress.vnecdn.net/2024/10/17/764d24dc4e21f77fae3065-1729099645.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=2j32gV-ZE9TowbQZCLRFXQ" intrinsicsize="1200x0" itemprop="contentUrl" loading="lazy" src="https://i1-vnexpress.vnecdn.net/2024/10/17/764d24dc4e21f77fae3065-1729099645.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=2j32gV-ZE9TowbQZCLRFXQ" /></p>

<p>Ng&ocirc;i nh&agrave; tập trung v&agrave;o tầng một, với c&aacute;c kh&ocirc;ng gian sinh hoạt mở v&agrave; kết nối c&ugrave;ng nhau. Đ&acirc;y l&agrave; nơi bố ngồi xem b&oacute;ng đ&aacute;, những đứa trẻ nằm tr&ecirc;n x&iacute;ch đu v&agrave; chờ thưởng thức những m&oacute;n ăn mẹ nấu. Trong khi c&aacute;c ph&ograve;ng ngủ được đưa l&ecirc;n tầng cao nhằm đảm bảo sự ri&ecirc;ng tư.</p>

<p><img alt="" data-ll-status="loaded" data-src="https://i1-vnexpress.vnecdn.net/2024/10/17/8b9c9d74f7894ed7179871-1729099647.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=QYjWejUSDSw1EPDchrhDEw" intrinsicsize="1200x0" itemprop="contentUrl" loading="lazy" src="https://i1-vnexpress.vnecdn.net/2024/10/17/8b9c9d74f7894ed7179871-1729099647.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=QYjWejUSDSw1EPDchrhDEw" /></p>

<p>X&iacute;ch đu l&agrave; kh&ocirc;ng gian vui chơi cho trẻ, cũng l&agrave; điểm kết nối giữa ph&ograve;ng kh&aacute;ch v&agrave; khu bếp - ăn.</p>

<p><img alt="" data-ll-status="loaded" data-src="https://i1-vnexpress.vnecdn.net/2024/10/17/ce21dfc9b5340c6a552589-1729099647.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=MZy3J91_AepG9VZrUu5-QA" intrinsicsize="1200x0" itemprop="contentUrl" loading="lazy" src="https://i1-vnexpress.vnecdn.net/2024/10/17/ce21dfc9b5340c6a552589-1729099647.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=MZy3J91_AepG9VZrUu5-QA" /></p>

<p>&nbsp;</p>

<p>B&agrave;n ăn lớn, đặt ở vị tr&iacute; nhiều &aacute;nh s&aacute;ng tự nhi&ecirc;n.</p>

<p><img alt="" data-ll-status="loaded" data-src="https://i1-vnexpress.vnecdn.net/2024/10/17/9a9e9409fef447aa1ee581-1729099648.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=17L0kXZnbVC-j6nA7seUFA" intrinsicsize="1200x0" itemprop="contentUrl" loading="lazy" src="https://i1-vnexpress.vnecdn.net/2024/10/17/9a9e9409fef447aa1ee581-1729099648.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=17L0kXZnbVC-j6nA7seUFA" /></p>

<p>Khu bếp với cửa sổ tho&aacute;ng, b&agrave;n đảo, gi&uacute;p gia chủ thuận tiện nấu nướng.</p>

<p>&nbsp;</p>

<p>C&aacute;c ph&ograve;ng ngủ đều c&oacute; ban c&ocirc;ng hoặc cửa sổ lấy s&aacute;ng v&agrave; lưu th&ocirc;ng kh&ocirc;ng kh&iacute;.</p>

<p>&nbsp;</p>

<p>Bồn tắm nằm với tầm nh&igrave;n hướng ra mảng xanh ph&iacute;a trước.</p>

<p>&nbsp;</p>

<p>Ph&ograve;ng ngủ trẻ nhỏ được trang tr&iacute; theo tone m&agrave;u y&ecirc;u th&iacute;ch.</p>

<p>&nbsp;</p>

<p>Cửa sổ lớn gi&uacute;p kh&ocirc;ng gian giường ngủ v&agrave; g&oacute;c học tập lu&ocirc;n đủ s&aacute;ng.</p>

<p>&nbsp;</p>

<p>Mặt bằng bố tr&iacute; nội thất c&aacute;c tầng.</p>

<p>C&ocirc;ng tr&igrave;nh được thi c&ocirc;ng trong khoảng 5 th&aacute;ng, chi ph&iacute; kh&ocirc;ng được tiết lộ.</p>

<p>&nbsp;</p>

<p><strong>Thu Hương</strong></p>
', 0, 2, NULL, NULL, N'admin', CAST(N'2025-01-06T20:42:37.623' AS DateTime), N'admin', CAST(N'2025-01-06T20:42:37.623' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[PostCategory] ON 
GO
INSERT [dbo].[PostCategory] ([ID], [Name], [SeoTitle], [Status], [Sort], [ParentID], [Image], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (1, N'Khuyến mãi', N'khuyen-mai', 1, 2, NULL, N'/Data/Images/chiecla.png', NULL, NULL, N'admin', CAST(N'2024-12-26T10:54:14.557' AS DateTime), N'admin', CAST(N'2024-12-26T10:54:39.783' AS DateTime))
GO
INSERT [dbo].[PostCategory] ([ID], [Name], [SeoTitle], [Status], [Sort], [ParentID], [Image], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (2, N'Sự kiện', N'su-kien', 1, 5, NULL, N'/Data/Images/avatar3.png', NULL, NULL, N'admin', CAST(N'2024-12-26T11:09:11.663' AS DateTime), N'admin', CAST(N'2024-12-26T11:09:11.663' AS DateTime))
GO
INSERT [dbo].[PostCategory] ([ID], [Name], [SeoTitle], [Status], [Sort], [ParentID], [Image], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (3, N'quảng cáo', N'quang-cao', 1, 1, NULL, N'/Data/Images/avatar3.png', NULL, NULL, N'customer', CAST(N'2024-12-28T09:40:28.500' AS DateTime), N'admin', CAST(N'2025-01-06T20:07:41.410' AS DateTime))
GO
INSERT [dbo].[PostCategory] ([ID], [Name], [SeoTitle], [Status], [Sort], [ParentID], [Image], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (5, N'tin tức hot', N'tin-tuc-hot', 1, 4, NULL, N'/Data/Images/SanPham/coins.png', NULL, NULL, N'admin', CAST(N'2025-01-06T12:50:25.020' AS DateTime), N'admin', CAST(N'2025-01-06T15:23:16.533' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[PostCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (4, N'SP01', N'Ghế Tre', N'ghe-tre', 1, N'/Data/Images/SanPham/ghetre.jpg', CAST(90000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)), 1, 0, 12, CAST(N'2024-12-20T17:19:00.000' AS DateTime), 1, NULL, NULL, 61, 17, 1, N'SP01', NULL, N'admin', CAST(N'2024-12-27T17:19:51.083' AS DateTime), N'admin', CAST(N'2024-12-30T17:20:58.583' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (5, N'SP04', N'Ghế mây', N'ghe-may', 1, N'/Data/Images/SanPham/mdc-8004-n.jpg', CAST(80000 AS Decimal(18, 0)), CAST(70000 AS Decimal(18, 0)), 1, 0, 12, CAST(N'2024-12-20T19:28:00.000' AS DateTime), 1, NULL, NULL, 25, 17, 1, N'SP04', NULL, N'admin', CAST(N'2024-12-29T15:29:36.173' AS DateTime), N'admin', CAST(N'2024-12-30T17:30:34.390' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (6, N'SP07', N'Ghế gỗ', N'ghe-go', 1, N'/Data/Images/SanPham/ghe-an-go2.jpg', CAST(50000 AS Decimal(18, 0)), NULL, 1, 5, 12, CAST(N'2024-12-18T15:31:00.000' AS DateTime), 0, NULL, NULL, 19, 17, 1, N'SP07', NULL, N'admin', CAST(N'2024-12-29T15:32:27.420' AS DateTime), N'admin', CAST(N'2024-12-30T17:33:19.650' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (7, N'SP08', N'Ghế sofa gỗ', N'ghe-sofa-go', 1, N'/Data/Images/SanPham/Ghe-sofa-go-don.jpg', CAST(100000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)), 1, 4, 12, CAST(N'2025-01-02T17:44:00.000' AS DateTime), 1, NULL, NULL, 12, 17, 1, N'SP08', NULL, N'admin', CAST(N'2024-12-30T17:46:06.537' AS DateTime), N'admin', CAST(N'2024-12-30T17:46:06.537' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (8, N'SP09', N'Ghế đôi sofa', N'ghe-doi-sofa', 1, N'/Data/Images/SanPham/product-13-1.jpg', CAST(130000 AS Decimal(18, 0)), NULL, 1, 7, 12, NULL, 0, NULL, NULL, 3, 17, 1, N'SP09', NULL, N'admin', CAST(N'2024-12-30T17:48:04.703' AS DateTime), N'admin', CAST(N'2024-12-30T17:48:04.703' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (9, N'SP09', N'Ghế sofa dài', N'ghe-sofa-dai', 1, N'/Data/Images/SanPham/ghesofa.jpg', CAST(140000 AS Decimal(18, 0)), NULL, 1, 7, 12, NULL, 0, NULL, NULL, 3, 17, 1, N'SP09', NULL, N'admin', CAST(N'2024-12-30T17:57:23.523' AS DateTime), N'admin', CAST(N'2024-12-30T17:57:23.523' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (10, N'SP010', N'Bàn trà', N'ban-tra', 1, N'/Data/Images/banner/ban-tra-ban-sofa-dep-03_1.jpg', CAST(200000 AS Decimal(18, 0)), CAST(160000 AS Decimal(18, 0)), 1, 7, 12, CAST(N'2025-01-10T18:08:00.000' AS DateTime), 1, NULL, NULL, 16, 20, 1, N'SP010', NULL, N'admin', CAST(N'2024-12-30T18:10:14.270' AS DateTime), N'admin', CAST(N'2024-12-30T18:10:14.270' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (11, N'SP011', N'Bàn tròn', N'ban-tron', 1, N'/Data/Images/banner/images%20(22).jpg', CAST(160000 AS Decimal(18, 0)), NULL, 1, 7, 12, NULL, 0, NULL, NULL, 2, 20, 1, N'SP011', NULL, N'admin', CAST(N'2024-12-30T18:11:54.173' AS DateTime), N'admin', CAST(N'2024-12-30T18:11:54.173' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (12, N'SP022', N'Thảm  hoa', N'tham-hoa', 1, N'/Data/Images/banner/tham-lot-san-nha-cao-cap%20(3).jpg', CAST(40000 AS Decimal(18, 0)), NULL, 1, 5, 12, NULL, 0, NULL, NULL, 0, 23, 1, N'SP022', NULL, N'admin', CAST(N'2024-12-30T18:13:10.063' AS DateTime), N'admin', CAST(N'2024-12-30T18:13:10.063' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (13, N'SP024', N'Thảm tròn', N'tham-tron', 1, N'/Data/Images/banner/tham-tron-2m-bong-hoa-3.jpg', CAST(80000 AS Decimal(18, 0)), CAST(70000 AS Decimal(18, 0)), 1, 4, 12, NULL, 1, NULL, NULL, 1, 23, 1, N'SP024', NULL, N'admin', CAST(N'2024-12-30T18:14:57.300' AS DateTime), N'admin', CAST(N'2024-12-30T18:14:57.300' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (14, N'SP045', N'Thảm để chân', N'tham-de-chan', 1, N'/Data/Images/banner/10-mau-tham-lot-san.jpg', CAST(25000 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)), 1, 5, 12, NULL, 1, NULL, NULL, 1, 23, 1, N'SP045', NULL, N'admin', CAST(N'2024-12-30T18:16:12.830' AS DateTime), N'admin', CAST(N'2024-12-30T18:16:12.830' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (15, N'SP034', N'Bàn gỗ', N'ban-go', 1, N'/Data/Images/banner/ban-go-van-phong.jpg', CAST(80000 AS Decimal(18, 0)), NULL, 1, 4, 12, NULL, 0, NULL, NULL, 13, 20, 1, N'SP034', NULL, N'admin', CAST(N'2024-12-30T18:17:02.353' AS DateTime), N'admin', CAST(N'2024-12-30T18:17:02.353' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (16, N'SP016', N'Đèn tròn', N'den-tron', 1, N'/Data/Images/SanPham/product-10-1.jpg', CAST(40000 AS Decimal(18, 0)), NULL, 1, 5, 12, NULL, 0, NULL, NULL, 1, 35, 1, N'SP016', NULL, N'admin', CAST(N'2024-12-30T18:19:43.290' AS DateTime), N'admin', CAST(N'2024-12-30T18:19:43.290' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (17, N'SP017', N'Đèn lòng', N'den-long', 1, N'/Data/Images/SanPham/product-2-1.jpg', CAST(35000 AS Decimal(18, 0)), NULL, 1, 5, 12, NULL, 1, NULL, NULL, 3, 35, 1, N'SP017', NULL, N'admin', CAST(N'2024-12-30T18:20:37.833' AS DateTime), N'admin', CAST(N'2024-12-30T18:20:37.833' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (18, N'SP67', N'Ghế nhựa', N'ghe-nhua', 1, N'/Data/Images/SanPham/product-9-1.jpg', CAST(20000 AS Decimal(18, 0)), NULL, 1, 5, 12, NULL, 0, NULL, NULL, 0, 17, 1, N'SP67', NULL, N'admin', CAST(N'2024-12-30T18:24:31.263' AS DateTime), N'admin', CAST(N'2024-12-30T18:24:31.263' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (19, N'SP056', N'Chậu lan', N'chau-lan', 1, N'/Data/Images/SanPham/chau%20hoa.jpg', CAST(50000 AS Decimal(18, 0)), NULL, 1, 7, 12, NULL, 0, NULL, NULL, 2, 18, 1, N'SP056', NULL, N'admin', CAST(N'2024-12-30T18:29:49.893' AS DateTime), N'admin', CAST(N'2024-12-30T18:29:49.893' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (20, N'SP059', N'Chậu hoa bạch mã', N'chau-hoa-bach-ma', 1, N'/Data/Images/SanPham/cay-bach-ma-hoang-tu.jpg', CAST(60000 AS Decimal(18, 0)), NULL, 1, 7, 12, NULL, 0, NULL, NULL, 2, 18, 1, N'SP059', NULL, N'admin', CAST(N'2024-12-30T18:30:53.720' AS DateTime), N'admin', CAST(N'2024-12-30T18:30:53.720' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (21, N'SP039', N'Tranh cảnh biển', N'tranh-canh-bien', 1, N'/Data/Images/banner/tranh-treo-tuong-phong-canh-non-nuoc-25084.jpg', CAST(150000 AS Decimal(18, 0)), NULL, 1, 3, 12, NULL, 0, NULL, NULL, 1, 34, 1, N'SP039', NULL, N'admin', CAST(N'2024-12-30T18:34:57.143' AS DateTime), N'admin', CAST(N'2024-12-30T18:34:57.143' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (22, N'SP040', N'Tranh cảnh hồ', N'tranh-canh-ho', 1, N'/Data/Images/banner/tranh-treo-tuong-phong-canh-thien-nhien-25092.jpg', CAST(160000 AS Decimal(18, 0)), NULL, 1, 0, 12, NULL, 0, NULL, NULL, 6, 34, 1, N'SP040', NULL, N'admin', CAST(N'2024-12-30T18:35:59.567' AS DateTime), N'admin', CAST(N'2024-12-30T18:35:59.567' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (23, N'SP087', N'Đồng hồ TT', N'dong-ho-tt', 1, N'/Data/Images/SanPham/dongho.jpg', CAST(120000 AS Decimal(18, 0)), NULL, 1, 2, 12, NULL, 0, NULL, NULL, 8, 22, 1, N'SP087', NULL, N'admin', CAST(N'2024-12-30T18:40:24.993' AS DateTime), N'admin', CAST(N'2024-12-30T18:40:24.993' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (24, N'SP046', N'Tủ trưng bày', N'tu-trung-bay', 1, N'/Data/Images/SanPham/phong_khach_ksg268.jpg', CAST(180000 AS Decimal(18, 0)), NULL, 1, 4, 12, NULL, 0, NULL, NULL, 7, 21, 1, N'SP046', NULL, N'admin', CAST(N'2024-12-30T18:44:05.263' AS DateTime), N'admin', CAST(N'2024-12-30T18:44:05.263' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (25, N'SP055', N'Tủ khách', N'tu-khach', 1, N'/Data/Images/SanPham/tu-ke-trang-tri-phong-khach-2927.jpg', CAST(200000 AS Decimal(18, 0)), CAST(190000 AS Decimal(18, 0)), 1, 1, 12, NULL, 1, NULL, NULL, 13, 21, 1, N'SP055', NULL, N'admin', CAST(N'2024-12-30T18:45:02.843' AS DateTime), N'admin', CAST(N'2024-12-30T18:45:02.843' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (26, N'SP099', N'Hoa loa kè', N'hoa-loa-ke', 1, N'/Data/Images/SanPham/hoa.jpg', CAST(80000 AS Decimal(18, 0)), CAST(70000 AS Decimal(18, 0)), 0, 5, 12, CAST(N'2025-01-23T13:17:00.000' AS DateTime), 1, N'Sản phẩm tôt, chất lượng cao', N'<p>Sản phẩm&nbsp;</p>
', 0, 18, 4, N'SP099', NULL, N'admin', CAST(N'2025-01-06T13:18:37.720' AS DateTime), N'admin', CAST(N'2025-01-06T13:18:37.720' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (27, N'SP111', N'Đồng hồ white', N'dong-ho-white', 1, N'/Data/Images/SanPham/cmg734.jpg', CAST(100000 AS Decimal(18, 0)), CAST(70000 AS Decimal(18, 0)), 0, 5, 12, CAST(N'2025-01-23T13:19:00.000' AS DateTime), 1, N'Sản phẩm chất lượng', NULL, 0, 22, 6, N'SP111', NULL, N'admin', CAST(N'2025-01-06T13:20:22.980' AS DateTime), N'admin', CAST(N'2025-01-06T13:20:22.980' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (28, N'SP091', N'Đèn bầu dục', N'den-bau-duc', 1, N'/Data/Images/banner/den-op-tran-hinh-to-ong-sang-tao-yht072-13.jpg', CAST(100000 AS Decimal(18, 0)), CAST(90000 AS Decimal(18, 0)), 1, 5, 12, NULL, 1, NULL, NULL, 0, 35, 5, N'SP091', NULL, N'admin', CAST(N'2025-01-06T13:22:37.697' AS DateTime), N'admin', CAST(N'2025-01-06T13:22:37.697' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (29, N'SP888', N'tranh thuyền', N'tranh-thuyen', 1, N'/Data/Images/banner/tranh-treo-tuong-con-thuyen-tren-ho-nuoc-25076.jpg', CAST(100000 AS Decimal(18, 0)), NULL, 0, 5, 12, NULL, 0, NULL, NULL, 0, 34, 3, N'SP888', NULL, N'admin', CAST(N'2025-01-06T13:24:11.690' AS DateTime), N'admin', CAST(N'2025-01-06T13:24:11.690' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (30, N'SP768', N'Đồng hồ cao cấp', N'dong-ho-cao-cap', 1, N'/Data/Images/banner/dong-ho-decor-gan-tuong.jpg', CAST(100000 AS Decimal(18, 0)), NULL, 1, 5, 12, NULL, 0, NULL, NULL, 0, 22, 4, N'SP768', NULL, N'admin', CAST(N'2025-01-06T13:25:08.040' AS DateTime), N'admin', CAST(N'2025-01-06T13:25:08.040' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (31, N'SP777', N'Tủ hồ sơ phòng khách', N'tu-ho-so-phong-khach', 1, N'/Data/Images/banner/tu-ho-so-tg-12-00_823.jpg', CAST(200000 AS Decimal(18, 0)), NULL, 1, 5, 12, NULL, 0, NULL, NULL, 0, 21, 5, N'SP777', NULL, N'admin', CAST(N'2025-01-06T13:26:43.907' AS DateTime), N'admin', CAST(N'2025-01-06T13:26:43.907' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (32, N'SP222', N'Đồng hồ quý tộc', N'dong-ho-quy-toc', 1, N'/Data/Images/banner/dong-ho-trang-tri-cao.jpg', CAST(250000 AS Decimal(18, 0)), CAST(230000 AS Decimal(18, 0)), 0, 5, 12, NULL, 1, NULL, NULL, 2, 22, 6, N'SP222', NULL, N'admin', CAST(N'2025-01-06T13:27:53.357' AS DateTime), N'admin', CAST(N'2025-01-06T13:27:53.357' AS DateTime))
GO
INSERT [dbo].[Product] ([ID], [Code], [Name], [SeoTitle], [Status], [Image], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [IsSale], [Description], [Detail], [ViewCount], [CategoryID], [SupplierID], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (33, N'SP224', N'Kệ sách', N'ke-sach', 1, N'/Data/Images/banner/ke-goc-tuong-co-ngan-tu-go-cao-su-1a.jpg', CAST(280000 AS Decimal(18, 0)), CAST(250000 AS Decimal(18, 0)), 1, 5, 12, NULL, 1, NULL, NULL, 0, 21, 5, N'SP224', NULL, N'admin', CAST(N'2025-01-06T13:29:43.163' AS DateTime), N'admin', CAST(N'2025-01-06T13:29:43.163' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 
GO
INSERT [dbo].[ProductCategory] ([ID], [Name], [SeoTitle], [Status], [Sort], [ParentID], [Image], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (17, N'Ghế khách', N'ghe-khach', 1, 1, NULL, N'/Data/Images/banner/banner-1(2).jpg', NULL, NULL, N'admin', CAST(N'2024-12-30T07:29:07.623' AS DateTime), N'admin', CAST(N'2024-12-30T20:42:54.723' AS DateTime))
GO
INSERT [dbo].[ProductCategory] ([ID], [Name], [SeoTitle], [Status], [Sort], [ParentID], [Image], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (18, N'Chậu cây', N'chau-cay', 1, 2, NULL, N'/Data/Images/banner/banner-4.jpg', NULL, NULL, N'admin', CAST(N'2024-12-30T07:30:57.273' AS DateTime), N'admin', CAST(N'2024-12-30T11:27:44.577' AS DateTime))
GO
INSERT [dbo].[ProductCategory] ([ID], [Name], [SeoTitle], [Status], [Sort], [ParentID], [Image], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (20, N'Bàn khách', N'ban-khach', 1, 3, NULL, N'/Data/Images/banner/ban-tra-mat-da-hinh-elip-dep.jpg', NULL, NULL, N'admin', CAST(N'2024-12-30T07:38:26.970' AS DateTime), N'admin', CAST(N'2024-12-30T18:08:24.863' AS DateTime))
GO
INSERT [dbo].[ProductCategory] ([ID], [Name], [SeoTitle], [Status], [Sort], [ParentID], [Image], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (21, N'Tủ & Hòm', N'tu-hom', 1, 4, NULL, N'/Data/Images/banner/tu-phong-khach-la-gi.jpg', NULL, NULL, N'admin', CAST(N'2024-12-30T07:38:53.087' AS DateTime), N'admin', CAST(N'2024-12-30T11:27:51.093' AS DateTime))
GO
INSERT [dbo].[ProductCategory] ([ID], [Name], [SeoTitle], [Status], [Sort], [ParentID], [Image], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (22, N'Đồng hồ', N'dong-ho', 1, 5, NULL, N'/Data/Images/banner/images%20(24).jpg', NULL, NULL, N'admin', CAST(N'2024-12-30T07:55:54.367' AS DateTime), N'admin', CAST(N'2024-12-30T11:27:53.940' AS DateTime))
GO
INSERT [dbo].[ProductCategory] ([ID], [Name], [SeoTitle], [Status], [Sort], [ParentID], [Image], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (23, N'Thảm lót sàn', N'tham-lot-san', 1, 6, NULL, N'/Data/Images/banner/tham-tron-2m-bong-hoa-2.jpg', NULL, NULL, N'admin', CAST(N'2024-12-30T08:00:13.390' AS DateTime), N'admin', CAST(N'2024-12-30T20:45:42.820' AS DateTime))
GO
INSERT [dbo].[ProductCategory] ([ID], [Name], [SeoTitle], [Status], [Sort], [ParentID], [Image], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (34, N'Tranh tường', N'tranh-tuong', 1, 7, NULL, N'/Data/Images/banner/tranh-treo-tuong-e1642228650806.jpg', NULL, NULL, N'admin', CAST(N'2024-12-30T10:56:13.707' AS DateTime), N'admin', CAST(N'2024-12-30T20:43:47.037' AS DateTime))
GO
INSERT [dbo].[ProductCategory] ([ID], [Name], [SeoTitle], [Status], [Sort], [ParentID], [Image], [MetaKeywords], [MetaDescription], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (35, N'Đèn trần', N'den-tran', 1, 8, NULL, N'/Data/Images/banner/den-tran-hien-dai-qua-cau-gai.jpg', NULL, NULL, N'admin', CAST(N'2024-12-30T10:58:42.237' AS DateTime), N'admin', CAST(N'2024-12-30T11:28:03.010' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImage] ON 
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (21, 4, N'ghetre.jpg', N'/Data/Images/SanPham/ghetre.jpg', 1, N'admin', CAST(N'2024-12-30T17:29:36.047' AS DateTime), N'admin', CAST(N'2024-12-30T17:29:36.047' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (22, 5, N'mdc-8004-n.jpg', N'/Data/Images/SanPham/mdc-8004-n.jpg', 1, N'admin', CAST(N'2024-12-30T17:32:25.183' AS DateTime), N'admin', CAST(N'2024-12-30T17:32:25.183' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (23, 6, N'ghe-an-go2.jpg', N'/Data/Images/SanPham/ghe-an-go2.jpg', 1, N'admin', CAST(N'2024-12-30T17:38:05.390' AS DateTime), N'admin', CAST(N'2024-12-30T17:38:05.390' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (24, 7, N'Ghe-sofa-go-don.jpg', N'/Data/Images/SanPham/Ghe-sofa-go-don.jpg', 1, N'admin', CAST(N'2024-12-30T17:46:06.537' AS DateTime), N'admin', CAST(N'2024-12-30T17:46:06.537' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (25, 7, N'Ghe-sofa-go-don.jpg', N'/Data/Images/SanPham/ghe-sofa-don-gsd68051-01.jpg', 0, N'admin', CAST(N'2024-12-30T17:46:06.537' AS DateTime), N'admin', CAST(N'2024-12-30T17:46:06.537' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (28, 8, N'ghe-sofa.jpg', N'/Data/Images/SanPham/ghe-sofa.jpg', 0, N'admin', CAST(N'2024-12-30T17:57:46.333' AS DateTime), N'admin', CAST(N'2024-12-30T17:57:46.333' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (29, 8, N'product-13-1.jpg', N'/Data/Images/SanPham/product-13-1.jpg', 1, N'admin', CAST(N'2024-12-30T17:57:53.713' AS DateTime), N'admin', CAST(N'2024-12-30T17:57:53.713' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (30, 8, N'product-13-2.jpg', N'/Data/Images/SanPham/product-13-2.jpg', 0, N'admin', CAST(N'2024-12-30T17:57:59.980' AS DateTime), N'admin', CAST(N'2024-12-30T17:57:59.980' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (31, 9, N'ghe-bang-sofa-sf21-3-1.jpg', N'/Data/Images/SanPham/ghe-bang-sofa-sf21-3-1.jpg', 0, N'admin', CAST(N'2024-12-30T17:58:14.070' AS DateTime), N'admin', CAST(N'2024-12-30T17:58:14.070' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (32, 9, N'bo-sofa-cao-cap-SF23.jpg', N'/Data/Images/SanPham/bo-sofa-cao-cap-SF23.jpg', 0, N'admin', CAST(N'2024-12-30T17:58:16.533' AS DateTime), N'admin', CAST(N'2024-12-30T17:58:16.533' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (33, 9, N'ghesofa.jpg', N'/Data/Images/SanPham/ghesofa.jpg', 1, N'admin', CAST(N'2024-12-30T17:58:19.133' AS DateTime), N'admin', CAST(N'2024-12-30T17:58:19.133' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (34, 10, N'ban-tra-ban-sofa-dep-03_1.jpg', N'/Data/Images/banner/ban-tra-ban-sofa-dep-03_1.jpg', 1, N'admin', CAST(N'2024-12-30T18:10:14.270' AS DateTime), N'admin', CAST(N'2024-12-30T18:10:14.270' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (35, 10, N'ban-tra-ban-sofa-dep-03_1.jpg', N'/Data/Images/banner/ban-tra-ban-sofa-dep-03.jpg', 0, N'admin', CAST(N'2024-12-30T18:10:14.270' AS DateTime), N'admin', CAST(N'2024-12-30T18:10:14.270' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (36, 11, N'images%20(22).jpg', N'/Data/Images/banner/images%20(22).jpg', 1, N'admin', CAST(N'2024-12-30T18:11:54.173' AS DateTime), N'admin', CAST(N'2024-12-30T18:11:54.173' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (37, 12, N'tham-lot-san-nha-cao-cap%20(3).jpg', N'/Data/Images/banner/tham-lot-san-nha-cao-cap%20(3).jpg', 1, N'admin', CAST(N'2024-12-30T18:13:10.063' AS DateTime), N'admin', CAST(N'2024-12-30T18:13:10.063' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (38, 12, N'tham-lot-san-nha-cao-cap%20(3).jpg', N'/Data/Images/banner/tham-trai-san-kho-lon%20(1).jpg', 0, N'admin', CAST(N'2024-12-30T18:13:10.063' AS DateTime), N'admin', CAST(N'2024-12-30T18:13:10.063' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (39, 13, N'tham-tron-2m-bong-hoa-3.jpg', N'/Data/Images/banner/tham-tron-2m-bong-hoa-3.jpg', 1, N'admin', CAST(N'2024-12-30T18:14:57.300' AS DateTime), N'admin', CAST(N'2024-12-30T18:14:57.300' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (40, 13, N'tham-tron-2m-bong-hoa-3.jpg', N'/Data/Images/banner/tham-tron-2m-bong-hoa-2.jpg', 0, N'admin', CAST(N'2024-12-30T18:14:57.300' AS DateTime), N'admin', CAST(N'2024-12-30T18:14:57.300' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (41, 14, N'10-mau-tham-lot-san.jpg', N'/Data/Images/banner/10-mau-tham-lot-san.jpg', 1, N'admin', CAST(N'2024-12-30T18:16:12.830' AS DateTime), N'admin', CAST(N'2024-12-30T18:16:12.830' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (42, 14, N'10-mau-tham-lot-san.jpg', N'/Data/Images/banner/10-mau-tham-lot.jpg', 0, N'admin', CAST(N'2024-12-30T18:16:12.830' AS DateTime), N'admin', CAST(N'2024-12-30T18:16:12.830' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (43, 15, N'ban-go-van-phong.jpg', N'/Data/Images/banner/ban-go-van-phong.jpg', 1, N'admin', CAST(N'2024-12-30T18:17:02.353' AS DateTime), N'admin', CAST(N'2024-12-30T18:17:02.353' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (44, 16, N'product-10-1.jpg', N'/Data/Images/SanPham/product-10-1.jpg', 1, N'admin', CAST(N'2024-12-30T18:19:43.290' AS DateTime), N'admin', CAST(N'2024-12-30T18:19:43.290' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (45, 16, N'product-10-1.jpg', N'/Data/Images/SanPham/product-10-2.jpg', 0, N'admin', CAST(N'2024-12-30T18:19:43.290' AS DateTime), N'admin', CAST(N'2024-12-30T18:19:43.290' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (46, 17, N'product-2-1.jpg', N'/Data/Images/SanPham/product-2-1.jpg', 1, N'admin', CAST(N'2024-12-30T18:20:37.833' AS DateTime), N'admin', CAST(N'2024-12-30T18:20:37.833' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (47, 17, N'product-2-1.jpg', N'/Data/Images/SanPham/product-2-2.jpg', 0, N'admin', CAST(N'2024-12-30T18:20:37.833' AS DateTime), N'admin', CAST(N'2024-12-30T18:20:37.833' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (48, 18, N'product-9-1.jpg', N'/Data/Images/SanPham/product-9-1.jpg', 1, N'admin', CAST(N'2024-12-30T18:24:31.263' AS DateTime), N'admin', CAST(N'2024-12-30T18:24:31.263' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (49, 18, N'product-9-1.jpg', N'/Data/Images/SanPham/product-6-1.jpg', 0, N'admin', CAST(N'2024-12-30T18:24:31.263' AS DateTime), N'admin', CAST(N'2024-12-30T18:24:31.263' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (50, 19, N'chaulan.jpg', N'/Data/Images/SanPham/chaulan.jpg', 0, N'admin', CAST(N'2024-12-30T18:29:49.893' AS DateTime), N'admin', CAST(N'2024-12-30T18:29:49.893' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (51, 20, N'cay-bach-ma-hoang-tu.jpg', N'/Data/Images/SanPham/cay-bach-ma-hoang-tu.jpg', 1, N'admin', CAST(N'2024-12-30T18:30:53.720' AS DateTime), N'admin', CAST(N'2024-12-30T18:30:53.720' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (52, 19, N'chau%20hoa.jpg', N'/Data/Images/SanPham/chau%20hoa.jpg', 1, N'admin', CAST(N'2024-12-30T18:32:22.337' AS DateTime), N'admin', CAST(N'2024-12-30T18:32:22.337' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (53, 21, N'tranh-treo-tuong-phong-canh-non-nuoc-25084.jpg', N'/Data/Images/banner/tranh-treo-tuong-phong-canh-non-nuoc-25084.jpg', 1, N'admin', CAST(N'2024-12-30T18:34:57.143' AS DateTime), N'admin', CAST(N'2024-12-30T18:34:57.143' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (54, 22, N'tranh-treo-tuong-phong-canh-thien-nhien-25092.jpg', N'/Data/Images/banner/tranh-treo-tuong-phong-canh-thien-nhien-25092.jpg', 1, N'admin', CAST(N'2024-12-30T18:35:59.567' AS DateTime), N'admin', CAST(N'2024-12-30T18:35:59.567' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (55, 23, N'dongho.jpg', N'/Data/Images/SanPham/dongho.jpg', 1, N'admin', CAST(N'2024-12-30T18:40:24.993' AS DateTime), N'admin', CAST(N'2024-12-30T18:40:24.993' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (56, 23, N'dongho.jpg', N'/Data/Images/SanPham/images%20(42).jpg', 0, N'admin', CAST(N'2024-12-30T18:40:24.993' AS DateTime), N'admin', CAST(N'2024-12-30T18:40:24.993' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (57, 24, N'phong_khach_ksg268.jpg', N'/Data/Images/SanPham/phong_khach_ksg268.jpg', 1, N'admin', CAST(N'2024-12-30T18:44:05.263' AS DateTime), N'admin', CAST(N'2024-12-30T18:44:05.263' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (58, 25, N'tu-ke-trang-tri-phong-khach-2927.jpg', N'/Data/Images/SanPham/tu-ke-trang-tri-phong-khach-2927.jpg', 1, N'admin', CAST(N'2024-12-30T18:45:02.843' AS DateTime), N'admin', CAST(N'2024-12-30T18:45:02.843' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (59, 4, N'images%20(38).jpg', N'/Data/Images/SanPham/images%20(38).jpg', 0, N'admin', CAST(N'2025-01-06T13:15:39.327' AS DateTime), N'admin', CAST(N'2025-01-06T13:15:39.327' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (60, 26, N'hoa.jpg', N'/Data/Images/SanPham/hoa.jpg', 1, N'admin', CAST(N'2025-01-06T13:18:37.720' AS DateTime), N'admin', CAST(N'2025-01-06T13:18:37.720' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (61, 27, N'cmg734.jpg', N'/Data/Images/SanPham/cmg734.jpg', 1, N'admin', CAST(N'2025-01-06T13:20:22.980' AS DateTime), N'admin', CAST(N'2025-01-06T13:20:22.980' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (62, 27, N'cmg.jpg', N'/Data/Images/SanPham/cmg.jpg', 0, N'admin', CAST(N'2025-01-06T13:20:39.130' AS DateTime), N'admin', CAST(N'2025-01-06T13:20:39.130' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (63, 28, N'den-op-tran-hinh-to-ong-sang-tao-yht072-13.jpg', N'/Data/Images/banner/den-op-tran-hinh-to-ong-sang-tao-yht072-13.jpg', 1, N'admin', CAST(N'2025-01-06T13:22:37.697' AS DateTime), N'admin', CAST(N'2025-01-06T13:22:37.697' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (64, 29, N'tranh-treo-tuong-con-thuyen-tren-ho-nuoc-25076.jpg', N'/Data/Images/banner/tranh-treo-tuong-con-thuyen-tren-ho-nuoc-25076.jpg', 1, N'admin', CAST(N'2025-01-06T13:24:11.690' AS DateTime), N'admin', CAST(N'2025-01-06T13:24:11.690' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (65, 30, N'dong-ho-decor-gan-tuong.jpg', N'/Data/Images/banner/dong-ho-decor-gan-tuong.jpg', 1, N'admin', CAST(N'2025-01-06T13:25:08.040' AS DateTime), N'admin', CAST(N'2025-01-06T13:25:08.040' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (66, 31, N'tu-ho-so-tg-12-00_823.jpg', N'/Data/Images/banner/tu-ho-so-tg-12-00_823.jpg', 1, N'admin', CAST(N'2025-01-06T13:26:43.907' AS DateTime), N'admin', CAST(N'2025-01-06T13:26:43.907' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (67, 32, N'dong-ho-trang-tri-cao.jpg', N'/Data/Images/banner/dong-ho-trang-tri-cao.jpg', 1, N'admin', CAST(N'2025-01-06T13:27:53.357' AS DateTime), N'admin', CAST(N'2025-01-06T13:27:53.357' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Name], [Path], [IsDefault], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (68, 33, N'ke-goc-tuong-co-ngan-tu-go-cao-su-1a.jpg', N'/Data/Images/banner/ke-goc-tuong-co-ngan-tu-go-cao-su-1a.jpg', 1, N'admin', CAST(N'2025-01-06T13:29:43.163' AS DateTime), N'admin', CAST(N'2025-01-06T13:29:43.163' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ProductImage] OFF
GO
SET IDENTITY_INSERT [dbo].[Review] ON 
GO
INSERT [dbo].[Review] ([ID], [ProductID], [Username], [EmailRate], [Rate], [Detail], [CreateDate], [UpdateDate]) VALUES (1, 15, N'Nguyen Minh Tai', N'tuyetchungkhoi@gmail.com', 3, N'eeeee', CAST(N'2025-01-01T21:09:21.760' AS DateTime), CAST(N'2025-01-01T21:09:21.763' AS DateTime))
GO
INSERT [dbo].[Review] ([ID], [ProductID], [Username], [EmailRate], [Rate], [Detail], [CreateDate], [UpdateDate]) VALUES (2, 15, N'Nguyen Minh Tai', N'tuyetchungkhoi@gmail.com', 1, N'rferfreferf', CAST(N'2025-01-01T21:09:52.603' AS DateTime), CAST(N'2025-01-01T21:09:52.603' AS DateTime))
GO
INSERT [dbo].[Review] ([ID], [ProductID], [Username], [EmailRate], [Rate], [Detail], [CreateDate], [UpdateDate]) VALUES (3, 15, N'Nguyen Minh Tai', N'tuyetchungkhoi@gmail.com', 5, N'rẻertertertr', CAST(N'2025-01-01T21:10:04.150' AS DateTime), CAST(N'2025-01-01T21:10:04.150' AS DateTime))
GO
INSERT [dbo].[Review] ([ID], [ProductID], [Username], [EmailRate], [Rate], [Detail], [CreateDate], [UpdateDate]) VALUES (4, 15, N'Nguyen Minh Tai', N'tuyetchungkhoi@gmail.com', 5, N'rẻertertertr', CAST(N'2025-01-01T21:10:04.740' AS DateTime), CAST(N'2025-01-01T21:10:04.740' AS DateTime))
GO
INSERT [dbo].[Review] ([ID], [ProductID], [Username], [EmailRate], [Rate], [Detail], [CreateDate], [UpdateDate]) VALUES (5, 15, N'Nguyen Minh Tai', N'tuyetchungkhoi@gmail.com', 5, N'444', CAST(N'2025-01-01T21:10:20.890' AS DateTime), CAST(N'2025-01-01T21:10:20.890' AS DateTime))
GO
INSERT [dbo].[Review] ([ID], [ProductID], [Username], [EmailRate], [Rate], [Detail], [CreateDate], [UpdateDate]) VALUES (6, 6, N'Nguyen Minh Tai', N'tuyetchungkhoi@gmail.com', 3, N'444', CAST(N'2025-01-02T08:19:38.400' AS DateTime), CAST(N'2025-01-02T08:19:38.400' AS DateTime))
GO
INSERT [dbo].[Review] ([ID], [ProductID], [Username], [EmailRate], [Rate], [Detail], [CreateDate], [UpdateDate]) VALUES (7, 25, N'Nguyen Minh Tai', N'tuyetchungkhoi@gmail.com', 5, N'444', CAST(N'2025-01-02T08:44:13.187' AS DateTime), CAST(N'2025-01-02T08:44:13.187' AS DateTime))
GO
INSERT [dbo].[Review] ([ID], [ProductID], [Username], [EmailRate], [Rate], [Detail], [CreateDate], [UpdateDate]) VALUES (8, 10, N'Nguyen Minh Tai', N'tuyetchungkhoi@gmail.com', 5, N'123', CAST(N'2025-01-03T09:56:25.283' AS DateTime), CAST(N'2025-01-03T09:56:25.283' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
SET IDENTITY_INSERT [dbo].[Slide] ON 
GO
INSERT [dbo].[Slide] ([ID], [Name], [Image], [Status], [Position], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (1, N'Slide1', N'/Data/Images/banner/slide-1(1).jpg', 1, 1, N'admin', CAST(N'2024-12-30T12:06:19.410' AS DateTime), N'admin', CAST(N'2024-12-30T12:06:19.410' AS DateTime))
GO
INSERT [dbo].[Slide] ([ID], [Name], [Image], [Status], [Position], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (2, N'Slide2', N'/Assets/client/images/slider/slide-2.jpg', 1, 2, N'admin', CAST(N'2024-12-30T12:07:45.330' AS DateTime), N'admin', CAST(N'2024-12-30T12:07:45.330' AS DateTime))
GO
INSERT [dbo].[Slide] ([ID], [Name], [Image], [Status], [Position], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (3, N'Slide3', N'/Assets/client/images/slider/slide-3.jpg', 1, 3, N'admin', CAST(N'2024-12-30T12:08:08.140' AS DateTime), N'admin', CAST(N'2024-12-30T12:08:08.140' AS DateTime))
GO
INSERT [dbo].[Slide] ([ID], [Name], [Image], [Status], [Position], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (4, N'Silde 4', N'/Data/Images/SanPham/images%20(37).jpg', 0, 9, N'admin', CAST(N'2025-01-04T07:07:34.273' AS DateTime), N'admin', CAST(N'2025-01-04T07:07:34.273' AS DateTime))
GO
INSERT [dbo].[Slide] ([ID], [Name], [Image], [Status], [Position], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (5, N'Slide 5', N'/Data/Images/blog/post-2.jpg', 0, 9, N'admin', CAST(N'2025-01-06T20:25:22.833' AS DateTime), N'admin', CAST(N'2025-01-06T20:25:22.833' AS DateTime))
GO
INSERT [dbo].[Slide] ([ID], [Name], [Image], [Status], [Position], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (6, N'Silde 6', N'/Data/Images/blog/c1tint.jpg', 0, 77, N'admin', CAST(N'2025-01-06T20:25:37.507' AS DateTime), N'admin', CAST(N'2025-01-06T20:25:37.507' AS DateTime))
GO
INSERT [dbo].[Slide] ([ID], [Name], [Image], [Status], [Position], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (7, N'Silde 78', N'/Data/Images/blog/tin-t.png', 0, 12, N'admin', CAST(N'2025-01-06T20:25:55.170' AS DateTime), N'admin', CAST(N'2025-01-06T20:25:55.170' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Slide] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 
GO
INSERT [dbo].[Supplier] ([ID], [Name], [Email], [Phone], [Address], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (1, N'Tôn Hoa Sen', N'tuyetchungkhoi123@gmail.com', N'0702347998', N'Huế', N'admin', CAST(N'2024-12-26T15:08:45.217' AS DateTime), N'admin', CAST(N'2024-12-26T15:08:59.487' AS DateTime))
GO
INSERT [dbo].[Supplier] ([ID], [Name], [Email], [Phone], [Address], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (3, N'Marcel Furniture', N'ntoan0661@gmail.com', N'0971577370', N' Số 3, Ngõ 18 Xã Thạch Xá, Huyện Thạch Thất, Hà Nội', N'admin', CAST(N'2024-12-30T19:16:21.827' AS DateTime), N'admin', CAST(N'2024-12-30T19:16:21.827' AS DateTime))
GO
INSERT [dbo].[Supplier] ([ID], [Name], [Email], [Phone], [Address], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (4, N'Nội thất minh tiến', N'toanvu359888@gmail.com', N'0908359888', N'Tầng 2, Lakeview 1, 19 Tố Hữu, Phường Thủ Thiêm, TP. Thủ Đức, TP. Hồ Chí Minh (TPHCM)', N'admin', CAST(N'2024-12-30T19:17:23.960' AS DateTime), N'admin', CAST(N'2024-12-30T19:17:23.960' AS DateTime))
GO
INSERT [dbo].[Supplier] ([ID], [Name], [Email], [Phone], [Address], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (5, N'Rồng Phương Nam', N'NoiThat190.Sales@gmail.com', N'0967913389', N'Số 2, Đường Phú Thuận, Khu Dân Cư Tấn Trường, P. Phú Thuận, Q. 7, TP. Hồ Chí Minh (TPHCM)', N'admin', CAST(N'2024-12-30T19:18:23.750' AS DateTime), N'admin', CAST(N'2024-12-30T19:18:23.750' AS DateTime))
GO
INSERT [dbo].[Supplier] ([ID], [Name], [Email], [Phone], [Address], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (6, N'Nội Thất Việt', N'noithatviet1112@gmail.com', N'0989949395', N'Km 341 Quảng Lĩnh, Quảng Xương, Thanh Hóa', N'admin', CAST(N'2024-12-30T19:19:34.263' AS DateTime), N'admin', CAST(N'2024-12-30T19:19:34.263' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
INSERT [dbo].[UserGroup] ([ID], [Name], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (N'ADMIN', N'Admin', N'admin', CAST(N'2024-12-26T10:46:30.830' AS DateTime), N'admin', CAST(N'2024-12-26T10:46:30.830' AS DateTime))
GO
INSERT [dbo].[UserGroup] ([ID], [Name], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (N'CUSTOMER', N'Customer', N'admin', CAST(N'2024-12-26T10:46:49.350' AS DateTime), N'admin', CAST(N'2024-12-26T10:46:49.350' AS DateTime))
GO
INSERT [dbo].[UserGroup] ([ID], [Name], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (N'EMPLOYEE', N'Employee', N'admin', CAST(N'2024-12-26T10:47:07.273' AS DateTime), N'admin', CAST(N'2024-12-26T10:47:07.273' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (1, N'admin', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Minh Tài', N'admin@gmail.com', N'/Data/Images/avatar1.png', 1, NULL, N'0000000', N'ADMIN', 1, N'admin', CAST(N'2024-12-26T10:53:06.863' AS DateTime), N'customer', CAST(N'2024-12-27T18:59:52.450' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (2, N'customer', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyen Minh Tai', N'tuyetchungkhoi@gmail.com', N'/Data/Images/avatar3.png', 1, N'Khánh Hòa', N'0702347998', N'CUSTOMER', 1, N'admin', CAST(N'2024-12-26T10:53:06.863' AS DateTime), N'admin', CAST(N'2024-12-26T10:53:06.863' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (3, N'employee', N'e10adc3949ba59abbe56e057f20f883e', N'Hai bà Trưng', N'khunglongem@gmail.com', N'/Data/Images/avatar2.png', 1, N'Huế', N'4938232635', N'EMPLOYEE', 1, N'admin', CAST(N'2024-12-26T10:53:38.653' AS DateTime), N'admin', CAST(N'2025-01-06T20:11:24.860' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (4, N'minhtai', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Minh Thọ', N'minhtai123@gmail.com', N'/Data/images/02a4891e-9c4a-48f4-9855-972b0cfd2fa6.jpg', 1, N'Khánh Hòa', N'0702347998', N'ADMIN', 1, N'customer', CAST(N'2024-12-28T08:22:37.843' AS DateTime), N'minhtai', CAST(N'2025-01-01T12:57:52.710' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (5, N'minhtho', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyen Minh A', N'nguyenminha@gmail.com', N'/Data/Images/cute1.png', 0, N'Khánh Hòa', N'0702347998', N'CUSTOMER', 1, N'minhtho', CAST(N'2025-01-02T10:09:37.713' AS DateTime), N'admin', CAST(N'2025-01-06T20:10:22.020' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (6, N'minhvana', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Vân A', N'nguyenvana@gmail.com', N'/Data/images/69f90115-f670-494c-98ec-62eb0b4220fc.jpg', 1, N'Khánh Hòa', N'0702347998', N'CUSTOMER', 1, N'minhtaivip123', CAST(N'2025-01-03T09:25:35.650' AS DateTime), N'admin', CAST(N'2025-01-06T20:09:51.363' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (7, N'vanhien', N'e10adc3949ba59abbe56e057f20f883e', N'Lưu Văn Hiến', N'vanhien@gmail.com', N'/Data/Images/avatar3.png', 1, N'Khánh Hòa', N'0702347998', N'CUSTOMER', 1, N'minhthu', CAST(N'2025-01-03T09:26:24.147' AS DateTime), N'admin', CAST(N'2025-01-06T20:11:05.200' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (8, N'minhthien', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Minh Thiên', N'minhthien@gmail.com', N'/Data/Images/cute3.png', 1, N'Khánh Hòa', N'0702347998', N'CUSTOMER', 1, N'minhthien', CAST(N'2025-01-03T09:27:55.840' AS DateTime), N'admin', CAST(N'2025-01-06T20:09:10.847' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (9, N'Tranthanh', N'e10adc3949ba59abbe56e057f20f883e', N'Trần Thành', N'tuyetchungkhoi4444@gmail.com', N'/Data/Images/SanPham/cay-bach-ma-hoang-tu.jpg', 1, N'Khánh Hòa', N'0702347998', N'EMPLOYEE', 1, N'111111', CAST(N'2025-01-03T09:29:31.317' AS DateTime), N'admin', CAST(N'2025-01-06T20:08:42.747' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (10, N'tranthihong', N'e10adc3949ba59abbe56e057f20f883e', N'Trần Thị Hồng', N'tranthihong@gmail.com', N'/Data/Images/cute1.png', 0, N'Bình Dương', N'0487364463', N'ADMIN', 1, N'admin', CAST(N'2025-01-06T20:12:36.707' AS DateTime), N'admin', CAST(N'2025-01-06T20:12:36.707' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (11, N'thuminhha', N'e10adc3949ba59abbe56e057f20f883e', N'Thu Minh Hà', N'thuminha@gmail.com', N'/Data/Images/cute2.png', 0, N'Huế', N'0324737433', N'EMPLOYEE', 1, N'admin', CAST(N'2025-01-06T20:13:29.887' AS DateTime), N'admin', CAST(N'2025-01-06T20:13:29.887' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (12, N'tranmanh', N'e10adc3949ba59abbe56e057f20f883e', N'Trần Mạnh', N'tranmanh@gmail.com', N'/Data/Images/02a4891e-9c4a-48f4-9855-972b0cfd2fa6.jpg', 1, N'Hà Nội', N'032938473', N'CUSTOMER', 1, N'admin', CAST(N'2025-01-06T20:14:32.410' AS DateTime), N'admin', CAST(N'2025-01-06T20:14:32.410' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (13, N'tranmanhquy', N'e10adc3949ba59abbe56e057f20f883e', N'Trần Mạnh Quy', N'tranmanh@gmail.com', N'/Data/Images/02a4891e-9c4a-48f4-9855-972b0cfd2fa6.jpg', 1, N'Hà Nội', N'032938473', N'CUSTOMER', 1, N'admin', CAST(N'2025-01-06T20:14:51.573' AS DateTime), N'admin', CAST(N'2025-01-06T20:14:51.573' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (14, N'lubo', N'e10adc3949ba59abbe56e057f20f883e', N'Lữ Bố', N'lubo@gmail.com', N'/Data/Images/avatar2.png', 1, N'Đà Nẵng', N'05453454443', N'CUSTOMER', 1, N'admin', CAST(N'2025-01-06T20:15:51.160' AS DateTime), N'admin', CAST(N'2025-01-06T20:15:51.160' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (15, N'Luubi', N'e10adc3949ba59abbe56e057f20f883e', N'Lưu Bị', N'luubi@gmail.com', N'/Data/Images/avatar3.png', 1, N'Phú Thọ', N'076765664', N'CUSTOMER', 1, N'admin', CAST(N'2025-01-06T20:16:40.870' AS DateTime), N'admin', CAST(N'2025-01-06T20:16:40.870' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (16, N'TrieuVan', N'e10adc3949ba59abbe56e057f20f883e', N'trieuvan', N'trieuvan@gmail.com', N'/Data/Images/avatar1.png', 1, N'huế', N'098765555', N'CUSTOMER', 1, N'admin', CAST(N'2025-01-06T20:17:33.817' AS DateTime), N'admin', CAST(N'2025-01-06T20:17:33.817' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (17, N'nguyA', N'e10adc3949ba59abbe56e057f20f883e', N'nguyA', N'nguyA@gmail.com', N'/Data/Images/beach.png', 1, N'Huế', N'09436777', N'CUSTOMER', 1, N'admin', CAST(N'2025-01-06T20:18:15.120' AS DateTime), N'admin', CAST(N'2025-01-06T20:18:15.120' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (18, N'sieunhan', N'e10adc3949ba59abbe56e057f20f883e', N'Siêu Nhân', N'sieunhan@gmail.com', N'/Data/Images/food_11.png', 1, N'Huế', N'0305485745', N'ADMIN', 1, N'admin', CAST(N'2025-01-06T20:19:14.877' AS DateTime), N'admin', CAST(N'2025-01-06T20:19:14.877' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (19, N'MinhThi', N'e10adc3949ba59abbe56e057f20f883e', N'Minh Thi', N'minhthi@gmail.com', N'/Data/Images/coins.png', 1, N'Huế', N'09876543', N'CUSTOMER', 1, N'admin', CAST(N'2025-01-06T20:19:48.450' AS DateTime), N'admin', CAST(N'2025-01-06T20:19:48.450' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (20, N'Tranchi', N'e10adc3949ba59abbe56e057f20f883e', N'Trần Chí', N'tranchi@gmail.com', N'/Data/Images/cute3.png', 1, N'Huế', N'0987654', N'CUSTOMER', 1, N'admin', CAST(N'2025-01-06T20:21:19.257' AS DateTime), N'admin', CAST(N'2025-01-06T20:21:19.257' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (21, N'nguyentran', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyên Trần', N'nguyentran@gmail.com', N'/Data/Images/food_2.png', 1, N'Huế', N'065987463', N'CUSTOMER', 1, N'admin', CAST(N'2025-01-06T20:22:17.150' AS DateTime), N'admin', CAST(N'2025-01-06T20:22:17.150' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (22, N'tranA', N'e10adc3949ba59abbe56e057f20f883e', N'Trần A', N'trana@gmail.com', N'/Data/Images/food_2.png', 1, N'Huế', N'9877987644', N'CUSTOMER', 1, N'admin', CAST(N'2025-01-06T20:22:59.583' AS DateTime), N'admin', CAST(N'2025-01-06T20:22:59.583' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (23, N'tranb', N'e10adc3949ba59abbe56e057f20f883e', N'Trần B', N'tranb@gmail.com', N'/Data/Images/cute2.png', 1, N'Huế', N'0987659876', N'CUSTOMER', 1, N'admin', CAST(N'2025-01-06T20:23:28.047' AS DateTime), N'admin', CAST(N'2025-01-06T20:23:28.047' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (24, N'tranc', N'e10adc3949ba59abbe56e057f20f883e', N'trần c', N'tranc@gmail.com', N'/Data/Images/avatar3.png', 1, N'Huế', N'0987898765', N'CUSTOMER', 0, N'admin', CAST(N'2025-01-06T20:24:13.817' AS DateTime), N'admin', CAST(N'2025-01-06T20:24:13.817' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (25, N'trand', N'e10adc3949ba59abbe56e057f20f883e', N'Trần D', N'trand@gmail.com', N'/Data/Images/food_3.png', 1, N'Huế', N'598760987', N'ADMIN', 1, N'admin', CAST(N'2025-01-06T20:31:15.887' AS DateTime), N'admin', CAST(N'2025-01-06T20:31:15.887' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (26, N'trandr', N'e10adc3949ba59abbe56e057f20f883e', N'Trần Dr', N'trandr@gmail.com', N'/Data/Images/food_3.png', 1, N'Huế', N'598760987', N'ADMIN', 1, N'admin', CAST(N'2025-01-06T20:31:26.610' AS DateTime), N'admin', CAST(N'2025-01-06T20:31:26.610' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (27, N'tranminh', N'e10adc3949ba59abbe56e057f20f883e', N'Trần Minh', N'tranminh@gmail.com', N'/Data/Images/avatar1.png', 1, N'Huế', N'056786543', N'CUSTOMER', 1, N'admin', CAST(N'2025-01-06T20:32:29.193' AS DateTime), N'admin', CAST(N'2025-01-06T20:32:29.193' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (28, N'Thienta', N'e10adc3949ba59abbe56e057f20f883e', N'Thiên Tà', N'thientai@gmail.com', N'/Data/Images/02a4891e-9c4a-48f4-9855-972b0cfd2fa6.jpg', 1, N'Huế', N'058876543', N'CUSTOMER', 1, N'admin', CAST(N'2025-01-06T20:33:19.367' AS DateTime), N'admin', CAST(N'2025-01-06T20:33:19.367' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (29, N'Tranthanhthi', N'e10adc3949ba59abbe56e057f20f883e', N'Trân Thành Thi', N'tranthanh@gmail.com', N'/Data/Images/avatar1.png', 1, N'Huế', N'0456787654', N'EMPLOYEE', 1, N'admin', CAST(N'2025-01-06T20:34:24.997' AS DateTime), N'admin', CAST(N'2025-01-06T20:34:24.997' AS DateTime))
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Fullname], [Email], [Image], [Gender], [Address], [Phone], [GroupID], [Status], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate]) VALUES (30, N'Vanminh', N'e10adc3949ba59abbe56e057f20f883e', N'Văn Minh', N'vanminh@gmail.com', N'/Data/Images/69f90115-f670-494c-98ec-62eb0b4220fc.jpg', 1, N'Huế', N'0466587654', N'CUSTOMER', 1, N'admin', CAST(N'2025-01-06T20:35:11.687' AS DateTime), N'admin', CAST(N'2025-01-06T20:35:11.687' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Wishlist] ON 
GO
INSERT [dbo].[Wishlist] ([ID], [ProductID], [Username], [CreateDate]) VALUES (3, 23, N'customer', CAST(N'2025-01-03T17:42:14.360' AS DateTime))
GO
INSERT [dbo].[Wishlist] ([ID], [ProductID], [Username], [CreateDate]) VALUES (4, 22, N'customer', CAST(N'2025-01-03T18:22:28.597' AS DateTime))
GO
INSERT [dbo].[Wishlist] ([ID], [ProductID], [Username], [CreateDate]) VALUES (5, 4, N'customer', CAST(N'2025-01-03T18:36:47.477' AS DateTime))
GO
INSERT [dbo].[Wishlist] ([ID], [ProductID], [Username], [CreateDate]) VALUES (6, 7, N'customer', CAST(N'2025-01-03T18:36:49.787' AS DateTime))
GO
INSERT [dbo].[Wishlist] ([ID], [ProductID], [Username], [CreateDate]) VALUES (7, 4, N'minhtaivip123', CAST(N'2025-01-06T13:30:43.843' AS DateTime))
GO
INSERT [dbo].[Wishlist] ([ID], [ProductID], [Username], [CreateDate]) VALUES (8, 32, N'minhtaivip123', CAST(N'2025-01-06T16:06:33.290' AS DateTime))
GO
INSERT [dbo].[Wishlist] ([ID], [ProductID], [Username], [CreateDate]) VALUES (9, 30, N'minhtaivip123', CAST(N'2025-01-06T16:06:35.130' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Wishlist] OFF
GO
ALTER TABLE [dbo].[About] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[About] ADD  DEFAULT ('admin') FOR [CreateBy]
GO
ALTER TABLE [dbo].[About] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[About] ADD  DEFAULT ('admin') FOR [UpdateBy]
GO
ALTER TABLE [dbo].[About] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF__Contact__Status__32AB8735]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF__Contact__CreateB__339FAB6E]  DEFAULT ('admin') FOR [CreateBy]
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF__Contact__CreateD__3493CFA7]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF__Contact__UpdateB__3587F3E0]  DEFAULT ('admin') FOR [UpdateBy]
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF__Contact__UpdateD__367C1819]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT ('admin') FOR [CreateBy]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT ('admin') FOR [UpdateBy]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF__Menu__Status__236943A5]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF__Menu__CreateBy__25518C17]  DEFAULT ('admin') FOR [CreateBy]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF__Menu__CreateDate__2645B050]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF__Menu__UpdateBy__2739D489]  DEFAULT ('admin') FOR [UpdateBy]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF__Menu__UpdateDate__282DF8C2]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF__OrderDeta__Price__01142BA1]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF__OrderDeta__Quant__02084FDA]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF__OrderDeta__Statu__02FC7413]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF__Orders__OrderDat__797309D9]  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF__Orders__Status__7A672E12]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Ship]  DEFAULT ((0)) FOR [Ship]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF__Orders__TotalAmo__7C4F7684]  DEFAULT ((0)) FOR [TotalAmount]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF__Orders__TypePaym__7D439ABD]  DEFAULT ((0)) FOR [TypePayment]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Note]  DEFAULT (N'Đặt hàng') FOR [Note]
GO
ALTER TABLE [dbo].[Post] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Post] ADD  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[Post] ADD  DEFAULT ('admin') FOR [CreateBy]
GO
ALTER TABLE [dbo].[Post] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Post] ADD  DEFAULT ('admin') FOR [UpdateBy]
GO
ALTER TABLE [dbo].[Post] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[PostCategory] ADD  CONSTRAINT [DF__PostCateg__Statu__07C12930]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[PostCategory] ADD  CONSTRAINT [DF__PostCatego__Sort__08B54D69]  DEFAULT ((0)) FOR [Sort]
GO
ALTER TABLE [dbo].[PostCategory] ADD  CONSTRAINT [DF__PostCateg__Creat__09A971A2]  DEFAULT ('admin') FOR [CreateBy]
GO
ALTER TABLE [dbo].[PostCategory] ADD  CONSTRAINT [DF__PostCateg__Creat__0A9D95DB]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[PostCategory] ADD  CONSTRAINT [DF__PostCateg__Updat__0B91BA14]  DEFAULT ('admin') FOR [UpdateBy]
GO
ALTER TABLE [dbo].[PostCategory] ADD  CONSTRAINT [DF__PostCateg__Updat__0C85DE4D]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__Status__5DCAEF64]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__Price__5EBF139D]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__Promoti__5FB337D6]  DEFAULT ((0)) FOR [PromotionPrice]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__VAT__60A75C0F]  DEFAULT ((0)) FOR [VAT]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__Quantit__619B8048]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__Warrant__628FA481]  DEFAULT ((0)) FOR [Warranty]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_IsSale]  DEFAULT ((0)) FOR [IsSale]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__ViewCou__6383C8BA]  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__CreateB__6477ECF3]  DEFAULT ('admin') FOR [CreateBy]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__CreateD__656C112C]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__UpdateB__66603565]  DEFAULT ('admin') FOR [UpdateBy]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__UpdateD__6754599E]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF__ProductCa__Statu__5629CD9C]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF__ProductCat__Sort__571DF1D5]  DEFAULT ((0)) FOR [Sort]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF__ProductCa__Creat__5812160E]  DEFAULT ('admin') FOR [CreateBy]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF__ProductCa__Creat__59063A47]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF__ProductCa__Updat__59FA5E80]  DEFAULT ('admin') FOR [UpdateBy]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF__ProductCa__Updat__5AEE82B9]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[ProductImage] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[ProductImage] ADD  DEFAULT ('admin') FOR [CreateBy]
GO
ALTER TABLE [dbo].[ProductImage] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[ProductImage] ADD  DEFAULT ('admin') FOR [UpdateBy]
GO
ALTER TABLE [dbo].[ProductImage] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[Review] ADD  DEFAULT ((0)) FOR [Rate]
GO
ALTER TABLE [dbo].[Review] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Review] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[Slide] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Slide] ADD  DEFAULT ((0)) FOR [Position]
GO
ALTER TABLE [dbo].[Slide] ADD  DEFAULT ('admin') FOR [CreateBy]
GO
ALTER TABLE [dbo].[Slide] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Slide] ADD  DEFAULT ('admin') FOR [UpdateBy]
GO
ALTER TABLE [dbo].[Slide] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[Supplier] ADD  DEFAULT ('admin') FOR [CreateBy]
GO
ALTER TABLE [dbo].[Supplier] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Supplier] ADD  DEFAULT ('admin') FOR [UpdateBy]
GO
ALTER TABLE [dbo].[Supplier] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[UserGroup] ADD  DEFAULT ('admin') FOR [CreateBy]
GO
ALTER TABLE [dbo].[UserGroup] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[UserGroup] ADD  DEFAULT ('admin') FOR [UpdateBy]
GO
ALTER TABLE [dbo].[UserGroup] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [Gender]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users__GroupID__3E52440B]  DEFAULT ('CUSTOMER') FOR [GroupID]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('admin') FOR [CreateBy]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('admin') FOR [UpdateBy]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[Wishlist] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Order__03F0984C] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__Order__03F0984C]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Produ__04E4BC85] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__Produ__04E4BC85]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__Customer__7E37BEF6] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Users] ([ID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__Customer__7E37BEF6]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK__Post__CatePostID__151B244E] FOREIGN KEY([CatePostID])
REFERENCES [dbo].[PostCategory] ([ID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK__Post__CatePostID__151B244E]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__Categor__68487DD7] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ProductCategory] ([ID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__Categor__68487DD7]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__Supplie__693CA210] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__Supplie__693CA210]
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD  CONSTRAINT [FK__ProductIm__Produ__70DDC3D8] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImage] CHECK CONSTRAINT [FK__ProductIm__Produ__70DDC3D8]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK__Review__ProductI__76969D2E] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK__Review__ProductI__76969D2E]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([GroupID])
REFERENCES [dbo].[UserGroup] ([ID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK__Wishlist__Produc__208CD6FA] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK__Wishlist__Produc__208CD6FA]
GO
ALTER TABLE Orders ADD DeliveryDate DATETIME NULL;

