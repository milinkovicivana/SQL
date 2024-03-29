USE [master]
GO
/****** Object:  Database [AthleticsGym]    Script Date: 6.11.2018. 22:51:01 ******/
CREATE DATABASE [AthleticsGym]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AthleticsGym', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AthleticsGym.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AthleticsGym_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AthleticsGym_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AthleticsGym] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AthleticsGym].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AthleticsGym] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AthleticsGym] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AthleticsGym] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AthleticsGym] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AthleticsGym] SET ARITHABORT OFF 
GO
ALTER DATABASE [AthleticsGym] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AthleticsGym] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AthleticsGym] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AthleticsGym] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AthleticsGym] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AthleticsGym] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AthleticsGym] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AthleticsGym] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AthleticsGym] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AthleticsGym] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AthleticsGym] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AthleticsGym] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AthleticsGym] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AthleticsGym] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AthleticsGym] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AthleticsGym] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AthleticsGym] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AthleticsGym] SET RECOVERY FULL 
GO
ALTER DATABASE [AthleticsGym] SET  MULTI_USER 
GO
ALTER DATABASE [AthleticsGym] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AthleticsGym] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AthleticsGym] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AthleticsGym] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AthleticsGym] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AthleticsGym', N'ON'
GO
ALTER DATABASE [AthleticsGym] SET QUERY_STORE = OFF
GO
USE [AthleticsGym]
GO
/****** Object:  Schema [HR]    Script Date: 6.11.2018. 22:51:01 ******/
CREATE SCHEMA [HR]
GO
/****** Object:  Schema [Objekat]    Script Date: 6.11.2018. 22:51:01 ******/
CREATE SCHEMA [Objekat]
GO
/****** Object:  Schema [Ponuda]    Script Date: 6.11.2018. 22:51:01 ******/
CREATE SCHEMA [Ponuda]
GO
/****** Object:  Table [dbo].[Grad]    Script Date: 6.11.2018. 22:51:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grad](
	[gradID] [int] IDENTITY(1,1) NOT NULL,
	[ime] [nvarchar](50) NOT NULL,
	[pozivniBroj] [nvarchar](4) NULL,
 CONSTRAINT [PK_Grad] PRIMARY KEY CLUSTERED 
(
	[gradID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Naselje]    Script Date: 6.11.2018. 22:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Naselje](
	[naseljeID] [int] IDENTITY(1,1) NOT NULL,
	[ime] [nvarchar](50) NOT NULL,
	[gradID] [int] NOT NULL,
	[postanskiBroj] [int] NULL,
 CONSTRAINT [PK_Naselje] PRIMARY KEY CLUSTERED 
(
	[naseljeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HR].[Tim]    Script Date: 6.11.2018. 22:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[Tim](
	[klubID] [int] NOT NULL,
	[zaposlenID] [int] NOT NULL,
 CONSTRAINT [PK_Tim] PRIMARY KEY CLUSTERED 
(
	[klubID] ASC,
	[zaposlenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HR].[Zaposlen]    Script Date: 6.11.2018. 22:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[Zaposlen](
	[zaposlenID] [int] IDENTITY(1,1) NOT NULL,
	[ime] [nvarchar](25) NOT NULL,
	[prezime] [nvarchar](30) NOT NULL,
	[radnoMesto] [nvarchar](50) NOT NULL,
	[programID] [int] NULL,
	[jmbg] [nvarchar](13) NULL,
	[telefon] [nvarchar](20) NULL,
	[adresa] [nvarchar](100) NULL,
	[email] [nvarchar](50) NULL,
	[putanjaDoSlike] [nvarchar](255) NULL,
 CONSTRAINT [PK_Zaposlen] PRIMARY KEY CLUSTERED 
(
	[zaposlenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Objekat].[Galerija]    Script Date: 6.11.2018. 22:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Objekat].[Galerija](
	[slikaID] [int] IDENTITY(1,1) NOT NULL,
	[putanjaDoSlike] [nvarchar](255) NOT NULL,
	[klubID] [int] NULL,
 CONSTRAINT [PK_Galerija] PRIMARY KEY CLUSTERED 
(
	[slikaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Objekat].[Klub]    Script Date: 6.11.2018. 22:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Objekat].[Klub](
	[klubID] [int] IDENTITY(1,1) NOT NULL,
	[naseljeID] [int] NOT NULL,
	[adresa] [nvarchar](100) NOT NULL,
	[telefon] [nvarchar](20) NOT NULL,
	[brojKardioSprava] [int] NULL,
	[brojMasina] [int] NULL,
	[velicinaProstora] [int] NULL,
 CONSTRAINT [PK_Klub] PRIMARY KEY CLUSTERED 
(
	[klubID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ponuda].[Cenovnik]    Script Date: 6.11.2018. 22:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ponuda].[Cenovnik](
	[cenaID] [int] IDENTITY(1,1) NOT NULL,
	[programID] [int] NOT NULL,
	[nivoPlacanja] [nvarchar](10) NULL,
	[brojTreninga] [int] NULL,
	[brojVezbaca] [int] NULL,
	[cena] [int] NOT NULL,
 CONSTRAINT [PK_Cenovnik] PRIMARY KEY CLUSTERED 
(
	[cenaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ponuda].[KlubProgram]    Script Date: 6.11.2018. 22:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ponuda].[KlubProgram](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[klubID] [int] NOT NULL,
	[programID] [int] NOT NULL,
 CONSTRAINT [PK_KlubProgram] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ponuda].[Potprogram]    Script Date: 6.11.2018. 22:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ponuda].[Potprogram](
	[potprogramID] [int] IDENTITY(1,1) NOT NULL,
	[programID] [int] NOT NULL,
	[naziv] [nvarchar](50) NOT NULL,
	[opis] [nvarchar](max) NULL,
	[putanjaDoSlike] [nvarchar](255) NULL,
 CONSTRAINT [PK_Potprogram] PRIMARY KEY CLUSTERED 
(
	[potprogramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Ponuda].[Program]    Script Date: 6.11.2018. 22:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ponuda].[Program](
	[programID] [int] IDENTITY(1,1) NOT NULL,
	[tipID] [int] NOT NULL,
	[naziv] [nvarchar](50) NOT NULL,
	[opis] [nvarchar](max) NULL,
	[putanjaDoSlike] [nvarchar](255) NULL,
 CONSTRAINT [PK_Program] PRIMARY KEY CLUSTERED 
(
	[programID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Ponuda].[Termin]    Script Date: 6.11.2018. 22:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ponuda].[Termin](
	[terminID] [int] IDENTITY(1,1) NOT NULL,
	[id] [int] NOT NULL,
	[dan] [nvarchar](10) NOT NULL,
	[vreme] [time](7) NOT NULL,
 CONSTRAINT [PK_Termin] PRIMARY KEY CLUSTERED 
(
	[terminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ponuda].[TipPrograma]    Script Date: 6.11.2018. 22:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ponuda].[TipPrograma](
	[tipID] [int] IDENTITY(1,1) NOT NULL,
	[naziv] [nvarchar](50) NOT NULL,
	[opis] [nvarchar](350) NULL,
 CONSTRAINT [PK_TipPrograma] PRIMARY KEY CLUSTERED 
(
	[tipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Naselje]  WITH CHECK ADD  CONSTRAINT [FK_Naselje_Grad1] FOREIGN KEY([gradID])
REFERENCES [dbo].[Grad] ([gradID])
GO
ALTER TABLE [dbo].[Naselje] CHECK CONSTRAINT [FK_Naselje_Grad1]
GO
ALTER TABLE [HR].[Tim]  WITH CHECK ADD  CONSTRAINT [FK_Tim_Klub] FOREIGN KEY([klubID])
REFERENCES [Objekat].[Klub] ([klubID])
GO
ALTER TABLE [HR].[Tim] CHECK CONSTRAINT [FK_Tim_Klub]
GO
ALTER TABLE [HR].[Tim]  WITH CHECK ADD  CONSTRAINT [FK_Tim_Zaposlen] FOREIGN KEY([zaposlenID])
REFERENCES [HR].[Zaposlen] ([zaposlenID])
GO
ALTER TABLE [HR].[Tim] CHECK CONSTRAINT [FK_Tim_Zaposlen]
GO
ALTER TABLE [HR].[Zaposlen]  WITH CHECK ADD  CONSTRAINT [FK_Zaposlen_Program] FOREIGN KEY([programID])
REFERENCES [Ponuda].[Program] ([programID])
GO
ALTER TABLE [HR].[Zaposlen] CHECK CONSTRAINT [FK_Zaposlen_Program]
GO
ALTER TABLE [Objekat].[Galerija]  WITH CHECK ADD  CONSTRAINT [FK_Galerija_Klub] FOREIGN KEY([klubID])
REFERENCES [Objekat].[Klub] ([klubID])
GO
ALTER TABLE [Objekat].[Galerija] CHECK CONSTRAINT [FK_Galerija_Klub]
GO
ALTER TABLE [Objekat].[Klub]  WITH CHECK ADD  CONSTRAINT [FK_Klub_Naselje] FOREIGN KEY([naseljeID])
REFERENCES [dbo].[Naselje] ([naseljeID])
GO
ALTER TABLE [Objekat].[Klub] CHECK CONSTRAINT [FK_Klub_Naselje]
GO
ALTER TABLE [Ponuda].[Cenovnik]  WITH CHECK ADD  CONSTRAINT [FK_Cenovnik_Program] FOREIGN KEY([programID])
REFERENCES [Ponuda].[Program] ([programID])
GO
ALTER TABLE [Ponuda].[Cenovnik] CHECK CONSTRAINT [FK_Cenovnik_Program]
GO
ALTER TABLE [Ponuda].[KlubProgram]  WITH CHECK ADD  CONSTRAINT [FK_KlubProgram_Klub] FOREIGN KEY([klubID])
REFERENCES [Objekat].[Klub] ([klubID])
GO
ALTER TABLE [Ponuda].[KlubProgram] CHECK CONSTRAINT [FK_KlubProgram_Klub]
GO
ALTER TABLE [Ponuda].[KlubProgram]  WITH CHECK ADD  CONSTRAINT [FK_KlubProgram_Program] FOREIGN KEY([programID])
REFERENCES [Ponuda].[Program] ([programID])
GO
ALTER TABLE [Ponuda].[KlubProgram] CHECK CONSTRAINT [FK_KlubProgram_Program]
GO
ALTER TABLE [Ponuda].[Potprogram]  WITH CHECK ADD  CONSTRAINT [FK_Potprogram_Program] FOREIGN KEY([programID])
REFERENCES [Ponuda].[Program] ([programID])
GO
ALTER TABLE [Ponuda].[Potprogram] CHECK CONSTRAINT [FK_Potprogram_Program]
GO
ALTER TABLE [Ponuda].[Program]  WITH CHECK ADD  CONSTRAINT [FK_Program_TipPrograma] FOREIGN KEY([tipID])
REFERENCES [Ponuda].[TipPrograma] ([tipID])
GO
ALTER TABLE [Ponuda].[Program] CHECK CONSTRAINT [FK_Program_TipPrograma]
GO
ALTER TABLE [Ponuda].[Termin]  WITH CHECK ADD  CONSTRAINT [FK_Termin_KlubProgram] FOREIGN KEY([id])
REFERENCES [Ponuda].[KlubProgram] ([id])
GO
ALTER TABLE [Ponuda].[Termin] CHECK CONSTRAINT [FK_Termin_KlubProgram]
GO
USE [master]
GO
ALTER DATABASE [AthleticsGym] SET  READ_WRITE 
GO
