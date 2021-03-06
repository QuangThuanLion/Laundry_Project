USE [LAUNDRY_PROJECT]
GO
/****** Object:  Table [dbo].[AccountRoles]    Script Date: 21/03/2021 10:16:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountRoles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[employeeId] [bigint] NOT NULL,
	[roleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Barcodes]    Script Date: 21/03/2021 10:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Barcodes](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[orderId] [bigint] NOT NULL,
	[codeName] [varchar](255) NOT NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 21/03/2021 10:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](255) NOT NULL,
	[categoryCode] [varchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [nvarchar](255) NULL,
	[modifyDate] [datetime] NULL,
	[modifyBy] [nvarchar](255) NULL,
	[status] [bit] NULL,
	[image] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 21/03/2021 10:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](max) NULL,
	[customerId] [bigint] NOT NULL,
	[newId] [int] NOT NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [nvarchar](255) NULL,
	[modifyDate] [datetime] NULL,
	[modifyBy] [nvarchar](255) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Counties]    Script Date: 21/03/2021 10:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Counties](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 21/03/2021 10:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[fullname] [nvarchar](255) NULL,
	[phone] [bigint] NULL,
	[gender] [varchar](50) NULL,
	[dayOfBirth] [datetime] NULL,
	[address] [nvarchar](255) NULL,
	[avatar] [varchar](max) NULL,
	[idCounty] [int] NULL,
	[activated] [bit] NULL,
	[status] [bit] NULL,
	[createdDate] [datetime] NULL,
	[modifyDate] [datetime] NULL,
	[modifyBy] [nvarchar](255) NULL,
	[roleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DuePayments]    Script Date: 21/03/2021 10:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DuePayments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customerId] [bigint] NULL,
	[orderId] [bigint] NULL,
	[totalDebt] [bigint] NULL,
	[fromDate] [datetime] NULL,
	[toDate] [datetime] NULL,
	[description] [nvarchar](255) NULL,
	[status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 21/03/2021 10:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employees](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[fullname] [nvarchar](200) NULL,
	[phone] [bigint] NULL,
	[gender] [varchar](50) NULL,
	[dayOfBirth] [datetime] NULL,
	[address] [nvarchar](255) NULL,
	[avatar] [varchar](max) NULL,
	[dateStart] [datetime] NULL,
	[dateEnd] [datetime] NULL,
	[contractSalary] [bigint] NULL,
	[unitSalary] [varchar](50) NULL,
	[workTime] [int] NULL,
	[schedule] [varchar](max) NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [nvarchar](255) NULL,
	[modifyDate] [datetime] NULL,
	[modifyBy] [nvarchar](255) NULL,
	[status] [bit] NULL,
	[activated] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 21/03/2021 10:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[providerId] [int] NULL,
	[price] [int] NOT NULL,
	[amount] [int] NOT NULL,
	[description] [nvarchar](255) NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [nvarchar](255) NULL,
	[modifyDate] [datetime] NULL,
	[modifyBy] [nvarchar](255) NULL,
	[available] [bit] NULL,
	[materialName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 21/03/2021 10:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[News](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NULL,
	[thumbnail] [varchar](max) NULL,
	[shortDescription] [nvarchar](500) NULL,
	[content] [nvarchar](max) NULL,
	[categoryPostId] [int] NOT NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [nvarchar](255) NULL,
	[modifyDate] [datetime] NULL,
	[modifyBy] [nvarchar](255) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 21/03/2021 10:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[orderId] [bigint] NOT NULL,
	[productId] [int] NOT NULL,
	[discount] [float] NULL,
	[price] [int] NULL,
	[type] [nvarchar](50) NULL,
	[status] [bit] NULL,
	[totalPrice] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 21/03/2021 10:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[customerId] [bigint] NULL,
	[orderDate] [datetime] NULL,
	[endDate] [datetime] NULL,
	[address] [nvarchar](max) NULL,
	[paymentMethodId] [int] NULL,
	[paymentStatus] [varchar](50) NULL,
	[amount] [int] NULL,
	[description] [nvarchar](max) NULL,
	[statusId] [int] NULL,
	[createdBy] [nvarchar](255) NULL,
	[shippingId] [int] NULL,
	[employeeIdConfirm] [bigint] NULL,
	[employeeIdShipping] [bigint] NULL,
	[totalDebt] [int] NULL,
	[status] [bit] NULL,
	[totalOrder] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PayMentMethods]    Script Date: 21/03/2021 10:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayMentMethods](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[paymentName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PayRollsEmployees]    Script Date: 21/03/2021 10:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PayRollsEmployees](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[month] [datetime] NOT NULL,
	[employeeId] [bigint] NOT NULL,
	[dayOff] [varchar](500) NULL,
	[dayWork] [varchar](500) NULL,
	[hourOfDay] [int] NULL,
	[salaryToMonth] [bigint] NULL,
	[unitSalary] [nvarchar](50) NULL,
	[fromDate] [datetime] NULL,
	[toDate] [datetime] NULL,
	[standardWorkDay] [int] NULL,
	[totalWorkDay] [int] NULL,
	[baseSalary] [bigint] NULL,
	[mainSalary] [bigint] NULL,
	[subsidySalary] [bigint] NULL,
	[totalOverTime] [int] NULL,
	[overtimePay] [bigint] NULL,
	[totalSalary] [bigint] NULL,
	[description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PayRollsWorker]    Script Date: 21/03/2021 10:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PayRollsWorker](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[month] [datetime] NOT NULL,
	[workerId] [int] NOT NULL,
	[dayOff] [varchar](500) NULL,
	[dayWork] [varchar](500) NULL,
	[hourOfDay] [int] NULL,
	[salaryToMonth] [bigint] NULL,
	[unitSalary] [nvarchar](50) NULL,
	[fromDate] [datetime] NULL,
	[toDate] [datetime] NULL,
	[standardWorkDay] [int] NULL,
	[totalWorkDay] [int] NULL,
	[baseSalary] [bigint] NULL,
	[mainSalary] [bigint] NULL,
	[subsidySalary] [bigint] NULL,
	[totalOverTime] [int] NULL,
	[overtimePay] [bigint] NULL,
	[totalSalary] [bigint] NULL,
	[description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PostCategories]    Script Date: 21/03/2021 10:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PostCategories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoryNamePost] [nvarchar](255) NOT NULL,
	[categoryCodePost] [varchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [nvarchar](255) NULL,
	[modifyDate] [datetime] NULL,
	[modifyBy] [nvarchar](255) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 21/03/2021 10:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](max) NOT NULL,
	[categoryId] [int] NOT NULL,
	[description] [nvarchar](max) NULL,
	[image] [varchar](max) NULL,
	[viewCount] [int] NULL,
	[discount] [float] NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [nvarchar](255) NULL,
	[modifyDate] [datetime] NULL,
	[modifyBy] [nvarchar](255) NULL,
	[type] [nvarchar](10) NULL,
	[price] [int] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Providers]    Script Date: 21/03/2021 10:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Providers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[providerName] [nvarchar](255) NULL,
	[phone] [int] NOT NULL,
	[address] [nvarchar](255) NULL,
	[email] [varchar](50) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 21/03/2021 10:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShippingAdress]    Script Date: 21/03/2021 10:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingAdress](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[addressName] [nvarchar](max) NOT NULL,
	[price] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 21/03/2021 10:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[statusName] [varchar](100) NOT NULL,
	[color] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Workers]    Script Date: 21/03/2021 10:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Workers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[workerName] [nvarchar](255) NOT NULL,
	[phone] [int] NULL,
	[address] [nvarchar](255) NULL,
	[gender] [varchar](50) NULL,
	[dayOfBirth] [datetime] NULL,
	[avatar] [varchar](max) NULL,
	[status] [bit] NULL,
	[dateStart] [datetime] NULL,
	[dateEnd] [datetime] NULL,
	[contactSalary] [bigint] NULL,
	[unitSalary] [varchar](50) NULL,
	[workTime] [int] NULL,
	[schedule] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Works]    Script Date: 21/03/2021 10:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Works](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[workerId] [int] NOT NULL,
	[dateStart] [datetime] NULL,
	[dateEnd] [datetime] NULL,
	[title] [nvarchar](500) NULL,
	[status] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AccountRoles] ON 

INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (1, 1, 1)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (2, 1, 2)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (3, 1, 3)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (4, 2, 1)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (5, 3, 2)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (6, 4, 2)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (7, 21, 3)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (8, 17, 1)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (9, 22, 1)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (10, 2, 1)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (11, 2, 3)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (12, 2, 4)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (13, 23, 1)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (14, 24, 2)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (15, 25, 1)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (16, 26, 2)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (17, 27, 2)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (18, 28, 2)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (19, 29, 2)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (20, 30, 2)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (21, 31, 2)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (22, 32, 2)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (23, 33, 2)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (24, 34, 2)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (25, 35, 1)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (26, 36, 2)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (27, 37, 2)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (28, 38, 1)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (29, 39, 3)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (30, 40, 2)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (31, 41, 2)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (32, 42, 2)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (33, 43, 1)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (34, 44, 2)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (35, 2, 2)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (36, 2, 2)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (37, 2, 1)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (38, 2, 1)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (39, 2, 1)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (40, 2, 1)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (41, 1, 1)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (42, 1, 2)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (43, 2, 2)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (44, 3, 2)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (45, 4, 2)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (46, 45, 1)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (47, 46, 3)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (48, 45, 1)
INSERT [dbo].[AccountRoles] ([id], [employeeId], [roleId]) VALUES (49, 45, 1)
SET IDENTITY_INSERT [dbo].[AccountRoles] OFF
SET IDENTITY_INSERT [dbo].[Barcodes] ON 

INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (1, 1, N'0HKNF528F', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (2, 2, N'0HKNF528F', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (3, 3, N'0HKNF528F', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (4, 4, N'0HKNF528F', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (5, 5, N'0HKNF528F', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (12, 21, N'crae4ueehtunkeu', CAST(N'2020-12-15 22:14:16.173' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (13, 22, N'ncnauctygeqaunn', CAST(N'2020-12-15 22:21:27.480' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (14, 23, N'HE9A2ANYU435GHHN7H6E', CAST(N'2020-12-15 22:29:42.363' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (15, 24, N'HHG2HHGN5NTTTANNANNC', CAST(N'2020-12-15 22:44:48.860' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (16, 25, N'A98U8PYTAA6ENT0N4A2N', CAST(N'2020-12-15 22:45:08.677' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (17, 26, N'TNHTUUY0ECA7TA319YNC', CAST(N'2020-12-15 22:47:31.133' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (18, 27, N'UE6UEN24HT78NEY6E3EY', CAST(N'2020-12-15 22:47:39.667' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (19, 28, N'TANCU2NPH31ET2NH2GA7', CAST(N'2020-12-15 22:47:43.907' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (20, 29, N'YA512TN4GU51UH66EPE7', CAST(N'2020-12-15 22:47:47.983' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (21, 30, N'EP3GUUTPN2P2U8EHHP4N', CAST(N'2020-12-15 22:47:52.220' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (22, 31, N'NY39UC0HN6744YU28N0N', CAST(N'2020-12-15 22:47:56.870' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (23, 32, N'G49E1GA9EAU0AH257EHN', CAST(N'2020-12-15 22:48:04.537' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (24, 33, N'EE1H26GNTHPC32PHNPCA', CAST(N'2020-12-15 22:48:20.983' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (25, 34, N'7GNNHTGYCTPHEA420UH2', CAST(N'2020-12-15 22:49:46.940' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (26, 35, N'THG005HNG8ANU7T7NT6U', CAST(N'2020-12-15 22:55:00.333' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (27, 36, N'NN9CAEUAEACUG16E3066', CAST(N'2020-12-15 22:55:04.690' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (28, 37, N'YH7P9TU1G90ECUUGN8A8', CAST(N'2020-12-15 22:58:49.140' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (29, 38, N'8PT50C8Y5U37ET8E8N5U', CAST(N'2020-12-15 22:59:21.313' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (30, 39, N'N9ETNTT61PTCN3161U1A', CAST(N'2020-12-15 22:59:56.183' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (31, 40, N'NEUN2TAUTNH8ANP313UA', CAST(N'2020-12-15 23:00:04.463' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (32, 41, N'U736NCHA2EY46H6HN67N', CAST(N'2020-12-15 23:02:18.353' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (33, 42, N'5Y29EEHN12311AENE1Y1', CAST(N'2020-12-15 23:07:19.073' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (34, 43, N'AUT38TTAPT41GYUNNE4T', CAST(N'2020-12-15 23:09:05.643' AS DateTime), N'Nguyen Khac Trung')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (35, 44, N'15E5C0EU319GTANHU325', CAST(N'2020-12-15 23:12:07.173' AS DateTime), N'Nguyen Thi Trang')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (36, 45, N'PYUNNEY4CTHA3N71NCHT', CAST(N'2020-12-16 01:01:49.097' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (37, 46, N'U3PPT2UTAP798C64E7A4', CAST(N'2020-12-16 01:01:51.587' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (38, 47, N'H8HHE870THAAE2G5PGY4', CAST(N'2020-12-16 01:01:53.043' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (39, 48, N'N3UHGN51PTYHC882PNY0', CAST(N'2020-12-16 01:01:54.260' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (40, 49, N'N67AUG6HUN667ENNH755', CAST(N'2020-12-16 01:01:55.340' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (41, 50, N'NTG231P566TPUNE3G71U', CAST(N'2020-12-16 01:01:56.833' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (42, 51, N'1N8CYN8TEUNNYENHT3A0', CAST(N'2020-12-16 01:01:57.970' AS DateTime), N'Nguyễn Hữu Thọ')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (43, 52, N'ANGN7ANEHE3UA6A5UCTC', CAST(N'2020-12-16 14:44:01.377' AS DateTime), N'Nguyễn Văn A')
INSERT [dbo].[Barcodes] ([id], [orderId], [codeName], [createdDate], [createdBy]) VALUES (44, 53, N'EUN3CG4016H02GA6E0PY', CAST(N'2020-12-16 14:44:05.960' AS DateTime), N'Nguyễn Văn A')
SET IDENTITY_INSERT [dbo].[Barcodes] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([id], [categoryName], [categoryCode], [description], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [image]) VALUES (1, N'Áo quần', N'ao-quan', N'Giặt ủi Đà Nẵng tại Laundry City cung cấp dịch vụ giặt hấp, giặt khô các loại quần áo.', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Nguyễn Khắc Quang Thuận', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Nguyễn Quang Trung', 1, N'Assets/Client/vendors/img/service/1.png')
INSERT [dbo].[Categories] ([id], [categoryName], [categoryCode], [description], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [image]) VALUES (2, N'Giày dép', N'giay-dep', N'Chuyên nhận giặt giày, vệ sinh giày cao cấp giá rẻ tại Đà Nẵng. Giày sẽ sạch, đẹp, thơm hơn', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Nguyễn Khắc Quang Thuận', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Nguyễn Quang Trung', 1, N'Assets/Client/vendors/img/service/2.png')
INSERT [dbo].[Categories] ([id], [categoryName], [categoryCode], [description], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [image]) VALUES (3, N'Chăn mền', N'chan-men', N'Dịch vụ giặt sấy chăn mền tại Đà Nẵng của Laundry City. Luôn là địa chỉ uy tín tại Đà Nẵng.', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Nguyễn Khắc Quang Thuận', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Nguyễn Quang Trung', 1, N'Assets/Client/vendors/img/service/3.png')
INSERT [dbo].[Categories] ([id], [categoryName], [categoryCode], [description], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [image]) VALUES (4, N'Nệm, rèm, thảm', N'nem-rem-tham', N'Với 10 năm kinh nghiệm về giặt rèm cửa. Giặt ủi Đà Nẵng cam kết giặt rèm sạch, đẹp, thơm.', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Nguyễn Khắc Quang Thuận', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Nguyễn Quang Trung', 1, N'Assets/Client/vendors/img/service/4.png')
INSERT [dbo].[Categories] ([id], [categoryName], [categoryCode], [description], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [image]) VALUES (5, N'Đồ da lông thú', N'do-da-long-thu', N'Laundry City cung cấp dịch vụ giặt ủi đồ da, lông thú. Những bộ da và lông sẽ trở nên đẹp.', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Nguyễn Khắc Quang Thuận', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Nguyễn Quang Trung', 1, N'Assets/Client/vendors/img/service/5.png')
INSERT [dbo].[Categories] ([id], [categoryName], [categoryCode], [description], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [image]) VALUES (6, N'Balo túi xách', N'balo-tui-xach', N'Chuyên nhận giặt balo, túi xách cao cấp giá rẻ tại Đà Nẵng. Balo sẽ sạch, đẹp, thơm hơn', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Nguyễn Khắc Quang Thuận', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Nguyễn Quang Trung', 1, N'Assets/Client/vendors/img/service/6.png')
INSERT [dbo].[Categories] ([id], [categoryName], [categoryCode], [description], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [image]) VALUES (7, N'Giặt theo gói', N'goi-giat', N'Lựa chọn theo gói để có những ưu đãi hấp dẫn và chất lượng tốt nhất từ cửa hàng chúng tôi', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Nguyễn Khắc Quang Thuận', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Nguyễn Quang Trung', 1, N'Assets/Client/vendors/img/service/7.png')
INSERT [dbo].[Categories] ([id], [categoryName], [categoryCode], [description], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [image]) VALUES (8, N'Cho doanh nghiệp', N'goi-doanh-nghiep', N'Gói doanh nghiệp luôn là lựa chọn hàng đầu của nhà hàng, khách sạn, trung tâm tiệc cưới.', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Nguyễn Khắc Quang Thuận', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Nguyễn Quang Trung', 1, N'Assets/Client/vendors/img/service/8.png')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([id], [content], [customerId], [newId], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (1, N'Bài viết rất hữu ích và rất hay', 1, 1, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', NULL)
INSERT [dbo].[Comments] ([id], [content], [customerId], [newId], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (2, N'Bài viết rất hữu ích và rất hay', 2, 2, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', NULL)
INSERT [dbo].[Comments] ([id], [content], [customerId], [newId], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (3, N'Bài viết rất hữu ích và rất hay', 1, 2, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', NULL)
INSERT [dbo].[Comments] ([id], [content], [customerId], [newId], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (4, N'Bài viết rất hữu ích và rất hay', 2, 3, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', NULL)
INSERT [dbo].[Comments] ([id], [content], [customerId], [newId], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (5, N'Bài viết rất hữu ích và rất hay', 3, 4, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', NULL)
INSERT [dbo].[Comments] ([id], [content], [customerId], [newId], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (6, N'Bài viết rất hữu ích và rất hay', 1, 1, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', NULL)
INSERT [dbo].[Comments] ([id], [content], [customerId], [newId], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (7, N'Bài viết rất hữu ích và rất hay', 2, 2, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', NULL)
INSERT [dbo].[Comments] ([id], [content], [customerId], [newId], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (8, N'Bài viết rất hữu ích và rất hay', 1, 2, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', NULL)
INSERT [dbo].[Comments] ([id], [content], [customerId], [newId], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (9, N'Bài viết rất hữu ích và rất hay', 2, 3, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', NULL)
INSERT [dbo].[Comments] ([id], [content], [customerId], [newId], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (10, N'Bài viết rất hữu ích và rất hay', 3, 4, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', NULL)
INSERT [dbo].[Comments] ([id], [content], [customerId], [newId], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (11, N'hay qua ha', 33, 1, CAST(N'2020-12-13 12:04:12.683' AS DateTime), N'nguyen trung dung', CAST(N'2020-12-13 12:04:12.683' AS DateTime), N'nguyen trung dung', 1)
INSERT [dbo].[Comments] ([id], [content], [customerId], [newId], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (12, N'bai viet qua te', 32, 1, CAST(N'2020-12-13 12:15:01.310' AS DateTime), N'Nguyễn Hữu Thọ', CAST(N'2020-12-13 12:15:01.310' AS DateTime), N'Nguyễn Hữu Thọ', 1)
INSERT [dbo].[Comments] ([id], [content], [customerId], [newId], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (13, NULL, 34, 1, CAST(N'2020-12-13 12:18:25.980' AS DateTime), NULL, CAST(N'2020-12-13 12:18:25.980' AS DateTime), NULL, 1)
INSERT [dbo].[Comments] ([id], [content], [customerId], [newId], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (14, N'bai viet nay hay qua nha', 32, 1, CAST(N'2020-12-13 12:30:48.513' AS DateTime), N'Nguyễn Hữu Thọ', CAST(N'2020-12-13 12:30:48.513' AS DateTime), N'Nguyễn Hữu Thọ', 1)
INSERT [dbo].[Comments] ([id], [content], [customerId], [newId], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (15, N'bai viet nay that su dang gia', 32, 4, CAST(N'2020-12-13 12:32:35.963' AS DateTime), N'Nguyễn Hữu Thọ', CAST(N'2020-12-13 12:32:35.963' AS DateTime), N'Nguyễn Hữu Thọ', 1)
INSERT [dbo].[Comments] ([id], [content], [customerId], [newId], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (16, N'Ý kiến của bạn rất hay', 32, 4, CAST(N'2020-12-13 12:41:00.467' AS DateTime), N'Nguyễn Hữu Thọ', CAST(N'2020-12-13 12:41:00.467' AS DateTime), N'Nguyễn Hữu Thọ', 1)
INSERT [dbo].[Comments] ([id], [content], [customerId], [newId], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (17, N'theo ý kiến của tôi thì chúng ta có rất nhiều nguyên nhân ', 32, 4, CAST(N'2020-12-13 13:00:17.690' AS DateTime), N'Nguyễn Hữu Thọ', CAST(N'2020-12-13 13:00:17.690' AS DateTime), N'Nguyễn Hữu Thọ', 1)
INSERT [dbo].[Comments] ([id], [content], [customerId], [newId], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (18, N'Tôi không có ý kiến gì về bài này', 32, 1, CAST(N'2020-12-13 15:51:42.827' AS DateTime), N'Nguyễn Hữu Thọ', CAST(N'2020-12-13 15:51:42.827' AS DateTime), N'Nguyễn Hữu Thọ', 1)
INSERT [dbo].[Comments] ([id], [content], [customerId], [newId], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (19, N'Bài viết rất hay và ý nghĩa', 32, 1, CAST(N'2020-12-13 17:22:26.497' AS DateTime), N'Nguyễn Hữu Thọ', CAST(N'2020-12-13 17:22:26.497' AS DateTime), N'Nguyễn Hữu Thọ', 1)
INSERT [dbo].[Comments] ([id], [content], [customerId], [newId], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (20, N'toi chinh la nguyenthuanyoutobe.2412@gmail.com', 36, 4, CAST(N'2020-12-15 22:32:05.947' AS DateTime), N'Nguyen Trung Dung', CAST(N'2020-12-15 22:32:05.947' AS DateTime), N'Nguyen Trung Dung', 1)
INSERT [dbo].[Comments] ([id], [content], [customerId], [newId], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (21, N'Giao hàng đúng hẹn', 44, 2, CAST(N'2020-12-16 14:47:24.453' AS DateTime), N'Trương Thị Thu Hương', CAST(N'2020-12-16 14:47:24.453' AS DateTime), N'Trương Thị Thu Hương', 1)
INSERT [dbo].[Comments] ([id], [content], [customerId], [newId], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (22, N'Bài viết mới nhất theo order By', 32, 4, CAST(N'2020-12-16 14:52:57.400' AS DateTime), N'Nguyễn Hữu Thọ', CAST(N'2020-12-16 14:52:57.400' AS DateTime), N'Nguyễn Hữu Thọ', 1)
SET IDENTITY_INSERT [dbo].[Comments] OFF
SET IDENTITY_INSERT [dbo].[Counties] ON 

INSERT [dbo].[Counties] ([id], [name]) VALUES (1, N'Quận Hải Châu')
INSERT [dbo].[Counties] ([id], [name]) VALUES (2, N'Quận Cẩm Lệ')
INSERT [dbo].[Counties] ([id], [name]) VALUES (3, N'Quận Thanh Khê')
INSERT [dbo].[Counties] ([id], [name]) VALUES (4, N'Quận Liên Chiểu')
INSERT [dbo].[Counties] ([id], [name]) VALUES (5, N'Quận Ngũ Hành Sơn')
INSERT [dbo].[Counties] ([id], [name]) VALUES (6, N'Quận Sơn Trà')
INSERT [dbo].[Counties] ([id], [name]) VALUES (7, N'Huyện Hòa Vang')
INSERT [dbo].[Counties] ([id], [name]) VALUES (8, N'Huyện Hoàng Sa')
SET IDENTITY_INSERT [dbo].[Counties] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (1, N'quangthuanyomost1@gmail.com', N'thuan123', N'Nguyễn Khắc Quang Thuận', 383789311, N'Male', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thanh Khê - Ðà Nẵng', N'Assets/Admin/resources/customer/anh-dai-dien-facebook-2.jpg', 1, 1, 1, CAST(N'2020-12-20 00:00:00.000' AS DateTime), CAST(N'2020-01-20 00:00:00.000' AS DateTime), N'Nguyễn Khắc Quang Thuận', 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (2, N'quangthuanyomost2@gmail.com', N'thuan123', N'Nguyễn Lê Giang', 383789311, N'Male', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thanh Khê - Ðà Nẵng', N'Assets/Admin/resources/customer/customerDefault.jpg', 2, 1, 0, CAST(N'2020-12-20 00:00:00.000' AS DateTime), CAST(N'2020-01-20 00:00:00.000' AS DateTime), N'Nguyễn Khắc Quang Thuận', 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (3, N'quangthuanyomost3@gmail.com', N'thuan123', N'Nguyễn Viết Huỳnh', 383789311, N'Male', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thanh Khê - Ðà Nẵng', N'Assets/Admin/resources/customer/customerDefault.jpg', 3, 0, 0, CAST(N'2020-12-20 00:00:00.000' AS DateTime), CAST(N'2020-01-20 00:00:00.000' AS DateTime), N'Nguyễn Khắc Quang Thuận', 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (4, N'quangthuanyomost33@gmail.com', N'thuan123', N'Nguyễn Đại Dương', 383789311, N'Male', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thanh Khê - Ðà Nẵng', N'Assets/Admin/resources/customer/customerDefault.jpg', 4, 0, 1, CAST(N'2020-12-20 00:00:00.000' AS DateTime), CAST(N'2020-01-20 00:00:00.000' AS DateTime), N'Nguyễn Khắc Quang Thuận', 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (5, N'quangthuanyomost4@gmail.com', N'thuan123', N'Nguyễn Hoàng Sa', 383789311, N'Male', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thanh Khê - Ðà Nẵng', N'Assets/Admin/resources/customer/customerDefault.jpg', 5, 1, 1, CAST(N'2020-12-20 00:00:00.000' AS DateTime), CAST(N'2020-01-20 00:00:00.000' AS DateTime), N'Nguyễn Khắc Quang Thuận', 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (6, N'quangthuanyomost44@gmail.com', N'thuan123', N'Nguyễn Trọng Nghĩa', 383789311, N'Male', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thanh Khê - Ðà Nẵng', N'Assets/Admin/resources/customer/customerDefault.jpg', 6, 1, 0, CAST(N'2020-12-20 00:00:00.000' AS DateTime), CAST(N'2020-01-20 00:00:00.000' AS DateTime), N'Nguyễn Khắc Quang Thuận', 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (7, N'quangthuanyomost43@gmail.com', N'thuan123', N'Nguyễn Lê Kim', 383789311, N'Male', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thanh Khê - Ðà Nẵng', N'Assets/Admin/resources/customer/customerDefault.jpg', 7, 0, 0, CAST(N'2020-12-20 00:00:00.000' AS DateTime), CAST(N'2020-01-20 00:00:00.000' AS DateTime), N'Nguyễn Khắc Quang Thuận', 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (8, N'quangthuanyomost55@gmail.com', N'thuan123', N'Nguyễn Viết Trọng', 383789311, N'Male', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thanh Khê - Ðà Nẵng', N'Assets/Admin/resources/customer/customerDefault.jpg', 8, 0, 1, CAST(N'2020-12-20 00:00:00.000' AS DateTime), CAST(N'2020-01-20 00:00:00.000' AS DateTime), N'Nguyễn Khắc Quang Thuận', 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (10, N'quangthuansmt123@gmail.com', N'123456', N'Nguyễn Khắc Quang Thuận', 383789311, N'Male', CAST(N'2020-10-28 00:00:00.000' AS DateTime), N'24', N'Assets/Admin/resources/customer/anh-dai-dien-facebook-3.jpg', 3, 1, 1, NULL, NULL, NULL, 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (12, N'admin4444@gmail.com', N'12345', N'Nguyễn Hoàng Sa', NULL, NULL, NULL, N'Thanh Khê - Ðà Nẵng', N'Assets/Client/resources/image/client1.jpg', NULL, NULL, NULL, CAST(N'2020-12-05 21:14:23.027' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (13, N'admin444@gmail.com', N'dcsccdsc', N'Nguyễn Khắc Quang Thuận', NULL, NULL, NULL, N'Thanh Khê - Ðà Nẵng', N'Assets/Client/resources/image/customerDefault.jpg', NULL, NULL, NULL, CAST(N'2020-12-05 21:19:26.207' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (14, N'admin44@gmail.com', N'12133', N'Nguyễn Viết Huỳnh', NULL, NULL, NULL, N'Thanh Khê - Ðà Nẵng', N'Assets/Client/resources/image/client1.jpg', NULL, NULL, NULL, CAST(N'2020-12-05 21:21:14.603' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (15, N'editor@gmail.net', N'12345', N'Nguyễn Viết Trọng', NULL, NULL, NULL, N'Thanh Khê - Ðà Nẵng', N'Assets/Client/resources/image/user-2.png', NULL, NULL, NULL, CAST(N'2020-12-05 21:29:44.563' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (16, N'quangthuanyomost2@gmail.com', N'desv', N'Nguyễn Viết Trọng', NULL, NULL, NULL, N'Thanh Khê - Ðà Nẵng', N'Assets/Client/resources/image/customerDefault.jpg', NULL, 0, 1, CAST(N'2020-12-05 21:41:54.130' AS DateTime), NULL, NULL, 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (17, N'admindewd@gmail.com', N'123', N'Nguyễn Viết Trọng', NULL, NULL, NULL, N'Thanh Khê - Ðà Nẵng', N'Assets/client/resources/image/user-2.png', NULL, 0, 1, CAST(N'2020-12-05 21:47:05.683' AS DateTime), NULL, NULL, 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (18, N'admiedsn@gmail.com', N'123', N'Nguyễn Trọng Dũng', NULL, NULL, NULL, N'Thanh Khê - Ðà Nẵng', N'Assets/client/resources/image/user-3.png', NULL, 0, 1, CAST(N'2020-12-05 21:47:28.720' AS DateTime), NULL, NULL, 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (19, N'admifdfn@gmail.com', N'1234', N'Nguyễn Trọng Dũng', NULL, NULL, NULL, N'Thanh Khê - Ðà Nẵng', N'Assets/client/resources/image/user-3.png', NULL, 0, 1, CAST(N'2020-12-05 21:47:35.970' AS DateTime), NULL, NULL, 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (20, N'thuannguyenadmin@gmail.com', N'5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', N'Nguyễn Trọng Dũng', NULL, NULL, NULL, N'Thanh Khê - Ðà Nẵng', N'Assets/client/resources/image/client1.jpg', NULL, 0, 1, CAST(N'2020-12-05 22:17:25.667' AS DateTime), NULL, NULL, 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (23, N'nguyenkhacquangthuan1@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Viết Trọng', 383789311, N'Male', CAST(N'2020-10-28 00:00:00.000' AS DateTime), N'Thanh Khê - Ðà Nẵng', N'Assets/Client/resources/image/customerDefault.jpg', 1, 1, 1, CAST(N'2020-12-05 23:17:56.000' AS DateTime), CAST(N'2020-12-11 02:24:19.177' AS DateTime), N'Nguyễn Viết Trọng', 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (24, N'trongmai@gmail.com', N'123456789', N'Nguyen trong mai', 123456789, NULL, NULL, N'34 Quan Lien Chieu Da Nang', N'Assets/Admin/resources/image/customerDefault.jpg', 4, 0, 1, CAST(N'2020-12-06 03:38:18.087' AS DateTime), NULL, NULL, 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (25, N'nguyendung@gmail.com', N'123456798', N'Nguyễn Trọng Dũng', 123456798, NULL, NULL, N'Thanh khê _ Đà Nẵng', N'Assets/Admin/resources/image/customerDefault.jpg', 4, 0, 1, CAST(N'2020-12-07 23:04:21.320' AS DateTime), NULL, NULL, 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (26, N'nguyenmanhha@gmail.com', N'EV/naUinUCovR/E7vSrvkg==', NULL, NULL, NULL, NULL, N'Thanh Khê - Ðà Nẵng', N'Assets/Admin/resources/image/customerDefault.jpg', NULL, 0, 1, CAST(N'2020-12-08 02:00:16.290' AS DateTime), NULL, NULL, 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (27, N'anhchangkhodai@gmail.com', N'njFrkBKk8WXBskURZSoZZw==', N'Nguyễn Trọng Nghĩa', NULL, NULL, NULL, N'Thanh Khê - Ðà Nẵng', N'Assets/Admin/resources/image/client1.jpg', NULL, 0, 1, CAST(N'2020-12-08 02:10:18.237' AS DateTime), NULL, NULL, 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (28, N'nguyenvanlinh@gmail.com', N'22-85-87-7F-BE-C4-BB-1A-D6-46-6A-6D-35-96-F3-A3-69-64-6D-B0-3A-02-D4-F7-4A-26-16-A5-0D-45-7A-0C', N'Nguyễn Trọng Nghĩa', NULL, NULL, NULL, N'Thanh Khê - Ðà Nẵng', N'Assets/Admin/resources/image/customerDefault.jpg', NULL, 0, 1, CAST(N'2020-12-09 19:30:04.337' AS DateTime), NULL, NULL, 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (31, N'nguyenthuanyoutobe.2412123@gmail.com', N'tcvkFWUJbX1ZA8TwG8pNNQ==', N'Nguyễn Trọng Nghĩa', NULL, NULL, NULL, N'Thanh Khê - Ðà Nẵng', N'Assets/Admin/resources/image/user-2.png', 1, 1, 1, CAST(N'2020-12-09 19:55:05.623' AS DateTime), NULL, NULL, 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (32, N'nguyenkhacquangthuan@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Hữu Thọ', 977204758, N'Male', CAST(N'2020-11-09 00:00:00.000' AS DateTime), N'Hải Châu - Đà Nẵng', N'Assets/client/resources/image/user-3.png', 1, 1, 1, CAST(N'2020-12-10 21:07:42.000' AS DateTime), CAST(N'2020-12-16 14:52:56.873' AS DateTime), N'Nguyễn Hữu Thọ', 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (33, N'nguyendungmanh@gmail.com', N'tcvkFWUJbX1ZA8TwG8pNNQ==', N'nguyen trung dung', NULL, NULL, NULL, N'Thanh Khê - Ðà Nẵng', N'Assets/client/resources/image/client2.jpg', NULL, 0, 1, CAST(N'2020-12-13 12:04:02.087' AS DateTime), NULL, NULL, 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (34, N'nguyenkhacquangthuan@gmail.com', N'tcvkFWUJbX1ZA8TwG8pNNQ==', N'Nguyễn Trọng Nghĩa', NULL, NULL, NULL, N'Thanh Khê - Ðà Nẵng', N'Assets/Admin/resources/image/customerDefault.jpg', NULL, 0, 1, CAST(N'2020-12-13 12:18:25.450' AS DateTime), NULL, NULL, 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (35, N'daitrung@gmail.com', N'EOrjlMQo1PRbS0DaPS+gpw==', N'Nguyễn KhắcĐài Trung', 383789311, NULL, NULL, N'Thanh Khê - Ðà Nẵng', N'Assets/Client/resources/image/customerDefault.jpg', NULL, 1, 1, CAST(N'2020-12-13 14:34:10.977' AS DateTime), NULL, NULL, 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (36, N'nguyenthuanyoutddddobe.2412@gmail.com', N'tcvkFWUJbX1ZA8TwG8pNNQ==', N'Nguyen Trung Dung', NULL, NULL, NULL, NULL, N'Assets/Admin/resources/image/customerDefault.jpg', NULL, 1, 1, CAST(N'2020-12-15 22:32:00.737' AS DateTime), NULL, NULL, 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (37, N'nguyenthuanyoutobe.2412vdvfdfvdf@gmail.com', N'k6b4zCXay1lAZ+6G26OecA==', N'Nguyen Khac Trung', 383789311, N'', NULL, N'24 Le Dinh Duong - Da Nang', N'Assets/Admin/resources/image/customerDefault.jpg', 4, 1, 1, CAST(N'2020-12-15 23:09:05.623' AS DateTime), CAST(N'2020-12-15 23:09:05.623' AS DateTime), N'Nguyen Khac Trung', 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (38, N'nguyenthuanyoutobedvfvfvdf.2412@gmail.com', N'k6b4zCXay1lAZ+6G26OecA==', N'Nguyen Thi Trang', 383789311, N'Male', CAST(N'2020-11-09 00:00:00.000' AS DateTime), N'67/49 Dien Bien Phu', N'Assets/Admin/resources/image/customerDefault.jpg', 4, 1, 1, CAST(N'2020-12-15 23:12:06.517' AS DateTime), CAST(N'2020-12-15 23:12:06.517' AS DateTime), N'Nguyen Thi Trang', 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (39, N'nguyenthuanyoutobe.245545612@gmail.com', N'u0OS8edpSsNB2iU3DNGJ2Q==', NULL, NULL, NULL, NULL, NULL, N'Assets/Client/resources/image/customerDefault.jpg', NULL, 1, 1, CAST(N'2020-12-15 23:40:42.377' AS DateTime), NULL, NULL, 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (40, N'nguyenthuanyovfdfdbfdbdzutobe.2412@gmail.com', N'u0OS8edpSsNB2iU3DNGJ2Q==', N'', NULL, NULL, NULL, N'', N'Assets/Client/resources/image/customerDefault.jpg', 1, 1, 1, CAST(N'2020-12-15 23:53:17.093' AS DateTime), CAST(N'2020-12-15 23:53:17.093' AS DateTime), N'', 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (41, N'nguyenthuanyoutobegbgbgcccfdfg.2412@gmail.com', N'u0OS8edpSsNB2iU3DNGJ2Q==', N'Nguyễn Khắc Quang Thuận', 383789311, N'Male', CAST(N'2020-12-16 00:00:00.000' AS DateTime), N'24', N'Assets/Client/resources/image/11.jpg', 1, 1, 1, CAST(N'2020-12-16 14:33:27.000' AS DateTime), CAST(N'2020-12-16 14:36:45.367' AS DateTime), N'', 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (42, N'quangthuansmt@gmail.com', N'DB0I89buosNDZ7PszSj8cQ==', N'Nguyễn Văn A', 12345789, NULL, CAST(N'2020-12-16 14:43:55.133' AS DateTime), N'38 Yên Bái', N'Assets/Client/resources/image/customerDefault.jpg', 6, 1, 1, CAST(N'2020-12-16 14:43:55.133' AS DateTime), CAST(N'2020-12-16 14:43:55.133' AS DateTime), N'Nguyễn Văn A', 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (43, N'quangthuansmt@gmail.com', N'DB0I89buosNDZ7PszSj8cQ==', N'Nguyễn Văn A', 12345789, NULL, CAST(N'2020-12-16 14:44:01.857' AS DateTime), N'38 Yên Bái', N'Assets/Client/resources/image/customerDefault.jpg', 6, 1, 1, CAST(N'2020-12-16 14:44:01.857' AS DateTime), CAST(N'2020-12-16 14:44:01.857' AS DateTime), N'Nguyễn Văn A', 3)
INSERT [dbo].[Customers] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [idCounty], [activated], [status], [createdDate], [modifyDate], [modifyBy], [roleId]) VALUES (44, N'nguyenthuanyoutobe.2412@gmail.com', N'tcvkFWUJbX1ZA8TwG8pNNQ==', N'Trương Thị Thu Hương', NULL, NULL, CAST(N'2020-12-16 14:47:21.113' AS DateTime), N'', N'Assets/Client/resources/image/customerDefault.jpg', 1, 1, 1, CAST(N'2020-12-16 14:47:21.113' AS DateTime), CAST(N'2020-12-16 14:47:21.113' AS DateTime), N'Trương Thị Thu Hương', 3)
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[DuePayments] ON 

INSERT [dbo].[DuePayments] ([id], [customerId], [orderId], [totalDebt], [fromDate], [toDate], [description], [status]) VALUES (1, 1, 1, 300000, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Công nợ đã hoàn thành', N'done')
INSERT [dbo].[DuePayments] ([id], [customerId], [orderId], [totalDebt], [fromDate], [toDate], [description], [status]) VALUES (2, 2, 1, 300000, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Công nợ đã hoàn thành', N'done')
INSERT [dbo].[DuePayments] ([id], [customerId], [orderId], [totalDebt], [fromDate], [toDate], [description], [status]) VALUES (3, 3, 1, 300000, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Công nợ đã hoàn thành', N'done')
INSERT [dbo].[DuePayments] ([id], [customerId], [orderId], [totalDebt], [fromDate], [toDate], [description], [status]) VALUES (4, 4, 1, 300000, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Công nợ đã hoàn thành', N'done')
INSERT [dbo].[DuePayments] ([id], [customerId], [orderId], [totalDebt], [fromDate], [toDate], [description], [status]) VALUES (5, 5, 1, 300000, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Công nợ đã hoàn thành', N'done')
INSERT [dbo].[DuePayments] ([id], [customerId], [orderId], [totalDebt], [fromDate], [toDate], [description], [status]) VALUES (6, 1, 2, 300000, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Công nợ đã hoàn thành', N'done')
INSERT [dbo].[DuePayments] ([id], [customerId], [orderId], [totalDebt], [fromDate], [toDate], [description], [status]) VALUES (7, 1, 1, 300000, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Công nợ đã hoàn thành', N'done')
INSERT [dbo].[DuePayments] ([id], [customerId], [orderId], [totalDebt], [fromDate], [toDate], [description], [status]) VALUES (8, 2, 1, 300000, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Công nợ đã hoàn thành', N'done')
INSERT [dbo].[DuePayments] ([id], [customerId], [orderId], [totalDebt], [fromDate], [toDate], [description], [status]) VALUES (9, 3, 1, 300000, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Công nợ đã hoàn thành', N'done')
INSERT [dbo].[DuePayments] ([id], [customerId], [orderId], [totalDebt], [fromDate], [toDate], [description], [status]) VALUES (10, 4, 1, 300000, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Công nợ đã hoàn thành', N'done')
INSERT [dbo].[DuePayments] ([id], [customerId], [orderId], [totalDebt], [fromDate], [toDate], [description], [status]) VALUES (11, 5, 1, 300000, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Công nợ đã hoàn thành', N'done')
INSERT [dbo].[DuePayments] ([id], [customerId], [orderId], [totalDebt], [fromDate], [toDate], [description], [status]) VALUES (12, 1, 2, 300000, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Công nợ đã hoàn thành', N'done')
SET IDENTITY_INSERT [dbo].[DuePayments] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (1, N'quangthuansmt8@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang  Đạt', 383789311, N'Male', CAST(N'1995-12-24 00:00:00.000' AS DateTime), N'Đồng Hới-Quảng Bình', N'anhEmployee1.jpg', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 5000000, N'thang', 10, N'th2,th3,th4,th5,th6', CAST(N'2020-12-20 00:00:00.000' AS DateTime), N'Admin', CAST(N'2020-12-30 00:00:00.000' AS DateTime), N'Nguyên Khắc Quang Thuận', 0, 1)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (2, N'thuannguyenadmin@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Đoàn', 12345679, N'Male', CAST(N'2020-11-03 00:00:00.000' AS DateTime), N'Hà Nội', N'Assets/Admin/resources/image/userDefault.jpg', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-10-20 00:00:00.000' AS DateTime), 5000000, N'thang', 8, N'th2,th3,th4,th5,th6', CAST(N'2020-12-20 00:00:00.000' AS DateTime), N'Admin', CAST(N'2020-11-29 04:17:16.790' AS DateTime), N'Nguyễn Khắc Quang Đoàn', 0, 1)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (3, N'honghanh123@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Hồng Hạnh', 383789311, N'Female', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Đồng Hới-Quảng Bình', N'Assets/Admin/resources/image/userDefault.jpg', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 5000000, N'thang', 8, N'th2,th3,th4,th5,th6', CAST(N'2020-12-20 00:00:00.000' AS DateTime), N'Admin', CAST(N'2020-12-30 00:00:00.000' AS DateTime), N'Nguyên Khắc Quang Thuận', 0, 1)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (4, N'quangtrung@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Quang Trung', 383789311, N'Male', CAST(N'1995-12-24 00:00:00.000' AS DateTime), N'Đồng Hới-Quảng Bình', N'anhEmployee1.jpg', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 5000000, N'thang', 8, N'th2,th3,th4,th5,th6', CAST(N'2020-12-20 00:00:00.000' AS DateTime), N'Admin', CAST(N'2020-12-30 00:00:00.000' AS DateTime), N'Nguyên Khắc Quang Thuận', 0, 0)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (9, N'quangthuansmt123@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Thuận', 383789311, N'Male', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'24', N'Assets/Admin/resources/image/106567740_10112084545410921_8506334020973196184_o.jpg', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-10-20 00:00:00.000' AS DateTime), 5555555, N'ngày', 5, N'th2,th3,th4,th5', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (10, N'honghanh123@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Hồng Hạnh', 383789311, N'Female', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Đồng Hới-Quảng Bình', N'Assets/Admin/resources/image/Hinh-nen-anh-chuc-mung-sinh-nhat.jpg', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 5000000, N'thang', 8, N'th2,th3,th4,th5,th6', CAST(N'2020-12-20 00:00:00.000' AS DateTime), N'Admin', CAST(N'2020-12-30 00:00:00.000' AS DateTime), N'Nguyên Khắc Quang Thuận', 1, 1)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (11, N'admin@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Thuận', 383789311, NULL, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'24', N'Assets/Admin/resources/image/userDefault.jpg', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-10-20 00:00:00.000' AS DateTime), 333333333, N'ngày', 3, N'th2,th3,th4,th5', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (12, N'honghanh123@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Hồng Hạnh', 383789311, N'Female', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Đồng Hới-Quảng Bình', N'Assets/Admin/resources/image/userDefault.jpg', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 5000000, N'thang', 8, N'th2,th3,th4,th5,th6', CAST(N'2020-12-20 00:00:00.000' AS DateTime), N'Admin', CAST(N'2020-12-30 00:00:00.000' AS DateTime), N'Nguyên Khắc Quang Thuận', 0, 1)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (13, N'quangthuansmt6@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Trung', 383789311, N'Male', CAST(N'1995-12-24 00:00:00.000' AS DateTime), N'Đồng Hới-Quảng Bình', N'Assets/Admin/resources/image/userDefault.jpg', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 5000000, N'thang', 8, N'th2,th3,th4,th5,th6', CAST(N'2020-12-20 00:00:00.000' AS DateTime), N'Admin', CAST(N'2020-12-30 00:00:00.000' AS DateTime), N'Nguyên Khắc Quang Thuận', 0, 1)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (14, N'honghanh123@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Hồng Hạnh', 383789311, N'Female', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Đồng Hới-Quảng Bình', N'Assets/Admin/resources/image/1453473_717940548231043_418384555_n - Copy.jpg', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 5000000, N'thang', 8, N'th2,th3,th4,th5,th6', CAST(N'2020-12-20 00:00:00.000' AS DateTime), N'Admin', CAST(N'2020-12-30 00:00:00.000' AS DateTime), N'Nguyên Khắc Quang Thuận', 1, 1)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (15, N'admin@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Thuận', 383789311, N'Male', NULL, N'24', N'Assets/Admin/resources/image/userDefault.jpg', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-10-20 00:00:00.000' AS DateTime), 333335, N'ngày', 3, N'th2,th3,th4,th5', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (16, N'quangthuansmt7@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Thùy Dương', 383789311, N'Male', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Đồng Hới', N'Assets/Admin/resources/image/userDefault.jpg', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-10-20 00:00:00.000' AS DateTime), 333333, N'ngày', 2, N'th2,th3,th4,th5', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (17, N'admin@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Dương', 383789311, N'Male', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'24', N'Assets/Admin/resources/image/userDefault.jpg', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-10-20 00:00:00.000' AS DateTime), 5555, N'ngày', 5, N'th2,th3,th4,th5', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (18, N'quangthuansmt1@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Đạt', 383789311, N'Male', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'24', N'Assets/Admin/resources/image/img4n9t1urodo.jpg', CAST(N'2020-10-20 00:00:00.000' AS DateTime), NULL, 33333, N'ngày', 3, N'th2,th3,th4,th5', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (19, N'editor@gmail.net', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Thuận', 383789311, N'Male', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'24', N'Assets/Admin/resources/image/anh-dai-dien-facebook-4.jpg', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-10-20 00:00:00.000' AS DateTime), 22222, N'ngày', 2, N'th2,th3,th4,th5', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (20, N'quangthuansmt2@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Thuận', 383789311, N'Male', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'24', N'Assets/Admin/resources/image/14614633.jpg', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-10-20 00:00:00.000' AS DateTime), 55555, N'ngày', 5, N'th2,th3,th4,th5', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (21, N'admin@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Dũng', 383789311, N'Male', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'24', N'Assets/Admin/resources/image/avatar104633_3.jpg', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-10-20 00:00:00.000' AS DateTime), 33333, N'ngày', 3, N'th2,th3,th4,th5', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (22, N'admin@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Đồng', 383789311, N'Male', CAST(N'2020-11-12 00:00:00.000' AS DateTime), N'24', N'Assets/Admin/resources/image/anh-dai-dien-facebook-4.jpg', CAST(N'2020-10-29 00:00:00.000' AS DateTime), CAST(N'2020-11-12 00:00:00.000' AS DateTime), 5555, N'ngày', 5, N'th2,th3,th4,th5', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (23, N'quangthuanyomost2@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Thuận', 383789311, N'Male', CAST(N'2020-11-03 00:00:00.000' AS DateTime), N'24', N'Assets/Admin/resources/image/yahoo_hello86158.jpg', CAST(N'2020-10-30 00:00:00.000' AS DateTime), CAST(N'2020-11-09 00:00:00.000' AS DateTime), 333333, N'ngày', 333, N'th2,th3,th4,th5', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (24, N'quangthuansmt4@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Thuận', 383789311, N'Male', CAST(N'2020-11-19 00:00:00.000' AS DateTime), N'24', N'Assets/Admin/resources/image/anh-dai-dien-facebook-7.jpg', CAST(N'2020-11-26 00:00:00.000' AS DateTime), CAST(N'2020-11-26 00:00:00.000' AS DateTime), 3333333333, N'ngày', 41, N'th2,th3,th4,th5', CAST(N'2020-11-26 23:40:47.123' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (25, N'admin@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Thuận', 383789311, N'Male', CAST(N'2020-11-06 00:00:00.000' AS DateTime), N'24', N'Assets/Admin/resources/image/userDefault.jpg', CAST(N'2020-11-06 00:00:00.000' AS DateTime), CAST(N'2020-11-21 00:00:00.000' AS DateTime), 4444, N'ngày', 3, N'th2,th3,th4,th5', CAST(N'2020-11-27 00:04:25.110' AS DateTime), N'Nguyễn Khắc Quang Trung', NULL, NULL, 1, NULL)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (26, N'nguyenthuanyoutobe.2412fddgmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Thuận', 383789311, N'Male', CAST(N'2020-10-28 00:00:00.000' AS DateTime), N'24', N'Assets/Admin/resources/image/3abf.jpg', CAST(N'2020-11-13 00:00:00.000' AS DateTime), CAST(N'2020-11-17 00:00:00.000' AS DateTime), 3333333, N'ngày', 10, N'th2,th3,th4,th5', CAST(N'2020-11-27 01:07:48.943' AS DateTime), N'Nguyễn Khắc Quang Trung', NULL, NULL, 1, 0)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (27, N'nguyenthuanyoutobe.24125435454@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Thuận', 383789311, N'Male', CAST(N'2020-11-12 00:00:00.000' AS DateTime), N'24', N'Assets/Admin/resources/image/anh-dai-dien-facebook-15.jpg', CAST(N'2020-11-17 00:00:00.000' AS DateTime), CAST(N'2020-11-18 00:00:00.000' AS DateTime), 44444, N'ngày', 3, N'th2,th3,th4,th5', CAST(N'2020-11-27 01:11:02.647' AS DateTime), N'Nguyễn Khắc Quang Trung', NULL, NULL, 1, 0)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (28, N'nguyenthuanyoutobe.24125435@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'', 383789311, N'Male', CAST(N'2020-11-05 00:00:00.000' AS DateTime), N'24', N'Assets/Admin/resources/image/anh-dai-dien-facebook-15.jpg', CAST(N'2020-11-06 00:00:00.000' AS DateTime), CAST(N'2020-11-19 00:00:00.000' AS DateTime), 33333, N'ngày', 3, N'th2,th3,th4,th5', CAST(N'2020-11-27 01:19:45.077' AS DateTime), N'Nguyễn Khắc Quang Trung', NULL, NULL, 1, 0)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (29, N'quangthuansmt3@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Thuận', 383789311, N'Male', CAST(N'2020-11-25 00:00:00.000' AS DateTime), N'24', N'Assets/Admin/resources/image/anh-dai-dien-facebook-2.jpg', CAST(N'2020-11-18 00:00:00.000' AS DateTime), CAST(N'2020-11-04 00:00:00.000' AS DateTime), 3333, N'ngày', 3, N'th2,th3,th4,th5', CAST(N'2020-11-27 01:36:04.250' AS DateTime), N'Nguyễn Khắc Quang Trung', NULL, NULL, 1, 0)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (30, N'quangthuansmt9@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'fwef', 23432, NULL, NULL, NULL, N'Assets/Admin/resources/image/userDefault.jpg', CAST(N'2020-11-17 00:00:00.000' AS DateTime), CAST(N'2021-11-27 02:11:31.617' AS DateTime), 3444, N'ngày', 4, N'th2,th3,th4,th5', CAST(N'2020-11-27 02:11:31.617' AS DateTime), N'Nguyễn Khắc Quang Trung', NULL, NULL, 1, 0)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (31, N'quangthuansmt20@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Thuận', 383789311, NULL, NULL, NULL, N'Assets/Admin/resources/image/userDefault.jpg', CAST(N'2020-11-10 00:00:00.000' AS DateTime), CAST(N'2021-11-27 02:22:40.170' AS DateTime), 222222222, N'ngày', 3, N'th2,th3,th4,th5', CAST(N'2020-11-27 02:22:40.170' AS DateTime), N'Nguyễn Khắc Quang Trung', NULL, NULL, 1, 0)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (32, N'quangthuansmt25@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Thuận', 383789311, NULL, NULL, NULL, N'Assets/Admin/resources/image/userDefault.jpg', CAST(N'2020-11-04 00:00:00.000' AS DateTime), CAST(N'2021-11-27 02:34:28.833' AS DateTime), 888888888, N'ngày', 5, N'th2,th3,th4,th5', CAST(N'2020-11-27 02:34:28.833' AS DateTime), N'Nguyễn Khắc Quang Trung', NULL, NULL, 1, 0)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (33, N'quangthuansmt45@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Thuận', 383789311, NULL, NULL, NULL, N'Assets/Admin/resources/image/userDefault.jpg', CAST(N'2020-11-12 00:00:00.000' AS DateTime), CAST(N'2021-11-27 02:40:09.830' AS DateTime), 66666, N'ngày', 6, N'th2,th3,th4,th5', CAST(N'2020-11-27 02:40:09.830' AS DateTime), N'Nguyễn Khắc Quang Trung', NULL, NULL, 1, 0)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (34, N'quangthuansmtvfd@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Thuận', 383789311, NULL, NULL, NULL, N'Assets/Admin/resources/image/userDefault.jpg', CAST(N'2020-11-09 00:00:00.000' AS DateTime), CAST(N'2021-11-28 22:01:44.043' AS DateTime), 3333333, N'ngày', 4, N'th2,th3,th4,th5', CAST(N'2020-11-28 22:01:44.043' AS DateTime), N'Nguyễn Khắc Quang Trung', NULL, NULL, 1, 1)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (35, N'quangthuansmt5656@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Thuận', 383789311, NULL, NULL, NULL, N'Assets/Admin/resources/image/userDefault.jpg', CAST(N'2020-11-18 00:00:00.000' AS DateTime), CAST(N'2021-11-28 22:04:31.327' AS DateTime), 44444, N'ngày', 4, N'th2,th3,th4,th5', CAST(N'2020-11-28 22:04:31.327' AS DateTime), N'Nguyễn Khắc Quang Trung', NULL, NULL, 1, 0)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (36, N'quangthuansmt75756@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Thuận', 383789311, NULL, NULL, NULL, N'Assets/Admin/resources/image/userDefault.jpg', CAST(N'2020-11-04 00:00:00.000' AS DateTime), CAST(N'2021-11-28 22:25:34.630' AS DateTime), 4444, N'ngày', 4, N'th2,th3,th4,th5', CAST(N'2020-11-28 22:25:34.630' AS DateTime), N'Nguyễn Khắc Quang Trung', NULL, NULL, 1, 0)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (37, N'quangthuansmt465165@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Thuận', 383789311, NULL, NULL, NULL, N'Assets/Admin/resources/image/userDefault.jpg', CAST(N'2020-11-18 00:00:00.000' AS DateTime), CAST(N'2021-11-28 22:42:22.627' AS DateTime), 3333, N'ngày', 3, N'th2,th3,th4,th5', CAST(N'2020-11-28 22:42:22.627' AS DateTime), N'Nguyễn Khắc Quang Trung', NULL, NULL, 1, 0)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (38, N'quangthuansmtfdsfdsfd@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Thuận', 383789311, NULL, NULL, NULL, N'Assets/Admin/resources/image/userDefault.jpg', CAST(N'2020-11-25 00:00:00.000' AS DateTime), CAST(N'2021-11-29 00:08:56.683' AS DateTime), 222222222, N'ngày', 22, N'th2,th3,th4,th5', CAST(N'2020-11-29 00:08:56.683' AS DateTime), N'Nguyễn Khắc Quang Trung', NULL, NULL, 1, 0)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (39, N'nguyenthuanyoutobe.2412gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Thuận', 383789311, NULL, NULL, NULL, N'Assets/Admin/resources/image/userDefault.jpg', CAST(N'2020-11-10 00:00:00.000' AS DateTime), CAST(N'2021-11-29 00:13:11.343' AS DateTime), 4444, N'ngày', 4, N'th2,th3,th4,th5', CAST(N'2020-11-29 00:13:11.343' AS DateTime), N'Nguyễn Khắc Quang Trung', NULL, NULL, 1, 0)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (40, N'nguyenthuanyouto3edsbe.2412@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Thuận', 383789311, NULL, NULL, NULL, N'Assets/Admin/resources/image/userDefault.jpg', CAST(N'2020-11-18 00:00:00.000' AS DateTime), CAST(N'2021-11-29 00:16:33.753' AS DateTime), 33333, N'ngày', 3, N'th2,th3,th4,th5', CAST(N'2020-11-29 00:16:33.753' AS DateTime), N'Nguyễn Khắc Quang Trung', NULL, NULL, 1, 0)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (41, N'nguyenthuanyoutocdcdcbe.2412@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Thuận', 383789311, NULL, NULL, NULL, N'Assets/Admin/resources/image/userDefault.jpg', CAST(N'2020-11-18 00:00:00.000' AS DateTime), CAST(N'2021-11-29 00:25:37.577' AS DateTime), 33333, N'ngày', 3, N'th2,th3,th4,th5', CAST(N'2020-11-29 00:25:37.577' AS DateTime), N'Nguyễn Khắc Quang Trung', NULL, NULL, 1, 0)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (42, N'nguyenthuanyoutobe.241222222@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Thuận', 383789311, NULL, NULL, NULL, N'Assets/Admin/resources/image/userDefault.jpg', CAST(N'2020-11-17 00:00:00.000' AS DateTime), CAST(N'2021-11-29 00:31:57.593' AS DateTime), 3333, N'ngày', 3, N'th2,th3,th4,th5', CAST(N'2020-11-29 00:31:57.593' AS DateTime), N'Nguyễn Khắc Quang Trung', NULL, NULL, 1, 0)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (43, N'quangthuansmt@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Thuận', 383789311, NULL, NULL, NULL, N'Assets/Admin/resources/image/userDefault.jpg', CAST(N'2020-11-04 00:00:00.000' AS DateTime), CAST(N'2021-11-29 00:36:42.237' AS DateTime), 2222, N'ngày', 2, N'th2,th3,th4,th5', CAST(N'2020-11-29 00:36:42.237' AS DateTime), N'Nguyễn Khắc Quang Trung', NULL, NULL, 1, 1)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (44, N'nguyenthuanyoutobe.2412@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Thuận', 383789311, NULL, NULL, NULL, N'Assets/Admin/resources/image/userDefault.jpg', CAST(N'2020-11-05 00:00:00.000' AS DateTime), CAST(N'2021-11-29 00:39:00.450' AS DateTime), 22222, N'ngày', 2, N'th2,th3,th4,th5', CAST(N'2020-11-29 00:39:00.450' AS DateTime), N'Nguyễn Khắc Quang Trung', NULL, NULL, 1, 1)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (45, N'nguyenkhacquangthuan@gmail.com', N'bz7ld5Ee/k1DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Thuận', 383789311, N'nam', CAST(N'2020-12-18 00:00:00.000' AS DateTime), N'Tân Nẫm - Bố Trạch - Quảng Bình', N'Assets/Admin/resources/image/11.jpg', CAST(N'2020-11-05 00:00:00.000' AS DateTime), CAST(N'2021-11-29 00:39:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-12-15 21:23:16.883' AS DateTime), N'Nguyễn Khắc Quang Thuận', 1, 1)
INSERT [dbo].[Employees] ([id], [email], [password], [fullname], [phone], [gender], [dayOfBirth], [address], [avatar], [dateStart], [dateEnd], [contractSalary], [unitSalary], [workTime], [schedule], [createdDate], [createdBy], [modifyDate], [modifyBy], [status], [activated]) VALUES (46, N'nguyenkhacDai@gmail.com', N'0naHxLfb6P9DZ7PszSj8cQ==', N'Nguyễn Khắc Quang Thuận', 383789311, NULL, NULL, NULL, N'Assets/Admin/resources/image/userDefault.jpg', CAST(N'2020-12-25 00:00:00.000' AS DateTime), CAST(N'2021-12-13 16:19:35.557' AS DateTime), 22222, N'ngày', 2, N'th2,th3,th4,th5', CAST(N'2020-12-13 16:19:35.557' AS DateTime), N'Nguyễn Khắc Quang Thuận', NULL, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Materials] ON 

INSERT [dbo].[Materials] ([id], [providerId], [price], [amount], [description], [createdDate], [createdBy], [modifyDate], [modifyBy], [available], [materialName]) VALUES (1, 1, 3000, 300, N'Hàng tốt chất lượng tốt', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Nguyễn Thuận', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', 1, N'Nước xả vải thiên nhiên')
INSERT [dbo].[Materials] ([id], [providerId], [price], [amount], [description], [createdDate], [createdBy], [modifyDate], [modifyBy], [available], [materialName]) VALUES (2, 2, 3000, 300, N'Hàng tốt chất lượng tốt', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Nguyễn Thuận', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', 1, N'Nước xả vải Sảng Khoái')
INSERT [dbo].[Materials] ([id], [providerId], [price], [amount], [description], [createdDate], [createdBy], [modifyDate], [modifyBy], [available], [materialName]) VALUES (3, 3, 3000, 300, N'Hàng tốt chất lượng tốt', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Nguyễn Thuận', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', 1, N'Nước Bột giặt omo')
INSERT [dbo].[Materials] ([id], [providerId], [price], [amount], [description], [createdDate], [createdBy], [modifyDate], [modifyBy], [available], [materialName]) VALUES (4, 4, 3000, 300, N'Hàng tốt chất lượng tốt', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Nguyễn Thuận', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', 1, N'Nước xả vải comfo')
INSERT [dbo].[Materials] ([id], [providerId], [price], [amount], [description], [createdDate], [createdBy], [modifyDate], [modifyBy], [available], [materialName]) VALUES (7, 1, 3000, 300, N'Hàng tốt chất lượng tốt', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Nguyễn Thuận', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', 1, N'Nước xả vải thiên nhiên')
INSERT [dbo].[Materials] ([id], [providerId], [price], [amount], [description], [createdDate], [createdBy], [modifyDate], [modifyBy], [available], [materialName]) VALUES (8, 2, 3000, 300, N'Hàng tốt chất lượng tốt', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Nguyễn Thuận', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', 1, N'Nước xả vải Sảng Khoái')
INSERT [dbo].[Materials] ([id], [providerId], [price], [amount], [description], [createdDate], [createdBy], [modifyDate], [modifyBy], [available], [materialName]) VALUES (9, 3, 3000, 300, N'Hàng tốt chất lượng tốt', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Nguyễn Thuận', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', 1, N'Nước Bột giặt omo')
INSERT [dbo].[Materials] ([id], [providerId], [price], [amount], [description], [createdDate], [createdBy], [modifyDate], [modifyBy], [available], [materialName]) VALUES (10, 4, 3000, 300, N'Hàng tốt chất lượng tốt', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Nguyễn Thuận', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', 1, N'Nước xả vải comfo')
INSERT [dbo].[Materials] ([id], [providerId], [price], [amount], [description], [createdDate], [createdBy], [modifyDate], [modifyBy], [available], [materialName]) VALUES (11, 5, 3000, 300, N'Hàng tốt chất lượng tốt', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Nguyễn Thuận', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', 1, N'Nước xả vải thiên nhiên')
INSERT [dbo].[Materials] ([id], [providerId], [price], [amount], [description], [createdDate], [createdBy], [modifyDate], [modifyBy], [available], [materialName]) VALUES (12, 5, 3000, 300, N'Hàng tốt chất lượng tốt', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Nguyễn Thuận', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', 1, N'Nước xả vải tinh khiết')
SET IDENTITY_INSERT [dbo].[Materials] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([id], [title], [thumbnail], [shortDescription], [content], [categoryPostId], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (1, N'SAPY LÀ XÍ NGHIỆP GIẶT LÀ ĐẦU TIÊN TẠI HÀ NỘI CÓ CHẤT LƯỢNG ĐẠT TIÊU CHUẨN ISO 9001:2015', N'Assets/Client/vendors/img/blog/1.jpg', N'VÀ ĐÓN NHẬN BẰNG KHEN CỦA BỘ QUỐC PHÒNG', N'Trong thời gian qua, tập thể cán bộ, nhân viên SAPY đã đoàn kết, nỗ lực phấn đấu xây dựng và áp dụng Hệ thống quản lý chất lượng theo tiêu chuẩn ISO 9001:2015, với mục đích:
- Xây dựng quy trình chuẩn để thực hiện và kiểm soát được quy trình thực hiện công việc.
- Phòng ngừa việc sai lỗi, giảm thiểu công việc làm lại, nâng cao năng suất, chất lượng sản phẩm.
- Tạo nền tảng để xây dựng môi trường làm việc chuyên nghiệp, hiệu quả.
Và với mục tiêu xây dựng:
- Xí nghiệp giặt là SAPY: UY TÍN - CHUYÊN NGHIỆP - SẠCH ĐẸP
- Đồng nghiệp: TẬN TÌNH - SẺ CHIA - CÙNG PHÁT TRIỂN
- Đối tác: HỢP TÁC CÙNG PHÁT TRIỂN
- Khách hàng: SỰ HÀI LÒNG CỦA BẠN CHÍNH LÀ HẠNH PHÚC CỦA CHÚNG TÔI
- Xã hội: SẢN PHẨM CHẤT LƯỢNG VƯỢT TRỘI.
Đến nay SAPY rất vinh dự và tự hào được đón nhận GIẤY CHỨNG NHẬN đánh giá và xác nhận phù hợp với các yêu cầu của tiêu chuẩn ISO 9001:2015.', 1, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', NULL)
INSERT [dbo].[News] ([id], [title], [thumbnail], [shortDescription], [content], [categoryPostId], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (2, N'GIẶT LÀ SAPY KHAI TRƯƠNG CỬA HÀNG NHẬN TRẢ HÀNG TẠI PHỐ ĐẶNG VŨ HỶ, LONG BIÊN, HÀ NỘI', N'Assets/Client/vendors/img/blog/2.jpg', N'SAPY ĐÓN CHỨNG NHẬN ISO 9001:2015
', N'VỀ VIỆC MỞ THÊM ĐỊA ĐIỂM NHẬN TRẢ HÀNG MỚI
Để thuận tiện trong việc giao dịch, nhận trả hàng với Qúy khách hàng ở gần khu vực quận Long Biên, Gia Lâm, Đông Anh - Hà Nội.
Từ ngày 06/10/2019 giặt là Sapy mở thêm một địa điểm nhận trả hàng mới như sau:
1- Địa điểm cửa hàng:
- Địa chỉ: Cửa hàng giặt là Sapy đường Đặng Vũ Hỷ, phường Thượng Thanh, quận Long Biên, Hà Nội.
- Điện thoại: 024.382.427.88;
2- Thời gian làm việc:
Tất cả các ngày trong tuần:
- Buổi sáng: Từ 07h30 đến 11h30;
- Buổi chiều: Từ 14h00 đến 18h30;
Sapy xin trân trọng cảm ơn sự hợp tác của Qúy khách!
Mọi chi tiết xin được đón tiếp qua số điện thoại Hotline 098.152.1188
Trân trọng!', 2, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', NULL)
INSERT [dbo].[News] ([id], [title], [thumbnail], [shortDescription], [content], [categoryPostId], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (3, N'GIẶT LÀ SAPY THÔNG BÁO QUY ĐỊNH XỬ LÝ HÀNG TỒN KHO
', N'Assets/Client/vendors/img/blog/1a.jpg', N'VỀ VIỆC MỞ THÊM ĐỊA ĐIỂM NHẬN TRẢ HÀNG MỚI
', N'QUY ĐỊNH VỀ VIỆC XỬ LÝ HÀNG TỒN KHO
Để đảm bảo về chất lượng sản phẩm, đề nghị Qúy khách đến lấy hàng đúng thời gian hẹn trả.
* Nếu sau 30 ngày Qúy khách  không đến lấy hàng, chúng tôi sẽ tính phí lưu kho, cụ thể như sau:
- Từ 31 đến 35 ngày so với ngày hẹn trả, mức phí lưu kho bằng 20% tiền dịch vụ giặt là của mặt hàng đó.
- Từ 36 đến 40 ngày so với ngày hẹn trả, mức phí lưu kho bằng 35% tiền dịch vụ giặt là của mặt hàng đó.
- Từ 41 đến 45 ngày so với ngày hẹn trả, mức phí lưu kho bằng 50% tiền dịch vụ giặt là của mặt hàng đó.
- Từ 46 đến 50 ngày so với ngày hẹn trả, mức phí lưu kho bằng 65% tiền dịch vụ giặt là của mặt hàng đó.
- Từ 51 đến 55 ngày so với ngày hẹn trả, mức phí lưu kho bằng 80% tiền dịch vụ giặt là của mặt hàng đó.
- Từ 56 đến 60 ngày so với ngày hẹn trả, mức phí lưu kho bằng 100% tiền dịch vụ giặt là của mặt hàng đó.
* Đối với hàng hóa quá hẹn từ 60 ngày trở lên, Sapy sẽ xử lý theo Quy định của Công ty, cụ thể như sau:
- Xử lý tiêu hủy, đối với hàng hóa không còn giá trị sử dụng (mục nát, hư hỏng, không đảm bảo chất lượng sử dụng)
- Tổ chức bán thanh lý cho cán bộ, nhân viên trong Công ty đối với hàng hóa còn giá trị sử dụng để hoàn phí lưu kho.
SAPY rất mong nhận được sự hợp tác của quý khách!
Trân trọng!', 3, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', NULL)
INSERT [dbo].[News] ([id], [title], [thumbnail], [shortDescription], [content], [categoryPostId], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (4, N'SAPY ĐIỀU CHỈNH BẢNG GIÁ GIẶT LÀ TỪ NGÀY 01/10/2019
', N'Assets/Client/vendors/img/blog/2a.jpg', N'BIỂU PHÍ VẬN CHUYỂN (ÁP DỤNG VỚI ĐƠN HÀNG NHẬN TRẢ HÀNG TẠI NHÀ)
', N'Xí nghiệp giặt là Sapy xin trân trọng cảm ơn sự hợp tác của Qúy khách hàng trong suốt thời gian qua!
Thời gian gần đây các loại nguyên, nhiên vật liệu chính dùng trong sản xuất của Xí nghiệp như điện, nước, chất giặt, bao bì đóng gói... và các chi phí khác đều tăng, việc này đã ảnh hưởng rất lớn đến tình hình sản xuất kinh doanh của Xí nghiệp.
Để khắc phục những khó khăn trên, Xí nghiệp đã chủ động thực hiện nhiều biện pháp tiết kiệm chi phí, cải tiến kỹ thuật để nâng cao năng suất lao động nhưng các chi phí cũng không giảm được nhiều.
Do vậy, để đảm bảo được chất lượng sản phẩm đáp ứng các yêu cầu của Qúy khách hàng, giặt là Sapy xin được điều chỉnh giá dịch vụ; bảng giá mới Sapy xin được áp dụng từ 01/10/2019.
Cũng từ 01/10/2019 Qúy khách vui lòng thanh toán tiền dịch vụ ngay sau khi đưa đồ giặt và nhận phiếu nhận hàng.
Vì diện tích kho hàng của Sapy có hạn, nên nếu sau 30 ngày Qúy khách không đến lấy đồ chúng tôi sẽ tính thêm phí gửi lưu kho; và sau 60 ngày Qúy khách không đến lấy đồ chúng tôi sẽ tiến hành lập hồ sơ xử lý hàng tồn theo quy định của Công ty.
Sapy rất mong nhận được sự hợp tác của Qúy khách!
Xin trân trọng cảm ơn!', 4, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', NULL)
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (1, 1, 1, 10, 20, N'cái', NULL, 11)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (2, 1, 1, 10, 20, N'cái', NULL, 11)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (3, 1, 1, 10, 20, N'kg', NULL, 11)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (4, 2, 1, 10, 20, N'gói', NULL, 11)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (5, 2, 1, 10, 20, N'cái', NULL, 11)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (6, 3, 1, 10, 20, N'kg', NULL, 11)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (7, 3, 1, 10, 20, N'kg', NULL, 11)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (8, 4, 1, 10, 20, N'cái', NULL, 11)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (9, 4, 1, 10, 20, N'kg', NULL, 11)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (10, 10, 1, 20, 10, N'Cái', 1, 11)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (11, 10, 2, 20, 10, N'Kg', 1, 11)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (12, 10, 3, 20, 10, N'Cái', 1, 88)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (13, 10, 4, 20, 10, N'Kg', 1, 77)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (14, 10, 5, 20, 10, N'Cái', 1, 66)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (15, 11, 30, 20, 20, N'Cái', 1, 55)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (16, 11, 31, 20, 20, N'Kg', 1, 44)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (17, 11, 39, NULL, 2, N'Cái', 1, 33)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (18, 11, 40, 20, 222, N'Kg', 1, 11)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (19, 12, 1, 20, 10, N'Cái', 1, 11)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (20, 12, 2, 20, 10, N'Kg', 1, 88)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (21, 13, 1, 20, 10, N'Cái', 1, 77)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (22, 13, 2, 20, 10, N'Kg', 1, 77)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (23, 13, 3, 20, 10, N'Cái', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (24, 14, 5, 20, 10, N'Cái', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (25, 14, 6, 20, 10, N'Kg', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (26, 14, 7, 20, 10, N'Cái', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (27, 14, 9, 20, 10, N'Cái', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (28, 14, 11, 20, 10, N'Kg', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (29, 15, 1, 20, 10, N'Cái', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (30, 15, 2, 20, 10, N'Kg', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (31, 15, 4, 20, 10, N'Kg', 1, 24)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (33, 1, 1, 10, 20, N'kg', NULL, 99)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (34, 2, 1, 10, 20, N'gói', NULL, 99)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (35, 2, 1, 10, 20, N'cái', NULL, 99)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (36, 3, 1, 10, 20, N'kg', NULL, 99)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (37, 3, 1, 10, 20, N'kg', NULL, 99)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (38, 4, 1, 10, 20, N'cái', NULL, 99)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (39, 4, 1, 10, 20, N'kg', NULL, 99)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (40, 16, 31, 20, 20, N'Kg', 1, 16)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (41, 16, 39, NULL, 2, N'Cái', 1, 0)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (42, 16, 40, 20, 222, N'Kg', 1, 178)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (43, 17, 1, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (44, 18, 30, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (45, 19, 20, 20, 10, N'Cái', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (46, 19, 21, 20, 10, N'Kg', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (47, 19, 22, 20, 10, N'Cái', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (48, 21, 46, NULL, 20, N'Cái', 1, 0)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (49, 21, 47, NULL, 10, N'Kg', 1, 0)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (50, 21, 1, 20, 10, N'Cái', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (51, 21, 2, 20, 10, N'Kg', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (52, 21, 3, 20, 10, N'Cái', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (53, 23, 1, 20, 10, N'Cái', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (54, 23, 2, 20, 10, N'Kg', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (55, 24, 1, 20, 10, N'Cái', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (56, 24, 2, 20, 10, N'Kg', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (57, 24, 3, 20, 10, N'Cái', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (58, 26, 20, 20, 10, N'Cái', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (59, 26, 21, 20, 10, N'Kg', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (60, 26, 22, 20, 10, N'Cái', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (61, 34, 14, 20, 10, N'Cái', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (62, 34, 15, 20, 10, N'Kg', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (63, 35, 30, 20, 20, N'Cái', 1, 16)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (64, 35, 31, 20, 20, N'Kg', 1, 16)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (65, 37, 8, 20, 10, N'Kg', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (66, 37, 9, 20, 10, N'Cái', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (67, 37, 11, 20, 10, N'Kg', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (68, 41, 2, 20, 10, N'Kg', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (69, 41, 3, 20, 10, N'Cái', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (70, 42, 1, 20, 10, N'Cái', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (71, 42, 2, 20, 10, N'Kg', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (72, 43, 26, 20, 10, N'Cái', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (73, 43, 27, 20, 10, N'Kg', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (74, 44, 4, 20, 10, N'Kg', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (75, 44, 5, 20, 10, N'Cái', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (76, 44, 6, 20, 10, N'Kg', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (77, 45, 30, 20, 20, N'Cái', 1, 16)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (78, 45, 31, 20, 20, N'Kg', 1, 16)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (79, 45, 40, 20, 222, N'Kg', 1, 178)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (80, 52, 1, 20, 10, N'Cái', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (81, 52, 2, 20, 10, N'Kg', 1, 8)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [discount], [price], [type], [status], [totalPrice]) VALUES (82, 52, 3, 20, 10, N'Cái', 1, 8)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (1, 1, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-10-21 00:00:00.000' AS DateTime), N'Thanh Khê - Đà Nẵng', 1, N'doing', 3, N'Giao đồ đúng hẹn', 1, N'Thuận Nguyễn', 1, 1, 2, 0, 1, 100)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (2, 2, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-10-21 00:00:00.000' AS DateTime), N'Thanh Khê - Đà Nẵng', 1, N'done', 4, N'Giao đồ đúng hẹn', 1, N'Thuận Nguyễn', 1, 2, 2, 0, 1, 100)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (3, 3, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-10-21 00:00:00.000' AS DateTime), N'Thanh Khê - Đà Nẵng', 2, N'done', 5, N'Giao đồ đúng hẹn', 1, N'Thuận Nguyễn', 1, 3, 2, 0, 1, 150)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (4, 4, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-10-21 00:00:00.000' AS DateTime), N'Thanh Khê - Đà Nẵng', 1, N'doing', 6, N'Giao đồ đúng hẹn', 1, N'Thuận Nguyễn', 1, 4, 2, 0, 1, 100)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (5, 5, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-10-21 00:00:00.000' AS DateTime), N'Thanh Khê - Đà Nẵng', 1, N'done', 7, N'Giao đồ đúng hẹn', 1, N'Thuận Nguyễn', 1, 1, 2, 0, 1, 120)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (6, 4, CAST(N'2020-11-29 22:04:55.000' AS DateTime), CAST(N'2020-11-29 22:22:23.857' AS DateTime), N'k67/49 Điện Biên Phủ - Đà Nẵng', 2, N'done', 8, N'Không đẹp lắm', 1, N'Thuận Nguyễn', 9, 2, 1, 11, 1, 190)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (7, 8, CAST(N'2020-11-29 22:04:55.000' AS DateTime), CAST(N'2020-11-29 22:22:37.827' AS DateTime), N'k67/49 Điện Biên Phủ - Đà Nẵng', 2, N'done', 10, N'Hàng đẹp', 1, N'Nguyễn Khắc Quang Đoàn', NULL, 2, 1, NULL, 1, 100)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (8, 5, CAST(N'2020-11-29 22:08:04.000' AS DateTime), CAST(N'2020-11-29 22:22:15.987' AS DateTime), N'k67/49 Điện Biên Phủ - Đà Nẵng', 1, N'done', 10, N'Hàng đẹp', 3, N'Nguyễn Khắc Quang Đoàn', 14, 2, 19, 40, 1, 100)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (9, 2, CAST(N'2020-11-29 22:19:57.000' AS DateTime), CAST(N'2020-11-29 22:21:44.970' AS DateTime), N'k67/49 Điện Biên Phủ - Đà Nẵng', 3, N'done', 3, N'Không đẹp lắm', 1, N'Nguyễn Khắc Quang Đoàn', 16, 2, 1, 30, 1, 40)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (10, 23, CAST(N'2020-12-06 03:32:22.777' AS DateTime), NULL, N'Thanh Khê - Ðà Nẵng', 2, N'doing', 5, N'giao hang dung hen nhe', 1, N'Nguyễn Viết Trọng', 1, NULL, NULL, 40, 1, 40)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (11, 24, CAST(N'2020-12-06 03:38:28.003' AS DateTime), NULL, N'34 Quan Lien Chieu Da Nang', 3, N'doing', 4, N'giao hang co van de gi nhe', 2, N'Nguyen trong mai', 1, NULL, NULL, 40, 1, 40)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (12, 23, CAST(N'2020-12-06 03:43:45.980' AS DateTime), NULL, N'Thanh Khê - Ðà Nẵng', 1, N'doing', 2, N'', 3, N'Nguyễn Viết Trọng', 1, NULL, NULL, 40, 1, 40)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (13, 25, CAST(N'2020-12-07 23:04:21.843' AS DateTime), NULL, N'Thanh khê _ Đà Nẵng', 2, N'doing', 3, N'Giao hàng đúng hẹn', 2, N'Nguyễn Trọng Dũng', 1, NULL, NULL, 40, 1, 40)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (14, 23, CAST(N'2020-12-07 23:46:43.447' AS DateTime), NULL, N'Thanh Khê - Ðà Nẵng', 3, N'doing', 5, N'Giao hang dung de xuoc do nha ban', 2, N'Nguyễn Viết Trọng', 1, NULL, NULL, 40, 1, 40)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (15, 23, CAST(N'2020-12-09 18:21:00.870' AS DateTime), NULL, N'Thanh Khê - Ðà Nẵng', 2, N'doing', 5, N'giao tan nha cho khach', 3, N'Nguyễn Viết Trọng', 1, NULL, NULL, 40, 1, 40)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (16, 32, CAST(N'2020-12-11 02:02:22.283' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 3, N'Giao hàng đúng nơi nhé bạn', 3, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 40, 1, 194)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (17, 32, CAST(N'2020-12-13 14:26:17.440' AS DateTime), NULL, N'Thanh Khê - Ðà Nẵng', 3, N'doing', NULL, N'Nhớ là áo quần nhé', 1, N'Nguyễn Hữu Thọ', NULL, NULL, NULL, NULL, 1, 100)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (18, 35, CAST(N'2020-12-13 14:34:10.000' AS DateTime), NULL, N'k67/49 Điện Biên Phủ - Đà Nẵng', 2, N'doing', NULL, N'tôi là tài khoản mới nhé', 3, N'Nguyễn KhắcĐài Trung', NULL, NULL, 1, NULL, 1, 100)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (19, 32, CAST(N'2020-12-13 16:53:42.717' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 2, N'doing', 3, N'', 3, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 24)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (20, 32, CAST(N'2020-12-13 16:53:53.467' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 0, N'', 1, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 0)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (21, 32, CAST(N'2020-12-15 22:14:16.030' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 7, N'', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 24)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (22, 32, CAST(N'2020-12-15 22:21:10.480' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 0, N'Tại vì sao mà không thể lưu vào', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 0)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (23, 32, CAST(N'2020-12-15 22:29:42.193' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 2, N'chinh la toi giao hang day', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 16)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (24, 32, CAST(N'2020-12-15 22:44:48.717' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 3, N'don hang test lan cuoi', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 24)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (25, 32, CAST(N'2020-12-15 22:45:08.670' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 0, N'don hang test lan cuoi', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 0)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (26, 32, CAST(N'2020-12-15 22:47:31.127' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 3, N'vi sao lai khong luu vo duoc trong db', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 24)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (27, 32, CAST(N'2020-12-15 22:47:39.660' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 0, N'vi sao lai khong luu vo duoc trong db', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 0)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (28, 32, CAST(N'2020-12-15 22:47:43.900' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 0, N'vi sao lai khong luu vo duoc trong db', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 0)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (29, 32, CAST(N'2020-12-15 22:47:47.980' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 0, N'vi sao lai khong luu vo duoc trong db', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 0)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (30, 32, CAST(N'2020-12-15 22:47:52.213' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 0, N'vi sao lai khong luu vo duoc trong db', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 0)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (31, 32, CAST(N'2020-12-15 22:47:56.863' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 0, N'vi sao lai khong luu vo duoc trong db', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 0)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (32, 32, CAST(N'2020-12-15 22:48:04.530' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 0, N'vi sao lai khong luu vo duoc trong db', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 0)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (33, 32, CAST(N'2020-12-15 22:48:20.977' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 0, N'vi sao lai khong luu vo duoc trong db', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 0)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (34, 32, CAST(N'2020-12-15 22:49:46.937' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 2, N'test lan nua nhe', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 16)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (35, 32, CAST(N'2020-12-15 22:55:00.327' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 2, N'Hải Châu - Đà Nẵng', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 32)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (36, 32, CAST(N'2020-12-15 22:55:04.687' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 0, N'Hải Châu - Đà Nẵng', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 0)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (37, 32, CAST(N'2020-12-15 22:58:48.977' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 3, N'Hải Châu - Đà Nẵng-', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 24)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (38, 32, CAST(N'2020-12-15 22:59:21.307' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 0, N'Hải Châu - Đà Nẵng-', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 0)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (39, 32, CAST(N'2020-12-15 22:59:56.177' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 0, N'Hải Châu - Đà Nẵng', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 0)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (40, 32, CAST(N'2020-12-15 23:00:04.457' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 0, N'Hải Châu - Đà Nẵng', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 0)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (41, 32, CAST(N'2020-12-15 23:02:18.203' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 2, N'Hải Châu - Đà Nẵng', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 16)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (42, 32, CAST(N'2020-12-15 23:07:18.920' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 2, N'Hải Châu - Đà Nẵng', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 16)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (43, 37, CAST(N'2020-12-15 23:09:05.637' AS DateTime), NULL, N'24 Le Dinh Duong - Da Nang', 1, N'doing', 2, N'24 Le Dinh Duong - Da Nang', 2, N'Nguyen Khac Trung', 1, NULL, NULL, 0, 1, 16)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (44, 38, CAST(N'2020-12-15 23:12:07.077' AS DateTime), NULL, N'67/49 Dien Bien Phu', 1, N'doing', 3, N'67/49 Dien Bien Phu', 2, N'Nguyen Thi Trang', 1, NULL, NULL, 0, 1, 24)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (45, 32, CAST(N'2020-12-16 01:01:48.943' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 3, N'Giao đúng nơi - đúng hẹn nha bạn', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 210)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (46, 32, CAST(N'2020-12-16 01:01:51.580' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 0, N'Giao đúng nơi - đúng hẹn nha bạn', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 0)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (47, 32, CAST(N'2020-12-16 01:01:53.037' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 0, N'Giao đúng nơi - đúng hẹn nha bạn', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 0)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (48, 32, CAST(N'2020-12-16 01:01:54.247' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 0, N'Giao đúng nơi - đúng hẹn nha bạn', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 0)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (49, 32, CAST(N'2020-12-16 01:01:55.333' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 0, N'Giao đúng nơi - đúng hẹn nha bạn', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 0)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (50, 32, CAST(N'2020-12-16 01:01:56.797' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 0, N'Giao đúng nơi - đúng hẹn nha bạn', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 0)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (51, 32, CAST(N'2020-12-16 01:01:57.963' AS DateTime), NULL, N'Hải Châu - Đà Nẵng', 1, N'doing', 0, N'Giao đúng nơi - đúng hẹn nha bạn', 2, N'Nguyễn Hữu Thọ', 1, NULL, NULL, 0, 1, 0)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (52, 42, CAST(N'2020-12-16 14:44:01.000' AS DateTime), NULL, N'38 Yên Bái', 1, N'doing', 3, N'ghi chú', 3, N'Nguyễn Văn A', 1, NULL, 1, 0, 1, 24)
INSERT [dbo].[Orders] ([id], [customerId], [orderDate], [endDate], [address], [paymentMethodId], [paymentStatus], [amount], [description], [statusId], [createdBy], [shippingId], [employeeIdConfirm], [employeeIdShipping], [totalDebt], [status], [totalOrder]) VALUES (53, 43, CAST(N'2020-12-16 14:44:05.000' AS DateTime), NULL, N'38 Yên Bái', 1, N'doing', 0, N'ghi chú', 1, N'Nguyễn Văn A', 1, NULL, 1, 0, 1, 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[PayMentMethods] ON 

INSERT [dbo].[PayMentMethods] ([id], [paymentName]) VALUES (1, N'Trực tiếp giao đồ tới cửa hàng')
INSERT [dbo].[PayMentMethods] ([id], [paymentName]) VALUES (2, N'Có nhân viên cửa hàng tới lấy')
INSERT [dbo].[PayMentMethods] ([id], [paymentName]) VALUES (3, N'Trực tiếp giao đồ tới cửa hàng')
INSERT [dbo].[PayMentMethods] ([id], [paymentName]) VALUES (4, N'Có nhân viên cửa hàng tới lấy')
SET IDENTITY_INSERT [dbo].[PayMentMethods] OFF
SET IDENTITY_INSERT [dbo].[PayRollsEmployees] ON 

INSERT [dbo].[PayRollsEmployees] ([id], [month], [employeeId], [dayOff], [dayWork], [hourOfDay], [salaryToMonth], [unitSalary], [fromDate], [toDate], [standardWorkDay], [totalWorkDay], [baseSalary], [mainSalary], [subsidySalary], [totalOverTime], [overtimePay], [totalSalary], [description]) VALUES (1, CAST(N'2020-10-20 00:00:00.000' AS DateTime), 1, N'2020-10-20,2020-11-20,2020-12-20', N'2020-10-20,2020-11-20,2020-12-20', 8, 3000000, N'ngày', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 28, 25, 4000000, 2500000, 500000, 8, 500, 3000000, N'Làm việc chăm chỉ, siêng năng trong công việc')
INSERT [dbo].[PayRollsEmployees] ([id], [month], [employeeId], [dayOff], [dayWork], [hourOfDay], [salaryToMonth], [unitSalary], [fromDate], [toDate], [standardWorkDay], [totalWorkDay], [baseSalary], [mainSalary], [subsidySalary], [totalOverTime], [overtimePay], [totalSalary], [description]) VALUES (2, CAST(N'2020-10-20 00:00:00.000' AS DateTime), 2, N'2020-10-20,2020-11-20,2020-12-20', N'2020-10-20,2020-11-20,2020-12-20', 8, 3000000, N'ngày', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 28, 25, 4000000, 2500000, 500000, 8, 500, 3000000, N'Làm việc chăm chỉ, siêng năng trong công việc')
INSERT [dbo].[PayRollsEmployees] ([id], [month], [employeeId], [dayOff], [dayWork], [hourOfDay], [salaryToMonth], [unitSalary], [fromDate], [toDate], [standardWorkDay], [totalWorkDay], [baseSalary], [mainSalary], [subsidySalary], [totalOverTime], [overtimePay], [totalSalary], [description]) VALUES (3, CAST(N'2020-10-20 00:00:00.000' AS DateTime), 3, N'2020-10-20,2020-11-20,2020-12-20', N'2020-10-20,2020-11-20,2020-12-20', 8, 3000000, N'ngày', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 28, 25, 4000000, 2500000, 500000, 8, 500, 3000000, N'Làm việc chăm chỉ, siêng năng trong công việc')
INSERT [dbo].[PayRollsEmployees] ([id], [month], [employeeId], [dayOff], [dayWork], [hourOfDay], [salaryToMonth], [unitSalary], [fromDate], [toDate], [standardWorkDay], [totalWorkDay], [baseSalary], [mainSalary], [subsidySalary], [totalOverTime], [overtimePay], [totalSalary], [description]) VALUES (4, CAST(N'2020-10-20 00:00:00.000' AS DateTime), 4, N'2020-10-20,2020-11-20,2020-12-20', N'2020-10-20,2020-11-20,2020-12-20', 8, 3000000, N'ngày', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 28, 25, 4000000, 2500000, 500000, 8, 500, 3000000, N'Làm việc chăm chỉ, siêng năng trong công việc')
INSERT [dbo].[PayRollsEmployees] ([id], [month], [employeeId], [dayOff], [dayWork], [hourOfDay], [salaryToMonth], [unitSalary], [fromDate], [toDate], [standardWorkDay], [totalWorkDay], [baseSalary], [mainSalary], [subsidySalary], [totalOverTime], [overtimePay], [totalSalary], [description]) VALUES (5, CAST(N'2020-10-20 00:00:00.000' AS DateTime), 1, N'2020-10-20,2020-11-20,2020-12-20', N'2020-10-20,2020-11-20,2020-12-20', 8, 3000000, N'ngày', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 28, 25, 4000000, 2500000, 500000, 8, 500, 3000000, N'Làm việc chăm chỉ, siêng năng trong công việc')
INSERT [dbo].[PayRollsEmployees] ([id], [month], [employeeId], [dayOff], [dayWork], [hourOfDay], [salaryToMonth], [unitSalary], [fromDate], [toDate], [standardWorkDay], [totalWorkDay], [baseSalary], [mainSalary], [subsidySalary], [totalOverTime], [overtimePay], [totalSalary], [description]) VALUES (6, CAST(N'2020-10-20 00:00:00.000' AS DateTime), 1, N'2020-10-20,2020-11-20,2020-12-20', N'2020-10-20,2020-11-20,2020-12-20', 8, 3000000, N'ngày', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 28, 25, 4000000, 2500000, 500000, 8, 500, 3000000, N'Làm việc chăm chỉ, siêng năng trong công việc')
INSERT [dbo].[PayRollsEmployees] ([id], [month], [employeeId], [dayOff], [dayWork], [hourOfDay], [salaryToMonth], [unitSalary], [fromDate], [toDate], [standardWorkDay], [totalWorkDay], [baseSalary], [mainSalary], [subsidySalary], [totalOverTime], [overtimePay], [totalSalary], [description]) VALUES (7, CAST(N'2020-10-20 00:00:00.000' AS DateTime), 2, N'2020-10-20,2020-11-20,2020-12-20', N'2020-10-20,2020-11-20,2020-12-20', 8, 3000000, N'ngày', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 28, 25, 4000000, 2500000, 500000, 8, 500, 3000000, N'Làm việc chăm chỉ, siêng năng trong công việc')
INSERT [dbo].[PayRollsEmployees] ([id], [month], [employeeId], [dayOff], [dayWork], [hourOfDay], [salaryToMonth], [unitSalary], [fromDate], [toDate], [standardWorkDay], [totalWorkDay], [baseSalary], [mainSalary], [subsidySalary], [totalOverTime], [overtimePay], [totalSalary], [description]) VALUES (8, CAST(N'2020-10-20 00:00:00.000' AS DateTime), 3, N'2020-10-20,2020-11-20,2020-12-20', N'2020-10-20,2020-11-20,2020-12-20', 8, 3000000, N'ngày', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 28, 25, 4000000, 2500000, 500000, 8, 500, 3000000, N'Làm việc chăm chỉ, siêng năng trong công việc')
INSERT [dbo].[PayRollsEmployees] ([id], [month], [employeeId], [dayOff], [dayWork], [hourOfDay], [salaryToMonth], [unitSalary], [fromDate], [toDate], [standardWorkDay], [totalWorkDay], [baseSalary], [mainSalary], [subsidySalary], [totalOverTime], [overtimePay], [totalSalary], [description]) VALUES (9, CAST(N'2020-10-20 00:00:00.000' AS DateTime), 4, N'2020-10-20,2020-11-20,2020-12-20', N'2020-10-20,2020-11-20,2020-12-20', 8, 3000000, N'ngày', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 28, 25, 4000000, 2500000, 500000, 8, 500, 3000000, N'Làm việc chăm chỉ, siêng năng trong công việc')
INSERT [dbo].[PayRollsEmployees] ([id], [month], [employeeId], [dayOff], [dayWork], [hourOfDay], [salaryToMonth], [unitSalary], [fromDate], [toDate], [standardWorkDay], [totalWorkDay], [baseSalary], [mainSalary], [subsidySalary], [totalOverTime], [overtimePay], [totalSalary], [description]) VALUES (10, CAST(N'2020-10-20 00:00:00.000' AS DateTime), 1, N'2020-10-20,2020-11-20,2020-12-20', N'2020-10-20,2020-11-20,2020-12-20', 8, 3000000, N'ngày', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 28, 25, 4000000, 2500000, 500000, 8, 500, 3000000, N'Làm việc chăm chỉ, siêng năng trong công việc')
SET IDENTITY_INSERT [dbo].[PayRollsEmployees] OFF
SET IDENTITY_INSERT [dbo].[PayRollsWorker] ON 

INSERT [dbo].[PayRollsWorker] ([id], [month], [workerId], [dayOff], [dayWork], [hourOfDay], [salaryToMonth], [unitSalary], [fromDate], [toDate], [standardWorkDay], [totalWorkDay], [baseSalary], [mainSalary], [subsidySalary], [totalOverTime], [overtimePay], [totalSalary], [description]) VALUES (1, CAST(N'2020-10-20 00:00:00.000' AS DateTime), 1, N'2020-10-20,2020-11-20,2020-12-20', N'2020-10-20,2020-11-20,2020-12-20', 8, 3000000, N'ngày', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 28, 25, 4000000, 2500000, 500000, 8, 500, 3000000, N'Làm việc chăm chỉ, siêng năng trong công việc')
INSERT [dbo].[PayRollsWorker] ([id], [month], [workerId], [dayOff], [dayWork], [hourOfDay], [salaryToMonth], [unitSalary], [fromDate], [toDate], [standardWorkDay], [totalWorkDay], [baseSalary], [mainSalary], [subsidySalary], [totalOverTime], [overtimePay], [totalSalary], [description]) VALUES (2, CAST(N'2020-10-20 00:00:00.000' AS DateTime), 2, N'2020-10-20,2020-11-20,2020-12-20', N'2020-10-20,2020-11-20,2020-12-20', 8, 3000000, N'ngày', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 28, 25, 4000000, 2500000, 500000, 8, 500, 3000000, N'Làm việc chăm chỉ, siêng năng trong công việc')
INSERT [dbo].[PayRollsWorker] ([id], [month], [workerId], [dayOff], [dayWork], [hourOfDay], [salaryToMonth], [unitSalary], [fromDate], [toDate], [standardWorkDay], [totalWorkDay], [baseSalary], [mainSalary], [subsidySalary], [totalOverTime], [overtimePay], [totalSalary], [description]) VALUES (3, CAST(N'2020-10-20 00:00:00.000' AS DateTime), 3, N'2020-10-20,2020-11-20,2020-12-20', N'2020-10-20,2020-11-20,2020-12-20', 8, 3000000, N'ngày', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 28, 25, 4000000, 2500000, 500000, 8, 500, 3000000, N'Làm việc chăm chỉ, siêng năng trong công việc')
INSERT [dbo].[PayRollsWorker] ([id], [month], [workerId], [dayOff], [dayWork], [hourOfDay], [salaryToMonth], [unitSalary], [fromDate], [toDate], [standardWorkDay], [totalWorkDay], [baseSalary], [mainSalary], [subsidySalary], [totalOverTime], [overtimePay], [totalSalary], [description]) VALUES (4, CAST(N'2020-10-20 00:00:00.000' AS DateTime), 4, N'2020-10-20,2020-11-20,2020-12-20', N'2020-10-20,2020-11-20,2020-12-20', 8, 3000000, N'ngày', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 28, 25, 4000000, 2500000, 500000, 8, 500, 3000000, N'Làm việc chăm chỉ, siêng năng trong công việc')
INSERT [dbo].[PayRollsWorker] ([id], [month], [workerId], [dayOff], [dayWork], [hourOfDay], [salaryToMonth], [unitSalary], [fromDate], [toDate], [standardWorkDay], [totalWorkDay], [baseSalary], [mainSalary], [subsidySalary], [totalOverTime], [overtimePay], [totalSalary], [description]) VALUES (5, CAST(N'2020-10-20 00:00:00.000' AS DateTime), 5, N'2020-10-20,2020-11-20,2020-12-20', N'2020-10-20,2020-11-20,2020-12-20', 8, 3000000, N'ngày', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 28, 25, 4000000, 2500000, 500000, 8, 500, 3000000, N'Làm việc chăm chỉ, siêng năng trong công việc')
INSERT [dbo].[PayRollsWorker] ([id], [month], [workerId], [dayOff], [dayWork], [hourOfDay], [salaryToMonth], [unitSalary], [fromDate], [toDate], [standardWorkDay], [totalWorkDay], [baseSalary], [mainSalary], [subsidySalary], [totalOverTime], [overtimePay], [totalSalary], [description]) VALUES (6, CAST(N'2020-10-20 00:00:00.000' AS DateTime), 1, N'2020-10-20,2020-11-20,2020-12-20', N'2020-10-20,2020-11-20,2020-12-20', 8, 3000000, N'ngày', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 28, 25, 4000000, 2500000, 500000, 8, 500, 3000000, N'Làm việc chăm chỉ, siêng năng trong công việc')
INSERT [dbo].[PayRollsWorker] ([id], [month], [workerId], [dayOff], [dayWork], [hourOfDay], [salaryToMonth], [unitSalary], [fromDate], [toDate], [standardWorkDay], [totalWorkDay], [baseSalary], [mainSalary], [subsidySalary], [totalOverTime], [overtimePay], [totalSalary], [description]) VALUES (7, CAST(N'2020-10-20 00:00:00.000' AS DateTime), 2, N'2020-10-20,2020-11-20,2020-12-20', N'2020-10-20,2020-11-20,2020-12-20', 8, 3000000, N'ngày', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 28, 25, 4000000, 2500000, 500000, 8, 500, 3000000, N'Làm việc chăm chỉ, siêng năng trong công việc')
INSERT [dbo].[PayRollsWorker] ([id], [month], [workerId], [dayOff], [dayWork], [hourOfDay], [salaryToMonth], [unitSalary], [fromDate], [toDate], [standardWorkDay], [totalWorkDay], [baseSalary], [mainSalary], [subsidySalary], [totalOverTime], [overtimePay], [totalSalary], [description]) VALUES (8, CAST(N'2020-10-20 00:00:00.000' AS DateTime), 3, N'2020-10-20,2020-11-20,2020-12-20', N'2020-10-20,2020-11-20,2020-12-20', 8, 3000000, N'ngày', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 28, 25, 4000000, 2500000, 500000, 8, 500, 3000000, N'Làm việc chăm chỉ, siêng năng trong công việc')
INSERT [dbo].[PayRollsWorker] ([id], [month], [workerId], [dayOff], [dayWork], [hourOfDay], [salaryToMonth], [unitSalary], [fromDate], [toDate], [standardWorkDay], [totalWorkDay], [baseSalary], [mainSalary], [subsidySalary], [totalOverTime], [overtimePay], [totalSalary], [description]) VALUES (9, CAST(N'2020-10-20 00:00:00.000' AS DateTime), 4, N'2020-10-20,2020-11-20,2020-12-20', N'2020-10-20,2020-11-20,2020-12-20', 8, 3000000, N'ngày', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 28, 25, 4000000, 2500000, 500000, 8, 500, 3000000, N'Làm việc chăm chỉ, siêng năng trong công việc')
INSERT [dbo].[PayRollsWorker] ([id], [month], [workerId], [dayOff], [dayWork], [hourOfDay], [salaryToMonth], [unitSalary], [fromDate], [toDate], [standardWorkDay], [totalWorkDay], [baseSalary], [mainSalary], [subsidySalary], [totalOverTime], [overtimePay], [totalSalary], [description]) VALUES (10, CAST(N'2020-10-20 00:00:00.000' AS DateTime), 5, N'2020-10-20,2020-11-20,2020-12-20', N'2020-10-20,2020-11-20,2020-12-20', 8, 3000000, N'ngày', CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 28, 25, 4000000, 2500000, 500000, 8, 500, 3000000, N'Làm việc chăm chỉ, siêng năng trong công việc')
SET IDENTITY_INSERT [dbo].[PayRollsWorker] OFF
SET IDENTITY_INSERT [dbo].[PostCategories] ON 

INSERT [dbo].[PostCategories] ([id], [categoryNamePost], [categoryCodePost], [description], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (1, N'Giặt ủi', N'giat-ui', N'Mô tả về quy trình giặt ủi', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', 1)
INSERT [dbo].[PostCategories] ([id], [categoryNamePost], [categoryCodePost], [description], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (2, N'Dịch vụ giặt ủi', N'dich-vu-giat-ui', N'Mô tả về dịch vụ giặt ủi', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', 1)
INSERT [dbo].[PostCategories] ([id], [categoryNamePost], [categoryCodePost], [description], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (3, N'Phí giặt ủi', N'phi-giat-ui', N'Mô tả về chi phí giặt ủi', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', 1)
INSERT [dbo].[PostCategories] ([id], [categoryNamePost], [categoryCodePost], [description], [createdDate], [createdBy], [modifyDate], [modifyBy], [status]) VALUES (4, N'Kinh nghiệm giặt ủi', N'kinh-nghiem-giat-ui', N'Mô tả về kinh nghiệm giặt ủi', CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', 1)
SET IDENTITY_INSERT [dbo].[PostCategories] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (1, N'Áo Sơ Mi', 1, N'Sản phẩm áo sơ mi', N'Assets/Admin/resources/product/defaultProduct.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-12-13 18:28:29.380' AS DateTime), N'Nguyễn Khắc Quang Thuận', N'Cái', 10, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (2, N'Áo Sơ Mi', 1, N'Sản phẩm áo phong', N'Assets/Admin/resources/product/defaultProduct.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Kg', 10, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (3, N'Áo Phong', 1, N'Sản phẩm khoác jean', N'Assets/Admin/resources/product/defaultProduct.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Cái', 10, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (4, N'Áo Phong', 1, N'Sản phẩm áo phao', N'Assets/Admin/resources/product/img1mg1oqdc2h.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Kg', 10, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (5, N'Áo Khoác Jean', 1, N'Sản quần tây', N'Assets/Admin/resources/product/defaultProduct.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Cái', 10, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (6, N'Áo Khoác Jean', 1, N'Sản phẩm quần jean', N'Assets/Admin/resources/product/defaultProduct.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Kg', 10, 0)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (7, N'Áo Phao', 1, N'Sản phẩm quần short', N'Assets/Admin/resources/product/defaultProduct.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Cái', 10, 0)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (8, N'Áo Phao', 1, N'Sản phẩm quần kaki', N'Assets/Admin/resources/product/defaultProduct.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Kg', 10, 0)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (9, N'Quần Tây', 1, N'Sản phẩm giày tây', N'Assets/Admin/resources/product/defaultProduct.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Cái', 10, 0)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (11, N'Quần Tây', 1, N'Sản phẩm dép tông', N'Assets/Admin/resources/product/defaultProduct.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Kg', 10, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (12, N'Quần Short', 1, N'Sản phẩm dép quai hậu', N'Assets/Admin/resources/product/defaultProduct.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Cái', 10, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (13, N'Quần Kaki', 1, N'Sản phẩm chăn mền mỏng', N'Assets/Admin/resources/product/defaultProduct.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Kg', 10, 0)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (14, N'Giày Tây', 2, N'Sản phẩm chăn mền dày', N'Assets/Admin/resources/product/pic665365.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Cái', 10, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (15, N'Giày Tây', 2, N'Sản phẩm chăn cao cấp', N'Assets/Admin/resources/product/yahoo_hello86158.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Kg', 10, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (16, N'Dép Tông', 2, N'Sản phẩm rèm cửa mỏng', N'Assets/Admin/resources/product/defaultProduct.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Cái', 10, 0)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (17, N'Dép Tông', 2, N'Sản phẩm rèm cửa dày', N'Assets/Admin/resources/product/defaultProduct.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Kg', 10, 0)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (18, N'Dép Quai Hậu', 2, N'Sản phẩm áo khoác da', N'Assets/Admin/resources/product/defaultProduct.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Cái', 10, 0)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (19, N'Dép Quai Hậu', 2, N'Sản phẩm áo khoác lông thú', N'Assets/Admin/resources/product/defaultProduct.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Kg', 10, 0)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (20, N'Chăn Mềm Mỏng', 3, N'Sản phẩm quần da', N'Assets/Admin/resources/product/defaultProduct.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Cái', 10, 0)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (21, N'Chăn Mềm Mỏng', 3, N'Sản phẩm quần lông thú', N'Assets/Admin/resources/product/avatar531982.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Kg', 10, 0)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (22, N'Chăn Mềm Dày', 3, N'Sản phẩm balo nhỏ', N'Assets/Admin/resources/product/defaultProduct.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Cái', 10, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (23, N'Chăn Mềm Dày', 3, N'Sản phẩm balo lớn', N'Assets/Admin/resources/product/anh-dai-dien-facebook-5.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Kg', 10, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (24, N'Chăn Cao Cấp', 3, N'Sản phẩm túi du lịch', N'Assets/Admin/resources/product/defaultProduct.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Cái', 10, 0)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (25, N'Chăn Cao Cấp', 3, N'Sản phẩm túi thời trang', N'Assets/Admin/resources/product/defaultProduct.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Kg', 10, 0)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (26, N'Rèm Cửa Mỏng', 4, N'Gói theo tuần', N'Assets/Admin/resources/product/defaultProduct.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Cái', 10, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (27, N'Rèm Cửa Mỏng', 4, N'Gói theo tháng', N'Assets/Admin/resources/product/defaultProduct.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Kg', 10, 0)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (28, N'Rèm Cửa Dày', 4, N'Gói theo quý', N'Assets/Admin/resources/product/defaultProduct.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Cái', 10, 0)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (29, N'Rèm Cửa Dày', 4, N'Gói theo năm', N'Assets/Admin/resources/product/defaultProduct.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Kg', 20, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (30, N'Áo Khoác Da', 5, N'Gói cho spa', N'Assets/Admin/resources/product/imgmf4gkxugo0.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Cái', 20, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (31, N'Áo Khoác Da', 5, N'Gói cho nhà nghỉ, khách sạn', N'Assets/Admin/resources/product/defaultProduct.jpg', 1, 20, CAST(N'2020-10-20 00:00:00.000' AS DateTime), N'Thuận Nguyễn', CAST(N'2020-10-30 00:00:00.000' AS DateTime), N'Thuận Nguyễn', N'Kg', 20, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (39, N'Áo Khoác Lông Thú', 5, N'Hàng đẹp', N'Assets/Admin/resources/product/anh-avatar-dep-21.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'Cái', 2, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (40, N'Áo Khoác Lông Thú', 5, N'Không đẹp lắm', N'Assets/Admin/resources/product/defaultProduct.jpg', NULL, 20, NULL, NULL, NULL, NULL, N'Kg', 222, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (41, N'Quần Da', 5, N'Hàng xiken Hand', N'Assets/Admin/resources/product/defaultProduct.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'Cái', 333333, 0)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (43, N'Quần Da', 5, N'Không đẹp lắm', N'Assets/Admin/resources/product/11.jpg', NULL, NULL, CAST(N'2020-12-01 02:24:38.310' AS DateTime), N'Nguyễn Khắc Quang Đoàn', NULL, NULL, N'Kg', 111, NULL)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (44, N'Quần Lông Thú', 5, N'test de di ngu', N'Assets/Admin/resources/product/imgmf4gkxugo0.jpg', NULL, NULL, CAST(N'2020-12-01 02:31:28.640' AS DateTime), N'Nguyễn Khắc Quang Đoàn', NULL, NULL, N'Cái', 20, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (45, N'Quần Lông Thú', 5, N'test de di ngu', N'Assets/Admin/resources/product/imgmf4gkxugo0.jpg', NULL, NULL, CAST(N'2020-12-01 02:31:28.640' AS DateTime), N'Nguyễn Khắc Quang Đoàn', NULL, NULL, N'Kg', 20, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (46, N'Balo Nhỏ', 6, N'San pham test de ngu lan 2', N'Assets/Admin/resources/product/14763835.jpg', NULL, NULL, CAST(N'2020-12-01 02:39:21.643' AS DateTime), N'Nguyễn Khắc Quang Đoàn', NULL, NULL, N'Cái', 20, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (47, N'Balo Nhỏ', 6, N'San pham test de ngu lan 2', N'Assets/Admin/resources/product/14763835.jpg', NULL, NULL, CAST(N'2020-12-01 02:39:21.643' AS DateTime), N'Nguyễn Khắc Quang Đoàn', NULL, NULL, N'Kg', 10, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (48, N'Balo Lớn', 6, N'San pham test de ngu lan 2', N'Assets/Admin/resources/product/14763835.jpg', NULL, NULL, CAST(N'2020-12-01 02:39:22.933' AS DateTime), N'Nguyễn Khắc Quang Đoàn', NULL, NULL, N'Cái', 20, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (49, N'Balo Lớn', 6, N'San pham test de ngu lan 2', N'Assets/Admin/resources/product/14763835.jpg', NULL, NULL, CAST(N'2020-12-01 02:39:22.933' AS DateTime), N'Nguyễn Khắc Quang Đoàn', NULL, NULL, N'Kg', 10, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (50, N'Túi Du Lịch', 6, N'Không đẹp lắm', N'Assets/Admin/resources/product/anh-dai-dien-facebook-4.jpg', NULL, NULL, CAST(N'2020-12-01 02:44:47.207' AS DateTime), N'Nguyễn Khắc Quang Đoàn', NULL, NULL, N'Cái', 1, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (51, N'Túi Du Lịch', 6, N'Không đẹp lắm', N'Assets/Admin/resources/product/anh-avatar-dep-21.jpg', NULL, NULL, CAST(N'2020-12-01 02:47:38.383' AS DateTime), N'Nguyễn Khắc Quang Đoàn', NULL, NULL, N'Kg', 2, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (52, N'Túi Thời Trang', 6, N'Không đẹp lắm', N'Assets/Admin/resources/product/anh-avatar-dep-21.jpg', NULL, NULL, CAST(N'2020-12-01 02:47:38.383' AS DateTime), N'Nguyễn Khắc Quang Đoàn', NULL, NULL, N'Cái', 1, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (58, N'Túi Thời Trang', 6, NULL, N'Assets/Admin/resources/product/defaultProduct.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'Kg', 10, NULL)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (60, N'Gói Theo Tuần', 7, NULL, N'Assets/Admin/resources/product/defaultProduct.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'Tuần', 10, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (61, N'Gói Theo Tháng', 7, NULL, N'Assets/Admin/resources/product/defaultProduct.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'Tháng', 10, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (62, N'Gói Theo Quý', 7, NULL, N'Assets/Admin/resources/product/defaultProduct.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'Quý', 10, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (63, N'Gói Theo Năm', 7, NULL, N'Assets/Admin/resources/product/defaultProduct.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'Năm', 10, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (64, N'Gói Cho Spa', 8, NULL, N'Assets/Admin/resources/product/defaultProduct.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'Spa', 10, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (65, N'Gói Cho Nhà Hàng', 8, NULL, N'Assets/Admin/resources/product/defaultProduct.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'Nhà Hàng', 10, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (66, N'Gói Cho Khách Sạn', 8, NULL, N'Assets/Admin/resources/product/defaultProduct.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'Khách Sạn', 10, 1)
INSERT [dbo].[Products] ([id], [productName], [categoryId], [description], [image], [viewCount], [discount], [createdDate], [createdBy], [modifyDate], [modifyBy], [type], [price], [status]) VALUES (67, N'Gói Cho Nhà Nghỉ', 8, NULL, N'Assets/Admin/resources/product/defaultProduct.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'Nhà Nghỉ', 10, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Providers] ON 

INSERT [dbo].[Providers] ([id], [providerName], [phone], [address], [email], [status]) VALUES (1, N'Công ty cung cấp nước xả vải Thành Lợi', 123456789, N'20 Tiểu La - Tp. Đà Nẵng', N'thanhloi@gmail.com', 1)
INSERT [dbo].[Providers] ([id], [providerName], [phone], [address], [email], [status]) VALUES (2, N'Công ty cung cấp bột giặt Trấn Thành', 123456789, N'20 Tiểu La - Tp. Đà Nẵng', N'thanhloi@gmail.com', 0)
INSERT [dbo].[Providers] ([id], [providerName], [phone], [address], [email], [status]) VALUES (3, N'Công ty cung cấp nước xả vải Thiên Nhiên', 123456789, N'20 Tiểu La - Tp. Đà Nẵng', N'thanhloi@gmail.com', 1)
INSERT [dbo].[Providers] ([id], [providerName], [phone], [address], [email], [status]) VALUES (4, N'Công ty cung cấp nước tẩy Hòa Phát', 123456789, N'20 Tiểu La - Tp. Đà Nẵng', N'thanhloi@gmail.com', 1)
INSERT [dbo].[Providers] ([id], [providerName], [phone], [address], [email], [status]) VALUES (5, N'Công ty cung cấp nước xả vải Phong Vũ', 123456789, N'20 Tiểu La - Tp. Đà Nẵng', N'thanhloi@gmail.com', 0)
INSERT [dbo].[Providers] ([id], [providerName], [phone], [address], [email], [status]) VALUES (6, N'Công ty cung cấp nước xả vải Thành Lợi', 123456789, N'20 Tiểu La - Tp. Đà Nẵng', N'thanhloi@gmail.com', 1)
INSERT [dbo].[Providers] ([id], [providerName], [phone], [address], [email], [status]) VALUES (7, N'Công ty cung cấp bột giặt Trấn Thành', 123456789, N'20 Tiểu La - Tp. Đà Nẵng', N'thanhloi@gmail.com', 0)
INSERT [dbo].[Providers] ([id], [providerName], [phone], [address], [email], [status]) VALUES (8, N'Công ty cung cấp nước xả vải Thiên Nhiên', 123456789, N'20 Tiểu La - Tp. Đà Nẵng', N'thanhloi@gmail.com', 1)
INSERT [dbo].[Providers] ([id], [providerName], [phone], [address], [email], [status]) VALUES (9, N'Công ty cung cấp nước tẩy Hòa Phát', 123456789, N'20 Tiểu La - Tp. Đà Nẵng', N'thanhloi@gmail.com', 1)
INSERT [dbo].[Providers] ([id], [providerName], [phone], [address], [email], [status]) VALUES (10, N'Công ty cung cấp nước xả vải Phong Vũ', 123456789, N'20 Tiểu La - Tp. Đà Nẵng', N'thanhloi@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[Providers] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([id], [name]) VALUES (1, N'ROLE_ADMIN')
INSERT [dbo].[Roles] ([id], [name]) VALUES (2, N'ROLE_EMPLOYEE')
INSERT [dbo].[Roles] ([id], [name]) VALUES (3, N'ROLE_USER')
INSERT [dbo].[Roles] ([id], [name]) VALUES (4, N'ROLE_WORKER')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[ShippingAdress] ON 

INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (1, N'Đường Cao Thắng', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (2, N'Đường Võ Nguyên Giáp', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (3, N'Đường Hồ Nghinh', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (4, N'Đường Lê Đại Hành', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (5, N'Đường Nguyễn Tất Thành', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (6, N'Đường Thái Thị Bôi', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (7, N'Đường Đống Đa', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (8, N'Đường Ngô Quyền', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (9, N'Đường Lý Thường Kiệt', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (10, N'Đường Trần Cao Vân', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (11, N'Đường Nguyễn Hữu Thọ', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (12, N'Đường Tiểu La', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (13, N'Đường Quang Trung', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (14, N'Đường Ông Ích Khiêm', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (15, N'Đường Lê Hồn Phong', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (16, N'Đường Hoàng Văn Thụ', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (17, N'Đường Yên Bái', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (18, N'Đường Triệu Nữ Vương', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (19, N'Đường Trưng Nữ Vương', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (20, N'Đường Ngô Gia Tự', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (21, N'Đường Bắc Đẩu', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (22, N'Đường Paster', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (23, N'Đường Lê Đình Dương', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (24, N'Đường Nguyễn Văn Linh', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (25, N'Đường Lê Thanh Nghị', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (26, N'Đường Xô Viết Nghệ Tĩnh', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (27, N'Đường Trần Phú', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (28, N'Đường Bạch Đằng', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (29, N'Đường Nguyễn Chí Thanh', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (30, N'Đường 3.2', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (31, N'Đường Lê Lợi', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (32, N'Đường Hùng Vương', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (33, N'Đường Lê Đình Lý', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (34, N'Đường Cao Thắng', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (35, N'Đường Võ Nguyên Giáp', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (36, N'Đường Hồ Nghinh', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (37, N'Đường Lê Đại Hành', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (38, N'Đường Nguyễn Tất Thành', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (39, N'Đường Thái Thị Bôi', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (40, N'Đường Đống Đa', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (41, N'Đường Ngô Quyền', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (42, N'Đường Lý Thường Kiệt', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (43, N'Đường Trần Cao Vân', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (44, N'Đường Nguyễn Hữu Thọ', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (45, N'Đường Tiểu La', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (46, N'Đường Quang Trung', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (47, N'Đường Ông Ích Khiêm', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (48, N'Đường Lê Hồn Phong', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (49, N'Đường Hoàng Văn Thụ', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (50, N'Đường Yên Bái', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (51, N'Đường Triệu Nữ Vương', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (52, N'Đường Trưng Nữ Vương', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (53, N'Đường Ngô Gia Tự', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (54, N'Đường Bắc Đẩu', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (55, N'Đường Paster', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (56, N'Đường Lê Đình Dương', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (57, N'Đường Nguyễn Văn Linh', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (58, N'Đường Lê Thanh Nghị', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (59, N'Đường Xô Viết Nghệ Tĩnh', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (60, N'Đường Trần Phú', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (61, N'Đường Bạch Đằng', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (62, N'Đường Nguyễn Chí Thanh', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (63, N'Đường 3.2', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (64, N'Đường Lê Lợi', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (65, N'Đường Hùng Vương', 20)
INSERT [dbo].[ShippingAdress] ([id], [addressName], [price]) VALUES (66, N'Đường Lê Đình Lý', 20)
SET IDENTITY_INSERT [dbo].[ShippingAdress] OFF
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([id], [statusName], [color]) VALUES (1, N'Confirm', 1)
INSERT [dbo].[Status] ([id], [statusName], [color]) VALUES (2, N'Pending', 2)
INSERT [dbo].[Status] ([id], [statusName], [color]) VALUES (3, N'Completed', 3)
SET IDENTITY_INSERT [dbo].[Status] OFF
SET IDENTITY_INSERT [dbo].[Workers] ON 

INSERT [dbo].[Workers] ([id], [workerName], [phone], [address], [gender], [dayOfBirth], [avatar], [status], [dateStart], [dateEnd], [contactSalary], [unitSalary], [workTime], [schedule]) VALUES (1, N'Nguyễn Thuận', 383789311, N'Thanh Khê - Đà Nẵng', N'male', CAST(N'1995-12-24 00:00:00.000' AS DateTime), N'avatarWorker1.jpg', 1, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 5000000, N'ngày', 8, N'th2,th3,th4,th5,th6')
INSERT [dbo].[Workers] ([id], [workerName], [phone], [address], [gender], [dayOfBirth], [avatar], [status], [dateStart], [dateEnd], [contactSalary], [unitSalary], [workTime], [schedule]) VALUES (2, N'Nguyễn Kha', 383789311, N'Thanh Khê - Đà Nẵng', N'male', CAST(N'1995-12-24 00:00:00.000' AS DateTime), N'avatarWorker1.jpg', 1, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 5000000, N'ngày', 8, N'th2,th3,th4,th5,th6')
INSERT [dbo].[Workers] ([id], [workerName], [phone], [address], [gender], [dayOfBirth], [avatar], [status], [dateStart], [dateEnd], [contactSalary], [unitSalary], [workTime], [schedule]) VALUES (3, N'Nguyễn Giang', 383789311, N'Thanh Khê - Đà Nẵng', N'male', CAST(N'1995-12-24 00:00:00.000' AS DateTime), N'avatarWorker1.jpg', 1, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 5000000, N'ngày', 8, N'th2,th3,th4,th5,th6')
INSERT [dbo].[Workers] ([id], [workerName], [phone], [address], [gender], [dayOfBirth], [avatar], [status], [dateStart], [dateEnd], [contactSalary], [unitSalary], [workTime], [schedule]) VALUES (4, N'Nguyễn Hòa', 383789311, N'Thanh Khê - Đà Nẵng', N'male', CAST(N'1995-12-24 00:00:00.000' AS DateTime), N'avatarWorker1.jpg', 1, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 5000000, N'ngày', 8, N'th2,th3,th4,th5,th6')
INSERT [dbo].[Workers] ([id], [workerName], [phone], [address], [gender], [dayOfBirth], [avatar], [status], [dateStart], [dateEnd], [contactSalary], [unitSalary], [workTime], [schedule]) VALUES (5, N'Nguyễn Đạt', 383789311, N'Thanh Khê - Đà Nẵng', N'male', CAST(N'1995-12-24 00:00:00.000' AS DateTime), N'avatarWorker1.jpg', 1, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 5000000, N'ngày', 8, N'th2,th3,th4,th5,th6')
INSERT [dbo].[Workers] ([id], [workerName], [phone], [address], [gender], [dayOfBirth], [avatar], [status], [dateStart], [dateEnd], [contactSalary], [unitSalary], [workTime], [schedule]) VALUES (6, N'Nguyễn Sơn', 383789311, N'Thanh Khê - Đà Nẵng', N'male', CAST(N'1995-12-24 00:00:00.000' AS DateTime), N'avatarWorker1.jpg', 1, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 5000000, N'ngày', 8, N'th2,th3,th4,th5,th6')
INSERT [dbo].[Workers] ([id], [workerName], [phone], [address], [gender], [dayOfBirth], [avatar], [status], [dateStart], [dateEnd], [contactSalary], [unitSalary], [workTime], [schedule]) VALUES (7, N'Nguyễn Thuận', 383789311, N'Thanh Khê - Đà Nẵng', N'male', CAST(N'1995-12-24 00:00:00.000' AS DateTime), N'avatarWorker1.jpg', 1, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 5000000, N'ngày', 8, N'th2,th3,th4,th5,th6')
INSERT [dbo].[Workers] ([id], [workerName], [phone], [address], [gender], [dayOfBirth], [avatar], [status], [dateStart], [dateEnd], [contactSalary], [unitSalary], [workTime], [schedule]) VALUES (8, N'Nguyễn Kha', 383789311, N'Thanh Khê - Đà Nẵng', N'male', CAST(N'1995-12-24 00:00:00.000' AS DateTime), N'avatarWorker1.jpg', 1, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 5000000, N'ngày', 8, N'th2,th3,th4,th5,th6')
INSERT [dbo].[Workers] ([id], [workerName], [phone], [address], [gender], [dayOfBirth], [avatar], [status], [dateStart], [dateEnd], [contactSalary], [unitSalary], [workTime], [schedule]) VALUES (9, N'Nguyễn Giang', 383789311, N'Thanh Khê - Đà Nẵng', N'male', CAST(N'1995-12-24 00:00:00.000' AS DateTime), N'avatarWorker1.jpg', 1, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 5000000, N'ngày', 8, N'th2,th3,th4,th5,th6')
INSERT [dbo].[Workers] ([id], [workerName], [phone], [address], [gender], [dayOfBirth], [avatar], [status], [dateStart], [dateEnd], [contactSalary], [unitSalary], [workTime], [schedule]) VALUES (10, N'Nguyễn Hòa', 383789311, N'Thanh Khê - Đà Nẵng', N'male', CAST(N'1995-12-24 00:00:00.000' AS DateTime), N'avatarWorker1.jpg', 1, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 5000000, N'ngày', 8, N'th2,th3,th4,th5,th6')
INSERT [dbo].[Workers] ([id], [workerName], [phone], [address], [gender], [dayOfBirth], [avatar], [status], [dateStart], [dateEnd], [contactSalary], [unitSalary], [workTime], [schedule]) VALUES (11, N'Nguyễn Đạt', 383789311, N'Thanh Khê - Đà Nẵng', N'male', CAST(N'1995-12-24 00:00:00.000' AS DateTime), N'avatarWorker1.jpg', 1, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 5000000, N'ngày', 8, N'th2,th3,th4,th5,th6')
INSERT [dbo].[Workers] ([id], [workerName], [phone], [address], [gender], [dayOfBirth], [avatar], [status], [dateStart], [dateEnd], [contactSalary], [unitSalary], [workTime], [schedule]) VALUES (12, N'Nguyễn Sơn', 383789311, N'Thanh Khê - Đà Nẵng', N'male', CAST(N'1995-12-24 00:00:00.000' AS DateTime), N'avatarWorker1.jpg', 1, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), 5000000, N'ngày', 8, N'th2,th3,th4,th5,th6')
SET IDENTITY_INSERT [dbo].[Workers] OFF
SET IDENTITY_INSERT [dbo].[Works] ON 

INSERT [dbo].[Works] ([id], [workerId], [dateStart], [dateEnd], [title], [status]) VALUES (1, 1, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Kiểm tra máy giặt và bảo trì', N'doing')
INSERT [dbo].[Works] ([id], [workerId], [dateStart], [dateEnd], [title], [status]) VALUES (2, 2, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Kiểm tra máy giặt và bảo trì', N'doing')
INSERT [dbo].[Works] ([id], [workerId], [dateStart], [dateEnd], [title], [status]) VALUES (3, 3, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Kiểm tra máy giặt và bảo trì', N'doing')
INSERT [dbo].[Works] ([id], [workerId], [dateStart], [dateEnd], [title], [status]) VALUES (4, 4, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Kiểm tra máy giặt và bảo trì', N'doing')
INSERT [dbo].[Works] ([id], [workerId], [dateStart], [dateEnd], [title], [status]) VALUES (5, 5, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Kiểm tra máy giặt và bảo trì', N'doing')
INSERT [dbo].[Works] ([id], [workerId], [dateStart], [dateEnd], [title], [status]) VALUES (6, 6, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Kiểm tra máy giặt và bảo trì', N'doing')
INSERT [dbo].[Works] ([id], [workerId], [dateStart], [dateEnd], [title], [status]) VALUES (7, 1, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Kiểm tra máy giặt và bảo trì', N'doing')
INSERT [dbo].[Works] ([id], [workerId], [dateStart], [dateEnd], [title], [status]) VALUES (8, 2, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Kiểm tra máy giặt và bảo trì', N'doing')
INSERT [dbo].[Works] ([id], [workerId], [dateStart], [dateEnd], [title], [status]) VALUES (9, 3, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Kiểm tra máy giặt và bảo trì', N'doing')
INSERT [dbo].[Works] ([id], [workerId], [dateStart], [dateEnd], [title], [status]) VALUES (10, 4, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Kiểm tra máy giặt và bảo trì', N'doing')
INSERT [dbo].[Works] ([id], [workerId], [dateStart], [dateEnd], [title], [status]) VALUES (11, 5, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Kiểm tra máy giặt và bảo trì', N'doing')
INSERT [dbo].[Works] ([id], [workerId], [dateStart], [dateEnd], [title], [status]) VALUES (12, 6, CAST(N'2020-10-20 00:00:00.000' AS DateTime), CAST(N'2020-11-20 00:00:00.000' AS DateTime), N'Kiểm tra máy giặt và bảo trì', N'doing')
SET IDENTITY_INSERT [dbo].[Works] OFF
ALTER TABLE [dbo].[AccountRoles]  WITH CHECK ADD  CONSTRAINT [fk_employeeId] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employees] ([id])
GO
ALTER TABLE [dbo].[AccountRoles] CHECK CONSTRAINT [fk_employeeId]
GO
ALTER TABLE [dbo].[AccountRoles]  WITH CHECK ADD  CONSTRAINT [fk_roleId] FOREIGN KEY([roleId])
REFERENCES [dbo].[Roles] ([id])
GO
ALTER TABLE [dbo].[AccountRoles] CHECK CONSTRAINT [fk_roleId]
GO
ALTER TABLE [dbo].[Barcodes]  WITH CHECK ADD  CONSTRAINT [fk_orderIdBarCode] FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[Barcodes] CHECK CONSTRAINT [fk_orderIdBarCode]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [fk_customerComment] FOREIGN KEY([customerId])
REFERENCES [dbo].[Customers] ([id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [fk_customerComment]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [fk_newId] FOREIGN KEY([newId])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [fk_newId]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [fk_idCounty] FOREIGN KEY([idCounty])
REFERENCES [dbo].[Counties] ([id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [fk_idCounty]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [fk_RoleCustomerId] FOREIGN KEY([roleId])
REFERENCES [dbo].[Roles] ([id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [fk_RoleCustomerId]
GO
ALTER TABLE [dbo].[DuePayments]  WITH CHECK ADD  CONSTRAINT [fk_customerIdDebt] FOREIGN KEY([customerId])
REFERENCES [dbo].[Customers] ([id])
GO
ALTER TABLE [dbo].[DuePayments] CHECK CONSTRAINT [fk_customerIdDebt]
GO
ALTER TABLE [dbo].[DuePayments]  WITH CHECK ADD  CONSTRAINT [fk_orderIdDebt] FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[DuePayments] CHECK CONSTRAINT [fk_orderIdDebt]
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD  CONSTRAINT [fk_providerId] FOREIGN KEY([providerId])
REFERENCES [dbo].[Providers] ([id])
GO
ALTER TABLE [dbo].[Materials] CHECK CONSTRAINT [fk_providerId]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [fk_categoryPostId] FOREIGN KEY([categoryPostId])
REFERENCES [dbo].[PostCategories] ([id])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [fk_categoryPostId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [fk_orderId] FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [fk_orderId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [fk_productOrderId] FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [fk_productOrderId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_customerIdOrder] FOREIGN KEY([customerId])
REFERENCES [dbo].[Customers] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_customerIdOrder]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_employeeIdConfirm] FOREIGN KEY([employeeIdConfirm])
REFERENCES [dbo].[Employees] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_employeeIdConfirm]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_employeeIdShipping] FOREIGN KEY([employeeIdShipping])
REFERENCES [dbo].[Employees] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_employeeIdShipping]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_paymentMethodId] FOREIGN KEY([paymentMethodId])
REFERENCES [dbo].[PayMentMethods] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_paymentMethodId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_shippingId] FOREIGN KEY([shippingId])
REFERENCES [dbo].[ShippingAdress] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_shippingId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_statusId] FOREIGN KEY([statusId])
REFERENCES [dbo].[Status] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_statusId]
GO
ALTER TABLE [dbo].[PayRollsEmployees]  WITH CHECK ADD  CONSTRAINT [fk_employeeIdPayRoll] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employees] ([id])
GO
ALTER TABLE [dbo].[PayRollsEmployees] CHECK CONSTRAINT [fk_employeeIdPayRoll]
GO
ALTER TABLE [dbo].[PayRollsWorker]  WITH CHECK ADD  CONSTRAINT [fk_workerIdPayRoll] FOREIGN KEY([workerId])
REFERENCES [dbo].[Workers] ([id])
GO
ALTER TABLE [dbo].[PayRollsWorker] CHECK CONSTRAINT [fk_workerIdPayRoll]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [fk_categoryId] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [fk_categoryId]
GO
ALTER TABLE [dbo].[Works]  WITH CHECK ADD  CONSTRAINT [fk_workerIdWork] FOREIGN KEY([workerId])
REFERENCES [dbo].[Workers] ([id])
GO
ALTER TABLE [dbo].[Works] CHECK CONSTRAINT [fk_workerIdWork]
GO
