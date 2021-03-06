USE [master]
GO
/****** Object:  Database [AirPortDB_2019E7344]    Script Date: 2022-06-04 오후 3:15:35 ******/
CREATE DATABASE [AirPortDB_2019E7344]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AirPortDB_2019E7344', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AirPortDB_2019E7344.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AirPortDB_2019E7344_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AirPortDB_2019E7344_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AirPortDB_2019E7344] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AirPortDB_2019E7344].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AirPortDB_2019E7344] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET ARITHABORT OFF 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET RECOVERY FULL 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET  MULTI_USER 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AirPortDB_2019E7344] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AirPortDB_2019E7344] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AirPortDB_2019E7344', N'ON'
GO
ALTER DATABASE [AirPortDB_2019E7344] SET QUERY_STORE = OFF
GO
USE [AirPortDB_2019E7344]
GO
/****** Object:  Table [dbo].[member_TBL]    Script Date: 2022-06-04 오후 3:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[member_TBL](
	[memberID] [char](8) NOT NULL,
	[memberName] [nchar](5) NOT NULL,
	[memberBirth] [date] NULL,
	[memberPhone] [nchar](20) NULL,
	[memberAddress] [nchar](20) NULL,
 CONSTRAINT [PK_memberTBL] PRIMARY KEY CLUSTERED 
(
	[memberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[이름아이디]    Script Date: 2022-06-04 오후 3:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[이름아이디] as
select memberID, memberName
from member_TBL
GO
/****** Object:  Table [dbo].[flight_TBL]    Script Date: 2022-06-04 오후 3:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[flight_TBL](
	[memberID] [char](8) NULL,
	[flightStartPoint] [nchar](10) NULL,
	[flightEndPoint] [nchar](10) NULL,
	[flightStartDate] [datetime] NULL,
	[flightEndDate] [datetime] NULL,
	[flightCost] [money] NULL,
	[flightNumber] [char](10) NOT NULL,
 CONSTRAINT [PK_flight_TBL] PRIMARY KEY CLUSTERED 
(
	[flightNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seat_TBL]    Script Date: 2022-06-04 오후 3:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seat_TBL](
	[airplaneNumber] [char](10) NULL,
	[seatGrade] [nchar](2) NULL,
	[seatCost] [money] NULL,
	[seatNumber] [char](10) NOT NULL,
 CONSTRAINT [PK_seat_TBL] PRIMARY KEY CLUSTERED 
(
	[seatNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[airplane_TBL]    Script Date: 2022-06-04 오후 3:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[airplane_TBL](
	[flightNumber] [char](10) NULL,
	[airplaneKind] [char](10) NULL,
	[airplaneCost] [money] NULL,
	[airplaneLimit] [int] NULL,
	[airplaneNumber] [char](10) NOT NULL,
 CONSTRAINT [PK_airplane_TBL] PRIMARY KEY CLUSTERED 
(
	[airplaneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[예약현황메인키]    Script Date: 2022-06-04 오후 3:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[예약현황메인키] as
select member_TBL.memberID,flight_TBL.flightNumber,airplane_TBL.airplaneNumber,seat_TBL.seatNumber
from member_TBL, flight_TBL, airplane_TBL,seat_TBL
where member_TBL.memberID = flight_TBL.memberID and flight_TBL.flightNumber = airplane_TBL.flightNumber and 
		airplane_TBL.airplaneNumber = seat_TBL.airplaneNumber
GO
/****** Object:  View [dbo].[총합가격]    Script Date: 2022-06-04 오후 3:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[총합가격] as
select member_TBL.memberID,flight_TBL.flightCost, airplane_TBL.airplaneCost, seat_TBL.seatCost,flight_TBL.flightCost + airplane_TBL.airplaneCost + seat_TBL.seatCost as 총합가격
from member_TBL, flight_TBL, airplane_TBL,seat_TBL
where member_TBL.memberID = flight_TBL.memberID and flight_TBL.flightNumber = airplane_TBL.flightNumber and 
		airplane_TBL.airplaneNumber = seat_TBL.airplaneNumber
GO
ALTER TABLE [dbo].[airplane_TBL]  WITH CHECK ADD  CONSTRAINT [FK_airplane_TBL_flight_TBL] FOREIGN KEY([flightNumber])
REFERENCES [dbo].[flight_TBL] ([flightNumber])
GO
ALTER TABLE [dbo].[airplane_TBL] CHECK CONSTRAINT [FK_airplane_TBL_flight_TBL]
GO
ALTER TABLE [dbo].[flight_TBL]  WITH CHECK ADD  CONSTRAINT [FK_flight_TBL_member_TBL] FOREIGN KEY([memberID])
REFERENCES [dbo].[member_TBL] ([memberID])
GO
ALTER TABLE [dbo].[flight_TBL] CHECK CONSTRAINT [FK_flight_TBL_member_TBL]
GO
ALTER TABLE [dbo].[seat_TBL]  WITH CHECK ADD  CONSTRAINT [FK_seat_TBL_airplane_TBL] FOREIGN KEY([airplaneNumber])
REFERENCES [dbo].[airplane_TBL] ([airplaneNumber])
GO
ALTER TABLE [dbo].[seat_TBL] CHECK CONSTRAINT [FK_seat_TBL_airplane_TBL]
GO
USE [master]
GO
ALTER DATABASE [AirPortDB_2019E7344] SET  READ_WRITE 
GO
