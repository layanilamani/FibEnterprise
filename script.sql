USE [master]
GO
/****** Object:  Database [EnterpriseResourceLibrary]    Script Date: 2/28/2019 11:35:56 AM ******/
CREATE DATABASE [EnterpriseResourceLibrary]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EnterpriseResourceLibrary', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\EnterpriseResourceLibrary.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EnterpriseResourceLibrary_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\EnterpriseResourceLibrary_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EnterpriseResourceLibrary].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET ARITHABORT OFF 
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET RECOVERY FULL 
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET  MULTI_USER 
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EnterpriseResourceLibrary', N'ON'
GO
USE [EnterpriseResourceLibrary]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [EnterpriseResourceLibrary]
GO
/****** Object:  Table [dbo].[ApprovalHierarchy]    Script Date: 2/28/2019 11:35:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApprovalHierarchy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[OrderNo] [tinyint] NULL,
 CONSTRAINT [PK_ApprovalHierarchy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FAQs]    Script Date: 2/28/2019 11:35:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Question] [varchar](max) NULL,
	[Answer] [varchar](max) NULL,
 CONSTRAINT [PK_FAQs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ResourceRequestApprovalHistory]    Script Date: 2/28/2019 11:35:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceRequestApprovalHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[Comment] [varchar](max) NULL,
	[HistoryDate] [datetime] NULL,
 CONSTRAINT [PK_ResourceRequestApprovalHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ResourceRequests]    Script Date: 2/28/2019 11:35:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceRequests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestedBy] [int] NOT NULL,
	[ResourceId] [int] NOT NULL,
	[RequestDate] [datetime] NULL,
	[StatusId] [int] NULL,
 CONSTRAINT [PK_ResourceRequests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resources]    Script Date: 2/28/2019 11:35:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NULL,
	[ResourceTypeId] [int] NOT NULL,
	[FileName] [varchar](100) NULL,
	[AddedDate] [datetime] NOT NULL,
	[UploadedBy] [int] NULL,
 CONSTRAINT [PK_Resources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ResourceTypes]    Script Date: 2/28/2019 11:35:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ResourceTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 2/28/2019 11:35:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/28/2019 11:35:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[UserTypeId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 2/28/2019 11:35:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ApprovalHierarchy] ON 

INSERT [dbo].[ApprovalHierarchy] ([Id], [UserId], [OrderNo]) VALUES (1, 1, 1)
INSERT [dbo].[ApprovalHierarchy] ([Id], [UserId], [OrderNo]) VALUES (2, 2, 2)
INSERT [dbo].[ApprovalHierarchy] ([Id], [UserId], [OrderNo]) VALUES (3, 3, 3)
SET IDENTITY_INSERT [dbo].[ApprovalHierarchy] OFF
SET IDENTITY_INSERT [dbo].[FAQs] ON 

INSERT [dbo].[FAQs] ([Id], [Question], [Answer]) VALUES (1, N'Do i have to register to download any content.', N'Yes. ')
INSERT [dbo].[FAQs] ([Id], [Question], [Answer]) VALUES (2, N'Should i be more scarcastic today?', N'may be, hmm.')
SET IDENTITY_INSERT [dbo].[FAQs] OFF
SET IDENTITY_INSERT [dbo].[Resources] ON 

INSERT [dbo].[Resources] ([Id], [Title], [ResourceTypeId], [FileName], [AddedDate], [UploadedBy]) VALUES (1, N'Pakistan''s Supreme Court disqualifies PM Sharif', 1, N'abc.mp4', CAST(N'2018-01-01T00:00:00.000' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[Resources] OFF
SET IDENTITY_INSERT [dbo].[ResourceTypes] ON 

INSERT [dbo].[ResourceTypes] ([Id], [Name]) VALUES (1, N'Video')
INSERT [dbo].[ResourceTypes] ([Id], [Name]) VALUES (2, N'Audio')
INSERT [dbo].[ResourceTypes] ([Id], [Name]) VALUES (3, N'Image')
INSERT [dbo].[ResourceTypes] ([Id], [Name]) VALUES (4, N'Document')
INSERT [dbo].[ResourceTypes] ([Id], [Name]) VALUES (5, N'Other')
SET IDENTITY_INSERT [dbo].[ResourceTypes] OFF
SET IDENTITY_INSERT [dbo].[Statuses] ON 

INSERT [dbo].[Statuses] ([Id], [Name]) VALUES (1, N'Pending')
INSERT [dbo].[Statuses] ([Id], [Name]) VALUES (2, N'Approved')
INSERT [dbo].[Statuses] ([Id], [Name]) VALUES (3, N'Cancelled')
SET IDENTITY_INSERT [dbo].[Statuses] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [UserTypeId], [StatusId]) VALUES (1, N'Ali', N'ali@gmail.com', N'123', 1, 2)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [UserTypeId], [StatusId]) VALUES (2, N'bilal', N'bilal@gmail.com', N'123', 2, 2)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [UserTypeId], [StatusId]) VALUES (3, N'zahid', N'zahid@gmail.com', N'123', 3, 2)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [UserTypeId], [StatusId]) VALUES (4, N'noman', N'noman@gmail.cojm', N'123', 4, 1)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [UserTypeId], [StatusId]) VALUES (5, N'ahmed', N'ahmed@gmail.com', N'123', 4, 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UserTypes] ON 

INSERT [dbo].[UserTypes] ([Id], [Name]) VALUES (1, N'Managing Director (Admin)')
INSERT [dbo].[UserTypes] ([Id], [Name]) VALUES (2, N'Manager')
INSERT [dbo].[UserTypes] ([Id], [Name]) VALUES (3, N'Associate')
INSERT [dbo].[UserTypes] ([Id], [Name]) VALUES (4, N'Client')
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
ALTER TABLE [dbo].[ResourceRequestApprovalHistory]  WITH CHECK ADD  CONSTRAINT [FK_ResourceRequestApprovalHistory_Statuses] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Statuses] ([Id])
GO
ALTER TABLE [dbo].[ResourceRequestApprovalHistory] CHECK CONSTRAINT [FK_ResourceRequestApprovalHistory_Statuses]
GO
ALTER TABLE [dbo].[ResourceRequestApprovalHistory]  WITH CHECK ADD  CONSTRAINT [FK_ResourceRequestApprovalHistory_Users] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ResourceRequestApprovalHistory] CHECK CONSTRAINT [FK_ResourceRequestApprovalHistory_Users]
GO
ALTER TABLE [dbo].[ResourceRequests]  WITH CHECK ADD  CONSTRAINT [FK_ResourceRequests_Resources] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resources] ([Id])
GO
ALTER TABLE [dbo].[ResourceRequests] CHECK CONSTRAINT [FK_ResourceRequests_Resources]
GO
ALTER TABLE [dbo].[ResourceRequests]  WITH CHECK ADD  CONSTRAINT [FK_ResourceRequests_Statuses] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Statuses] ([Id])
GO
ALTER TABLE [dbo].[ResourceRequests] CHECK CONSTRAINT [FK_ResourceRequests_Statuses]
GO
ALTER TABLE [dbo].[ResourceRequests]  WITH CHECK ADD  CONSTRAINT [FK_ResourceRequests_Users] FOREIGN KEY([RequestedBy])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ResourceRequests] CHECK CONSTRAINT [FK_ResourceRequests_Users]
GO
ALTER TABLE [dbo].[Resources]  WITH CHECK ADD  CONSTRAINT [FK_Resources_ResourceTypes] FOREIGN KEY([ResourceTypeId])
REFERENCES [dbo].[ResourceTypes] ([Id])
GO
ALTER TABLE [dbo].[Resources] CHECK CONSTRAINT [FK_Resources_ResourceTypes]
GO
ALTER TABLE [dbo].[Resources]  WITH CHECK ADD  CONSTRAINT [FK_Resources_Users] FOREIGN KEY([UploadedBy])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Resources] CHECK CONSTRAINT [FK_Resources_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserTypes] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[UserTypes] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserTypes]
GO
USE [master]
GO
ALTER DATABASE [EnterpriseResourceLibrary] SET  READ_WRITE 
GO
