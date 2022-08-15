﻿USE [master]
GO
/****** Object:  Database [KOLBO]    Script Date: 05/08/2022 03:49:24 ******/
CREATE DATABASE [KOLBO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KOLBO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\KOLBO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KOLBO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\KOLBO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [KOLBO] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KOLBO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KOLBO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KOLBO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KOLBO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KOLBO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KOLBO] SET ARITHABORT OFF 
GO
ALTER DATABASE [KOLBO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KOLBO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KOLBO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KOLBO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KOLBO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KOLBO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KOLBO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KOLBO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KOLBO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KOLBO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KOLBO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KOLBO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KOLBO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KOLBO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KOLBO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KOLBO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KOLBO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KOLBO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KOLBO] SET  MULTI_USER 
GO
ALTER DATABASE [KOLBO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KOLBO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KOLBO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KOLBO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KOLBO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KOLBO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [KOLBO] SET QUERY_STORE = OFF
GO
USE [KOLBO]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 05/08/2022 03:49:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[ID_O] [int] NOT NULL,
	[ID_P] [int] NULL,
	[ID_W] [int] NULL,
	[QUANTITY] [int] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[ID_O] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 05/08/2022 03:49:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID_P] [int] NOT NULL,
	[NAME] [nchar](40) NOT NULL,
	[PRICE] [money] NOT NULL,
 CONSTRAINT [PK_Product_1] PRIMARY KEY CLUSTERED 
(
	[ID_P] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Worker]    Script Date: 05/08/2022 03:49:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Worker](
	[ID_W] [int] NOT NULL,
	[NAME] [nchar](25) NOT NULL,
 CONSTRAINT [PK_Worker_1] PRIMARY KEY CLUSTERED 
(
	[ID_W] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_Product] FOREIGN KEY([ID_P])
REFERENCES [dbo].[Product] ([ID_P])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_Product]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_Worker] FOREIGN KEY([ID_W])
REFERENCES [dbo].[Worker] ([ID_W])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_Worker]
GO
USE [master]
GO
ALTER DATABASE [KOLBO] SET  READ_WRITE 
GO
