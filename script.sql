USE [master]
GO
/****** Object:  Database [KanBanDB]    Script Date: 30.11.2021 10:20:50 ******/
CREATE DATABASE [KanBanDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KanBanDB', FILENAME = N'/var/opt/mssql/data/KanBanDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KanBanDB_log', FILENAME = N'/var/opt/mssql/data/KanBanDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [KanBanDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KanBanDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KanBanDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KanBanDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KanBanDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KanBanDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KanBanDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [KanBanDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KanBanDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KanBanDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KanBanDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KanBanDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KanBanDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KanBanDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KanBanDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KanBanDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KanBanDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KanBanDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KanBanDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KanBanDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KanBanDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KanBanDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KanBanDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KanBanDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KanBanDB] SET RECOVERY FULL 
GO
ALTER DATABASE [KanBanDB] SET  MULTI_USER 
GO
ALTER DATABASE [KanBanDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KanBanDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KanBanDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KanBanDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KanBanDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KanBanDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [KanBanDB] SET QUERY_STORE = OFF
GO
USE [KanBanDB]
GO
/****** Object:  User [DefaultUser]    Script Date: 30.11.2021 10:20:50 ******/
CREATE USER [DefaultUser] FOR LOGIN [DefaultUser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [DefaultUser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [DefaultUser]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 30.11.2021 10:20:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Color] [nchar](6) NOT NULL,
	[DateOfCompletion] [datetime] NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Task] ON 

INSERT [dbo].[Task] ([ID], [Name], [Color], [DateOfCompletion]) VALUES (1, N'Написать программу', N'FF0000', CAST(N'2021-11-16T02:00:00.000' AS DateTime))
INSERT [dbo].[Task] ([ID], [Name], [Color], [DateOfCompletion]) VALUES (2, N'Написать тесты', N'00FF00', CAST(N'2021-11-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Task] ([ID], [Name], [Color], [DateOfCompletion]) VALUES (3, N'Сделать дизайн', N'0000FF', CAST(N'2021-11-16T04:00:00.000' AS DateTime))
INSERT [dbo].[Task] ([ID], [Name], [Color], [DateOfCompletion]) VALUES (4, N'test1', N'FFFF00', CAST(N'2021-11-15T01:00:00.000' AS DateTime))
INSERT [dbo].[Task] ([ID], [Name], [Color], [DateOfCompletion]) VALUES (5, N'test2', N'00FFFF', CAST(N'2021-11-17T02:00:00.000' AS DateTime))
INSERT [dbo].[Task] ([ID], [Name], [Color], [DateOfCompletion]) VALUES (6, N'test3', N'0FFFFF', CAST(N'2021-11-17T01:00:00.000' AS DateTime))
INSERT [dbo].[Task] ([ID], [Name], [Color], [DateOfCompletion]) VALUES (7, N'Сделать что-то', N'0cf09c', CAST(N'2021-11-18T01:00:00.000' AS DateTime))
INSERT [dbo].[Task] ([ID], [Name], [Color], [DateOfCompletion]) VALUES (8, N'teeeeeeeeeeeeeeeeeeest', N'244580', NULL)
INSERT [dbo].[Task] ([ID], [Name], [Color], [DateOfCompletion]) VALUES (9, N'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', N'FF00FF', NULL)
INSERT [dbo].[Task] ([ID], [Name], [Color], [DateOfCompletion]) VALUES (10, N'BBBBBBBBBBBBBBBBBBBBBBBBB', N'FF0000', NULL)
INSERT [dbo].[Task] ([ID], [Name], [Color], [DateOfCompletion]) VALUES (11, N'CCCCCCCCCCCC', N'FF00FF', NULL)
INSERT [dbo].[Task] ([ID], [Name], [Color], [DateOfCompletion]) VALUES (12, N'teeeeeeeeeeeest', N'FF00FF', CAST(N'2021-12-01T01:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Task] OFF
GO
USE [master]
GO
ALTER DATABASE [KanBanDB] SET  READ_WRITE 
GO
