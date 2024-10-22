USE [master]
GO
/****** Object:  Database [Lab02]    Script Date: 28-Jan-24 4:37:06 PM ******/
CREATE DATABASE [Lab02]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Lab02', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Lab02.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Lab02_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Lab02_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Lab02] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Lab02].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Lab02] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Lab02] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Lab02] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Lab02] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Lab02] SET ARITHABORT OFF 
GO
ALTER DATABASE [Lab02] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Lab02] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Lab02] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Lab02] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Lab02] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Lab02] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Lab02] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Lab02] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Lab02] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Lab02] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Lab02] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Lab02] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Lab02] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Lab02] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Lab02] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Lab02] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Lab02] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Lab02] SET RECOVERY FULL 
GO
ALTER DATABASE [Lab02] SET  MULTI_USER 
GO
ALTER DATABASE [Lab02] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Lab02] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Lab02] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Lab02] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Lab02] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Lab02] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Lab02', N'ON'
GO
ALTER DATABASE [Lab02] SET QUERY_STORE = ON
GO
ALTER DATABASE [Lab02] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Lab02]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 28-Jan-24 4:37:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Course_ID] [nchar](10) NULL,
	[Course_Name] [nchar](10) NULL,
	[Student_Name] [nchar](10) NULL,
	[Teacher_Name] [nchar](10) NULL,
	[Semester] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Result]    Script Date: 28-Jan-24 4:37:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[Student_ID] [nchar](10) NULL,
	[Student_Name] [nchar](10) NULL,
	[Course_Name] [nchar](10) NULL,
	[Marks] [nchar](10) NULL,
	[Grade] [nchar](10) NULL,
	[Section] [nchar](10) NULL,
	[Semester] [nchar](10) NULL,
	[Session] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 28-Jan-24 4:37:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Registration_No] [nchar](10) NULL,
	[Student_Name] [nchar](10) NULL,
	[Department] [nchar](10) NULL,
	[Session] [nchar](10) NULL,
	[Address] [nchar](10) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Course] ([Course_ID], [Course_Name], [Student_Name], [Teacher_Name], [Semester]) VALUES (N'1209      ', N'Database  ', N'Saad Malik', N'Samyaan   ', N'4         ')
INSERT [dbo].[Course] ([Course_ID], [Course_Name], [Student_Name], [Teacher_Name], [Semester]) VALUES (N'1208      ', N'Physics   ', N'Ahmad Ali ', N'Ishrat    ', N'2         ')
INSERT [dbo].[Course] ([Course_ID], [Course_Name], [Student_Name], [Teacher_Name], [Semester]) VALUES (N'1207      ', N'English   ', N'Nasir Shah', N'Sadia     ', N'4         ')
GO
INSERT [dbo].[Result] ([Student_ID], [Student_Name], [Course_Name], [Marks], [Grade], [Section], [Semester], [Session]) VALUES (N'2022CS27  ', N'Saad Malik', N'Database  ', N'90        ', N'A         ', N'A         ', N'4         ', N'2022      ')
INSERT [dbo].[Result] ([Student_ID], [Student_Name], [Course_Name], [Marks], [Grade], [Section], [Semester], [Session]) VALUES (N'2022EE12  ', N'Ahmad Ali ', N'Physics   ', N'84        ', N'A-        ', N'B         ', N'2         ', N'2022      ')
INSERT [dbo].[Result] ([Student_ID], [Student_Name], [Course_Name], [Marks], [Grade], [Section], [Semester], [Session]) VALUES (N'2020ME19  ', N'Nasir Shah', N'English   ', N'76        ', N'A+        ', N'C         ', N'4         ', N'2020      ')
GO
INSERT [dbo].[Student] ([Registration_No], [Student_Name], [Department], [Session], [Address]) VALUES (N'2022CS27  ', N'Saad Malik', N'CS        ', N'2022      ', N'Sadar     ')
INSERT [dbo].[Student] ([Registration_No], [Student_Name], [Department], [Session], [Address]) VALUES (N'2022EE12  ', N'Ahmad Ali ', N'EE        ', N'2022      ', N'Shalimar  ')
INSERT [dbo].[Student] ([Registration_No], [Student_Name], [Department], [Session], [Address]) VALUES (N'2020ME19  ', N'Nasir Shah', N'ME        ', N'2020      ', N'Walton    ')
GO
USE [master]
GO
ALTER DATABASE [Lab02] SET  READ_WRITE 
GO
