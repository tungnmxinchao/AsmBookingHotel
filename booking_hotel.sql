USE [asmPRJ]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 7/15/2024 9:00:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[room_id] [int] NULL,
	[bookingBy] [int] NULL,
	[check_in_date] [datetime] NULL,
	[check_out_date] [datetime] NULL,
	[booking_date] [datetime] NULL,
	[quantity] [int] NULL,
	[totalPrice] [int] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 7/15/2024 9:00:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image] [nvarchar](max) NULL,
	[name] [nvarchar](50) NULL,
	[address] [nvarchar](150) NULL,
	[phone_number] [nvarchar](20) NULL,
	[rating] [int] NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 7/15/2024 9:00:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[rid] [int] IDENTITY(1,1) NOT NULL,
	[hotel_id] [int] NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](max) NULL,
	[price] [int] NULL,
	[status] [bit] NULL,
	[adultAmount] [int] NULL,
	[childAmount] [int] NULL,
	[thumbnail] [nvarchar](max) NULL,
	[amountRoom] [int] NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomImage]    Script Date: 7/15/2024 9:00:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomImage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image] [nvarchar](max) NULL,
	[room_id] [int] NULL,
 CONSTRAINT [PK_RoomImage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/15/2024 9:00:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[fullName] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[gender] [bit] NULL,
	[phone] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[role] [int] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([id], [room_id], [bookingBy], [check_in_date], [check_out_date], [booking_date], [quantity], [totalPrice], [status]) VALUES (1, 1, 1, CAST(N'2024-06-21T00:00:00.000' AS DateTime), CAST(N'2024-06-23T00:00:00.000' AS DateTime), CAST(N'2024-06-21T00:00:00.000' AS DateTime), 1, 600000, 2)
INSERT [dbo].[Booking] ([id], [room_id], [bookingBy], [check_in_date], [check_out_date], [booking_date], [quantity], [totalPrice], [status]) VALUES (2, 2, 1, CAST(N'2024-06-22T00:00:00.000' AS DateTime), CAST(N'2024-06-25T00:00:00.000' AS DateTime), CAST(N'2024-06-22T00:00:00.000' AS DateTime), 3, 1800000, 3)
INSERT [dbo].[Booking] ([id], [room_id], [bookingBy], [check_in_date], [check_out_date], [booking_date], [quantity], [totalPrice], [status]) VALUES (3, 2, 1, CAST(N'2024-06-22T00:00:00.000' AS DateTime), CAST(N'2024-06-24T00:00:00.000' AS DateTime), CAST(N'2024-06-22T00:00:00.000' AS DateTime), 1, 400000, 1)
INSERT [dbo].[Booking] ([id], [room_id], [bookingBy], [check_in_date], [check_out_date], [booking_date], [quantity], [totalPrice], [status]) VALUES (4, 1, 1, CAST(N'2024-06-22T00:00:00.000' AS DateTime), CAST(N'2024-06-23T00:00:00.000' AS DateTime), CAST(N'2024-06-22T00:00:00.000' AS DateTime), 1, 300000, 1)
INSERT [dbo].[Booking] ([id], [room_id], [bookingBy], [check_in_date], [check_out_date], [booking_date], [quantity], [totalPrice], [status]) VALUES (5, 1, 1, CAST(N'2024-06-24T00:00:00.000' AS DateTime), CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-06-24T00:00:00.000' AS DateTime), 2, 1200000, 1)
INSERT [dbo].[Booking] ([id], [room_id], [bookingBy], [check_in_date], [check_out_date], [booking_date], [quantity], [totalPrice], [status]) VALUES (6, 2, 1, CAST(N'2024-06-24T00:00:00.000' AS DateTime), CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-06-24T00:00:00.000' AS DateTime), 1, 400000, 1)
INSERT [dbo].[Booking] ([id], [room_id], [bookingBy], [check_in_date], [check_out_date], [booking_date], [quantity], [totalPrice], [status]) VALUES (7, 1, 1, CAST(N'2024-06-24T00:00:00.000' AS DateTime), CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-06-24T00:00:00.000' AS DateTime), 3, 1800000, 1)
INSERT [dbo].[Booking] ([id], [room_id], [bookingBy], [check_in_date], [check_out_date], [booking_date], [quantity], [totalPrice], [status]) VALUES (8, 1, 1, CAST(N'2024-06-24T00:00:00.000' AS DateTime), CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-06-24T00:00:00.000' AS DateTime), 2, 1200000, 1)
INSERT [dbo].[Booking] ([id], [room_id], [bookingBy], [check_in_date], [check_out_date], [booking_date], [quantity], [totalPrice], [status]) VALUES (9, 1, 1, CAST(N'2024-06-24T00:00:00.000' AS DateTime), CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-06-24T00:00:00.000' AS DateTime), 3, 1800000, 1)
INSERT [dbo].[Booking] ([id], [room_id], [bookingBy], [check_in_date], [check_out_date], [booking_date], [quantity], [totalPrice], [status]) VALUES (10, 1, 1, CAST(N'2024-06-24T00:00:00.000' AS DateTime), CAST(N'2024-06-27T00:00:00.000' AS DateTime), CAST(N'2024-06-24T00:00:00.000' AS DateTime), 2, 1800000, 2)
INSERT [dbo].[Booking] ([id], [room_id], [bookingBy], [check_in_date], [check_out_date], [booking_date], [quantity], [totalPrice], [status]) VALUES (11, 1, 2, CAST(N'2024-06-20T00:00:00.000' AS DateTime), CAST(N'2024-06-29T00:00:00.000' AS DateTime), CAST(N'2024-06-24T00:00:00.000' AS DateTime), 1, 2700000, 0)
INSERT [dbo].[Booking] ([id], [room_id], [bookingBy], [check_in_date], [check_out_date], [booking_date], [quantity], [totalPrice], [status]) VALUES (12, 1, 2, CAST(N'2024-06-24T00:00:00.000' AS DateTime), CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-06-24T00:00:00.000' AS DateTime), 2, 1200000, 2)
INSERT [dbo].[Booking] ([id], [room_id], [bookingBy], [check_in_date], [check_out_date], [booking_date], [quantity], [totalPrice], [status]) VALUES (13, 2, 2, CAST(N'2024-06-24T00:00:00.000' AS DateTime), CAST(N'2024-06-27T00:00:00.000' AS DateTime), CAST(N'2024-06-24T00:00:00.000' AS DateTime), 1, 600000, 3)
INSERT [dbo].[Booking] ([id], [room_id], [bookingBy], [check_in_date], [check_out_date], [booking_date], [quantity], [totalPrice], [status]) VALUES (14, 2, 2, CAST(N'2024-06-24T00:00:00.000' AS DateTime), CAST(N'2024-06-27T00:00:00.000' AS DateTime), CAST(N'2024-06-24T00:00:00.000' AS DateTime), 3, 1800000, 3)
INSERT [dbo].[Booking] ([id], [room_id], [bookingBy], [check_in_date], [check_out_date], [booking_date], [quantity], [totalPrice], [status]) VALUES (15, 2, 1, CAST(N'2024-06-25T00:00:00.000' AS DateTime), CAST(N'2024-06-27T00:00:00.000' AS DateTime), CAST(N'2024-06-25T00:00:00.000' AS DateTime), 1, 400000, 1)
SET IDENTITY_INSERT [dbo].[Booking] OFF
GO
SET IDENTITY_INSERT [dbo].[Hotel] ON 

INSERT [dbo].[Hotel] ([id], [image], [name], [address], [phone_number], [rating]) VALUES (1, N'hehe.png', N'hotelmanhtung', N'vietnam', N'0849978689', 3)
INSERT [dbo].[Hotel] ([id], [image], [name], [address], [phone_number], [rating]) VALUES (2, N'hehe2.pmg', N'hotelLangman', N'hung yen, viet nam', N'0849978889', 5)
SET IDENTITY_INSERT [dbo].[Hotel] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([rid], [hotel_id], [name], [description], [price], [status], [adultAmount], [childAmount], [thumbnail], [amountRoom]) VALUES (1, 1, N'phongvip', N'daydutiennghi', 300000, 1, 2, 2, N'img/room/room-1.jpg', 0)
INSERT [dbo].[Room] ([rid], [hotel_id], [name], [description], [price], [status], [adultAmount], [childAmount], [thumbnail], [amountRoom]) VALUES (2, 1, N'phongvui', N'kodaydutiennghi', 200000, 1, 2, 1, N'img/room/room-1.jpg', 5)
INSERT [dbo].[Room] ([rid], [hotel_id], [name], [description], [price], [status], [adultAmount], [childAmount], [thumbnail], [amountRoom]) VALUES (3, 1, N'phongcui', N'kocodieuhoa', 120000, 1, 3, 1, N'img/room/room-1.jpg', 5)
INSERT [dbo].[Room] ([rid], [hotel_id], [name], [description], [price], [status], [adultAmount], [childAmount], [thumbnail], [amountRoom]) VALUES (4, 1, N'phongsieucappro', N'kocodieuhoa', 150000, 1, 2, 1, N'img/room/room-1.jpg', 5)
INSERT [dbo].[Room] ([rid], [hotel_id], [name], [description], [price], [status], [adultAmount], [childAmount], [thumbnail], [amountRoom]) VALUES (350, 2, N'tesst', N'123123', 120000, 0, 1, 1, N'img/432360966_122192626028091095_5863289487999889641_n.jpg', 12)
INSERT [dbo].[Room] ([rid], [hotel_id], [name], [description], [price], [status], [adultAmount], [childAmount], [thumbnail], [amountRoom]) VALUES (351, 1, N'tessthehe', N'day du', 120000, 0, 1, 1, N'img/432360966_122192626028091095_5863289487999889641_n.jpg', 123)
INSERT [dbo].[Room] ([rid], [hotel_id], [name], [description], [price], [status], [adultAmount], [childAmount], [thumbnail], [amountRoom]) VALUES (352, 1, N'tungtung', N'123', 123123, 0, 1, 1, N'img/432360966_122192626028091095_5863289487999889641_n.jpg', 123)
INSERT [dbo].[Room] ([rid], [hotel_id], [name], [description], [price], [status], [adultAmount], [childAmount], [thumbnail], [amountRoom]) VALUES (353, 1, N'tesst6h30', N'ressawd', 120000, 0, 5, 5, N'img/432360966_122192626028091095_5863289487999889641_n.jpg', 12)
INSERT [dbo].[Room] ([rid], [hotel_id], [name], [description], [price], [status], [adultAmount], [childAmount], [thumbnail], [amountRoom]) VALUES (354, 1, N'phong cua daicatung', N'phong co nhieu hoa va sofa', 145000, 0, 5, 5, N'img/432360966_122192626028091095_5863289487999889641_n.jpg', 123)
INSERT [dbo].[Room] ([rid], [hotel_id], [name], [description], [price], [status], [adultAmount], [childAmount], [thumbnail], [amountRoom]) VALUES (355, 2, N'phong cua tung', N'phong co dieu hoa', 450000, 0, 2, 2, N'img/432360966_122192626028091095_5863289487999889641_n.jpg', 20)
INSERT [dbo].[Room] ([rid], [hotel_id], [name], [description], [price], [status], [adultAmount], [childAmount], [thumbnail], [amountRoom]) VALUES (356, 2, N'phong cua tung', N'phong co dieu hoa', 450000, 0, 2, 2, N'img/432360966_122192626028091095_5863289487999889641_n.jpg', 20)
INSERT [dbo].[Room] ([rid], [hotel_id], [name], [description], [price], [status], [adultAmount], [childAmount], [thumbnail], [amountRoom]) VALUES (357, 2, N'phong cua tung', N'phong co dieu hoa', 450000, 0, 2, 2, N'img/432360966_122192626028091095_5863289487999889641_n.jpg', 20)
INSERT [dbo].[Room] ([rid], [hotel_id], [name], [description], [price], [status], [adultAmount], [childAmount], [thumbnail], [amountRoom]) VALUES (358, 1, N'dzdz', N'dzdz', 120000, 0, 1, 1, N'img/432360966_122192626028091095_5863289487999889641_n.jpg', 12)
INSERT [dbo].[Room] ([rid], [hotel_id], [name], [description], [price], [status], [adultAmount], [childAmount], [thumbnail], [amountRoom]) VALUES (733, 1, N'123', N'123', 123, 0, 1, 1, N'img/432360966_122192626028091095_5863289487999889641_n.jpg', 123)
INSERT [dbo].[Room] ([rid], [hotel_id], [name], [description], [price], [status], [adultAmount], [childAmount], [thumbnail], [amountRoom]) VALUES (734, 1, N'123', N'123', 123, 0, 1, 1, N'img/432360966_122192626028091095_5863289487999889641_n.jpg', 123)
INSERT [dbo].[Room] ([rid], [hotel_id], [name], [description], [price], [status], [adultAmount], [childAmount], [thumbnail], [amountRoom]) VALUES (735, 1, N'123', N'123', 123, 0, 1, 1, N'img/432360966_122192626028091095_5863289487999889641_n.jpg', 123)
INSERT [dbo].[Room] ([rid], [hotel_id], [name], [description], [price], [status], [adultAmount], [childAmount], [thumbnail], [amountRoom]) VALUES (736, 1, N'1234', N'1234', 1234, 0, 1, 1, N'img/432360966_122192626028091095_5863289487999889641_n.jpg', 123)
INSERT [dbo].[Room] ([rid], [hotel_id], [name], [description], [price], [status], [adultAmount], [childAmount], [thumbnail], [amountRoom]) VALUES (737, 1, N'11111', N'1111111', 111111, 1, 1, 1, N'img/432360966_122192626028091095_5863289487999889641_n.jpg', 2222)
INSERT [dbo].[Room] ([rid], [hotel_id], [name], [description], [price], [status], [adultAmount], [childAmount], [thumbnail], [amountRoom]) VALUES (738, 1, N'111111111', N'111111111', 111111111, 1, 2, 2, N'img/432360966_122192626028091095_5863289487999889641_n.jpg', 123)
INSERT [dbo].[Room] ([rid], [hotel_id], [name], [description], [price], [status], [adultAmount], [childAmount], [thumbnail], [amountRoom]) VALUES (739, 1, N'111111111', N'111111111', 111111111, 1, 2, 2, N'img/432360966_122192626028091095_5863289487999889641_n.jpg', 123)
INSERT [dbo].[Room] ([rid], [hotel_id], [name], [description], [price], [status], [adultAmount], [childAmount], [thumbnail], [amountRoom]) VALUES (740, 1, N'123', N'123', 123, 1, 2, 2, N'img/432360966_122192626028091095_5863289487999889641_n.jpg', 123)
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomImage] ON 

INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (699, N'img/VIEWDETAILBLOG.png', 351)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (700, N'img/VIEWBLOG.png', 351)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (701, N'img/VIEWDETAILBLOG.png', 352)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (702, N'img/VIEWBLOG.png', 352)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (703, N'img/addBlog.png', 352)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (704, N'img/VIEWDETAILBLOG.png', 353)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (705, N'img/VIEWBLOG.png', 353)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (706, N'img/VIEWDETAILBLOG.png', 354)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (707, N'img/VIEWBLOG.png', 354)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (708, N'img/Screenshot 2024-06-17 223421.png', 355)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (709, N'img/VIEWDETAILBLOG.png', 355)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (710, N'img/VIEWBLOG.png', 355)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (711, N'img/Screenshot 2024-06-17 223421.png', 356)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (712, N'img/VIEWDETAILBLOG.png', 356)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (713, N'img/VIEWBLOG.png', 356)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (714, N'img/Screenshot 2024-06-17 223421.png', 357)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (715, N'img/VIEWDETAILBLOG.png', 357)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (716, N'img/VIEWBLOG.png', 357)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (717, N'img/Screenshot 2024-06-17 223421.png', 358)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (718, N'img/VIEWDETAILBLOG.png', 358)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (719, N'img/VIEWBLOG.png', 358)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1257, N'img/Screenshot 2024-06-17 223421.png', 538)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1258, N'img/VIEWDETAILBLOG.png', 538)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1259, N'img/VIEWBLOG.png', 538)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1436, N'img/VIEWBLOG.png', 597)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1437, N'img/Screenshot 2024-06-17 223421.png', 598)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1438, N'img/VIEWDETAILBLOG.png', 598)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1439, N'img/VIEWBLOG.png', 598)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1440, N'img/Screenshot 2024-06-17 223421.png', 599)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1441, N'img/VIEWDETAILBLOG.png', 599)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1442, N'img/VIEWBLOG.png', 599)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1443, N'img/Screenshot 2024-06-17 223421.png', 600)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1444, N'img/VIEWDETAILBLOG.png', 600)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1445, N'img/VIEWBLOG.png', 600)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1446, N'img/Screenshot 2024-06-17 223421.png', 601)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1447, N'img/VIEWDETAILBLOG.png', 601)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1448, N'img/VIEWBLOG.png', 601)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1449, N'img/Screenshot 2024-06-17 223421.png', 602)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1450, N'img/VIEWDETAILBLOG.png', 602)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1451, N'img/VIEWBLOG.png', 602)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1452, N'img/Screenshot 2024-06-17 223421.png', 603)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1453, N'img/VIEWDETAILBLOG.png', 603)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1454, N'img/VIEWBLOG.png', 603)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1455, N'img/Screenshot 2024-06-17 223421.png', 604)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1456, N'img/VIEWDETAILBLOG.png', 604)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1457, N'img/VIEWBLOG.png', 604)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1458, N'img/Screenshot 2024-06-17 223421.png', 605)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1459, N'img/VIEWDETAILBLOG.png', 605)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1460, N'img/VIEWBLOG.png', 605)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1461, N'img/Screenshot 2024-06-17 223421.png', 606)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1462, N'img/VIEWDETAILBLOG.png', 606)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1463, N'img/VIEWBLOG.png', 606)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1464, N'img/Screenshot 2024-06-17 223421.png', 607)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1465, N'img/VIEWDETAILBLOG.png', 607)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1466, N'img/VIEWBLOG.png', 607)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1467, N'img/Screenshot 2024-06-17 223421.png', 608)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1468, N'img/VIEWDETAILBLOG.png', 608)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1469, N'img/VIEWBLOG.png', 608)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1470, N'img/Screenshot 2024-06-17 223421.png', 609)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1471, N'img/VIEWDETAILBLOG.png', 609)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1472, N'img/VIEWBLOG.png', 609)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1473, N'img/Screenshot 2024-06-17 223421.png', 610)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1474, N'img/VIEWDETAILBLOG.png', 610)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1475, N'img/VIEWBLOG.png', 610)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1476, N'img/Screenshot 2024-06-17 223421.png', 611)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1477, N'img/VIEWDETAILBLOG.png', 611)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1478, N'img/VIEWBLOG.png', 611)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1479, N'img/Screenshot 2024-06-17 223421.png', 612)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1480, N'img/VIEWDETAILBLOG.png', 612)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1481, N'img/VIEWBLOG.png', 612)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1482, N'img/Screenshot 2024-06-17 223421.png', 613)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1483, N'img/VIEWDETAILBLOG.png', 613)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1484, N'img/VIEWBLOG.png', 613)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1485, N'img/Screenshot 2024-06-17 223421.png', 614)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1486, N'img/VIEWDETAILBLOG.png', 614)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1487, N'img/VIEWBLOG.png', 614)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1488, N'img/Screenshot 2024-06-17 223421.png', 615)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1489, N'img/VIEWDETAILBLOG.png', 615)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1490, N'img/VIEWBLOG.png', 615)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1491, N'img/Screenshot 2024-06-17 223421.png', 616)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1492, N'img/VIEWDETAILBLOG.png', 616)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1493, N'img/VIEWBLOG.png', 616)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1494, N'img/Screenshot 2024-06-17 223421.png', 617)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1495, N'img/VIEWDETAILBLOG.png', 617)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1496, N'img/VIEWBLOG.png', 617)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1497, N'img/Screenshot 2024-06-17 223421.png', 618)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1498, N'img/VIEWDETAILBLOG.png', 618)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1499, N'img/VIEWBLOG.png', 618)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1500, N'img/Screenshot 2024-06-17 223421.png', 619)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1501, N'img/VIEWDETAILBLOG.png', 619)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1502, N'img/VIEWBLOG.png', 619)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1503, N'img/Screenshot 2024-06-17 223421.png', 620)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1504, N'img/VIEWDETAILBLOG.png', 620)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1505, N'img/VIEWBLOG.png', 620)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1506, N'img/Screenshot 2024-06-17 223421.png', 621)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1507, N'img/VIEWDETAILBLOG.png', 621)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1508, N'img/VIEWBLOG.png', 621)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1509, N'img/Screenshot 2024-06-17 223421.png', 622)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1510, N'img/VIEWDETAILBLOG.png', 622)
GO
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1511, N'img/VIEWBLOG.png', 622)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1512, N'img/Screenshot 2024-06-17 223421.png', 623)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1513, N'img/VIEWDETAILBLOG.png', 623)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1514, N'img/VIEWBLOG.png', 623)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1515, N'img/Screenshot 2024-06-17 223421.png', 624)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1516, N'img/VIEWDETAILBLOG.png', 624)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1517, N'img/VIEWBLOG.png', 624)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1518, N'img/Screenshot 2024-06-17 223421.png', 625)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1519, N'img/VIEWDETAILBLOG.png', 625)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1520, N'img/VIEWBLOG.png', 625)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1521, N'img/Screenshot 2024-06-17 223421.png', 626)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1522, N'img/VIEWDETAILBLOG.png', 626)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1523, N'img/VIEWBLOG.png', 626)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1524, N'img/Screenshot 2024-06-17 223421.png', 627)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1525, N'img/VIEWDETAILBLOG.png', 627)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1526, N'img/VIEWBLOG.png', 627)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1527, N'img/Screenshot 2024-06-17 223421.png', 628)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1528, N'img/VIEWDETAILBLOG.png', 628)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1529, N'img/VIEWBLOG.png', 628)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1530, N'img/Screenshot 2024-06-17 223421.png', 629)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1531, N'img/VIEWDETAILBLOG.png', 629)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1532, N'img/VIEWBLOG.png', 629)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1533, N'img/Screenshot 2024-06-17 223421.png', 630)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1534, N'img/VIEWDETAILBLOG.png', 630)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1535, N'img/VIEWBLOG.png', 630)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1536, N'img/Screenshot 2024-06-17 223421.png', 631)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1537, N'img/VIEWDETAILBLOG.png', 631)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1538, N'img/VIEWBLOG.png', 631)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1539, N'img/Screenshot 2024-06-17 223421.png', 632)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1540, N'img/VIEWDETAILBLOG.png', 632)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1541, N'img/VIEWBLOG.png', 632)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1542, N'img/Screenshot 2024-06-17 223421.png', 633)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1543, N'img/VIEWDETAILBLOG.png', 633)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1544, N'img/VIEWBLOG.png', 633)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1545, N'img/Screenshot 2024-06-17 223421.png', 634)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1546, N'img/VIEWDETAILBLOG.png', 634)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1547, N'img/VIEWBLOG.png', 634)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1548, N'img/Screenshot 2024-06-17 223421.png', 635)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1549, N'img/VIEWDETAILBLOG.png', 635)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1550, N'img/VIEWBLOG.png', 635)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1551, N'img/Screenshot 2024-06-17 223421.png', 636)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1552, N'img/VIEWDETAILBLOG.png', 636)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1553, N'img/VIEWBLOG.png', 636)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1554, N'img/Screenshot 2024-06-17 223421.png', 637)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1555, N'img/VIEWDETAILBLOG.png', 637)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1556, N'img/VIEWBLOG.png', 637)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1557, N'img/Screenshot 2024-06-17 223421.png', 638)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1558, N'img/VIEWDETAILBLOG.png', 638)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1559, N'img/VIEWBLOG.png', 638)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1560, N'img/Screenshot 2024-06-17 223421.png', 639)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1561, N'img/VIEWDETAILBLOG.png', 639)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1562, N'img/VIEWBLOG.png', 639)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1563, N'img/Screenshot 2024-06-17 223421.png', 640)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1564, N'img/VIEWDETAILBLOG.png', 640)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1565, N'img/VIEWBLOG.png', 640)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1566, N'img/Screenshot 2024-06-17 223421.png', 641)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1567, N'img/VIEWDETAILBLOG.png', 641)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1568, N'img/VIEWBLOG.png', 641)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1569, N'img/Screenshot 2024-06-17 223421.png', 642)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1570, N'img/VIEWDETAILBLOG.png', 642)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1571, N'img/VIEWBLOG.png', 642)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1572, N'img/Screenshot 2024-06-17 223421.png', 643)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1573, N'img/VIEWDETAILBLOG.png', 643)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1574, N'img/VIEWBLOG.png', 643)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1575, N'img/Screenshot 2024-06-17 223421.png', 644)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1576, N'img/VIEWDETAILBLOG.png', 644)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1577, N'img/VIEWBLOG.png', 644)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1578, N'img/Screenshot 2024-06-17 223421.png', 645)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1579, N'img/VIEWDETAILBLOG.png', 645)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1580, N'img/VIEWBLOG.png', 645)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1581, N'img/Screenshot 2024-06-17 223421.png', 646)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1582, N'img/VIEWDETAILBLOG.png', 646)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1583, N'img/VIEWBLOG.png', 646)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1584, N'img/Screenshot 2024-06-17 223421.png', 647)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1585, N'img/VIEWDETAILBLOG.png', 647)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1586, N'img/VIEWBLOG.png', 647)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1587, N'img/Screenshot 2024-06-17 223421.png', 648)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1588, N'img/VIEWDETAILBLOG.png', 648)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1589, N'img/VIEWBLOG.png', 648)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1590, N'img/Screenshot 2024-06-17 223421.png', 649)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1591, N'img/VIEWDETAILBLOG.png', 649)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1592, N'img/VIEWBLOG.png', 649)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1593, N'img/Screenshot 2024-06-17 223421.png', 650)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1594, N'img/VIEWDETAILBLOG.png', 650)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1595, N'img/VIEWBLOG.png', 650)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1596, N'img/Screenshot 2024-06-17 223421.png', 651)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1597, N'img/VIEWDETAILBLOG.png', 651)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1598, N'img/VIEWBLOG.png', 651)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1599, N'img/Screenshot 2024-06-17 223421.png', 652)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1600, N'img/VIEWDETAILBLOG.png', 652)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1601, N'img/VIEWBLOG.png', 652)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1602, N'img/Screenshot 2024-06-17 223421.png', 653)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1603, N'img/VIEWDETAILBLOG.png', 653)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1604, N'img/VIEWBLOG.png', 653)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1605, N'img/Screenshot 2024-06-17 223421.png', 654)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1606, N'img/VIEWDETAILBLOG.png', 654)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1607, N'img/VIEWBLOG.png', 654)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1608, N'img/Screenshot 2024-06-17 223421.png', 655)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1609, N'img/VIEWDETAILBLOG.png', 655)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1610, N'img/VIEWBLOG.png', 655)
GO
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1611, N'img/Screenshot 2024-06-17 223421.png', 656)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1612, N'img/VIEWDETAILBLOG.png', 656)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1613, N'img/VIEWBLOG.png', 656)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1614, N'img/Screenshot 2024-06-17 223421.png', 657)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1615, N'img/VIEWDETAILBLOG.png', 657)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1616, N'img/VIEWBLOG.png', 657)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1617, N'img/Screenshot 2024-06-17 223421.png', 658)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1618, N'img/VIEWDETAILBLOG.png', 658)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1619, N'img/VIEWBLOG.png', 658)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1620, N'img/Screenshot 2024-06-17 223421.png', 659)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1621, N'img/VIEWDETAILBLOG.png', 659)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1622, N'img/VIEWBLOG.png', 659)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1623, N'img/Screenshot 2024-06-17 223421.png', 660)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1624, N'img/VIEWDETAILBLOG.png', 660)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1625, N'img/VIEWBLOG.png', 660)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1626, N'img/Screenshot 2024-06-17 223421.png', 661)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1627, N'img/VIEWDETAILBLOG.png', 661)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1628, N'img/VIEWBLOG.png', 661)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1629, N'img/Screenshot 2024-06-17 223421.png', 662)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1630, N'img/VIEWDETAILBLOG.png', 662)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1631, N'img/VIEWBLOG.png', 662)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1632, N'img/Screenshot 2024-06-17 223421.png', 663)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1633, N'img/VIEWDETAILBLOG.png', 663)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1634, N'img/VIEWBLOG.png', 663)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1635, N'img/Screenshot 2024-06-17 223421.png', 664)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1636, N'img/VIEWDETAILBLOG.png', 664)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1637, N'img/VIEWBLOG.png', 664)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1638, N'img/Screenshot 2024-06-17 223421.png', 665)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1639, N'img/VIEWDETAILBLOG.png', 665)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1640, N'img/VIEWBLOG.png', 665)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1641, N'img/Screenshot 2024-06-17 223421.png', 666)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1642, N'img/VIEWDETAILBLOG.png', 666)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1643, N'img/VIEWBLOG.png', 666)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1644, N'img/Screenshot 2024-06-17 223421.png', 667)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1645, N'img/VIEWDETAILBLOG.png', 667)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1646, N'img/VIEWBLOG.png', 667)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1647, N'img/Screenshot 2024-06-17 223421.png', 668)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1648, N'img/VIEWDETAILBLOG.png', 668)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1649, N'img/VIEWBLOG.png', 668)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1650, N'img/Screenshot 2024-06-17 223421.png', 669)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1651, N'img/VIEWDETAILBLOG.png', 669)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1652, N'img/VIEWBLOG.png', 669)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1653, N'img/Screenshot 2024-06-17 223421.png', 670)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1654, N'img/VIEWDETAILBLOG.png', 670)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1655, N'img/VIEWBLOG.png', 670)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1656, N'img/Screenshot 2024-06-17 223421.png', 671)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1657, N'img/VIEWDETAILBLOG.png', 671)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1658, N'img/VIEWBLOG.png', 671)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1659, N'img/Screenshot 2024-06-17 223421.png', 672)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1660, N'img/VIEWDETAILBLOG.png', 672)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1661, N'img/VIEWBLOG.png', 672)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1662, N'img/Screenshot 2024-06-17 223421.png', 673)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1663, N'img/VIEWDETAILBLOG.png', 673)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1664, N'img/VIEWBLOG.png', 673)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1665, N'img/Screenshot 2024-06-17 223421.png', 674)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1666, N'img/VIEWDETAILBLOG.png', 674)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1667, N'img/VIEWBLOG.png', 674)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1668, N'img/Screenshot 2024-06-17 223421.png', 675)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1669, N'img/VIEWDETAILBLOG.png', 675)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1670, N'img/VIEWBLOG.png', 675)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1671, N'img/Screenshot 2024-06-17 223421.png', 676)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1672, N'img/VIEWDETAILBLOG.png', 676)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1673, N'img/VIEWBLOG.png', 676)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1674, N'img/Screenshot 2024-06-17 223421.png', 677)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1675, N'img/VIEWDETAILBLOG.png', 677)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1676, N'img/VIEWBLOG.png', 677)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1677, N'img/Screenshot 2024-06-17 223421.png', 678)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1678, N'img/VIEWDETAILBLOG.png', 678)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1679, N'img/VIEWBLOG.png', 678)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1680, N'img/Screenshot 2024-06-17 223421.png', 679)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1681, N'img/VIEWDETAILBLOG.png', 679)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1682, N'img/VIEWBLOG.png', 679)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1683, N'img/Screenshot 2024-06-17 223421.png', 680)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1684, N'img/VIEWDETAILBLOG.png', 680)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1685, N'img/VIEWBLOG.png', 680)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1686, N'img/Screenshot 2024-06-17 223421.png', 681)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1687, N'img/VIEWDETAILBLOG.png', 681)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1688, N'img/VIEWBLOG.png', 681)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1689, N'img/Screenshot 2024-06-17 223421.png', 682)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1690, N'img/VIEWDETAILBLOG.png', 682)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1691, N'img/VIEWBLOG.png', 682)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1692, N'img/Screenshot 2024-06-17 223421.png', 683)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1693, N'img/VIEWDETAILBLOG.png', 683)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1694, N'img/VIEWBLOG.png', 683)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1695, N'img/Screenshot 2024-06-17 223421.png', 684)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1696, N'img/VIEWDETAILBLOG.png', 684)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1697, N'img/VIEWBLOG.png', 684)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1698, N'img/Screenshot 2024-06-17 223421.png', 685)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1699, N'img/VIEWDETAILBLOG.png', 685)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1700, N'img/VIEWBLOG.png', 685)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1701, N'img/Screenshot 2024-06-17 223421.png', 686)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1702, N'img/VIEWDETAILBLOG.png', 686)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1703, N'img/VIEWBLOG.png', 686)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1704, N'img/Screenshot 2024-06-17 223421.png', 687)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1705, N'img/VIEWDETAILBLOG.png', 687)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1706, N'img/VIEWBLOG.png', 687)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1707, N'img/Screenshot 2024-06-17 223421.png', 688)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1708, N'img/VIEWDETAILBLOG.png', 688)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1709, N'img/VIEWBLOG.png', 688)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1710, N'img/Screenshot 2024-06-17 223421.png', 689)
GO
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1711, N'img/VIEWDETAILBLOG.png', 689)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1712, N'img/VIEWBLOG.png', 689)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1713, N'img/Screenshot 2024-06-17 223421.png', 690)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1714, N'img/VIEWDETAILBLOG.png', 690)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1715, N'img/VIEWBLOG.png', 690)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1716, N'img/Screenshot 2024-06-17 223421.png', 691)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1717, N'img/VIEWDETAILBLOG.png', 691)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1718, N'img/VIEWBLOG.png', 691)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1719, N'img/Screenshot 2024-06-17 223421.png', 692)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1720, N'img/VIEWDETAILBLOG.png', 692)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1721, N'img/VIEWBLOG.png', 692)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1722, N'img/Screenshot 2024-06-17 223421.png', 693)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1723, N'img/VIEWDETAILBLOG.png', 693)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1724, N'img/VIEWBLOG.png', 693)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1725, N'img/Screenshot 2024-06-17 223421.png', 694)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1726, N'img/VIEWDETAILBLOG.png', 694)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1727, N'img/VIEWBLOG.png', 694)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1728, N'img/Screenshot 2024-06-17 223421.png', 695)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1729, N'img/VIEWDETAILBLOG.png', 695)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1730, N'img/VIEWBLOG.png', 695)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1731, N'img/Screenshot 2024-06-17 223421.png', 696)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1732, N'img/VIEWDETAILBLOG.png', 696)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1733, N'img/VIEWBLOG.png', 696)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1734, N'img/Screenshot 2024-06-17 223421.png', 697)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1735, N'img/VIEWDETAILBLOG.png', 697)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1736, N'img/VIEWBLOG.png', 697)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1737, N'img/Screenshot 2024-06-17 223421.png', 698)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1738, N'img/VIEWDETAILBLOG.png', 698)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1739, N'img/VIEWBLOG.png', 698)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1740, N'img/Screenshot 2024-06-17 223421.png', 699)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1741, N'img/VIEWDETAILBLOG.png', 699)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1742, N'img/VIEWBLOG.png', 699)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1743, N'img/Screenshot 2024-06-17 223421.png', 700)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1744, N'img/VIEWDETAILBLOG.png', 700)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1745, N'img/VIEWBLOG.png', 700)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1746, N'img/Screenshot 2024-06-17 223421.png', 701)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1747, N'img/VIEWDETAILBLOG.png', 701)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1748, N'img/VIEWBLOG.png', 701)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1749, N'img/Screenshot 2024-06-17 223421.png', 702)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1750, N'img/VIEWDETAILBLOG.png', 702)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1751, N'img/VIEWBLOG.png', 702)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1752, N'img/Screenshot 2024-06-17 223421.png', 703)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1753, N'img/VIEWDETAILBLOG.png', 703)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1754, N'img/VIEWBLOG.png', 703)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1755, N'img/Screenshot 2024-06-17 223421.png', 704)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1756, N'img/VIEWDETAILBLOG.png', 704)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1757, N'img/VIEWBLOG.png', 704)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1758, N'img/Screenshot 2024-06-17 223421.png', 705)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1759, N'img/VIEWDETAILBLOG.png', 705)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1760, N'img/VIEWBLOG.png', 705)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1761, N'img/Screenshot 2024-06-17 223421.png', 706)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1762, N'img/VIEWDETAILBLOG.png', 706)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1763, N'img/VIEWBLOG.png', 706)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1764, N'img/Screenshot 2024-06-17 223421.png', 707)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1765, N'img/VIEWDETAILBLOG.png', 707)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1766, N'img/VIEWBLOG.png', 707)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1767, N'img/Screenshot 2024-06-17 223421.png', 708)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1768, N'img/VIEWDETAILBLOG.png', 708)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1769, N'img/VIEWBLOG.png', 708)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1770, N'img/Screenshot 2024-06-17 223421.png', 709)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1771, N'img/VIEWDETAILBLOG.png', 709)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1772, N'img/VIEWBLOG.png', 709)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1773, N'img/Screenshot 2024-06-17 223421.png', 710)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1774, N'img/VIEWDETAILBLOG.png', 710)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1775, N'img/VIEWBLOG.png', 710)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1776, N'img/Screenshot 2024-06-17 223421.png', 711)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1777, N'img/VIEWDETAILBLOG.png', 711)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1778, N'img/VIEWBLOG.png', 711)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1779, N'img/Screenshot 2024-06-17 223421.png', 712)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1780, N'img/VIEWDETAILBLOG.png', 712)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1781, N'img/VIEWBLOG.png', 712)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1782, N'img/Screenshot 2024-06-17 223421.png', 713)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1783, N'img/VIEWDETAILBLOG.png', 713)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1784, N'img/VIEWBLOG.png', 713)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1785, N'img/Screenshot 2024-06-17 223421.png', 714)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1786, N'img/VIEWDETAILBLOG.png', 714)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1787, N'img/VIEWBLOG.png', 714)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1788, N'img/Screenshot 2024-06-17 223421.png', 715)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1789, N'img/VIEWDETAILBLOG.png', 715)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1790, N'img/VIEWBLOG.png', 715)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1791, N'img/Screenshot 2024-06-17 223421.png', 716)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1792, N'img/VIEWDETAILBLOG.png', 716)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1793, N'img/VIEWBLOG.png', 716)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1794, N'img/Screenshot 2024-06-17 223421.png', 717)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1795, N'img/VIEWDETAILBLOG.png', 717)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1796, N'img/VIEWBLOG.png', 717)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1797, N'img/Screenshot 2024-06-17 223421.png', 718)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1798, N'img/VIEWDETAILBLOG.png', 718)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1799, N'img/VIEWBLOG.png', 718)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1800, N'img/Screenshot 2024-06-17 223421.png', 719)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1801, N'img/VIEWDETAILBLOG.png', 719)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1802, N'img/VIEWBLOG.png', 719)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1803, N'img/Screenshot 2024-06-17 223421.png', 720)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1804, N'img/VIEWDETAILBLOG.png', 720)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1805, N'img/VIEWBLOG.png', 720)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1806, N'img/Screenshot 2024-06-17 223421.png', 721)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1807, N'img/VIEWDETAILBLOG.png', 721)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1808, N'img/VIEWBLOG.png', 721)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1809, N'img/Screenshot 2024-06-17 223421.png', 722)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1810, N'img/VIEWDETAILBLOG.png', 722)
GO
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1811, N'img/VIEWBLOG.png', 722)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1812, N'img/Screenshot 2024-06-17 223421.png', 723)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1813, N'img/VIEWDETAILBLOG.png', 723)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1814, N'img/VIEWBLOG.png', 723)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1815, N'img/Screenshot 2024-06-17 223421.png', 724)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1816, N'img/VIEWDETAILBLOG.png', 724)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1817, N'img/VIEWBLOG.png', 724)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1818, N'img/Screenshot 2024-06-17 223421.png', 725)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1819, N'img/VIEWDETAILBLOG.png', 725)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1820, N'img/VIEWBLOG.png', 725)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1821, N'img/Screenshot 2024-06-17 223421.png', 726)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1822, N'img/VIEWDETAILBLOG.png', 726)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1823, N'img/VIEWBLOG.png', 726)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1824, N'img/Screenshot 2024-06-17 223421.png', 727)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1825, N'img/VIEWDETAILBLOG.png', 727)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1826, N'img/VIEWBLOG.png', 727)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1827, N'img/Screenshot 2024-06-17 223421.png', 728)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1828, N'img/VIEWDETAILBLOG.png', 728)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1829, N'img/VIEWBLOG.png', 728)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1830, N'img/Screenshot 2024-06-17 223421.png', 729)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1831, N'img/VIEWDETAILBLOG.png', 729)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1832, N'img/VIEWBLOG.png', 729)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1833, N'img/Screenshot 2024-06-17 223421.png', 730)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1834, N'img/VIEWDETAILBLOG.png', 730)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1835, N'img/VIEWBLOG.png', 730)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1836, N'img/Screenshot 2024-06-17 223421.png', 731)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1837, N'img/VIEWDETAILBLOG.png', 731)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1838, N'img/VIEWBLOG.png', 731)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1839, N'img/Screenshot 2024-06-17 223421.png', 732)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1840, N'img/VIEWDETAILBLOG.png', 732)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1841, N'img/VIEWBLOG.png', 732)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1842, N'img/Screenshot 2024-06-17 223421.png', 733)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1843, N'img/VIEWDETAILBLOG.png', 733)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1844, N'img/VIEWBLOG.png', 733)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1845, N'img/Screenshot 2024-06-17 223421.png', 734)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1846, N'img/VIEWDETAILBLOG.png', 734)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1847, N'img/VIEWBLOG.png', 734)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1848, N'img/Screenshot 2024-06-17 223421.png', 735)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1849, N'img/VIEWDETAILBLOG.png', 735)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1850, N'img/VIEWBLOG.png', 735)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1851, N'img/Screenshot 2024-06-17 223421.png', 736)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1852, N'img/VIEWDETAILBLOG.png', 736)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1853, N'img/VIEWBLOG.png', 736)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1854, N'img/432360966_122192626028091095_5863289487999889641_n.jpg', 737)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1855, N'img/Screenshot 2024-06-17 223421.png', 737)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1856, N'img/VIEWDETAILBLOG.png', 738)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1857, N'img/VIEWBLOG.png', 738)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1858, N'img/VIEWDETAILBLOG.png', 739)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1859, N'img/VIEWBLOG.png', 739)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1860, N'img/VIEWBLOG.png', 740)
INSERT [dbo].[RoomImage] ([id], [image], [room_id]) VALUES (1861, N'img/addBlog.png', 740)
SET IDENTITY_INSERT [dbo].[RoomImage] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [username], [password], [fullName], [email], [gender], [phone], [address], [role], [status]) VALUES (1, N'tungnmxinchao', N'123', N'nguyenmanhtung', N'tung@gmail.com', 1, N'0849978689', N'hungyen', 0, 1)
INSERT [dbo].[Users] ([id], [username], [password], [fullName], [email], [gender], [phone], [address], [role], [status]) VALUES (2, N'admin', N'123', N'admin', N'admin@gmail.com', 1, N'0849978689', N'hungyen', 1, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Booking] ADD  CONSTRAINT [DF_Booking_booking_date]  DEFAULT (getdate()) FOR [booking_date]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Room] FOREIGN KEY([room_id])
REFERENCES [dbo].[Room] ([rid])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Room]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Users] FOREIGN KEY([bookingBy])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Users]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Hotel] FOREIGN KEY([hotel_id])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Hotel]
GO
