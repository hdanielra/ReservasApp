USE [master]
GO
/****** Object:  Database [ReservasHotelDB]    Script Date: 10/02/2022 6:48:47 p. m. ******/
CREATE DATABASE [ReservasHotelDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ReservasHotelDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS2019\MSSQL\DATA\ReservasHotelDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ReservasHotelDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS2019\MSSQL\DATA\ReservasHotelDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ReservasHotelDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ReservasHotelDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ReservasHotelDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ReservasHotelDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ReservasHotelDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ReservasHotelDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ReservasHotelDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ReservasHotelDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ReservasHotelDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ReservasHotelDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ReservasHotelDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ReservasHotelDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ReservasHotelDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ReservasHotelDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ReservasHotelDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ReservasHotelDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ReservasHotelDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ReservasHotelDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ReservasHotelDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ReservasHotelDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ReservasHotelDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ReservasHotelDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ReservasHotelDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ReservasHotelDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ReservasHotelDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ReservasHotelDB] SET  MULTI_USER 
GO
ALTER DATABASE [ReservasHotelDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ReservasHotelDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ReservasHotelDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ReservasHotelDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ReservasHotelDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ReservasHotelDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ReservasHotelDB] SET QUERY_STORE = OFF
GO
USE [ReservasHotelDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/02/2022 6:48:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 10/02/2022 6:48:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[ClienteId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CostoHabitacion]    Script Date: 10/02/2022 6:48:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CostoHabitacion](
	[CostoHabitacionID] [int] IDENTITY(1,1) NOT NULL,
	[HotelId] [int] NOT NULL,
	[TipoHabitacionId] [int] NOT NULL,
	[TemporadaId] [int] NOT NULL,
	[Precio] [decimal](16, 2) NOT NULL,
 CONSTRAINT [PK_CostoHabitacion] PRIMARY KEY CLUSTERED 
(
	[CostoHabitacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habitacion]    Script Date: 10/02/2022 6:48:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitacion](
	[HabitacionId] [int] IDENTITY(1,1) NOT NULL,
	[HotelId] [int] NOT NULL,
	[TipoHabitacionId] [int] NOT NULL,
	[NumeroHabitacion] [int] NOT NULL,
	[Cupo] [int] NOT NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_Habitacion] PRIMARY KEY CLUSTERED 
(
	[HabitacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 10/02/2022 6:48:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[HotelId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[HotelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 10/02/2022 6:48:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[ReservaId] [int] IDENTITY(1,1) NOT NULL,
	[ClienteId] [int] NOT NULL,
	[HabitacionId] [int] NOT NULL,
	[FechaInicio] [datetime2](7) NOT NULL,
	[FechaFin] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[ReservaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temporada]    Script Date: 10/02/2022 6:48:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temporada](
	[TemporadaId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Temporada] PRIMARY KEY CLUSTERED 
(
	[TemporadaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoHabitacion]    Script Date: 10/02/2022 6:48:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoHabitacion](
	[TipoHabitacionId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TipoHabitacion] PRIMARY KEY CLUSTERED 
(
	[TipoHabitacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220210130545_migracion1', N'5.0.14')
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (1, N'Simone Lanfere')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (2, N'Tait Redier')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (3, N'Kata Flode')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (4, N'Rosamond Petworth')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (5, N'Weidar Van Vuuren')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (6, N'Gaby Calcut')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (7, N'Any Patchett')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (8, N'Billie Walwood')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (9, N'Abey Duke')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (10, N'Trueman Whitter')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (11, N'Marthena Stubs')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (12, N'Karim Gaisford')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (13, N'Latia Columbine')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (14, N'Deerdre Lowman')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (15, N'Franchot Kaes')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (16, N'Katya Tibalt')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (17, N'Franky Canellas')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (18, N'Clarke Caddies')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (19, N'Chelsea Scurrah')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (20, N'Brandtr Renoden')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (21, N'Lari Hairsine')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (22, N'Seth Aronowitz')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (23, N'Ophelia O''Scanlon')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (24, N'Davita Liles')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (25, N'Mariska Lerwill')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (26, N'Jule Malin')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (27, N'Constantino Rainsbury')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (28, N'Jourdain Batkin')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (29, N'Jasmina Hammersley')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (30, N'Piotr Smart')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (31, N'Milena Russo')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (32, N'Emogene Barkas')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (33, N'Harman McInally')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (34, N'Nikki Shenfish')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (35, N'Mikel Shute')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (36, N'Karim Patershall')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (37, N'Ogdan Gagg')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (38, N'Gusta Oakden')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (39, N'Con Sills')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (40, N'Gilberta Kauscher')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (41, N'Brendon Bussetti')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (42, N'Claudelle Cason')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (43, N'Caryl Wombwell')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (44, N'Jedidiah Chitter')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (45, N'Reinwald Catterell')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (46, N'Betti Credland')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (47, N'Alessandra Tewkesberrie')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (48, N'Porty Back')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (49, N'Kendre Liston')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (50, N'Fabian Dillow')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (51, N'Adriane Catlow')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (52, N'Debra Steventon')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (53, N'Karlene Terrey')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (54, N'Karole Fleis')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (55, N'Sonny Gynne')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (56, N'Dasya Bruhke')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (57, N'Seana Gorges')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (58, N'Ramsay Cuppitt')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (59, N'Rafferty Clowsley')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (60, N'Kathye Kinforth')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (61, N'Michel Rubenchik')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (62, N'Candie Dimitresco')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (63, N'Vivienne Dalzell')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (64, N'Ophelie Jorioz')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (65, N'Jenine Baumann')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (66, N'Laverna Blackaller')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (67, N'Addia Hiscoke')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (68, N'Hirsch Letrange')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (69, N'Coleen Lygo')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (70, N'Biron McKea')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (71, N'Merrilee Deddum')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (72, N'Felic Paquet')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (73, N'Miriam Kimblen')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (74, N'Ellie Vittel')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (75, N'Eleanor Sabine')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (76, N'Val Tadman')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (77, N'Harvey Copsey')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (78, N'Hercules Hebdon')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (79, N'Ursulina Tampion')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (80, N'Hersch Liversidge')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (81, N'Rebecka Frean')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (82, N'Adorne Coils')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (83, N'Odo Millberg')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (84, N'Markus Seer')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (85, N'Waverley Stanfield')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (86, N'Allsun Avramovsky')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (87, N'Patty Edgeon')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (88, N'Rikki Stendell')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (89, N'Dani Sleath')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (90, N'Zola Prince')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (91, N'Lonny Wyborn')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (92, N'Tilly Dunkley')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (93, N'Lorie Mosdell')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (94, N'Jelene Linggard')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (95, N'Bethanne Benam')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (96, N'Ulrica Lumb')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (97, N'Philip Klimaszewski')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (98, N'Bonnie Isson')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (99, N'Cleveland Jerg')
GO
INSERT [dbo].[Cliente] ([ClienteId], [Nombre]) VALUES (100, N'Niccolo Grandisson')
GO
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[CostoHabitacion] ON 
GO
INSERT [dbo].[CostoHabitacion] ([CostoHabitacionID], [HotelId], [TipoHabitacionId], [TemporadaId], [Precio]) VALUES (1, 1, 1, 2, CAST(100000.00 AS Decimal(16, 2)))
GO
INSERT [dbo].[CostoHabitacion] ([CostoHabitacionID], [HotelId], [TipoHabitacionId], [TemporadaId], [Precio]) VALUES (2, 1, 1, 1, CAST(150000.00 AS Decimal(16, 2)))
GO
INSERT [dbo].[CostoHabitacion] ([CostoHabitacionID], [HotelId], [TipoHabitacionId], [TemporadaId], [Precio]) VALUES (4, 1, 2, 2, CAST(160000.00 AS Decimal(16, 2)))
GO
INSERT [dbo].[CostoHabitacion] ([CostoHabitacionID], [HotelId], [TipoHabitacionId], [TemporadaId], [Precio]) VALUES (5, 1, 2, 1, CAST(190000.00 AS Decimal(16, 2)))
GO
INSERT [dbo].[CostoHabitacion] ([CostoHabitacionID], [HotelId], [TipoHabitacionId], [TemporadaId], [Precio]) VALUES (6, 2, 2, 2, CAST(140000.00 AS Decimal(16, 2)))
GO
INSERT [dbo].[CostoHabitacion] ([CostoHabitacionID], [HotelId], [TipoHabitacionId], [TemporadaId], [Precio]) VALUES (7, 2, 2, 1, CAST(170000.00 AS Decimal(16, 2)))
GO
INSERT [dbo].[CostoHabitacion] ([CostoHabitacionID], [HotelId], [TipoHabitacionId], [TemporadaId], [Precio]) VALUES (9, 2, 3, 2, CAST(200000.00 AS Decimal(16, 2)))
GO
INSERT [dbo].[CostoHabitacion] ([CostoHabitacionID], [HotelId], [TipoHabitacionId], [TemporadaId], [Precio]) VALUES (10, 2, 3, 1, CAST(245000.00 AS Decimal(16, 2)))
GO
INSERT [dbo].[CostoHabitacion] ([CostoHabitacionID], [HotelId], [TipoHabitacionId], [TemporadaId], [Precio]) VALUES (11, 3, 1, 2, CAST(120000.00 AS Decimal(16, 2)))
GO
INSERT [dbo].[CostoHabitacion] ([CostoHabitacionID], [HotelId], [TipoHabitacionId], [TemporadaId], [Precio]) VALUES (12, 3, 1, 1, CAST(150000.00 AS Decimal(16, 2)))
GO
INSERT [dbo].[CostoHabitacion] ([CostoHabitacionID], [HotelId], [TipoHabitacionId], [TemporadaId], [Precio]) VALUES (13, 3, 2, 2, CAST(145000.00 AS Decimal(16, 2)))
GO
INSERT [dbo].[CostoHabitacion] ([CostoHabitacionID], [HotelId], [TipoHabitacionId], [TemporadaId], [Precio]) VALUES (14, 3, 2, 1, CAST(175000.00 AS Decimal(16, 2)))
GO
INSERT [dbo].[CostoHabitacion] ([CostoHabitacionID], [HotelId], [TipoHabitacionId], [TemporadaId], [Precio]) VALUES (15, 4, 1, 2, CAST(130000.00 AS Decimal(16, 2)))
GO
INSERT [dbo].[CostoHabitacion] ([CostoHabitacionID], [HotelId], [TipoHabitacionId], [TemporadaId], [Precio]) VALUES (16, 4, 1, 1, CAST(170000.00 AS Decimal(16, 2)))
GO
INSERT [dbo].[CostoHabitacion] ([CostoHabitacionID], [HotelId], [TipoHabitacionId], [TemporadaId], [Precio]) VALUES (17, 4, 2, 2, CAST(140000.00 AS Decimal(16, 2)))
GO
INSERT [dbo].[CostoHabitacion] ([CostoHabitacionID], [HotelId], [TipoHabitacionId], [TemporadaId], [Precio]) VALUES (18, 4, 2, 1, CAST(200000.00 AS Decimal(16, 2)))
GO
INSERT [dbo].[CostoHabitacion] ([CostoHabitacionID], [HotelId], [TipoHabitacionId], [TemporadaId], [Precio]) VALUES (19, 4, 3, 2, CAST(200000.00 AS Decimal(16, 2)))
GO
INSERT [dbo].[CostoHabitacion] ([CostoHabitacionID], [HotelId], [TipoHabitacionId], [TemporadaId], [Precio]) VALUES (20, 4, 3, 1, CAST(250000.00 AS Decimal(16, 2)))
GO
SET IDENTITY_INSERT [dbo].[CostoHabitacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Habitacion] ON 
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (31, 1, 1, 1, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (32, 1, 1, 2, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (33, 1, 1, 3, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (34, 1, 1, 4, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (35, 1, 1, 5, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (36, 1, 1, 6, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (37, 1, 1, 7, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (38, 1, 1, 8, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (39, 1, 1, 9, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (40, 1, 1, 10, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (41, 1, 1, 11, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (42, 1, 1, 12, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (43, 1, 1, 13, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (44, 1, 1, 14, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (45, 1, 1, 15, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (46, 1, 1, 16, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (47, 1, 1, 17, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (48, 1, 1, 18, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (49, 1, 1, 19, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (50, 1, 1, 20, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (51, 1, 1, 21, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (52, 1, 1, 22, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (53, 1, 1, 23, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (54, 1, 1, 24, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (55, 1, 1, 25, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (56, 1, 1, 26, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (57, 1, 1, 27, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (58, 1, 1, 28, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (59, 1, 1, 29, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (60, 1, 1, 30, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (61, 1, 2, 31, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (62, 1, 2, 32, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (63, 1, 2, 33, 4, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (64, 2, 2, 1, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (65, 2, 2, 2, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (66, 2, 2, 3, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (67, 2, 2, 4, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (68, 2, 2, 5, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (69, 2, 2, 6, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (70, 2, 2, 7, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (71, 2, 2, 8, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (72, 2, 2, 9, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (73, 2, 2, 10, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (74, 2, 2, 11, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (75, 2, 2, 12, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (76, 2, 2, 13, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (77, 2, 2, 14, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (78, 2, 2, 15, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (79, 2, 2, 16, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (80, 2, 2, 17, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (81, 2, 2, 18, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (82, 2, 2, 19, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (83, 2, 2, 20, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (84, 2, 3, 21, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (85, 2, 3, 22, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (86, 3, 1, 1, 8, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (87, 3, 1, 2, 8, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (88, 3, 1, 3, 8, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (89, 3, 1, 4, 8, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (90, 3, 1, 5, 8, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (91, 3, 1, 6, 8, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (92, 3, 1, 7, 8, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (93, 3, 1, 8, 8, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (94, 3, 1, 9, 8, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (95, 3, 1, 10, 8, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (96, 3, 2, 11, 8, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (97, 4, 1, 1, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (98, 4, 1, 2, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (99, 4, 1, 3, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (100, 4, 1, 4, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (101, 4, 1, 5, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (102, 4, 1, 6, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (103, 4, 1, 7, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (104, 4, 1, 8, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (105, 4, 1, 9, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (106, 4, 1, 10, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (107, 4, 1, 11, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (108, 4, 1, 12, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (109, 4, 1, 13, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (110, 4, 1, 14, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (111, 4, 1, 15, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (112, 4, 1, 16, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (113, 4, 1, 17, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (114, 4, 1, 18, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (115, 4, 1, 19, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (116, 4, 1, 20, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (117, 4, 2, 21, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (118, 4, 2, 22, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (119, 4, 2, 23, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (120, 4, 2, 24, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (121, 4, 2, 25, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (122, 4, 2, 26, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (123, 4, 2, 27, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (124, 4, 2, 28, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (125, 4, 2, 29, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (126, 4, 2, 30, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (127, 4, 2, 31, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (128, 4, 2, 32, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (129, 4, 2, 33, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (130, 4, 2, 34, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (131, 4, 2, 35, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (132, 4, 2, 36, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (133, 4, 2, 37, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (134, 4, 2, 38, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (135, 4, 2, 39, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (136, 4, 2, 40, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (137, 4, 3, 41, 6, 1)
GO
INSERT [dbo].[Habitacion] ([HabitacionId], [HotelId], [TipoHabitacionId], [NumeroHabitacion], [Cupo], [Estado]) VALUES (138, 4, 3, 42, 6, 1)
GO
SET IDENTITY_INSERT [dbo].[Habitacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Hotel] ON 
GO
INSERT [dbo].[Hotel] ([HotelId], [Nombre]) VALUES (1, N'Barranquilla')
GO
INSERT [dbo].[Hotel] ([HotelId], [Nombre]) VALUES (2, N'Cali')
GO
INSERT [dbo].[Hotel] ([HotelId], [Nombre]) VALUES (3, N'Cartagena')
GO
INSERT [dbo].[Hotel] ([HotelId], [Nombre]) VALUES (4, N'Bogotá')
GO
SET IDENTITY_INSERT [dbo].[Hotel] OFF
GO
SET IDENTITY_INSERT [dbo].[Reserva] ON 
GO
INSERT [dbo].[Reserva] ([ReservaId], [ClienteId], [HabitacionId], [FechaInicio], [FechaFin]) VALUES (1, 1, 31, CAST(N'2022-02-01T10:32:00.0000000' AS DateTime2), CAST(N'2022-02-11T10:32:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Reserva] ([ReservaId], [ClienteId], [HabitacionId], [FechaInicio], [FechaFin]) VALUES (2, 4, 36, CAST(N'2022-02-15T12:10:00.0000000' AS DateTime2), CAST(N'2022-03-04T12:10:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Reserva] ([ReservaId], [ClienteId], [HabitacionId], [FechaInicio], [FechaFin]) VALUES (3, 14, 103, CAST(N'2022-02-01T14:47:00.0000000' AS DateTime2), CAST(N'2022-02-06T14:47:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Reserva] ([ReservaId], [ClienteId], [HabitacionId], [FechaInicio], [FechaFin]) VALUES (4, 13, 130, CAST(N'2022-02-08T15:50:00.0000000' AS DateTime2), CAST(N'2022-02-25T15:50:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Reserva] ([ReservaId], [ClienteId], [HabitacionId], [FechaInicio], [FechaFin]) VALUES (5, 19, 96, CAST(N'2022-02-01T15:50:00.0000000' AS DateTime2), CAST(N'2022-02-24T15:50:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Reserva] OFF
GO
SET IDENTITY_INSERT [dbo].[Temporada] ON 
GO
INSERT [dbo].[Temporada] ([TemporadaId], [Descripcion]) VALUES (1, N'Alta')
GO
INSERT [dbo].[Temporada] ([TemporadaId], [Descripcion]) VALUES (2, N'Baja')
GO
SET IDENTITY_INSERT [dbo].[Temporada] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoHabitacion] ON 
GO
INSERT [dbo].[TipoHabitacion] ([TipoHabitacionId], [Descripcion]) VALUES (1, N'Estándar')
GO
INSERT [dbo].[TipoHabitacion] ([TipoHabitacionId], [Descripcion]) VALUES (2, N'Premium')
GO
INSERT [dbo].[TipoHabitacion] ([TipoHabitacionId], [Descripcion]) VALUES (3, N'VIP')
GO
SET IDENTITY_INSERT [dbo].[TipoHabitacion] OFF
GO
/****** Object:  Index [IX_CostoHabitacion_HotelId]    Script Date: 10/02/2022 6:48:48 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_CostoHabitacion_HotelId] ON [dbo].[CostoHabitacion]
(
	[HotelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CostoHabitacion_TemporadaId]    Script Date: 10/02/2022 6:48:48 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_CostoHabitacion_TemporadaId] ON [dbo].[CostoHabitacion]
(
	[TemporadaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CostoHabitacion_TipoHabitacionId]    Script Date: 10/02/2022 6:48:48 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_CostoHabitacion_TipoHabitacionId] ON [dbo].[CostoHabitacion]
(
	[TipoHabitacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Habitacion_HotelId]    Script Date: 10/02/2022 6:48:48 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Habitacion_HotelId] ON [dbo].[Habitacion]
(
	[HotelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Habitacion_TipoHabitacionId]    Script Date: 10/02/2022 6:48:48 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Habitacion_TipoHabitacionId] ON [dbo].[Habitacion]
(
	[TipoHabitacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reserva_ClienteId]    Script Date: 10/02/2022 6:48:48 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Reserva_ClienteId] ON [dbo].[Reserva]
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reserva_HabitacionId]    Script Date: 10/02/2022 6:48:48 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Reserva_HabitacionId] ON [dbo].[Reserva]
(
	[HabitacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CostoHabitacion]  WITH CHECK ADD  CONSTRAINT [FK_CostoHabitacion_Hotel_HotelId] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([HotelId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CostoHabitacion] CHECK CONSTRAINT [FK_CostoHabitacion_Hotel_HotelId]
GO
ALTER TABLE [dbo].[CostoHabitacion]  WITH CHECK ADD  CONSTRAINT [FK_CostoHabitacion_Temporada_TemporadaId] FOREIGN KEY([TemporadaId])
REFERENCES [dbo].[Temporada] ([TemporadaId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CostoHabitacion] CHECK CONSTRAINT [FK_CostoHabitacion_Temporada_TemporadaId]
GO
ALTER TABLE [dbo].[CostoHabitacion]  WITH CHECK ADD  CONSTRAINT [FK_CostoHabitacion_TipoHabitacion_TipoHabitacionId] FOREIGN KEY([TipoHabitacionId])
REFERENCES [dbo].[TipoHabitacion] ([TipoHabitacionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CostoHabitacion] CHECK CONSTRAINT [FK_CostoHabitacion_TipoHabitacion_TipoHabitacionId]
GO
ALTER TABLE [dbo].[Habitacion]  WITH CHECK ADD  CONSTRAINT [FK_Habitacion_Hotel_HotelId] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([HotelId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Habitacion] CHECK CONSTRAINT [FK_Habitacion_Hotel_HotelId]
GO
ALTER TABLE [dbo].[Habitacion]  WITH CHECK ADD  CONSTRAINT [FK_Habitacion_TipoHabitacion_TipoHabitacionId] FOREIGN KEY([TipoHabitacionId])
REFERENCES [dbo].[TipoHabitacion] ([TipoHabitacionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Habitacion] CHECK CONSTRAINT [FK_Habitacion_TipoHabitacion_TipoHabitacionId]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Cliente] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Cliente] ([ClienteId])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Cliente]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Habitacion] FOREIGN KEY([HabitacionId])
REFERENCES [dbo].[Habitacion] ([HabitacionId])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Habitacion]
GO
USE [master]
GO
ALTER DATABASE [ReservasHotelDB] SET  READ_WRITE 
GO
