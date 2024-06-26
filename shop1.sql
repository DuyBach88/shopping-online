USE [ShoppingDB]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 6/25/2024 10:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[account_id] [int] NOT NULL,
	[email] [varchar](255) NOT NULL,
	[first_name] [nvarchar](255) NOT NULL,
	[last_name] [nvarchar](255) NOT NULL,
	[phone] [varchar](25) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[account_image] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[is_admin] [bit] NULL,
	[active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brands]    Script Date: 6/25/2024 10:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brands](
	[brand_id] [int] NOT NULL,
	[brand_name] [nvarchar](100) NULL,
	[brand_phone] [varchar](50) NULL,
	[brand_email] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categorys]    Script Date: 6/25/2024 10:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categorys](
	[category_id] [int] NOT NULL,
	[category_name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_items]    Script Date: 6/25/2024 10:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_items](
	[item_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[discount] [int] NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 6/25/2024 10:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] NOT NULL,
	[account_id] [int] NOT NULL,
	[order_date] [datetime] NOT NULL,
	[recieve_date] [datetime] NULL,
	[status] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 6/25/2024 10:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [int] NOT NULL,
	[product_name] [nvarchar](255) NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[discount] [int] NULL,
	[category_id] [int] NOT NULL,
	[brand_id] [int] NOT NULL,
	[product_img] [nvarchar](255) NOT NULL,
	[date_added] [datetime] NOT NULL,
	[product_desc] [nvarchar](255) NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (1, N'nguyenvana@gmail.com', N'Cường', N'Trần', N'0383459560', N'123', N'vn-11134207-7r98o-lldqbe77u7cmfd.jpeg', N'Diễn Châu Nghệ An', 1, 1)
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (2, N'phamthib@gmail.com', N'Alice2', N'Smithi', N'0987654328', N'1234', N'vn-11134207-7qukw-limj0x32t5vw5d.jpeg', N'456 Elm Si', 0, 1)
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (3, N'linhDieuk@gmail.com', N'Bob', N'Johnson', N'05551234567', N'Johnson567', NULL, N'789 Oak St', 0, 1)
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (4, N'vuvane@gmail.com', N'Emily', N'Brown', N'05551234567', N'Brown543', NULL, N'101 Maple St', 0, 0)
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (5, N'hoangthif@gmail.com', N'Michael', N'Wilson', N'05551234567', N'Wilson9999', NULL, N'111 Pine St', 0, 1)
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (6, N'dovang@gmail.com', N'Sophia', N'Miller', N'05551234567', N'Miller4567', NULL, N'222 Cedar St', 0, 1)
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (7, N'nguyenthih@gmail.com', N'Oliver', N'Davis', N'01112223333', N'Davis333', NULL, N'333 Birch St', 0, 0)
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (8, N'phanvani@gmail.com', N'Emma', N'Lee', N'03334445555', N'Lee666', NULL, N'444 Walnut St', 0, 0)
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (9, N'yenchibithik@gmail.com', N'Liam', N'Moore', N'02221110000', N'Moore0', NULL, N'555 Redwood St', 0, 1)
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (10, N'ngoquangm@gmail.com', N'Ava', N'White', N'01233335555', N'White555', NULL, N'666 Spruce St', 0, 0)
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (11, N'cuongvans@gmail.com', N'Noah', N'Martinez', N'04444444444', N'Martinez444', NULL, N'777 Oakwood St', 0, 0)
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (12, N'nguyenquangr@gmail.com', N'Mia', N'Hernandez', N'0553387555', N'Mia555', NULL, N'888 Maplewood St', 0, 1)
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (13, N'tranthis@gmail.com', N'Ethan', N'Garcia', N'0664238666', N'Mia666', NULL, N'999 Cedarwood St', 0, 0)
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (14, N'dinhvant@gmail.com', N'Luna', N'Perez', N'07777777777', N'Perez777', NULL, N'1010 Piney St', 0, 0)
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (15, N'lythiu@gmail.com', N'William', N'Rodriguez', N'08888888888', N'Rodriguez888', NULL, N'1111 Birchwood St', 0, 1)
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (16, N'ngominhv@gmail.com', N'Chloe', N'Lopez', N'09999999999', N'Lopez999', NULL, N'1212 Walnutwood St', 0, 0)
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (17, N'vothi2003@gmail.com', N'Logan', N'Gonzalez', N'05555555555', N'Gonzalez55', NULL, N'1313 Redwoodwood St', 0, 0)
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (18, N'mythi2233@gmail.com', N'Sophia', N'Smith', N'03333333333', N'Smith333', NULL, N'1414 Sprucewood St', 0, 0)
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (19, N'minhvuong23@gmail.com', N'Liam', N'Brown', N'0446454444', N'Brown444', NULL, N'1515 Oakwoodwood St', 0, 1)
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (20, N'trungHieu11@gmail.com', N'Olivia', N'Davis', N'05553185555', N'Davis555', NULL, N'1616 Maplewoodwood St', 0, 0)
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (21, N'cuong2003@gmail.com', N'tran', N'cuong', N'09999999', N'CUONGTRAN2003@', NULL, NULL, 0, 0)
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (22, N'asas2@gmail.com', N'Johns', N'Trans', N'0383459560', N'Cuongtran2003@', N'vn-11134207-7qukw-lhx23jmp4khta2.jpeg', N'null', 0, 0)
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (23, N'trantrunghau2003@gmail.com', N'Hau', N'Tran', N'0383459534', N'Hautran2003@', NULL, NULL, 0, 0)
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (24, N'boytranvip2003@gmail.com', N'Cuong', N'Tran', N'03834595600', N'Cuongtran2003@', NULL, NULL, 0, 0)
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (25, N'cuongtvhe176258@fpt.edu.vn', N'Cuong', N'Tran', N'0383459560', N'Cuongtran123@', N'vn-11134207-7qukw-lhshacr4utoh47.jpeg', N'Dien thai, Dien chau, Nghe An', 0, 0)
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (26, N'khanhnguye2008@gmail.com', N'Cuong ', N'Tran', N'0123456784', N'Khanh123@', NULL, NULL, 0, 0)
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (27, N'cuongtran2003@gmail.com', N'Cường', N'Trần', N'0123456784', N'Cuongtran123@', N'vn-11134207-7qukw-lhx23jmp4khta2.jpeg', N'Thach hoa thach that', 0, 0)
INSERT [dbo].[accounts] ([account_id], [email], [first_name], [last_name], [phone], [password], [account_image], [address], [is_admin], [active]) VALUES (28, N'betonamu19@gmail.com', N'ad', N'ada', N'qu', N'12', NULL, NULL, 0, 0)
GO
INSERT [dbo].[brands] ([brand_id], [brand_name], [brand_phone], [brand_email], [address]) VALUES (1, N'Amand', N'123-456-7890', N'amand@gmail.com', N'123 Street, City, Albania')
INSERT [dbo].[brands] ([brand_id], [brand_name], [brand_phone], [brand_email], [address]) VALUES (2, N'CITY CYCLE', N'987-654-3210', N'citycycle@gmail.com', N'456 Avenue, Town, Australia')
INSERT [dbo].[brands] ([brand_id], [brand_name], [brand_phone], [brand_email], [address]) VALUES (3, N'Coolmate', N'555-123-4567', N'Coolmate22@gmail.com', N'789 Road, Village, Argentina')
INSERT [dbo].[brands] ([brand_id], [brand_name], [brand_phone], [brand_email], [address]) VALUES (4, N'DWIN', N'111-222-3333', N'Dwin10c@gmail.com', N'10 Lane, Suburb, Armenia')
INSERT [dbo].[brands] ([brand_id], [brand_name], [brand_phone], [brand_email], [address]) VALUES (5, N'Fila', N'193-531-6890', N'FilaBrand@gmail.com', N'4 Pine Road, Suburb, Canada')
INSERT [dbo].[brands] ([brand_id], [brand_name], [brand_phone], [brand_email], [address]) VALUES (6, N'HUSSIO', N'277-634-3210', N'Ghuu@gmail.com', N'6 Birch Circle, County, Colombia')
INSERT [dbo].[brands] ([brand_id], [brand_name], [brand_phone], [brand_email], [address]) VALUES (7, N'JBAGY', N'748-123-4237', N'jpagyHigh@gmail.com', N'789 Cedar Trail, District, Croatia')
INSERT [dbo].[brands] ([brand_id], [brand_name], [brand_phone], [brand_email], [address]) VALUES (8, N'Mecod', N'890-2245-3323', N'mecodsp@gmail.com', N'Willow Drive, Municipality, Denmark')
INSERT [dbo].[brands] ([brand_id], [brand_name], [brand_phone], [brand_email], [address]) VALUES (9, N'MonsterStreet', N'129-434-7843', N'monsters@gmail.com', N'9 Redwood Avenue, Province, Finland')
INSERT [dbo].[brands] ([brand_id], [brand_name], [brand_phone], [brand_email], [address]) VALUES (10, N'PARADOX', N'956-654-723', N'paraboxtt@gmail.com', N'456 Avenue, Municipality, Germany')
INSERT [dbo].[brands] ([brand_id], [brand_name], [brand_phone], [brand_email], [address]) VALUES (11, N'Ripofff', N'533-123-684', N'rifful@gmail.com', N'789 Road, Village, Indonesia')
INSERT [dbo].[brands] ([brand_id], [brand_name], [brand_phone], [brand_email], [address]) VALUES (12, N'SWE', N'189-242-3657', N'sweshopp@gmail.com', N'10 Lane, Suburb, Israel')
INSERT [dbo].[brands] ([brand_id], [brand_name], [brand_phone], [brand_email], [address]) VALUES (13, N'THATFARM', N'123-555-7120', N'thatFarm@gmail.com', N'123 Street 24 , City, Japan')
INSERT [dbo].[brands] ([brand_id], [brand_name], [brand_phone], [brand_email], [address]) VALUES (14, N'TORANO', N'558-763-879', N'toranoVip@gmail.com', N'246 Street, City Tokyo, Japan')
GO
INSERT [dbo].[categorys] ([category_id], [category_name]) VALUES (1, N'Áo gió')
INSERT [dbo].[categorys] ([category_id], [category_name]) VALUES (2, N'Hoodie')
INSERT [dbo].[categorys] ([category_id], [category_name]) VALUES (3, N'Jacket')
INSERT [dbo].[categorys] ([category_id], [category_name]) VALUES (4, N'Jeans')
INSERT [dbo].[categorys] ([category_id], [category_name]) VALUES (5, N'Polo')
INSERT [dbo].[categorys] ([category_id], [category_name]) VALUES (6, N'Quần Âu')
INSERT [dbo].[categorys] ([category_id], [category_name]) VALUES (7, N'Set')
INSERT [dbo].[categorys] ([category_id], [category_name]) VALUES (8, N'T-Shirt')
INSERT [dbo].[categorys] ([category_id], [category_name]) VALUES (9, N'Váy')
INSERT [dbo].[categorys] ([category_id], [category_name]) VALUES (10, N'Shirt')
GO
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (1, 1, 1, CAST(300000.00 AS Decimal(10, 2)), 5, 2)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (2, 1, 2, CAST(179000.00 AS Decimal(10, 2)), 2, 1)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (3, 2, 12, CAST(830000.00 AS Decimal(10, 2)), 20, 3)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (4, 2, 10, CAST(180000.00 AS Decimal(10, 2)), 14, 1)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (5, 2, 4, CAST(149000.00 AS Decimal(10, 2)), 9, 2)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (6, 3, 3, CAST(250000.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (7, 3, 2, CAST(179000.00 AS Decimal(10, 2)), 2, 1)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (8, 3, 9, CAST(670000.00 AS Decimal(10, 2)), 17, 4)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (9, 4, 8, CAST(190000.00 AS Decimal(10, 2)), 10, 2)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (10, 4, 6, CAST(178000.00 AS Decimal(10, 2)), 10, 2)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (11, 4, 3, CAST(250000.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (12, 5, 11, CAST(590000.00 AS Decimal(10, 2)), 27, 3)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (13, 5, 7, CAST(670000.00 AS Decimal(10, 2)), 26, 2)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (14, 5, 6, CAST(178000.00 AS Decimal(10, 2)), 10, 1)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (15, 6, 5, CAST(900000.00 AS Decimal(10, 2)), 10, 2)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (16, 6, 12, CAST(830000.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (17, 7, 5, CAST(900000.00 AS Decimal(10, 2)), 10, 2)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (18, 7, 11, CAST(590000.00 AS Decimal(10, 2)), 27, 1)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (19, 8, 5, CAST(900000.00 AS Decimal(10, 2)), 10, 3)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (20, 9, 1, CAST(300000.00 AS Decimal(10, 2)), 5, 3)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (21, 10, 5, CAST(900000.00 AS Decimal(10, 2)), 10, 1)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (22, 10, 13, CAST(199000.00 AS Decimal(10, 2)), 12, 2)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (23, 11, 9, CAST(670000.00 AS Decimal(10, 2)), 17, 1)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (24, 11, 24, CAST(280000.00 AS Decimal(10, 2)), 0, 2)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (25, 12, 6, CAST(198000.00 AS Decimal(10, 2)), 10, 1)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (26, 13, 20, CAST(280000.00 AS Decimal(10, 2)), 17, 3)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (27, 13, 10, CAST(180000.00 AS Decimal(10, 2)), 14, 3)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (28, 13, 1, CAST(300000.00 AS Decimal(10, 2)), 5, 1)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (29, 14, 12, CAST(830000.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (30, 14, 18, CAST(450000.00 AS Decimal(10, 2)), 10, 1)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (31, 15, 6, CAST(198000.00 AS Decimal(10, 2)), 10, 1)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (32, 15, 1, CAST(300000.00 AS Decimal(10, 2)), 5, 7)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (33, 16, 30, CAST(380000.00 AS Decimal(10, 2)), 5, 2)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (34, 16, 31, CAST(420000.00 AS Decimal(10, 2)), 10, 2)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (35, 17, 1, CAST(300000.00 AS Decimal(10, 2)), 5, 3)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (36, 17, 2, CAST(179000.00 AS Decimal(10, 2)), 2, 2)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (37, 18, 6, CAST(198000.00 AS Decimal(10, 2)), 10, 5)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (38, 19, 13, CAST(199000.00 AS Decimal(10, 2)), 12, 6)
INSERT [dbo].[order_items] ([item_id], [order_id], [product_id], [list_price], [discount], [quantity]) VALUES (39, 20, 11, CAST(590000.00 AS Decimal(10, 2)), 27, 6)
GO
INSERT [dbo].[orders] ([order_id], [account_id], [order_date], [recieve_date], [status]) VALUES (1, 1, CAST(N'2022-06-28T00:00:00.000' AS DateTime), CAST(N'2022-07-05T00:00:00.000' AS DateTime), N'done')
INSERT [dbo].[orders] ([order_id], [account_id], [order_date], [recieve_date], [status]) VALUES (2, 2, CAST(N'2022-06-29T00:00:00.000' AS DateTime), CAST(N'2023-11-01T21:47:47.000' AS DateTime), N'done')
INSERT [dbo].[orders] ([order_id], [account_id], [order_date], [recieve_date], [status]) VALUES (3, 4, CAST(N'2022-07-29T00:00:00.000' AS DateTime), CAST(N'2023-11-01T22:28:25.000' AS DateTime), N'done')
INSERT [dbo].[orders] ([order_id], [account_id], [order_date], [recieve_date], [status]) VALUES (4, 6, CAST(N'2022-08-25T00:00:00.000' AS DateTime), NULL, N'wait')
INSERT [dbo].[orders] ([order_id], [account_id], [order_date], [recieve_date], [status]) VALUES (5, 9, CAST(N'2022-07-29T00:00:00.000' AS DateTime), CAST(N'2023-11-04T10:52:42.000' AS DateTime), N'done')
INSERT [dbo].[orders] ([order_id], [account_id], [order_date], [recieve_date], [status]) VALUES (6, 10, CAST(N'2022-08-25T00:00:00.000' AS DateTime), CAST(N'2023-11-07T08:22:37.000' AS DateTime), N'done')
INSERT [dbo].[orders] ([order_id], [account_id], [order_date], [recieve_date], [status]) VALUES (7, 2, CAST(N'2023-11-04T00:33:48.000' AS DateTime), CAST(N'2023-11-19T16:36:47.000' AS DateTime), N'done')
INSERT [dbo].[orders] ([order_id], [account_id], [order_date], [recieve_date], [status]) VALUES (8, 2, CAST(N'2023-11-05T21:32:55.000' AS DateTime), CAST(N'2024-01-06T16:13:53.000' AS DateTime), N'done')
INSERT [dbo].[orders] ([order_id], [account_id], [order_date], [recieve_date], [status]) VALUES (9, 2, CAST(N'2023-11-06T10:53:42.000' AS DateTime), NULL, N'wait')
INSERT [dbo].[orders] ([order_id], [account_id], [order_date], [recieve_date], [status]) VALUES (10, 2, CAST(N'2023-11-06T23:36:51.000' AS DateTime), CAST(N'2023-11-07T08:36:38.000' AS DateTime), N'done')
INSERT [dbo].[orders] ([order_id], [account_id], [order_date], [recieve_date], [status]) VALUES (11, 2, CAST(N'2023-11-07T02:01:48.000' AS DateTime), CAST(N'2023-11-07T08:39:55.000' AS DateTime), N'done')
INSERT [dbo].[orders] ([order_id], [account_id], [order_date], [recieve_date], [status]) VALUES (12, 2, CAST(N'2023-11-07T07:45:39.000' AS DateTime), CAST(N'2023-11-07T08:36:13.000' AS DateTime), N'done')
INSERT [dbo].[orders] ([order_id], [account_id], [order_date], [recieve_date], [status]) VALUES (13, 25, CAST(N'2023-11-08T14:52:31.000' AS DateTime), NULL, N'process')
INSERT [dbo].[orders] ([order_id], [account_id], [order_date], [recieve_date], [status]) VALUES (14, 25, CAST(N'2023-11-08T14:53:09.000' AS DateTime), NULL, N'wait')
INSERT [dbo].[orders] ([order_id], [account_id], [order_date], [recieve_date], [status]) VALUES (15, 2, CAST(N'2023-11-19T16:34:21.000' AS DateTime), NULL, N'wait')
INSERT [dbo].[orders] ([order_id], [account_id], [order_date], [recieve_date], [status]) VALUES (16, 2, CAST(N'2023-12-01T21:12:51.000' AS DateTime), NULL, N'process')
INSERT [dbo].[orders] ([order_id], [account_id], [order_date], [recieve_date], [status]) VALUES (17, 27, CAST(N'2023-12-28T13:04:34.000' AS DateTime), CAST(N'2023-12-28T13:08:34.000' AS DateTime), N'done')
INSERT [dbo].[orders] ([order_id], [account_id], [order_date], [recieve_date], [status]) VALUES (18, 2, CAST(N'2024-05-11T20:56:59.000' AS DateTime), NULL, N'wait')
INSERT [dbo].[orders] ([order_id], [account_id], [order_date], [recieve_date], [status]) VALUES (19, 2, CAST(N'2024-05-11T20:57:33.000' AS DateTime), NULL, N'wait')
INSERT [dbo].[orders] ([order_id], [account_id], [order_date], [recieve_date], [status]) VALUES (20, 28, CAST(N'2024-05-19T00:02:53.000' AS DateTime), NULL, N'wait')
GO
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (1, N'Áo thun 𝐒𝐋𝐎 𝐓 𝐒𝐇𝐈𝐑𝐓', CAST(400000.00 AS Decimal(10, 2)), 5, 8, 1, N'60756746c73a7727a390fe491a9def31.jpeg', CAST(N'2023-12-28T13:06:35.000' AS DateTime), N'Chấtt liệu : cotton 2 chi?u d?nh lu?ng 280gsm. Áo du?c áp d?ng in b?ng m?c Japan (in th?m v?i) 2 m?t tru?c - sau.', 18)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (2, N'T-Shirt Basic Cotton', CAST(179000.00 AS Decimal(10, 2)), 2, 8, 1, N'vn-11134207-7r98o-lkqk86doy0g00b.jpeg', CAST(N'2023-01-03T00:00:00.000' AS DateTime), NULL, 15)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (3, N'Áo thun cotton Care & Share Chubby Corgi Papa ngực trái', CAST(250000.00 AS Decimal(10, 2)), NULL, 4, 1, N'vn-11134207-7r98o-llg8x85p8wco4e.jpeg', CAST(N'2023-01-20T00:00:00.000' AS DateTime), NULL, 15)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (4, N'Áo thun nam Cotton Coolmate Basics 200gsm', CAST(149000.00 AS Decimal(10, 2)), 9, 4, 1, N'vn-50009109-d1ddd14e0fa9b081a4b7a546d937306d.png', CAST(N'2023-03-10T00:00:00.000' AS DateTime), N'Nh? và d? b?n v?i cao r?t d? dàng s? d?ng - Form v?a v?n phù h?p m?i vóc dáng - Thân thi?n môi tru?ng Hon th? n?a b?i du?c làm t? ch?t li?u Cotton nên d? th?m hút m? hôi c?a nh?ng chi?c áo thun nam', 214)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (5, N'Qu?n Amand Modern Trouse', CAST(900000.00 AS Decimal(10, 2)), 10, 4, 1, N'vn-11134207-7qukw-lhx23jmp4khta2.jpeg', CAST(N'2023-03-21T00:00:00.000' AS DateTime), N'1. Mô t? s?n ph?m - Ki?u dáng: xuông - Màu s?c: Ðen - Ch?t li?u: V?i kate 2. Hu?ng d?n s? d?ng và b?o qu?n s?n ph?m - Gi?t ? nhi?t d? bình thu?ng v?i d? có màu tuong t? - Không du?c dùng hoá ch?t t?y - H?n ch? gi?t máy và nu?c nóng', 34)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (6, N'Qu?n Amand Grey Mist Jeans', CAST(198000.00 AS Decimal(10, 2)), 10, 4, 2, N'vn-11134207-7qukw-lgk9xv9ev9brb2.jpeg', CAST(N'2023-10-31T01:59:31.000' AS DateTime), N'1. Mô tả sản phẩm - Màu sắc: Xanh - Chất liệu: Jean cao cấp, co giãn 2. Thông s? s?n ph?m - Size 29: Du?i 59kg - Size 30: 59-64kg - Size 31: 64-69kg - Size 32: 69-73kg - Size 33: 73-76kg - Size 34: 76-81kg => Inbox d? du?c tu v?n', 54)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (7, N'Qu?n Jeans Local Brand Double Knee City Cycle', CAST(670000.00 AS Decimal(10, 2)), 26, 4, 2, N'vn-11134207-7qukw-lgizffwhtomv56.jpeg', CAST(N'2023-02-22T00:00:00.000' AS DateTime), N'KHÁCH YÊU LUU Ý: - CITY CYCLE không nh?n d?t hàng qua ghi chú, nên khách yêu ki?m tra màu size, d?a ch? v?i s? di?n tho?i chu?n tru?c khi d?t hàng nhé. - Thêm n?a do chính sách toàn sàn Shopee', 64)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (8, N'Áo Khoác Amand Signature Basic Bomber', CAST(190000.00 AS Decimal(10, 2)), 10, 3, 2, N'sg-11134201-22110-fisljxxmefkvb8.jpeg', CAST(N'2023-03-01T00:00:00.000' AS DateTime), N'LUU Ý QUAN TR?NG: - Màu s?c v?i có th? s? chênh l?ch th?c t? m?t ph?n nh?, do ?nh hu?ng v? d? l?ch màu c?a ánh sáng nhung v?n d?m b?o ch?t lu?ng. - Hàng chính hãng phân ph?i d?c quy?n b?i AMAND - CAM K?T 100% d?i size n?u s?n ph?m khách d?t không v?a', 55)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (9, N'Áo khoác gió dù Paradox - Jolly Jacket', CAST(670000.00 AS Decimal(10, 2)), 17, 3, 10, N'sg-11134201-22120-nl6s2tl68rkva1.jpeg', CAST(N'2023-03-05T00:00:00.000' AS DateTime), N'Dành cho nh?ng b?n tr? thích phong cách tr? trung, hip-hop Paradox chúng tôi mu?n g?i d?n b?n m?t s? l?a ch?n d?ng hành v?i b?n trong m?i ho?t d?ng, th? thao, vui choi không ng?i mua hay n?ng. JOLLY JACKET là m?t chi?c áo Áo khoác dù Local Brand', 27)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (10, N'Áo khoác gió dù Paradox - Jolly Jacket', CAST(180000.00 AS Decimal(10, 2)), 14, 3, 10, N'sg-11134201-22110-ko3rif1w03jvdf.jpeg', CAST(N'2023-03-12T00:00:00.000' AS DateTime), N'Dành cho nh?ng b?n tr? thích phong cách tr? trung, hip-hop Paradox chúng tôi mu?n g?i d?n b?n m?t s? l?a ch?n d?ng hành v?i b?n trong m?i ho?t d?ng, th? thao, vui choi không ng?i mua hay n?ng. JOLLY JACKET là m?t chi?c áo Áo khoác dù Local Brand', 38)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (11, N'Áo khoác thời trang unisex Fila Ravi Sherpa Jacket', CAST(590000.00 AS Decimal(10, 2)), 27, 3, 3, N'vn-11134201-7r98o-lln7el69q9bwf7.jpeg', CAST(N'2023-03-22T00:00:00.000' AS DateTime), N'Áo khoác th?i trang unisex Fila Ravi Sherpa Jacket - LM23C646-172 Ð?c di?m n?i b?t: ÁO KHOÁC TH?I TRANG UNISEX FILA RAVI SHERPA JACKET Chi?c áo khoác th?i trang s? d?ng ch?t li?u polyester siêu ?m áp, hoàn h?o d? s? d?ng cho nh?ng ngày tr? l?nh.', 67)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (12, N'RIPOFFF Abstract Girl Hoodie - Black', CAST(830000.00 AS Decimal(10, 2)), 20, 2, 3, N'vn-11134207-7r98o-lkuzehp4jjyjf6.jpeg', CAST(N'2023-04-10T00:00:00.000' AS DateTime), N'ÁO RIPOFFF HOODIE Ch?t li?u: N? bông Size: M, L Form: Oversize Xu?t x?: Vi?t Nam Các b?n cho shop xin chi?u cao và cân n?ng d? shop tu v?n size cho các b?n RIPOFFF khuy?n khích các b?n gi?t tay ho?c dùng ch? d? gi?t tay c?a máy gi?t d? gi? d? b?n', 89)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (13, N'SWE - Áo Hoodie có nón nam nữ KID HOODIE', CAST(199000.00 AS Decimal(10, 2)), 12, 2, 3, N'sg-11134201-22120-a5nepg13wmkvfa.jpeg', CAST(N'2023-04-11T00:00:00.000' AS DateTime), NULL, 64)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (14, N'Áo hoodie nỉ bông Monster X Street', CAST(340000.00 AS Decimal(10, 2)), 14, 2, 4, N'sg-11134201-22110-sa0h4pqkiljv0c.jpeg', CAST(N'2023-04-15T00:00:00.000' AS DateTime), NULL, 72)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (15, N'Áo hoodie local brand Acid Mirror City Cycle', CAST(520000.00 AS Decimal(10, 2)), 10, 2, 4, N'sg-11134201-22100-pfuexarvmoiv25.jpeg', CAST(N'2023-04-22T00:00:00.000' AS DateTime), NULL, 87)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (16, N'Áo sơ mi viền tay bạc chất lụa nam nữ mặc đẹp', CAST(200000.00 AS Decimal(10, 2)), 5, 8, 8, N'vn-11134207-7qukw-lfwaapjk7awnb1.jpeg', CAST(N'2023-04-25T00:00:00.000' AS DateTime), NULL, 62)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (17, N'Áo Sơ Mi Ngắn Tay Giả Hai Mảnh Co Giãn Phong Cách Hàn Quốc', CAST(124000.00 AS Decimal(10, 2)), 3, 8, 5, N'60756746c73a7727a390fe491a9def31.jpeg', CAST(N'2023-06-22T00:00:00.000' AS DateTime), NULL, 71)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (18, N'Áo so mi nam nỉ dài tay DWIN tron basic', CAST(450000.00 AS Decimal(10, 2)), 10, 8, 8, N'vn-11134202-7qukw-lewv16o6le8n26.jpeg', CAST(N'2023-05-16T00:00:00.000' AS DateTime), NULL, 11)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (19, N'Áo So Mi Mùa Hè Mới Thời Trang Dành Cho Nam', CAST(198000.00 AS Decimal(10, 2)), 15, 8, 5, N'sg-11134201-7qvdk-lhn2gajb4mpg5d.jpeg', CAST(N'2023-05-18T00:00:00.000' AS DateTime), NULL, 34)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (20, N'Quần tây nam hàn quốc JBagy', CAST(280000.00 AS Decimal(10, 2)), 17, 6, 7, N'vn-11134207-7r98o-lmk1d8b4dmfz2c.jpeg', CAST(N'2023-05-22T00:00:00.000' AS DateTime), NULL, 65)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (21, N'Quần âu nam JBAGY - Smart Pants', CAST(540000.00 AS Decimal(10, 2)), 14, 6, 7, N'vn-11134207-7r98o-lmqvnl6psmhr95.jpeg', CAST(N'2023-06-02T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (22, N'Quầnn ống rộng nam JBagycạp chun vải Lụa mịn', CAST(450000.00 AS Decimal(10, 2)), NULL, 3, 6, N'vn-11134207-7r98o-lmtwsvywbgtb23.jpeg', CAST(N'2023-06-12T00:00:00.000' AS DateTime), NULL, 15)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (23, N'SET ÁO + CHÂN VÁY XINH', CAST(450000.00 AS Decimal(10, 2)), 2, 9, 14, N'vn-11134207-7r98o-lllz4mdii8gf40.jpeg', CAST(N'2023-06-14T00:00:00.000' AS DateTime), NULL, 28)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (24, N'Set Dạ Tweed áo croptop + chân váy ngắn dày dặn', CAST(280000.00 AS Decimal(10, 2)), NULL, 7, 9, N'vn-11134207-7qukw-lkgfkoe7igmgb2.jpeg', CAST(N'2023-06-17T00:00:00.000' AS DateTime), NULL, 36)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (25, N'Váy dạ Tweed dáng baby doll', CAST(390000.00 AS Decimal(10, 2)), NULL, 9, 9, N'vn-11134207-7r98o-lm8dg3ikatwf3b.jpeg', CAST(N'2023-06-28T00:00:00.000' AS DateTime), NULL, 24)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (26, N'Váy xếp ly xòe dài tay pha bèo xinh xắn Lanushop', CAST(320000.00 AS Decimal(10, 2)), 4, 9, 11, N'f2b851e0930fb4f43a617299a22870f5.jpeg', CAST(N'2023-06-22T00:00:00.000' AS DateTime), NULL, 75)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (27, N'Váy nữ xinh dài tay phối cổ sơ mi trắng', CAST(350000.00 AS Decimal(10, 2)), 7, 9, 11, N'vn-11134207-7r98o-lldqbe77u7cmfd.jpeg', CAST(N'2023-07-10T00:00:00.000' AS DateTime), NULL, 12)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (28, N'Áo thun polo nam FIZNO', CAST(640000.00 AS Decimal(10, 2)), 15, 5, 12, N'vn-11134207-7r98o-llxar89o2nz391.jpeg', CAST(N'2023-07-14T00:00:00.000' AS DateTime), NULL, 10)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (29, N'Áo polo nam TORANO ngắn tay', CAST(450000.00 AS Decimal(10, 2)), 10, 5, 12, N'vn-11134207-7qukw-lk4qd0ve2y0k78.jpeg', CAST(N'2023-08-16T00:00:00.000' AS DateTime), NULL, 9)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (30, N'Áo Khoác Gió MNS Jacket', CAST(380000.00 AS Decimal(10, 2)), 5, 1, 13, N'vn-11134207-7qukw-limj0x32t5vw5d.jpeg', CAST(N'2023-08-25T00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (31, N'Áo Khoác Dù Nhan Form Croptop Phối Line', CAST(420000.00 AS Decimal(10, 2)), 10, 1, 13, N'vn-11134207-7qukw-lk7xwzac5fp0e8.jpeg', CAST(N'2023-06-22T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (32, N'Áo Khoác JACKET V3.0 BASIC', CAST(289000.00 AS Decimal(10, 2)), 5, 1, 14, N'vn-11134207-7qukw-lhshacr4utoh47.jpeg', CAST(N'2023-08-22T00:00:00.000' AS DateTime), NULL, 3)
INSERT [dbo].[products] ([product_id], [product_name], [list_price], [discount], [category_id], [brand_id], [product_img], [date_added], [product_desc], [quantity]) VALUES (33, N'aaaaaaaaaaaaaaaaa', CAST(2000000.00 AS Decimal(10, 2)), 12, 7, 1, N'vn-11134207-7r98o-lmjxqa2bnfmnea.jfif', CAST(N'2023-12-28T13:07:40.000' AS DateTime), N'âsasas', 3)
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[accounts] ([account_id])
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([brand_id])
REFERENCES [dbo].[brands] ([brand_id])
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[categorys] ([category_id])
GO
