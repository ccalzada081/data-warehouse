USE [master]
GO
/****** Object:  Database [Proyecto1]    Script Date: 3/15/2025 7:06:27 PM ******/
CREATE DATABASE [Proyecto1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Proyecto1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.DEVELOPER\MSSQL\DATA\Proyecto1.mdf' , SIZE = 139264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Proyecto1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.DEVELOPER\MSSQL\DATA\Proyecto1_log.ldf' , SIZE = 532480KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Proyecto1] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Proyecto1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Proyecto1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Proyecto1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Proyecto1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Proyecto1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Proyecto1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Proyecto1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Proyecto1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Proyecto1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Proyecto1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Proyecto1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Proyecto1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Proyecto1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Proyecto1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Proyecto1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Proyecto1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Proyecto1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Proyecto1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Proyecto1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Proyecto1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Proyecto1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Proyecto1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Proyecto1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Proyecto1] SET RECOVERY FULL 
GO
ALTER DATABASE [Proyecto1] SET  MULTI_USER 
GO
ALTER DATABASE [Proyecto1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Proyecto1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Proyecto1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Proyecto1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Proyecto1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Proyecto1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Proyecto1', N'ON'
GO
ALTER DATABASE [Proyecto1] SET QUERY_STORE = ON
GO
ALTER DATABASE [Proyecto1] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Proyecto1]
GO
/****** Object:  Table [dbo].[DimArticuloProyecto1]    Script Date: 3/15/2025 7:06:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimArticuloProyecto1](
	[IDArticulo] [char](20) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[ArticuloTipo] [char](20) NULL,
	[DescripcionArticuloTipo] [varchar](100) NULL,
	[ArticuloGrupo] [char](20) NULL,
	[DescripcionArticuloGrupo] [varchar](100) NULL,
	[ArticuloClase] [char](20) NULL,
	[DescripcionArticuloClase] [varchar](100) NULL,
	[Precio] [numeric](15, 5) NULL,
 CONSTRAINT [PK_DimArticuloProyecto1] PRIMARY KEY CLUSTERED 
(
	[IDArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimClienteProyecto1]    Script Date: 3/15/2025 7:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimClienteProyecto1](
	[IDCliente] [char](20) NOT NULL,
	[ClienteTipo] [char](20) NULL,
	[ClienteGrupo] [char](20) NULL,
	[ZonaVenta] [char](20) NULL,
 CONSTRAINT [PK_DimClienteProyecto1] PRIMARY KEY CLUSTERED 
(
	[IDCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimEntradaProyecto1]    Script Date: 3/15/2025 7:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimEntradaProyecto1](
	[IDFolio] [char](10) NOT NULL,
	[Operacion] [char](20) NULL,
	[Moneda] [char](20) NULL,
	[DescripcionMoneda] [varchar](100) NULL,
	[TipoMoneda] [varchar](100) NULL,
 CONSTRAINT [PK_DimEntradaProyecto1] PRIMARY KEY CLUSTERED 
(
	[IDFolio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimSalidaProyecto1]    Script Date: 3/15/2025 7:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimSalidaProyecto1](
	[IDFolio] [char](10) NOT NULL,
	[CondicionPago] [char](20) NULL,
	[DescripcionCondicionPago] [varchar](100) NULL,
	[MedioEmbarque] [char](20) NULL,
	[DescipcionMedioEmbarque] [varchar](100) NULL,
	[Moneda] [char](20) NULL,
	[DescripcionMoneda] [varchar](100) NULL,
	[TipoMoneda] [varchar](100) NULL,
 CONSTRAINT [PK_DimSalidaProyecto1] PRIMARY KEY CLUSTERED 
(
	[IDFolio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimTimeProyecto1]    Script Date: 3/15/2025 7:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimTimeProyecto1](
	[IDTiempo] [bigint] NOT NULL,
	[Fecha] [datetime] NULL,
	[Año] [int] NULL,
	[Mes] [int] NULL,
	[NombreMes] [nchar](50) NULL,
	[Dia] [int] NULL,
	[NombreDia] [nchar](50) NULL,
	[Semestre] [int] NULL,
	[Trimestre] [int] NULL,
	[Cuatrimestre] [int] NULL,
 CONSTRAINT [PK_DimTimeProyecto1] PRIMARY KEY CLUSTERED 
(
	[IDTiempo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimVendedorProyecto1]    Script Date: 3/15/2025 7:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimVendedorProyecto1](
	[IDVendedor] [char](20) NOT NULL,
	[Nombre] [varchar](100) NULL,
 CONSTRAINT [PK_DimVendedorProyecto1] PRIMARY KEY CLUSTERED 
(
	[IDVendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactSalesEntradaProyecto1]    Script Date: 3/15/2025 7:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSalesEntradaProyecto1](
	[IDTiempo] [bigint] NOT NULL,
	[IDCliente] [char](20) NOT NULL,
	[IDVendedor] [char](20) NOT NULL,
	[IDFolio] [char](10) NOT NULL,
	[IDArticulo] [char](20) NOT NULL,
	[pctDescuentoGlobal] [numeric](15, 5) NULL,
	[TotalImporte] [numeric](15, 5) NULL,
	[TotalDescuento] [numeric](15, 5) NULL,
	[TotalImpuesto] [numeric](15, 5) NULL,
	[Total] [numeric](15, 5) NULL,
	[TotalImporteDetalle] [numeric](15, 5) NULL,
	[TotalDescuentoDetalle] [numeric](15, 5) NULL,
	[TotalImpuestoDetalle] [numeric](15, 5) NULL,
	[TotalDetalle] [numeric](15, 5) NULL,
	[TotalFacturas] [numeric](15, 5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactSalesSalidaProyecto1]    Script Date: 3/15/2025 7:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSalesSalidaProyecto1](
	[IDTiempo] [bigint] NOT NULL,
	[IDCliente] [char](20) NOT NULL,
	[IDVendedor] [char](20) NOT NULL,
	[IDFolio] [char](10) NOT NULL,
	[IDArticulo] [char](20) NOT NULL,
	[pctDescuentoGlobal] [numeric](15, 5) NULL,
	[TotalImporte] [numeric](15, 5) NULL,
	[TotalDescuento] [numeric](15, 5) NULL,
	[TotalImpuesto] [numeric](15, 5) NULL,
	[Total] [numeric](15, 5) NULL,
	[TotalImporteDetalle] [numeric](15, 5) NULL,
	[TotalDescuentoDetalle] [numeric](15, 5) NULL,
	[TotalImpuestoDetalle] [numeric](15, 5) NULL,
	[TotalDetalle] [numeric](15, 5) NULL,
	[TotalFacturas] [numeric](15, 5) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactSalesEntradaProyecto1]  WITH CHECK ADD  CONSTRAINT [FK_FactSalesEntradaProyecto1_DimArticuloProyecto1] FOREIGN KEY([IDArticulo])
REFERENCES [dbo].[DimArticuloProyecto1] ([IDArticulo])
GO
ALTER TABLE [dbo].[FactSalesEntradaProyecto1] CHECK CONSTRAINT [FK_FactSalesEntradaProyecto1_DimArticuloProyecto1]
GO
ALTER TABLE [dbo].[FactSalesEntradaProyecto1]  WITH CHECK ADD  CONSTRAINT [FK_FactSalesEntradaProyecto1_DimClienteProyecto1] FOREIGN KEY([IDCliente])
REFERENCES [dbo].[DimClienteProyecto1] ([IDCliente])
GO
ALTER TABLE [dbo].[FactSalesEntradaProyecto1] CHECK CONSTRAINT [FK_FactSalesEntradaProyecto1_DimClienteProyecto1]
GO
ALTER TABLE [dbo].[FactSalesEntradaProyecto1]  WITH CHECK ADD  CONSTRAINT [FK_FactSalesEntradaProyecto1_DimEntradaProyecto1] FOREIGN KEY([IDFolio])
REFERENCES [dbo].[DimEntradaProyecto1] ([IDFolio])
GO
ALTER TABLE [dbo].[FactSalesEntradaProyecto1] CHECK CONSTRAINT [FK_FactSalesEntradaProyecto1_DimEntradaProyecto1]
GO
ALTER TABLE [dbo].[FactSalesEntradaProyecto1]  WITH CHECK ADD  CONSTRAINT [FK_FactSalesEntradaProyecto1_DimTimeProyecto1] FOREIGN KEY([IDTiempo])
REFERENCES [dbo].[DimTimeProyecto1] ([IDTiempo])
GO
ALTER TABLE [dbo].[FactSalesEntradaProyecto1] CHECK CONSTRAINT [FK_FactSalesEntradaProyecto1_DimTimeProyecto1]
GO
ALTER TABLE [dbo].[FactSalesEntradaProyecto1]  WITH CHECK ADD  CONSTRAINT [FK_FactSalesEntradaProyecto1_DimVendedorProyecto1] FOREIGN KEY([IDVendedor])
REFERENCES [dbo].[DimVendedorProyecto1] ([IDVendedor])
GO
ALTER TABLE [dbo].[FactSalesEntradaProyecto1] CHECK CONSTRAINT [FK_FactSalesEntradaProyecto1_DimVendedorProyecto1]
GO
ALTER TABLE [dbo].[FactSalesSalidaProyecto1]  WITH CHECK ADD  CONSTRAINT [FK_FactSalesSalidaProyecto1_DimArticuloProyecto1] FOREIGN KEY([IDArticulo])
REFERENCES [dbo].[DimArticuloProyecto1] ([IDArticulo])
GO
ALTER TABLE [dbo].[FactSalesSalidaProyecto1] CHECK CONSTRAINT [FK_FactSalesSalidaProyecto1_DimArticuloProyecto1]
GO
ALTER TABLE [dbo].[FactSalesSalidaProyecto1]  WITH CHECK ADD  CONSTRAINT [FK_FactSalesSalidaProyecto1_DimClienteProyecto1] FOREIGN KEY([IDCliente])
REFERENCES [dbo].[DimClienteProyecto1] ([IDCliente])
GO
ALTER TABLE [dbo].[FactSalesSalidaProyecto1] CHECK CONSTRAINT [FK_FactSalesSalidaProyecto1_DimClienteProyecto1]
GO
ALTER TABLE [dbo].[FactSalesSalidaProyecto1]  WITH CHECK ADD  CONSTRAINT [FK_FactSalesSalidaProyecto1_DimSalidaProyecto1] FOREIGN KEY([IDFolio])
REFERENCES [dbo].[DimSalidaProyecto1] ([IDFolio])
GO
ALTER TABLE [dbo].[FactSalesSalidaProyecto1] CHECK CONSTRAINT [FK_FactSalesSalidaProyecto1_DimSalidaProyecto1]
GO
ALTER TABLE [dbo].[FactSalesSalidaProyecto1]  WITH CHECK ADD  CONSTRAINT [FK_FactSalesSalidaProyecto1_DimTimeProyecto1] FOREIGN KEY([IDTiempo])
REFERENCES [dbo].[DimTimeProyecto1] ([IDTiempo])
GO
ALTER TABLE [dbo].[FactSalesSalidaProyecto1] CHECK CONSTRAINT [FK_FactSalesSalidaProyecto1_DimTimeProyecto1]
GO
ALTER TABLE [dbo].[FactSalesSalidaProyecto1]  WITH CHECK ADD  CONSTRAINT [FK_FactSalesSalidaProyecto1_DimVendedorProyecto1] FOREIGN KEY([IDVendedor])
REFERENCES [dbo].[DimVendedorProyecto1] ([IDVendedor])
GO
ALTER TABLE [dbo].[FactSalesSalidaProyecto1] CHECK CONSTRAINT [FK_FactSalesSalidaProyecto1_DimVendedorProyecto1]
GO
USE [master]
GO
ALTER DATABASE [Proyecto1] SET  READ_WRITE 
GO
