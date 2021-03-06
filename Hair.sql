USE [master]
GO
/****** Object:  Database [Hair]    Script Date: 2017-12-29 7:54:05 PM ******/
CREATE DATABASE [Hair]

GO
ALTER DATABASE [Hair] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hair].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hair] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hair] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hair] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hair] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hair] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hair] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Hair] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hair] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hair] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hair] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hair] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hair] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hair] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hair] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hair] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hair] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hair] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hair] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hair] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hair] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hair] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hair] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hair] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hair] SET  MULTI_USER 
GO
ALTER DATABASE [Hair] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hair] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hair] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hair] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Hair] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Hair]
GO
/****** Object:  Table [dbo].[appointment]    Script Date: 2017-12-29 7:54:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appointment](
	[appointmentId] [int] IDENTITY(1,1) NOT NULL,
	[customerId] [int] NOT NULL,
	[staffId] [int] NOT NULL,
	[appointmentDate] [date] NOT NULL,
	[scheduledStartTime] [time](7) NULL,
	[procedureMinutes] [int] NOT NULL,
	[scheduledEndTime] [time](7) NULL,
	[finalTotal] [float] NOT NULL,
	[totalBeforeTax] [float] NOT NULL,
	[taxRate] [float] NOT NULL,
	[completed] [bit] NOT NULL,
 CONSTRAINT [PK_appointment] PRIMARY KEY CLUSTERED 
(
	[appointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[appointmentDetail]    Script Date: 2017-12-29 7:54:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appointmentDetail](
	[appointmentDetailId] [int] IDENTITY(1,1) NOT NULL,
	[appointmentId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[procedureMinutes] [int] NOT NULL,
	[retailPrice] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[discount] [float] NOT NULL,
	[total] [float] NOT NULL,
	[comments] [varchar](max) NULL,
 CONSTRAINT [PK_appointmentDetail] PRIMARY KEY CLUSTERED 
(
	[appointmentDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customer]    Script Date: 2017-12-29 7:54:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[customerId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[phone] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[streetAddress] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[postalCode] [varchar](50) NULL,
	[province] [char](2) NULL,
	[preferredStylist] [varchar](50) NULL,
	[comments] [varchar](max) NULL,
	[canAdvertiseOnline] [bit] NOT NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[customerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product]    Script Date: 2017-12-29 7:54:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[isProcedure] [bit] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](max) NULL,
	[retailPrice] [float] NOT NULL,
	[wholesalePrice] [float] NOT NULL,
	[procedureMinutes] [int] NOT NULL,
 CONSTRAINT [PK_productProcedure] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[staff]    Script Date: 2017-12-29 7:54:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff](
	[staffId] [int] IDENTITY(1,1) NOT NULL,
	[customerId] [int] NOT NULL,
	[dateHired] [date] NULL,
	[dateTerminated] [date] NULL,
	[reasonForTermination] [varchar](max) NULL,
	[isStylist] [bit] NOT NULL,
	[hourlyChargeoutRate] [float] NOT NULL,
	[hourlySalary] [float] NOT NULL,
	[comments] [varchar](max) NULL,
 CONSTRAINT [PK_staff] PRIMARY KEY CLUSTERED 
(
	[staffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[appointment] ON 

INSERT [dbo].[appointment] ([appointmentId], [customerId], [staffId], [appointmentDate], [scheduledStartTime], [procedureMinutes], [scheduledEndTime], [finalTotal], [totalBeforeTax], [taxRate], [completed]) VALUES (1, 4, 1, CAST(N'2015-11-12' AS Date), CAST(N'12:30:00' AS Time), 13, CAST(N'12:45:00' AS Time), 71.19, 63, 0.13, 0)
INSERT [dbo].[appointment] ([appointmentId], [customerId], [staffId], [appointmentDate], [scheduledStartTime], [procedureMinutes], [scheduledEndTime], [finalTotal], [totalBeforeTax], [taxRate], [completed]) VALUES (3, 3, 2, CAST(N'2016-11-11' AS Date), CAST(N'01:30:00' AS Time), 8, CAST(N'01:45:00' AS Time), 7, 5, 0.12, 1)
INSERT [dbo].[appointment] ([appointmentId], [customerId], [staffId], [appointmentDate], [scheduledStartTime], [procedureMinutes], [scheduledEndTime], [finalTotal], [totalBeforeTax], [taxRate], [completed]) VALUES (5, 5, 1, CAST(N'2016-12-12' AS Date), CAST(N'00:00:00' AS Time), 0, CAST(N'00:00:00' AS Time), 3, 8, -5, 0)
SET IDENTITY_INSERT [dbo].[appointment] OFF
SET IDENTITY_INSERT [dbo].[appointmentDetail] ON 

INSERT [dbo].[appointmentDetail] ([appointmentDetailId], [appointmentId], [productId], [procedureMinutes], [retailPrice], [quantity], [discount], [total], [comments]) VALUES (1, 1, 4, 13, 70, 1, 0.1, 0, NULL)
INSERT [dbo].[appointmentDetail] ([appointmentDetailId], [appointmentId], [productId], [procedureMinutes], [retailPrice], [quantity], [discount], [total], [comments]) VALUES (3, 1, 5, 0, 40, 1, 0.2, 36, N'coupon')
INSERT [dbo].[appointmentDetail] ([appointmentDetailId], [appointmentId], [productId], [procedureMinutes], [retailPrice], [quantity], [discount], [total], [comments]) VALUES (12, 1, 6, 0, 27, 2, 0.1, 0, N'ffffffffffffffffffffff')
SET IDENTITY_INSERT [dbo].[appointmentDetail] OFF
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([customerId], [name], [phone], [email], [streetAddress], [city], [postalCode], [province], [preferredStylist], [comments], [canAdvertiseOnline]) VALUES (1, N'Marley Cirrius', N'519-748-5220', N'dturton@conestogac.on.ca', N'299 Doon Valley Drive', N'Kitchener', N'N2H 6R8', N'ON', N'Marley', NULL, 0)
INSERT [dbo].[customer] ([customerId], [name], [phone], [email], [streetAddress], [city], [postalCode], [province], [preferredStylist], [comments], [canAdvertiseOnline]) VALUES (2, N'Boggart King', N'519-748-5220', N'dturton@conestogac.on.ca', N'299 Doon Valley Drive', N'Kitchener', N'N2H 6R8', N'ON', N'Ann', NULL, 0)
INSERT [dbo].[customer] ([customerId], [name], [phone], [email], [streetAddress], [city], [postalCode], [province], [preferredStylist], [comments], [canAdvertiseOnline]) VALUES (3, N'Ann Hathaway', N'519-748-5220', N'dturton@conestogac.on.ca', N'299 Doon Valley Drive', N'Kitchener', N'N2H 6R8', N'ON', N'Marley', NULL, 0)
INSERT [dbo].[customer] ([customerId], [name], [phone], [email], [streetAddress], [city], [postalCode], [province], [preferredStylist], [comments], [canAdvertiseOnline]) VALUES (4, N'Eleanor Rigby', N'519-748-5220', N'dturton@conestogac.on.ca', N'299 Doon Valley Drive', N'Kitchener', N'N2H 6R8', N'ON', N'Ann', NULL, 0)
INSERT [dbo].[customer] ([customerId], [name], [phone], [email], [streetAddress], [city], [postalCode], [province], [preferredStylist], [comments], [canAdvertiseOnline]) VALUES (5, N'Diana Rigg', N'519-748-5220', N'dturton@conestogac.on.ca', N'299 Doon Valley Drive', N'Kitchener', N'N2H 6R8', N'ON', N'Marley', NULL, 0)
INSERT [dbo].[customer] ([customerId], [name], [phone], [email], [streetAddress], [city], [postalCode], [province], [preferredStylist], [comments], [canAdvertiseOnline]) VALUES (6, N'Ruth Chesterfield', N'519-748-5220', N'dturton@conestogac.on.ca', N'299 Doon Valley Drive', N'Kitchener', N'N2H 6R8', N'ON', N'Ann', NULL, 1)
SET IDENTITY_INSERT [dbo].[customer] OFF
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([productId], [isProcedure], [name], [description], [retailPrice], [wholesalePrice], [procedureMinutes]) VALUES (1, 1, N'Shag Cut', NULL, 62, 0, 30)
INSERT [dbo].[product] ([productId], [isProcedure], [name], [description], [retailPrice], [wholesalePrice], [procedureMinutes]) VALUES (2, 1, N'chin-length bob', NULL, 65, 0, 30)
INSERT [dbo].[product] ([productId], [isProcedure], [name], [description], [retailPrice], [wholesalePrice], [procedureMinutes]) VALUES (3, 1, N'short, layerd cut', NULL, 50, 0, 15)
INSERT [dbo].[product] ([productId], [isProcedure], [name], [description], [retailPrice], [wholesalePrice], [procedureMinutes]) VALUES (4, 1, N'long hair, short fringe', NULL, 70, 0, 15)
INSERT [dbo].[product] ([productId], [isProcedure], [name], [description], [retailPrice], [wholesalePrice], [procedureMinutes]) VALUES (5, 1, N'eyebrow wax', NULL, 40, 10, 15)
INSERT [dbo].[product] ([productId], [isProcedure], [name], [description], [retailPrice], [wholesalePrice], [procedureMinutes]) VALUES (6, 1, N'eyebrow pluck-and-shape', N'pain and more pain', 30, 0, 15)
INSERT [dbo].[product] ([productId], [isProcedure], [name], [description], [retailPrice], [wholesalePrice], [procedureMinutes]) VALUES (7, 0, N'Loreal Shampoo - dry hair', NULL, 13, 6, 0)
INSERT [dbo].[product] ([productId], [isProcedure], [name], [description], [retailPrice], [wholesalePrice], [procedureMinutes]) VALUES (8, 0, N'round brush, synthetic', NULL, 25, 12, 0)
SET IDENTITY_INSERT [dbo].[product] OFF
SET IDENTITY_INSERT [dbo].[staff] ON 

INSERT [dbo].[staff] ([staffId], [customerId], [dateHired], [dateTerminated], [reasonForTermination], [isStylist], [hourlyChargeoutRate], [hourlySalary], [comments]) VALUES (1, 1, CAST(N'2010-06-23' AS Date), NULL, NULL, 1, 40, 25, NULL)
INSERT [dbo].[staff] ([staffId], [customerId], [dateHired], [dateTerminated], [reasonForTermination], [isStylist], [hourlyChargeoutRate], [hourlySalary], [comments]) VALUES (2, 3, CAST(N'2010-12-12' AS Date), NULL, NULL, 1, 30, 25, NULL)
SET IDENTITY_INSERT [dbo].[staff] OFF
ALTER TABLE [dbo].[appointment] ADD  CONSTRAINT [DF_appointment_procedureMinutes]  DEFAULT ((0)) FOR [procedureMinutes]
GO
ALTER TABLE [dbo].[appointment] ADD  CONSTRAINT [DF_appointment_finalTotal]  DEFAULT ((0)) FOR [finalTotal]
GO
ALTER TABLE [dbo].[appointment] ADD  CONSTRAINT [DF_appointment_totalBeforeTax]  DEFAULT ((0)) FOR [totalBeforeTax]
GO
ALTER TABLE [dbo].[appointment] ADD  CONSTRAINT [DF_appointment_taxRate]  DEFAULT ((0)) FOR [taxRate]
GO
ALTER TABLE [dbo].[appointmentDetail] ADD  CONSTRAINT [DF_appointmentDetail_quantity]  DEFAULT ((1)) FOR [quantity]
GO
ALTER TABLE [dbo].[appointmentDetail] ADD  CONSTRAINT [DF_appointmentDetail_discount]  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF_productProcedure_retailPrice]  DEFAULT ((0)) FOR [retailPrice]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF_productProcedure_procedureMinutes]  DEFAULT ((0)) FOR [procedureMinutes]
GO
ALTER TABLE [dbo].[staff] ADD  CONSTRAINT [DF_staff_hourlyChargeoutRate]  DEFAULT ((0)) FOR [hourlyChargeoutRate]
GO
ALTER TABLE [dbo].[staff] ADD  CONSTRAINT [DF_staff_hourlySalary]  DEFAULT ((0)) FOR [hourlySalary]
GO
ALTER TABLE [dbo].[appointment]  WITH CHECK ADD  CONSTRAINT [FK_appointment_customer] FOREIGN KEY([customerId])
REFERENCES [dbo].[customer] ([customerId])
GO
ALTER TABLE [dbo].[appointment] CHECK CONSTRAINT [FK_appointment_customer]
GO
ALTER TABLE [dbo].[appointment]  WITH CHECK ADD  CONSTRAINT [FK_appointment_staff] FOREIGN KEY([staffId])
REFERENCES [dbo].[staff] ([staffId])
GO
ALTER TABLE [dbo].[appointment] CHECK CONSTRAINT [FK_appointment_staff]
GO
ALTER TABLE [dbo].[appointmentDetail]  WITH CHECK ADD  CONSTRAINT [FK_appointmentDetail_appointment] FOREIGN KEY([appointmentId])
REFERENCES [dbo].[appointment] ([appointmentId])
GO
ALTER TABLE [dbo].[appointmentDetail] CHECK CONSTRAINT [FK_appointmentDetail_appointment]
GO
ALTER TABLE [dbo].[appointmentDetail]  WITH CHECK ADD  CONSTRAINT [FK_appointmentDetail_product] FOREIGN KEY([productId])
REFERENCES [dbo].[product] ([productId])
GO
ALTER TABLE [dbo].[appointmentDetail] CHECK CONSTRAINT [FK_appointmentDetail_product]
GO
ALTER TABLE [dbo].[staff]  WITH CHECK ADD  CONSTRAINT [FK_staff_customer] FOREIGN KEY([customerId])
REFERENCES [dbo].[customer] ([customerId])
GO
ALTER TABLE [dbo].[staff] CHECK CONSTRAINT [FK_staff_customer]
GO
USE [master]
GO
ALTER DATABASE [Hair] SET  READ_WRITE 
GO
