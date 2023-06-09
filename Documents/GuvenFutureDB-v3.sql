USE [master]
GO
/****** Object:  Database [GDDb]    Script Date: 05/06/2023 17:22:01 ******/
CREATE DATABASE [GDDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GDDb', FILENAME = N'C:\Users\adilk\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\GDDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GDDb_log', FILENAME = N'C:\Users\adilk\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\GDDb.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GDDb] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GDDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GDDb] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [GDDb] SET ANSI_NULLS ON 
GO
ALTER DATABASE [GDDb] SET ANSI_PADDING ON 
GO
ALTER DATABASE [GDDb] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [GDDb] SET ARITHABORT ON 
GO
ALTER DATABASE [GDDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GDDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GDDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GDDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GDDb] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [GDDb] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [GDDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GDDb] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [GDDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GDDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GDDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GDDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GDDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GDDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GDDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GDDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GDDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GDDb] SET RECOVERY FULL 
GO
ALTER DATABASE [GDDb] SET  MULTI_USER 
GO
ALTER DATABASE [GDDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GDDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GDDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GDDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GDDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GDDb] SET QUERY_STORE = OFF
GO
USE [GDDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [GDDb]
GO
/****** Object:  Schema [HangFire]    Script Date: 05/06/2023 17:22:01 ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 05/06/2023 17:22:01 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppointmentActions]    Script Date: 05/06/2023 17:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppointmentActions](
	[AutoId] [int] IDENTITY(1,1) NOT NULL,
	[ProviderId] [int] NULL,
	[ProviderLocationId] [int] NOT NULL,
	[AppointmentDate] [datetime2](7) NULL,
	[StartTime] [datetime2](7) NULL,
	[EndTime] [datetime2](7) NULL,
	[PatientUserId] [int] NULL,
	[DoctorUserId] [int] NULL,
	[ReminderTimePeriod] [int] NULL,
	[ReminderCount] [int] NULL,
	[ReminderType] [nvarchar](max) NULL,
	[AppointmentStatus] [int] NULL,
	[AppointmentStatusNote] [nvarchar](max) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[DataStatus] [int] NOT NULL,
 CONSTRAINT [PK_AppointmentActions] PRIMARY KEY CLUSTERED 
(
	[AutoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppointmentReminderQueues]    Script Date: 05/06/2023 17:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppointmentReminderQueues](
	[AutoId] [int] IDENTITY(1,1) NOT NULL,
	[ProviderId] [int] NULL,
	[AppointmentActionId] [int] NOT NULL,
	[ReminderDate] [datetime2](7) NULL,
	[ReminderType] [nvarchar](max) NULL,
	[ReminderStatus] [int] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[DataStatus] [int] NOT NULL,
 CONSTRAINT [PK_AppointmentReminderQueues] PRIMARY KEY CLUSTERED 
(
	[AutoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppointmentSettings]    Script Date: 05/06/2023 17:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppointmentSettings](
	[AutoId] [int] IDENTITY(1,1) NOT NULL,
	[ProviderLocationId] [int] NOT NULL,
	[AppointmentDate] [datetime2](7) NULL,
	[StartTime] [datetime2](7) NULL,
	[ConsultationTimePeriod] [int] NULL,
	[BreakTimePeriod] [int] NULL,
	[LunchTimeStart] [datetime2](7) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[DataStatus] [int] NOT NULL,
	[EndTime] [datetime2](7) NULL,
 CONSTRAINT [PK_AppointmentSettings] PRIMARY KEY CLUSTERED 
(
	[AutoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 05/06/2023 17:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[AutoId] [int] IDENTITY(1,1) NOT NULL,
	[ProviderId] [int] NULL,
	[StokType] [nvarchar](max) NULL,
	[StockName] [nvarchar](max) NULL,
	[SUTCode] [nvarchar](max) NULL,
	[Barcode] [nvarchar](max) NULL,
	[MaterialUnitName] [nvarchar](max) NULL,
	[CurrencyName] [nvarchar](max) NULL,
	[UnitPrice] [float] NULL,
	[UnitPriceAvg] [float] NULL,
	[QuantityBalance] [float] NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[DataStatus] [int] NOT NULL,
 CONSTRAINT [PK_Materials] PRIMARY KEY CLUSTERED 
(
	[AutoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalHistoryView]    Script Date: 05/06/2023 17:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalHistoryView](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProviderID] [int] NOT NULL,
	[ProviderLocationId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[DoctorId] [int] NOT NULL,
	[SaglikKurulusu] [nvarchar](max) NULL,
	[SaglikKurulusuTesisKodu] [nvarchar](max) NULL,
	[MuayeneYeri] [nvarchar](max) NULL,
	[MuayeneOdaNo] [nvarchar](max) NULL,
	[HastaAdi] [nvarchar](max) NULL,
	[HastaTC] [nvarchar](max) NULL,
	[DoktorAdi] [nvarchar](max) NULL,
	[DoktorTC] [nvarchar](max) NULL,
	[ZiyaretKayitTuru] [nvarchar](max) NULL,
	[RandevuKaydiniYapan] [nvarchar](max) NULL,
	[RandevuTarihi] [datetime2](7) NULL,
	[RandevuBaslamaSaati] [datetime2](7) NULL,
	[RandevuBitisSaati] [datetime2](7) NULL,
	[RandevuDurumu] [int] NULL,
	[RandevuNotu] [nvarchar](max) NULL,
	[ZiyaretKayidiniYapan] [nvarchar](max) NULL,
	[ZiyaretKayitTarihi] [datetime2](7) NULL,
	[ZiyaretTarihi] [datetime2](7) NULL,
	[HastaSikayeti] [nvarchar](max) NULL,
	[Teshis] [nvarchar](max) NULL,
	[HastaKritikSeviyesi] [int] NULL,
	[ProvisionNumber] [int] NULL,
	[IslemKaydiniYapan] [nvarchar](max) NULL,
	[IslemKayitTarihi] [datetime2](7) NULL,
	[IslemKayitTuru] [nvarchar](max) NULL,
	[ReceteNumarasi] [nvarchar](max) NULL,
	[MalzemeTuru] [nvarchar](max) NULL,
	[MalzemeAdi] [nvarchar](max) NULL,
	[Barcode] [nvarchar](max) NULL,
	[SUTCode] [nvarchar](max) NULL,
	[MalzemeBirimi] [nvarchar](max) NULL,
	[VerilenMiktar] [float] NULL,
	[KullanimDozu] [int] NULL,
	[Fiyat] [float] NULL,
	[ParaBirimi] [nvarchar](max) NULL,
 CONSTRAINT [PK_MedicalHistoryView] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientMedicalHistories]    Script Date: 05/06/2023 17:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientMedicalHistories](
	[AutoId] [int] IDENTITY(1,1) NOT NULL,
	[ProviderId] [int] NULL,
	[ProviderLocationId] [int] NULL,
	[AppointmentActionId] [int] NULL,
	[PatientUserId] [int] NULL,
	[DoctorUserId] [int] NULL,
	[ActionDate] [datetime2](7) NULL,
	[PaitentComplaint] [nvarchar](max) NULL,
	[Severity] [int] NULL,
	[ProvisionNumber] [int] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[DataStatus] [int] NOT NULL,
	[DoctorDiagnosis] [nvarchar](max) NULL,
 CONSTRAINT [PK_PatientMedicalHistories] PRIMARY KEY CLUSTERED 
(
	[AutoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientMedicalHistoryDetails]    Script Date: 05/06/2023 17:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientMedicalHistoryDetails](
	[AutoId] [int] IDENTITY(1,1) NOT NULL,
	[ProviderId] [int] NULL,
	[ProviderLocationId] [int] NULL,
	[PatientMedicalHistoryId] [int] NULL,
	[IsPrescription] [bit] NOT NULL,
	[PrescriptionNumber] [nvarchar](max) NULL,
	[PatientUserId] [int] NULL,
	[DoctorUserId] [int] NULL,
	[MaterialId] [int] NULL,
	[MaterialUnitName] [nvarchar](max) NULL,
	[UsegeDose] [int] NULL,
	[Quantity] [float] NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[DataStatus] [int] NOT NULL,
 CONSTRAINT [PK_PatientMedicalHistoryDetails] PRIMARY KEY CLUSTERED 
(
	[AutoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProviderLocations]    Script Date: 05/06/2023 17:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProviderLocations](
	[AutoId] [int] IDENTITY(1,1) NOT NULL,
	[ProviderId] [int] NULL,
	[ParentId] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[UserId] [int] NULL,
	[LocationNo] [nvarchar](max) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[DataStatus] [int] NOT NULL,
 CONSTRAINT [PK_ProviderLocations] PRIMARY KEY CLUSTERED 
(
	[AutoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Providers]    Script Date: 05/06/2023 17:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Providers](
	[AutoId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[TesisKodu] [nvarchar](max) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[DataStatus] [int] NOT NULL,
	[ProviderId] [int] NULL,
 CONSTRAINT [PK_Providers] PRIMARY KEY CLUSTERED 
(
	[AutoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 05/06/2023 17:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[AutoId] [int] IDENTITY(1,1) NOT NULL,
	[ProviderId] [int] NOT NULL,
	[UserId] [int] NULL,
	[Nation] [nvarchar](max) NULL,
	[BloodType] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[Gender] [nvarchar](max) NULL,
	[Height] [int] NULL,
	[Weight] [real] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[DataStatus] [int] NOT NULL,
	[EMail] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[AutoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05/06/2023 17:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[AutoId] [int] IDENTITY(1,1) NOT NULL,
	[ProviderId] [int] NULL,
	[TCNo] [nvarchar](max) NULL,
	[FullName] [nvarchar](max) NULL,
	[UserType] [nvarchar](max) NULL,
	[PasswordHashed] [nvarchar](max) NULL,
	[PasswordHashKey] [nvarchar](max) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[DataStatus] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[AutoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 05/06/2023 17:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[AggregatedCounter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [bigint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_CounterAggregated] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Counter]    Script Date: 05/06/2023 17:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Counter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [int] NOT NULL,
	[ExpireAt] [datetime] NULL,
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_HangFire_Counter] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 05/06/2023 17:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Hash](
	[Key] [nvarchar](100) NOT NULL,
	[Field] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime2](7) NULL,
 CONSTRAINT [PK_HangFire_Hash] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Field] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Job]    Script Date: 05/06/2023 17:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Job](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StateId] [bigint] NULL,
	[StateName] [nvarchar](20) NULL,
	[InvocationData] [nvarchar](max) NOT NULL,
	[Arguments] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 05/06/2023 17:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobParameter](
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_JobParameter] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 05/06/2023 17:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobQueue](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Queue] [nvarchar](50) NOT NULL,
	[FetchedAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_JobQueue] PRIMARY KEY CLUSTERED 
(
	[Queue] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[List]    Script Date: 05/06/2023 17:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[List](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_List] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Schema]    Script Date: 05/06/2023 17:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Schema](
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_HangFire_Schema] PRIMARY KEY CLUSTERED 
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Server]    Script Date: 05/06/2023 17:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Server](
	[Id] [nvarchar](200) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[LastHeartbeat] [datetime] NOT NULL,
 CONSTRAINT [PK_HangFire_Server] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Set]    Script Date: 05/06/2023 17:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Set](
	[Key] [nvarchar](100) NOT NULL,
	[Score] [float] NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Set] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[State]    Script Date: 05/06/2023 17:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[State](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_State] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230603001823_init', N'7.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230604144541_init', N'7.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230605090443_init', N'7.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230605120902_MedicalHistoryView', N'7.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230605141922_last', N'7.0.5')
GO
SET IDENTITY_INSERT [dbo].[AppointmentActions] ON 

INSERT [dbo].[AppointmentActions] ([AutoId], [ProviderId], [ProviderLocationId], [AppointmentDate], [StartTime], [EndTime], [PatientUserId], [DoctorUserId], [ReminderTimePeriod], [ReminderCount], [ReminderType], [AppointmentStatus], [AppointmentStatusNote], [CreatedBy], [CreatedDate], [DataStatus]) VALUES (2, 3, 2, CAST(N'2023-06-05T00:00:00.0000000' AS DateTime2), CAST(N'2023-06-05T11:00:00.0000000' AS DateTime2), CAST(N'2023-06-05T11:30:00.0000000' AS DateTime2), 10, 8, 60, 6, N'Email', 0, N'Açık', 13, CAST(N'2023-06-04T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[AppointmentActions] ([AutoId], [ProviderId], [ProviderLocationId], [AppointmentDate], [StartTime], [EndTime], [PatientUserId], [DoctorUserId], [ReminderTimePeriod], [ReminderCount], [ReminderType], [AppointmentStatus], [AppointmentStatusNote], [CreatedBy], [CreatedDate], [DataStatus]) VALUES (3, 3, 2, CAST(N'2023-05-06T15:00:00.0000000' AS DateTime2), CAST(N'2023-05-06T15:00:00.0000000' AS DateTime2), CAST(N'2023-05-06T15:00:00.0000000' AS DateTime2), 8, 8, 30, 3, N'SMS', 0, N'not yok. ', 3, CAST(N'2023-06-05T16:47:31.3527170' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[AppointmentActions] OFF
GO
SET IDENTITY_INSERT [dbo].[AppointmentReminderQueues] ON 

INSERT [dbo].[AppointmentReminderQueues] ([AutoId], [ProviderId], [AppointmentActionId], [ReminderDate], [ReminderType], [ReminderStatus], [CreatedBy], [CreatedDate], [DataStatus]) VALUES (1, 3, 3, CAST(N'2023-05-06T15:00:00.0000000' AS DateTime2), N'SMS', NULL, 3, CAST(N'2023-06-05T16:47:31.5725830' AS DateTime2), 1)
INSERT [dbo].[AppointmentReminderQueues] ([AutoId], [ProviderId], [AppointmentActionId], [ReminderDate], [ReminderType], [ReminderStatus], [CreatedBy], [CreatedDate], [DataStatus]) VALUES (2, 3, 3, CAST(N'2023-05-06T14:30:00.0000000' AS DateTime2), N'SMS', NULL, 3, CAST(N'2023-06-05T16:47:31.5942428' AS DateTime2), 1)
INSERT [dbo].[AppointmentReminderQueues] ([AutoId], [ProviderId], [AppointmentActionId], [ReminderDate], [ReminderType], [ReminderStatus], [CreatedBy], [CreatedDate], [DataStatus]) VALUES (3, 3, 3, CAST(N'2023-05-06T14:00:00.0000000' AS DateTime2), N'SMS', NULL, 3, CAST(N'2023-06-05T16:47:31.5981318' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[AppointmentReminderQueues] OFF
GO
SET IDENTITY_INSERT [dbo].[AppointmentSettings] ON 

INSERT [dbo].[AppointmentSettings] ([AutoId], [ProviderLocationId], [AppointmentDate], [StartTime], [ConsultationTimePeriod], [BreakTimePeriod], [LunchTimeStart], [CreatedBy], [CreatedDate], [DataStatus], [EndTime]) VALUES (2, 2, CAST(N'2023-06-05T00:00:00.0000000' AS DateTime2), CAST(N'2023-06-05T08:00:00.0000000' AS DateTime2), 30, 60, CAST(N'2023-06-05T12:30:00.0000000' AS DateTime2), 13, CAST(N'2023-05-05T00:00:00.0000000' AS DateTime2), 1, NULL)
SET IDENTITY_INSERT [dbo].[AppointmentSettings] OFF
GO
SET IDENTITY_INSERT [dbo].[Materials] ON 

INSERT [dbo].[Materials] ([AutoId], [ProviderId], [StokType], [StockName], [SUTCode], [Barcode], [MaterialUnitName], [CurrencyName], [UnitPrice], [UnitPriceAvg], [QuantityBalance], [Description], [CreatedBy], [CreatedDate], [DataStatus]) VALUES (2, 3, N'Sarf', N'Şırınga', N'213123', N'452343', N'Adet', N'TL', 2, 2.2999999523162842, 6, NULL, 3, CAST(N'2023-06-05T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Materials] ([AutoId], [ProviderId], [StokType], [StockName], [SUTCode], [Barcode], [MaterialUnitName], [CurrencyName], [UnitPrice], [UnitPriceAvg], [QuantityBalance], [Description], [CreatedBy], [CreatedDate], [DataStatus]) VALUES (3, 3, N'Demirbas', N'Bilgisayar', N'213434', N'796575', N'Adet', N'TL', 9870, 9870, 4, NULL, 3, CAST(N'2023-06-05T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Materials] ([AutoId], [ProviderId], [StokType], [StockName], [SUTCode], [Barcode], [MaterialUnitName], [CurrencyName], [UnitPrice], [UnitPriceAvg], [QuantityBalance], [Description], [CreatedBy], [CreatedDate], [DataStatus]) VALUES (4, 3, N'Ilac', N'Arvales', N'676543', N'546656', N'Adet', N'TL', 35, 34.700000762939453, 78, NULL, 3, CAST(N'2023-06-05T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Materials] ([AutoId], [ProviderId], [StokType], [StockName], [SUTCode], [Barcode], [MaterialUnitName], [CurrencyName], [UnitPrice], [UnitPriceAvg], [QuantityBalance], [Description], [CreatedBy], [CreatedDate], [DataStatus]) VALUES (5, 3, N'Ilac', N'Serum', N'768565', N'134663', N'Adet', N'TL', 67.300003051757812, 67, 525, NULL, 3, CAST(N'2023-06-05T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Materials] ([AutoId], [ProviderId], [StokType], [StockName], [SUTCode], [Barcode], [MaterialUnitName], [CurrencyName], [UnitPrice], [UnitPriceAvg], [QuantityBalance], [Description], [CreatedBy], [CreatedDate], [DataStatus]) VALUES (6, 3, N'Ilac', N'Klacid', N'657659', N'456435', N'Adet', N'TL', 45.799999237060547, 50, 78, NULL, 3, CAST(N'2023-06-05T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Materials] ([AutoId], [ProviderId], [StokType], [StockName], [SUTCode], [Barcode], [MaterialUnitName], [CurrencyName], [UnitPrice], [UnitPriceAvg], [QuantityBalance], [Description], [CreatedBy], [CreatedDate], [DataStatus]) VALUES (7, 3, N'Sarf', N'Eldiven', N'213546', N'697898', N'Kutu', N'TL', 13, 12, 35, NULL, 3, CAST(N'2023-06-05T00:00:00.0000000' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Materials] OFF
GO
SET IDENTITY_INSERT [dbo].[PatientMedicalHistories] ON 

INSERT [dbo].[PatientMedicalHistories] ([AutoId], [ProviderId], [ProviderLocationId], [AppointmentActionId], [PatientUserId], [DoctorUserId], [ActionDate], [PaitentComplaint], [Severity], [ProvisionNumber], [CreatedBy], [CreatedDate], [DataStatus], [DoctorDiagnosis]) VALUES (3, 3, 2, 2, 10, 8, CAST(N'2023-06-05T00:00:00.0000000' AS DateTime2), N'Karın ağrısı', 3, 78952453, 13, CAST(N'2023-02-04T00:00:00.0000000' AS DateTime2), 1, NULL)
SET IDENTITY_INSERT [dbo].[PatientMedicalHistories] OFF
GO
SET IDENTITY_INSERT [dbo].[PatientMedicalHistoryDetails] ON 

INSERT [dbo].[PatientMedicalHistoryDetails] ([AutoId], [ProviderId], [ProviderLocationId], [PatientMedicalHistoryId], [IsPrescription], [PrescriptionNumber], [PatientUserId], [DoctorUserId], [MaterialId], [MaterialUnitName], [UsegeDose], [Quantity], [Description], [CreatedBy], [CreatedDate], [DataStatus]) VALUES (3, 3, 2, 3, 0, NULL, 10, 8, 2, NULL, 1, 1, NULL, 13, CAST(N'2023-06-05T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[PatientMedicalHistoryDetails] ([AutoId], [ProviderId], [ProviderLocationId], [PatientMedicalHistoryId], [IsPrescription], [PrescriptionNumber], [PatientUserId], [DoctorUserId], [MaterialId], [MaterialUnitName], [UsegeDose], [Quantity], [Description], [CreatedBy], [CreatedDate], [DataStatus]) VALUES (4, 3, 2, 3, 0, NULL, 10, 8, 4, NULL, 1, 1, NULL, 13, CAST(N'2023-06-05T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[PatientMedicalHistoryDetails] ([AutoId], [ProviderId], [ProviderLocationId], [PatientMedicalHistoryId], [IsPrescription], [PrescriptionNumber], [PatientUserId], [DoctorUserId], [MaterialId], [MaterialUnitName], [UsegeDose], [Quantity], [Description], [CreatedBy], [CreatedDate], [DataStatus]) VALUES (5, 3, 2, 3, 0, NULL, 10, 8, 5, NULL, 1, 1, NULL, 13, CAST(N'2023-06-05T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[PatientMedicalHistoryDetails] ([AutoId], [ProviderId], [ProviderLocationId], [PatientMedicalHistoryId], [IsPrescription], [PrescriptionNumber], [PatientUserId], [DoctorUserId], [MaterialId], [MaterialUnitName], [UsegeDose], [Quantity], [Description], [CreatedBy], [CreatedDate], [DataStatus]) VALUES (6, 3, 2, 3, 0, NULL, 10, 8, 7, NULL, 1, 1, NULL, 13, CAST(N'2023-06-05T00:00:00.0000000' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[PatientMedicalHistoryDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[ProviderLocations] ON 

INSERT [dbo].[ProviderLocations] ([AutoId], [ProviderId], [ParentId], [Name], [UserId], [LocationNo], [CreatedBy], [CreatedDate], [DataStatus]) VALUES (1, 3, NULL, N'3.Cadde Merkez', NULL, N'Merkez', 3, CAST(N'2023-06-05T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[ProviderLocations] ([AutoId], [ProviderId], [ParentId], [Name], [UserId], [LocationNo], [CreatedBy], [CreatedDate], [DataStatus]) VALUES (2, 3, 1, N'Dahiliye', 8, N'Pol1', 3, CAST(N'2023-06-05T00:00:00.0000000' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[ProviderLocations] OFF
GO
SET IDENTITY_INSERT [dbo].[Providers] ON 

INSERT [dbo].[Providers] ([AutoId], [Name], [Address], [TesisKodu], [CreatedBy], [CreatedDate], [DataStatus], [ProviderId]) VALUES (3, N'ABK Health', N'Bahçeli', N'1234', 1, CAST(N'2023-06-05T00:00:00.0000000' AS DateTime2), 1, NULL)
SET IDENTITY_INSERT [dbo].[Providers] OFF
GO
SET IDENTITY_INSERT [dbo].[UserDetails] ON 

INSERT [dbo].[UserDetails] ([AutoId], [ProviderId], [UserId], [Nation], [BloodType], [Country], [City], [Address], [PhoneNumber], [Gender], [Height], [Weight], [CreatedBy], [CreatedDate], [DataStatus], [EMail]) VALUES (1, 3, 3, N'TR', N'ARH-', N'Türkiye', N'Ankara', N'Baçeli', N'5336871565', N'Erkek', 188, 96, 3, CAST(N'2023-06-05T00:00:00.0000000' AS DateTime2), 1, N'adilbkaya@gmail.com')
SET IDENTITY_INSERT [dbo].[UserDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([AutoId], [ProviderId], [TCNo], [FullName], [UserType], [PasswordHashed], [PasswordHashKey], [CreatedBy], [CreatedDate], [DataStatus]) VALUES (3, 3, N'1', N'Adil Kaya', N'Admin', N'cd6b33f9-9bcf-4940-aa52-b88cfccaf235622$leAlw/PXsyoKTOcU6jD2eML9PIemS0zPVUovEnGw1YxvC/X+', N'cd6b33f9-9bcf-4940-aa52-b88cfccaf235', 3, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Users] ([AutoId], [ProviderId], [TCNo], [FullName], [UserType], [PasswordHashed], [PasswordHashKey], [CreatedBy], [CreatedDate], [DataStatus]) VALUES (8, 3, N'2', N'Doktor 1', N'Personel', N'cd6b33f9-9bcf-4940-aa52-b88cfccaf235622$leAlw/PXsyoKTOcU6jD2eML9PIemS0zPVUovEnGw1YxvC/X+', N'cd6b33f9-9bcf-4940-aa52-b88cfccaf235', 3, CAST(N'2023-06-05T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Users] ([AutoId], [ProviderId], [TCNo], [FullName], [UserType], [PasswordHashed], [PasswordHashKey], [CreatedBy], [CreatedDate], [DataStatus]) VALUES (9, 3, N'3', N'Doktor 2', N'Personel', N'cd6b33f9-9bcf-4940-aa52-b88cfccaf235622$leAlw/PXsyoKTOcU6jD2eML9PIemS0zPVUovEnGw1YxvC/X+', N'cd6b33f9-9bcf-4940-aa52-b88cfccaf235', 3, CAST(N'2023-06-05T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Users] ([AutoId], [ProviderId], [TCNo], [FullName], [UserType], [PasswordHashed], [PasswordHashKey], [CreatedBy], [CreatedDate], [DataStatus]) VALUES (10, 3, N'4', N'Hasta 1', N'Hasta', N'cd6b33f9-9bcf-4940-aa52-b88cfccaf235622$leAlw/PXsyoKTOcU6jD2eML9PIemS0zPVUovEnGw1YxvC/X+', N'cd6b33f9-9bcf-4940-aa52-b88cfccaf235', 3, CAST(N'2023-06-05T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Users] ([AutoId], [ProviderId], [TCNo], [FullName], [UserType], [PasswordHashed], [PasswordHashKey], [CreatedBy], [CreatedDate], [DataStatus]) VALUES (11, 3, N'5', N'Hasta 2', N'Hasta', N'cd6b33f9-9bcf-4940-aa52-b88cfccaf235622$leAlw/PXsyoKTOcU6jD2eML9PIemS0zPVUovEnGw1YxvC/X+', N'cd6b33f9-9bcf-4940-aa52-b88cfccaf235', 3, CAST(N'2023-06-05T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Users] ([AutoId], [ProviderId], [TCNo], [FullName], [UserType], [PasswordHashed], [PasswordHashKey], [CreatedBy], [CreatedDate], [DataStatus]) VALUES (12, 3, N'6', N'Hasta 3', N'Hasta', N'cd6b33f9-9bcf-4940-aa52-b88cfccaf235622$leAlw/PXsyoKTOcU6jD2eML9PIemS0zPVUovEnGw1YxvC/X+', N'cd6b33f9-9bcf-4940-aa52-b88cfccaf235', 3, CAST(N'2023-06-05T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Users] ([AutoId], [ProviderId], [TCNo], [FullName], [UserType], [PasswordHashed], [PasswordHashKey], [CreatedBy], [CreatedDate], [DataStatus]) VALUES (13, 3, N'6', N'Sekreter 1', N'Personel', N'cd6b33f9-9bcf-4940-aa52-b88cfccaf235622$leAlw/PXsyoKTOcU6jD2eML9PIemS0zPVUovEnGw1YxvC/X+', N'cd6b33f9-9bcf-4940-aa52-b88cfccaf235', 3, CAST(N'2023-06-05T00:00:00.0000000' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:failed:2023-06-05', 2, CAST(N'2023-07-05T08:25:38.207' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:failed:2023-06-05-08', 2, CAST(N'2023-06-06T08:25:38.207' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded', 121, NULL)
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2023-06-04', 99, CAST(N'2023-07-04T22:51:00.230' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2023-06-04-14', 14, CAST(N'2023-06-05T14:31:14.520' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2023-06-04-18', 3, CAST(N'2023-06-05T18:59:07.900' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2023-06-04-19', 21, CAST(N'2023-06-05T19:20:09.380' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2023-06-04-20', 5, CAST(N'2023-06-05T20:30:06.797' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2023-06-04-21', 20, CAST(N'2023-06-05T21:59:13.517' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2023-06-04-22', 36, CAST(N'2023-06-05T22:51:00.230' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2023-06-05', 22, CAST(N'2023-07-05T12:51:10.333' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2023-06-05-08', 10, CAST(N'2023-06-06T08:54:03.440' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2023-06-05-12', 12, CAST(N'2023-06-06T12:51:10.333' AS DateTime))
GO
SET IDENTITY_INSERT [HangFire].[Counter] ON 

INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded', 1, NULL, 368)
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded', 1, NULL, 371)
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded', 1, NULL, 374)
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded', 1, NULL, 377)
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded', 1, NULL, 380)
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded', 1, NULL, 383)
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded:2023-06-05', 1, CAST(N'2023-07-05T13:45:49.887' AS DateTime), 369)
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded:2023-06-05', 1, CAST(N'2023-07-05T13:46:04.743' AS DateTime), 372)
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded:2023-06-05', 1, CAST(N'2023-07-05T13:47:04.800' AS DateTime), 375)
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded:2023-06-05', 1, CAST(N'2023-07-05T13:48:04.853' AS DateTime), 378)
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded:2023-06-05', 1, CAST(N'2023-07-05T13:49:04.913' AS DateTime), 381)
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded:2023-06-05', 1, CAST(N'2023-07-05T13:50:04.973' AS DateTime), 384)
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded:2023-06-05-13', 1, CAST(N'2023-06-06T13:45:49.890' AS DateTime), 370)
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded:2023-06-05-13', 1, CAST(N'2023-06-06T13:46:04.743' AS DateTime), 373)
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded:2023-06-05-13', 1, CAST(N'2023-06-06T13:47:04.800' AS DateTime), 376)
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded:2023-06-05-13', 1, CAST(N'2023-06-06T13:48:04.853' AS DateTime), 379)
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded:2023-06-05-13', 1, CAST(N'2023-06-06T13:49:04.913' AS DateTime), 382)
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded:2023-06-05-13', 1, CAST(N'2023-06-06T13:50:04.973' AS DateTime), 385)
SET IDENTITY_INSERT [HangFire].[Counter] OFF
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:MailRecursiveJob.Execute', N'CreatedAt', N'2023-06-04T14:23:47.5424635Z', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:MailRecursiveJob.Execute', N'Cron', N'* * * * *', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:MailRecursiveJob.Execute', N'Job', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":"[]"}', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:MailRecursiveJob.Execute', N'LastExecution', N'2023-06-05T13:50:04.9488569Z', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:MailRecursiveJob.Execute', N'LastJobId', N'129', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:MailRecursiveJob.Execute', N'NextExecution', N'2023-06-05T13:51:00.0000000Z', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:MailRecursiveJob.Execute', N'Queue', N'default', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:MailRecursiveJob.Execute', N'TimeZoneId', N'UTC', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:MailRecursiveJob.Execute', N'V', N'2', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:SMSRecursiveJob.Execute', N'CreatedAt', N'2023-06-04T14:27:42.8692348Z', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:SMSRecursiveJob.Execute', N'Cron', N'* * * * *', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:SMSRecursiveJob.Execute', N'Error', N'System.InvalidOperationException: Recurring job can''t be scheduled, see inner exception for details.
 ---> Hangfire.Common.JobLoadException: Could not load the job. See inner exception for the details.
 ---> System.InvalidOperationException: The type `GuvenFuture.Business.BackgroundJobs.SMSRecursiveJob` does not contain a method with signature `Execute()`
   at Hangfire.Storage.InvocationData.DeserializeJob()
   --- End of inner exception stack trace ---
   at Hangfire.Storage.InvocationData.DeserializeJob()
   at Hangfire.RecurringJobEntity..ctor(String recurringJobId, IDictionary`2 recurringJob, ITimeZoneResolver timeZoneResolver, DateTime now)
   --- End of inner exception stack trace ---
   at Hangfire.Server.RecurringJobScheduler.ScheduleRecurringJob(BackgroundProcessContext context, IStorageConnection connection, String recurringJobId, RecurringJobEntity recurringJob, DateTime now)', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:SMSRecursiveJob.Execute', N'Job', N'{"Type":"GuvenFuture.Business.BackgroundJobs.SMSRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":"[]"}', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:SMSRecursiveJob.Execute', N'LastExecution', N'2023-06-04T14:31:14.4851727Z', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:SMSRecursiveJob.Execute', N'LastJobId', N'16', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:SMSRecursiveJob.Execute', N'NextExecution', N'', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:SMSRecursiveJob.Execute', N'Queue', N'default', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:SMSRecursiveJob.Execute', N'RetryAttempt', N'5', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:SMSRecursiveJob.Execute', N'TimeZoneId', N'UTC', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:SMSRecursiveJob.Execute', N'V', N'2', NULL)
GO
SET IDENTITY_INSERT [HangFire].[Job] ON 

INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (1, 4, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":null}', N'["\"You checkout new product into your checklist!\""]', CAST(N'2023-06-04T14:12:38.457' AS DateTime), CAST(N'2023-06-05T14:13:08.720' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (2, 7, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T14:24:04.373' AS DateTime), CAST(N'2023-06-05T14:24:04.577' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (3, 10, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T14:25:10.270' AS DateTime), CAST(N'2023-06-05T14:25:10.627' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (4, 392, N'Failed', N'{"Type":"GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T14:26:44.933' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (5, 15, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T14:26:45.177' AS DateTime), CAST(N'2023-06-05T14:26:45.467' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (6, 391, N'Failed', N'{"Type":"GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T14:27:00.200' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (7, 24, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T14:27:00.203' AS DateTime), CAST(N'2023-06-05T14:27:00.217' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (8, 35, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T14:28:06.043' AS DateTime), CAST(N'2023-06-05T14:28:06.110' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (9, 38, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.SMSRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T14:28:14.090' AS DateTime), CAST(N'2023-06-05T14:28:14.100' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10, 49, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.SMSRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T14:28:59.517' AS DateTime), CAST(N'2023-06-05T14:28:59.533' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (11, 53, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T14:29:14.200' AS DateTime), CAST(N'2023-06-05T14:29:14.217' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (12, 55, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.SMSRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T14:29:14.213' AS DateTime), CAST(N'2023-06-05T14:29:14.223' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (13, 67, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T14:30:14.380' AS DateTime), CAST(N'2023-06-05T14:30:14.397' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (14, 69, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.SMSRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T14:30:14.393' AS DateTime), CAST(N'2023-06-05T14:30:14.400' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (15, 74, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T14:31:14.487' AS DateTime), CAST(N'2023-06-05T14:31:14.517' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (16, 75, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.SMSRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T14:31:14.507' AS DateTime), CAST(N'2023-06-05T14:31:14.520' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (17, 82, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T18:57:22.513' AS DateTime), CAST(N'2023-06-05T18:57:22.667' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (18, 89, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T18:58:07.770' AS DateTime), CAST(N'2023-06-05T18:58:07.783' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (19, 92, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T18:59:07.877' AS DateTime), CAST(N'2023-06-05T18:59:07.900' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (20, 95, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T19:00:07.943' AS DateTime), CAST(N'2023-06-05T19:00:07.963' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (21, 98, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T19:01:08.013' AS DateTime), CAST(N'2023-06-05T19:01:08.023' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (22, 101, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T19:02:08.087' AS DateTime), CAST(N'2023-06-05T19:02:08.117' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (23, 104, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T19:03:08.160' AS DateTime), CAST(N'2023-06-05T19:03:08.173' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (24, 115, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T19:04:08.213' AS DateTime), CAST(N'2023-06-05T19:04:08.233' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (25, 118, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T19:05:08.300' AS DateTime), CAST(N'2023-06-05T19:05:08.320' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (26, 121, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T19:06:08.347' AS DateTime), CAST(N'2023-06-05T19:06:08.360' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (27, 124, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T19:07:08.420' AS DateTime), CAST(N'2023-06-05T19:07:08.433' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (28, 127, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T19:08:08.480' AS DateTime), CAST(N'2023-06-05T19:08:08.503' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (29, 130, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T19:09:08.567' AS DateTime), CAST(N'2023-06-05T19:09:08.587' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30, 133, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T19:10:08.637' AS DateTime), CAST(N'2023-06-05T19:10:08.657' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (31, 136, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T19:11:08.717' AS DateTime), CAST(N'2023-06-05T19:11:08.733' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (32, 139, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T19:12:08.777' AS DateTime), CAST(N'2023-06-05T19:12:08.800' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (33, 142, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T19:13:08.853' AS DateTime), CAST(N'2023-06-05T19:13:08.873' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (34, 145, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T19:14:08.920' AS DateTime), CAST(N'2023-06-05T19:14:08.943' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (35, 152, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T19:15:08.987' AS DateTime), CAST(N'2023-06-05T19:15:09.007' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (36, 159, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T19:16:09.070' AS DateTime), CAST(N'2023-06-05T19:16:09.090' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (37, 162, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T19:17:09.143' AS DateTime), CAST(N'2023-06-05T19:17:09.163' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (38, 165, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T19:18:09.210' AS DateTime), CAST(N'2023-06-05T19:18:09.223' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (39, 168, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T19:19:09.293' AS DateTime), CAST(N'2023-06-05T19:19:09.307' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (40, 171, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T19:20:09.360' AS DateTime), CAST(N'2023-06-05T19:20:09.380' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (41, 178, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T20:26:33.013' AS DateTime), CAST(N'2023-06-05T20:26:33.157' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (42, 185, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T20:27:03.150' AS DateTime), CAST(N'2023-06-05T20:27:03.163' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (43, 188, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T20:28:03.203' AS DateTime), CAST(N'2023-06-05T20:28:03.227' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (44, 191, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T20:29:03.263' AS DateTime), CAST(N'2023-06-05T20:29:03.277' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (45, 194, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T20:30:06.767' AS DateTime), CAST(N'2023-06-05T20:30:06.800' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (46, 197, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T21:02:34.677' AS DateTime), CAST(N'2023-06-05T21:02:34.877' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (47, 200, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T21:04:05.733' AS DateTime), CAST(N'2023-06-05T21:04:05.977' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (48, 203, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T21:05:26.050' AS DateTime), CAST(N'2023-06-05T21:05:26.280' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (49, 206, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T21:07:54.860' AS DateTime), CAST(N'2023-06-05T21:07:55.083' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (50, 209, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T21:08:10.410' AS DateTime), CAST(N'2023-06-05T21:08:10.960' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (51, 219, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":null}', N'["\"You checkout new product into your checklist!\""]', CAST(N'2023-06-04T21:08:25.260' AS DateTime), CAST(N'2023-06-05T21:29:47.340' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (52, 220, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T21:29:47.170' AS DateTime), CAST(N'2023-06-05T21:29:47.340' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (53, 227, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T21:30:02.310' AS DateTime), CAST(N'2023-06-05T21:30:02.313' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (54, 230, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T21:31:03.507' AS DateTime), CAST(N'2023-06-05T21:31:03.530' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (55, 233, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T21:32:20.943' AS DateTime), CAST(N'2023-06-05T21:32:21.170' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (56, 236, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T21:34:22.437' AS DateTime), CAST(N'2023-06-05T21:34:22.727' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (57, 239, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T21:35:07.583' AS DateTime), CAST(N'2023-06-05T21:35:07.603' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (58, 242, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T21:53:09.740' AS DateTime), CAST(N'2023-06-05T21:53:09.970' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (59, 246, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":null}', N'["\"You checkout new product into your checklist!\""]', CAST(N'2023-06-04T21:53:24.493' AS DateTime), CAST(N'2023-06-05T21:53:58.243' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (60, 249, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T21:54:13.217' AS DateTime), CAST(N'2023-06-05T21:54:13.227' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (61, 252, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T21:55:13.277' AS DateTime), CAST(N'2023-06-05T21:55:13.297' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (62, 255, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T21:56:13.333' AS DateTime), CAST(N'2023-06-05T21:56:13.347' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (63, 258, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T21:57:13.397' AS DateTime), CAST(N'2023-06-05T21:57:13.423' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (64, 261, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T21:58:13.447' AS DateTime), CAST(N'2023-06-05T21:58:13.470' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (65, 264, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T21:59:13.497' AS DateTime), CAST(N'2023-06-05T21:59:13.517' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (66, 267, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:00:13.550' AS DateTime), CAST(N'2023-06-05T22:00:13.570' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (67, 270, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:01:13.607' AS DateTime), CAST(N'2023-06-05T22:01:13.630' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (68, 273, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:02:04.713' AS DateTime), CAST(N'2023-06-05T22:02:04.727' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (69, 276, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:03:04.763' AS DateTime), CAST(N'2023-06-05T22:03:04.780' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (70, 282, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":null}', N'["\"You checkout new product into your checklist!\""]', CAST(N'2023-06-04T22:03:43.587' AS DateTime), CAST(N'2023-06-05T22:04:13.607' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (71, 283, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:04:13.600' AS DateTime), CAST(N'2023-06-05T22:04:13.610' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (72, 286, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:05:03.440' AS DateTime), CAST(N'2023-06-05T22:05:04.940' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (73, 289, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:06:06.497' AS DateTime), CAST(N'2023-06-05T22:06:06.517' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (74, 292, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:07:06.540' AS DateTime), CAST(N'2023-06-05T22:07:06.560' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (75, 295, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:08:06.573' AS DateTime), CAST(N'2023-06-05T22:08:06.593' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (76, 298, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:09:06.617' AS DateTime), CAST(N'2023-06-05T22:09:06.640' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (77, 301, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:10:06.660' AS DateTime), CAST(N'2023-06-05T22:10:06.690' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (78, 304, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:11:06.717' AS DateTime), CAST(N'2023-06-05T22:11:06.730' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (79, 307, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:12:06.773' AS DateTime), CAST(N'2023-06-05T22:12:06.787' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (80, 310, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:21:33.283' AS DateTime), CAST(N'2023-06-05T22:21:33.570' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (81, 313, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:22:07.543' AS DateTime), CAST(N'2023-06-05T22:22:07.570' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (82, 316, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:23:13.857' AS DateTime), CAST(N'2023-06-05T22:23:13.870' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (83, 319, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:24:03.333' AS DateTime), CAST(N'2023-06-05T22:24:05.027' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (84, 322, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:25:05.057' AS DateTime), CAST(N'2023-06-05T22:25:05.080' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (85, 325, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:26:05.103' AS DateTime), CAST(N'2023-06-05T22:26:05.123' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (86, 328, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:27:06.207' AS DateTime), CAST(N'2023-06-05T22:27:06.230' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (87, 331, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:28:00.747' AS DateTime), CAST(N'2023-06-05T22:28:00.973' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (88, 338, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":null}', N'["\"You checkout new product into your checklist!\""]', CAST(N'2023-06-04T22:28:24.473' AS DateTime), CAST(N'2023-06-05T22:29:05.540' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (89, 335, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:29:05.510' AS DateTime), CAST(N'2023-06-05T22:29:05.533' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (90, 341, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:30:06.833' AS DateTime), CAST(N'2023-06-05T22:30:06.847' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (91, 346, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:41:25.033' AS DateTime), CAST(N'2023-06-05T22:41:25.167' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (92, 360, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":null}', N'["\"You checkout new product into your checklist!\""]', CAST(N'2023-06-04T22:41:53.237' AS DateTime), CAST(N'2023-06-05T22:44:16.253' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (93, 354, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:43:00.480' AS DateTime), CAST(N'2023-06-05T22:43:00.507' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (94, 359, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:44:16.233' AS DateTime), CAST(N'2023-06-05T22:44:16.253' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (95, 365, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:45:01.290' AS DateTime), CAST(N'2023-06-05T22:45:01.303' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (96, 368, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:46:04.990' AS DateTime), CAST(N'2023-06-05T22:46:14.807' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (97, 371, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:47:53.350' AS DateTime), CAST(N'2023-06-05T22:47:53.580' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (98, 374, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:48:08.460' AS DateTime), CAST(N'2023-06-05T22:48:08.463' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (99, 377, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:49:05.913' AS DateTime), CAST(N'2023-06-05T22:49:15.410' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (100, 380, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:50:00.143' AS DateTime), CAST(N'2023-06-05T22:50:00.163' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (101, 383, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-04T22:51:00.207' AS DateTime), CAST(N'2023-06-05T22:51:00.230' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (102, 390, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T08:25:37.970' AS DateTime), CAST(N'2023-06-06T08:25:38.120' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (103, 395, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T08:26:08.113' AS DateTime), CAST(N'2023-06-06T08:26:08.120' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (104, 398, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T08:29:29.923' AS DateTime), CAST(N'2023-06-06T08:29:30.140' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (105, 401, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T08:30:00.037' AS DateTime), CAST(N'2023-06-06T08:30:00.050' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (106, 404, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T08:31:15.923' AS DateTime), CAST(N'2023-06-06T08:31:15.947' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (107, 407, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T08:32:00.960' AS DateTime), CAST(N'2023-06-06T08:32:00.973' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (108, 410, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T08:33:01.007' AS DateTime), CAST(N'2023-06-06T08:33:01.027' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (109, 413, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T08:52:26.097' AS DateTime), CAST(N'2023-06-06T08:52:26.310' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (110, 416, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T08:53:48.307' AS DateTime), CAST(N'2023-06-06T08:53:48.530' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (111, 419, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T08:54:03.427' AS DateTime), CAST(N'2023-06-06T08:54:03.440' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (112, 422, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T12:32:46.453' AS DateTime), CAST(N'2023-06-06T12:32:46.683' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (113, 425, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T12:33:17.523' AS DateTime), CAST(N'2023-06-06T12:33:17.763' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (114, 428, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T12:34:02.677' AS DateTime), CAST(N'2023-06-06T12:34:02.687' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (115, 431, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T12:36:48.347' AS DateTime), CAST(N'2023-06-06T12:36:48.543' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (116, 434, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T12:37:03.460' AS DateTime), CAST(N'2023-06-06T12:37:03.467' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (117, 437, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T12:40:31.407' AS DateTime), CAST(N'2023-06-06T12:40:31.623' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (118, 440, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T12:41:01.530' AS DateTime), CAST(N'2023-06-06T12:41:01.537' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (119, 443, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T12:43:06.060' AS DateTime), CAST(N'2023-06-06T12:43:06.077' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (120, 446, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T12:48:09.853' AS DateTime), CAST(N'2023-06-06T12:48:10.113' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (121, 449, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T12:49:55.230' AS DateTime), CAST(N'2023-06-06T12:49:55.247' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (122, 452, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T12:50:10.253' AS DateTime), CAST(N'2023-06-06T12:50:10.273' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (123, 455, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T12:51:10.310' AS DateTime), CAST(N'2023-06-06T12:51:10.333' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (124, 458, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T13:45:49.597' AS DateTime), CAST(N'2023-06-06T13:45:49.893' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (125, 461, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T13:46:04.737' AS DateTime), CAST(N'2023-06-06T13:46:04.743' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (126, 464, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T13:47:04.783' AS DateTime), CAST(N'2023-06-06T13:47:04.800' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (127, 467, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T13:48:04.840' AS DateTime), CAST(N'2023-06-06T13:48:04.853' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (128, 470, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T13:49:04.890' AS DateTime), CAST(N'2023-06-06T13:49:04.913' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (129, 473, N'Succeeded', N'{"Type":"GuvenFuture.Business.BackgroundJobs.MailRecursiveJob, GuvenFuture.Business, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Execute","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-06-05T13:50:04.950' AS DateTime), CAST(N'2023-06-06T13:50:04.973' AS DateTime))
SET IDENTITY_INSERT [HangFire].[Job] OFF
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (1, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (1, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (2, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (2, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (2, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (2, N'Time', N'1685888644')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3, N'Time', N'1685888710')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (4, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (4, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (4, N'RecurringJobId', N'"IRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (4, N'RetryCount', N'10')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (4, N'Time', N'1685888804')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (5, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (5, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (5, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (5, N'Time', N'1685888804')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (6, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (6, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (6, N'RecurringJobId', N'"IRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (6, N'RetryCount', N'10')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (6, N'Time', N'1685888820')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (7, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (7, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (7, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (7, N'Time', N'1685888820')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (8, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (8, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (8, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (8, N'Time', N'1685888886')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (9, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (9, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (9, N'RecurringJobId', N'"SMSRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (9, N'Time', N'1685888894')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10, N'RecurringJobId', N'"SMSRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10, N'Time', N'1685888939')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (11, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (11, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (11, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (11, N'Time', N'1685888954')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (12, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (12, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (12, N'RecurringJobId', N'"SMSRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (12, N'Time', N'1685888954')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (13, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (13, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (13, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (13, N'Time', N'1685889014')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14, N'RecurringJobId', N'"SMSRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14, N'Time', N'1685889014')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (15, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (15, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (15, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (15, N'Time', N'1685889074')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (16, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (16, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (16, N'RecurringJobId', N'"SMSRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (16, N'Time', N'1685889074')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (17, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (17, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (17, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (17, N'Time', N'1685905042')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (18, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (18, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (18, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (18, N'Time', N'1685905087')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (19, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (19, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (19, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (19, N'Time', N'1685905147')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20, N'Time', N'1685905207')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (21, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (21, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (21, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (21, N'Time', N'1685905268')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (22, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (22, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (22, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (22, N'Time', N'1685905328')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (23, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (23, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (23, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (23, N'Time', N'1685905388')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (24, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (24, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (24, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (24, N'Time', N'1685905448')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (25, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (25, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (25, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (25, N'Time', N'1685905508')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (26, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (26, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (26, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (26, N'Time', N'1685905568')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (27, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (27, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (27, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (27, N'Time', N'1685905628')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (28, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (28, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (28, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (28, N'Time', N'1685905688')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (29, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (29, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (29, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (29, N'Time', N'1685905748')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30, N'Time', N'1685905808')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (31, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (31, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (31, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (31, N'Time', N'1685905868')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (32, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (32, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (32, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (32, N'Time', N'1685905928')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (33, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (33, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (33, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (33, N'Time', N'1685905988')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (34, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (34, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (34, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (34, N'Time', N'1685906048')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (35, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (35, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (35, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (35, N'Time', N'1685906108')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (36, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (36, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (36, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (36, N'Time', N'1685906169')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (37, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (37, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (37, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (37, N'Time', N'1685906229')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (38, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (38, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (38, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (38, N'Time', N'1685906289')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (39, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (39, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (39, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (39, N'Time', N'1685906349')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (40, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (40, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (40, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (40, N'Time', N'1685906409')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (41, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (41, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (41, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (41, N'Time', N'1685910392')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (42, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (42, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (42, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (42, N'Time', N'1685910423')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (43, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (43, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (43, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (43, N'Time', N'1685910483')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (44, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (44, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (44, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (44, N'Time', N'1685910543')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (45, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (45, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (45, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (45, N'Time', N'1685910606')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (46, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (46, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (46, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (46, N'Time', N'1685912554')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (47, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (47, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (47, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (47, N'Time', N'1685912645')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (48, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (48, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (48, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (48, N'Time', N'1685912726')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (49, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (49, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (49, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (49, N'Time', N'1685912874')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (50, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (50, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (50, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (50, N'Time', N'1685912890')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (51, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (51, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (52, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (52, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (52, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (52, N'Time', N'1685914187')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (53, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (53, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (53, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (53, N'Time', N'1685914202')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (54, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (54, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (54, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (54, N'Time', N'1685914263')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (55, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (55, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (55, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (55, N'Time', N'1685914340')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (56, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (56, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (56, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (56, N'Time', N'1685914462')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (57, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (57, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (57, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (57, N'Time', N'1685914507')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (58, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (58, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (58, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (58, N'Time', N'1685915589')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (59, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (59, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (60, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (60, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (60, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (60, N'Time', N'1685915653')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (61, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (61, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (61, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (61, N'Time', N'1685915713')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (62, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (62, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (62, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (62, N'Time', N'1685915773')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (63, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (63, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (63, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (63, N'Time', N'1685915833')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (64, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (64, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (64, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (64, N'Time', N'1685915893')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (65, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (65, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (65, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (65, N'Time', N'1685915953')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (66, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (66, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (66, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (66, N'Time', N'1685916013')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (67, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (67, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (67, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (67, N'Time', N'1685916073')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (68, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (68, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (68, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (68, N'Time', N'1685916124')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (69, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (69, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (69, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (69, N'Time', N'1685916184')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (70, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (70, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (71, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (71, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (71, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (71, N'Time', N'1685916253')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (72, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (72, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (72, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (72, N'Time', N'1685916303')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (73, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (73, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (73, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (73, N'Time', N'1685916366')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (74, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (74, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (74, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (74, N'Time', N'1685916426')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (75, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (75, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (75, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (75, N'Time', N'1685916486')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (76, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (76, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (76, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (76, N'Time', N'1685916546')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (77, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (77, N'CurrentUICulture', N'"en-GB"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (77, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (77, N'Time', N'1685916606')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (78, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (78, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (78, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (78, N'Time', N'1685916666')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (79, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (79, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (79, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (79, N'Time', N'1685916726')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (80, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (80, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (80, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (80, N'Time', N'1685917293')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (81, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (81, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (81, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (81, N'Time', N'1685917327')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (82, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (82, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (82, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (82, N'Time', N'1685917393')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (83, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (83, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (83, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (83, N'Time', N'1685917443')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (84, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (84, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (84, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (84, N'Time', N'1685917505')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (85, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (85, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (85, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (85, N'Time', N'1685917565')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (86, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (86, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (86, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (86, N'Time', N'1685917626')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (87, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (87, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (87, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (87, N'Time', N'1685917680')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (88, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (88, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (89, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (89, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (89, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (89, N'Time', N'1685917745')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (90, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (90, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (90, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (90, N'Time', N'1685917806')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (91, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (91, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (91, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (91, N'Time', N'1685918485')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (92, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (92, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (93, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (93, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (93, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (93, N'Time', N'1685918580')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (94, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (94, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (94, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (94, N'Time', N'1685918656')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (95, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (95, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (95, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (95, N'Time', N'1685918701')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (96, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (96, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (96, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (96, N'Time', N'1685918764')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (97, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (97, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (97, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (97, N'Time', N'1685918873')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (98, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (98, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (98, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (98, N'Time', N'1685918888')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (99, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (99, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (99, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (99, N'Time', N'1685918945')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (100, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (100, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (100, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (100, N'Time', N'1685919000')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (101, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (101, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (101, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (101, N'Time', N'1685919060')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (102, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (102, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (102, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (102, N'Time', N'1685953537')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (103, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (103, N'CurrentUICulture', N'"en-GB"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (103, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (103, N'Time', N'1685953568')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (104, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (104, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (104, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (104, N'Time', N'1685953769')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (105, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (105, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (105, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (105, N'Time', N'1685953800')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (106, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (106, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (106, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (106, N'Time', N'1685953875')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (107, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (107, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (107, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (107, N'Time', N'1685953920')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (108, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (108, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (108, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (108, N'Time', N'1685953981')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (109, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (109, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (109, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (109, N'Time', N'1685955146')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (110, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (110, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (110, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (110, N'Time', N'1685955228')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (111, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (111, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (111, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (111, N'Time', N'1685955243')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (112, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (112, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (112, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (112, N'Time', N'1685968366')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (113, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (113, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (113, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (113, N'Time', N'1685968397')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (114, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (114, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (114, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (114, N'Time', N'1685968442')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (115, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (115, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (115, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (115, N'Time', N'1685968608')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (116, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (116, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (116, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (116, N'Time', N'1685968623')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (117, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (117, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (117, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (117, N'Time', N'1685968831')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (118, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (118, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (118, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (118, N'Time', N'1685968861')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (119, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (119, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (119, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (119, N'Time', N'1685968986')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (120, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (120, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (120, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (120, N'Time', N'1685969289')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (121, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (121, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (121, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (121, N'Time', N'1685969395')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (122, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (122, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (122, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (122, N'Time', N'1685969410')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (123, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (123, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (123, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (123, N'Time', N'1685969470')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (124, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (124, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (124, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (124, N'Time', N'1685972749')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (125, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (125, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (125, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (125, N'Time', N'1685972764')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (126, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (126, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (126, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (126, N'Time', N'1685972824')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (127, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (127, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (127, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (127, N'Time', N'1685972884')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (128, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (128, N'CurrentUICulture', N'"en-GB"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (128, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (128, N'Time', N'1685972944')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (129, N'CurrentCulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (129, N'CurrentUICulture', N'"en-GB"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (129, N'RecurringJobId', N'"MailRecursiveJob.Execute"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (129, N'Time', N'1685973004')
GO
INSERT [HangFire].[Schema] ([Version]) VALUES (9)
GO
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'nbtulpar01:12876:5f637b4d-dedd-49a3-8023-45ac76bd6d08', N'{"WorkerCount":20,"Queues":["default"],"StartedAt":"2023-06-05T13:45:49.432888Z"}', CAST(N'2023-06-05T13:50:19.620' AS DateTime))
GO
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'recurring-jobs', 1685973060, N'MailRecursiveJob.Execute', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'recurring-jobs', -1, N'SMSRecursiveJob.Execute', NULL)
GO
SET IDENTITY_INSERT [HangFire].[State] ON 

INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (1, 1, N'Scheduled', NULL, CAST(N'2023-06-04T14:12:38.510' AS DateTime), N'{"EnqueueAt":"2023-06-04T14:13:08.4359888Z","ScheduledAt":"2023-06-04T14:12:38.4359892Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (2, 1, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2023-06-04T14:13:08.663' AS DateTime), N'{"EnqueuedAt":"2023-06-04T14:13:08.4898535Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (3, 1, N'Processing', NULL, CAST(N'2023-06-04T14:13:08.687' AS DateTime), N'{"StartedAt":"2023-06-04T14:13:08.6829974Z","ServerId":"nbtulpar01:35872:336ab118-1e88-417d-aa22-48433908dc80","WorkerId":"7812e1d1-e361-4190-bb62-0beab22228af"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4, 1, N'Succeeded', NULL, CAST(N'2023-06-04T14:13:08.717' AS DateTime), N'{"SucceededAt":"2023-06-04T14:13:08.7085228Z","PerformanceDuration":"14","Latency":"30237"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (5, 2, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T14:24:04.417' AS DateTime), N'{"EnqueuedAt":"2023-06-04T14:24:04.3985124Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (6, 2, N'Processing', NULL, CAST(N'2023-06-04T14:24:04.530' AS DateTime), N'{"StartedAt":"2023-06-04T14:24:04.4497240Z","ServerId":"nbtulpar01:43908:b92b6231-5917-4a9a-8b9f-25512207636c","WorkerId":"79f0d25e-b8c8-40b4-a7a4-608f4040f0a1"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (7, 2, N'Succeeded', NULL, CAST(N'2023-06-04T14:24:04.573' AS DateTime), N'{"SucceededAt":"2023-06-04T14:24:04.5613101Z","PerformanceDuration":"25","Latency":"162"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (8, 3, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T14:25:10.317' AS DateTime), N'{"EnqueuedAt":"2023-06-04T14:25:10.2940575Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (9, 3, N'Processing', NULL, CAST(N'2023-06-04T14:25:10.567' AS DateTime), N'{"StartedAt":"2023-06-04T14:25:10.3532220Z","ServerId":"nbtulpar01:23740:813a01b3-b4f4-4a43-90bb-86007e6139f6","WorkerId":"461ac387-559d-4ee9-9bba-b38f64b3ebf3"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10, 3, N'Succeeded', NULL, CAST(N'2023-06-04T14:25:10.623' AS DateTime), N'{"SucceededAt":"2023-06-04T14:25:10.6056060Z","PerformanceDuration":"32","Latency":"302"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (11, 4, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T14:26:44.983' AS DateTime), N'{"EnqueuedAt":"2023-06-04T14:26:44.9636387Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (13, 4, N'Processing', NULL, CAST(N'2023-06-04T14:26:45.393' AS DateTime), N'{"StartedAt":"2023-06-04T14:26:45.1832533Z","ServerId":"nbtulpar01:44452:cd403924-2116-4973-867e-b592975adfee","WorkerId":"48c3965b-972d-44d3-9bbe-acac7d42c120"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (16, 4, N'Failed', N'An exception occurred during processing of a background job.', CAST(N'2023-06-04T14:26:45.670' AS DateTime), N'{"FailedAt":"2023-06-04T14:26:45.4357869Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.","ExceptionDetails":"System.InvalidOperationException: A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.\r\n   at Microsoft.Extensions.DependencyInjection.ActivatorUtilities.CreateInstance(IServiceProvider provider, Type instanceType, Object[] parameters)\r\n   at Hangfire.Server.CoreBackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.BackgroundJobPerformer.<>c__DisplayClass10_0.<PerformJobWithFilters>b__0()\r\n   at Hangfire.Server.BackgroundJobPerformer.InvokePerformFilter(IServerFilter filter, PerformingContext preContext, Func`1 continuation)\r\n   at Hangfire.Server.BackgroundJobPerformer.PerformJobWithFilters(PerformContext context, IEnumerable`1 filters)\r\n   at Hangfire.Server.BackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.Worker.PerformJob(BackgroundProcessContext context, IStorageConnection connection, String jobId, BackgroundJob backgroundJob, IReadOnlyDictionary`2& customData)","ServerId":"nbtulpar01:44452:cd403924-2116-4973-867e-b592975adfee"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (17, 4, N'Scheduled', N'Retry attempt 1 of 10: A suitable constructor for type ''GuvenFuture.Busi…', CAST(N'2023-06-04T14:26:45.677' AS DateTime), N'{"EnqueueAt":"2023-06-04T14:27:25.4513301Z","ScheduledAt":"2023-06-04T14:26:45.4513306Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (26, 4, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2023-06-04T14:27:44.370' AS DateTime), N'{"EnqueuedAt":"2023-06-04T14:27:44.3687614Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (27, 4, N'Processing', NULL, CAST(N'2023-06-04T14:27:44.380' AS DateTime), N'{"StartedAt":"2023-06-04T14:27:44.3775657Z","ServerId":"nbtulpar01:23400:1da46675-fb6a-42a3-af57-e245c49e5d67","WorkerId":"8a29f6f7-a8d7-4618-919d-fef809caefb8"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (30, 4, N'Failed', N'An exception occurred during processing of a background job.', CAST(N'2023-06-04T14:27:44.513' AS DateTime), N'{"FailedAt":"2023-06-04T14:27:44.4110385Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.","ExceptionDetails":"System.InvalidOperationException: A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.\r\n   at Microsoft.Extensions.DependencyInjection.ActivatorUtilities.CreateInstance(IServiceProvider provider, Type instanceType, Object[] parameters)\r\n   at Hangfire.Server.CoreBackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.BackgroundJobPerformer.<>c__DisplayClass10_0.<PerformJobWithFilters>b__0()\r\n   at Hangfire.Server.BackgroundJobPerformer.InvokePerformFilter(IServerFilter filter, PerformingContext preContext, Func`1 continuation)\r\n   at Hangfire.Server.BackgroundJobPerformer.PerformJobWithFilters(PerformContext context, IEnumerable`1 filters)\r\n   at Hangfire.Server.BackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.Worker.PerformJob(BackgroundProcessContext context, IStorageConnection connection, String jobId, BackgroundJob backgroundJob, IReadOnlyDictionary`2& customData)","ServerId":"nbtulpar01:23400:1da46675-fb6a-42a3-af57-e245c49e5d67"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (32, 4, N'Scheduled', N'Retry attempt 2 of 10: A suitable constructor for type ''GuvenFuture.Busi…', CAST(N'2023-06-04T14:27:44.517' AS DateTime), N'{"EnqueueAt":"2023-06-04T14:28:16.4331603Z","ScheduledAt":"2023-06-04T14:27:44.4331608Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (39, 4, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2023-06-04T14:28:29.410' AS DateTime), N'{"EnqueuedAt":"2023-06-04T14:28:29.4100799Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (40, 4, N'Processing', NULL, CAST(N'2023-06-04T14:28:29.417' AS DateTime), N'{"StartedAt":"2023-06-04T14:28:29.4161710Z","ServerId":"nbtulpar01:23400:1da46675-fb6a-42a3-af57-e245c49e5d67","WorkerId":"af771394-97f9-4371-9247-7589e297fb15"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (41, 4, N'Failed', N'An exception occurred during processing of a background job.', CAST(N'2023-06-04T14:28:29.430' AS DateTime), N'{"FailedAt":"2023-06-04T14:28:29.4200412Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.","ExceptionDetails":"System.InvalidOperationException: A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.\r\n   at Microsoft.Extensions.DependencyInjection.ActivatorUtilities.CreateInstance(IServiceProvider provider, Type instanceType, Object[] parameters)\r\n   at Hangfire.Server.CoreBackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.BackgroundJobPerformer.<>c__DisplayClass10_0.<PerformJobWithFilters>b__0()\r\n   at Hangfire.Server.BackgroundJobPerformer.InvokePerformFilter(IServerFilter filter, PerformingContext preContext, Func`1 continuation)\r\n   at Hangfire.Server.BackgroundJobPerformer.PerformJobWithFilters(PerformContext context, IEnumerable`1 filters)\r\n   at Hangfire.Server.BackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.Worker.PerformJob(BackgroundProcessContext context, IStorageConnection connection, String jobId, BackgroundJob backgroundJob, IReadOnlyDictionary`2& customData)","ServerId":"nbtulpar01:23400:1da46675-fb6a-42a3-af57-e245c49e5d67"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (42, 4, N'Scheduled', N'Retry attempt 3 of 10: A suitable constructor for type ''GuvenFuture.Busi…', CAST(N'2023-06-04T14:28:29.430' AS DateTime), N'{"EnqueueAt":"2023-06-04T14:29:45.4215295Z","ScheduledAt":"2023-06-04T14:28:29.4215297Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (60, 4, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2023-06-04T14:29:59.670' AS DateTime), N'{"EnqueuedAt":"2023-06-04T14:29:59.6677069Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (61, 4, N'Processing', NULL, CAST(N'2023-06-04T14:29:59.680' AS DateTime), N'{"StartedAt":"2023-06-04T14:29:59.6783276Z","ServerId":"nbtulpar01:23400:1da46675-fb6a-42a3-af57-e245c49e5d67","WorkerId":"49f55098-4668-44d9-ae27-ebd01f0ff724"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (62, 4, N'Failed', N'An exception occurred during processing of a background job.', CAST(N'2023-06-04T14:29:59.693' AS DateTime), N'{"FailedAt":"2023-06-04T14:29:59.6814219Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.","ExceptionDetails":"System.InvalidOperationException: A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.\r\n   at Microsoft.Extensions.DependencyInjection.ActivatorUtilities.CreateInstance(IServiceProvider provider, Type instanceType, Object[] parameters)\r\n   at Hangfire.Server.CoreBackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.BackgroundJobPerformer.<>c__DisplayClass10_0.<PerformJobWithFilters>b__0()\r\n   at Hangfire.Server.BackgroundJobPerformer.InvokePerformFilter(IServerFilter filter, PerformingContext preContext, Func`1 continuation)\r\n   at Hangfire.Server.BackgroundJobPerformer.PerformJobWithFilters(PerformContext context, IEnumerable`1 filters)\r\n   at Hangfire.Server.BackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.Worker.PerformJob(BackgroundProcessContext context, IStorageConnection connection, String jobId, BackgroundJob backgroundJob, IReadOnlyDictionary`2& customData)","ServerId":"nbtulpar01:23400:1da46675-fb6a-42a3-af57-e245c49e5d67"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (63, 4, N'Scheduled', N'Retry attempt 4 of 10: A suitable constructor for type ''GuvenFuture.Busi…', CAST(N'2023-06-04T14:29:59.693' AS DateTime), N'{"EnqueueAt":"2023-06-04T14:32:23.6839913Z","ScheduledAt":"2023-06-04T14:29:59.6839915Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (77, 4, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2023-06-04T18:57:22.603' AS DateTime), N'{"EnqueuedAt":"2023-06-04T18:57:22.4939517Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (80, 4, N'Processing', NULL, CAST(N'2023-06-04T18:57:22.637' AS DateTime), N'{"StartedAt":"2023-06-04T18:57:22.6363662Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"06988809-818f-45f3-957d-dd8820309c5d"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (83, 4, N'Failed', N'An exception occurred during processing of a background job.', CAST(N'2023-06-04T18:57:22.727' AS DateTime), N'{"FailedAt":"2023-06-04T18:57:22.6545598Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.","ExceptionDetails":"System.InvalidOperationException: A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.\r\n   at Microsoft.Extensions.DependencyInjection.ActivatorUtilities.CreateInstance(IServiceProvider provider, Type instanceType, Object[] parameters)\r\n   at Hangfire.Server.CoreBackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.BackgroundJobPerformer.<>c__DisplayClass10_0.<PerformJobWithFilters>b__0()\r\n   at Hangfire.Server.BackgroundJobPerformer.InvokePerformFilter(IServerFilter filter, PerformingContext preContext, Func`1 continuation)\r\n   at Hangfire.Server.BackgroundJobPerformer.PerformJobWithFilters(PerformContext context, IEnumerable`1 filters)\r\n   at Hangfire.Server.BackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.Worker.PerformJob(BackgroundProcessContext context, IStorageConnection connection, String jobId, BackgroundJob backgroundJob, IReadOnlyDictionary`2& customData)","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (86, 4, N'Scheduled', N'Retry attempt 5 of 10: A suitable constructor for type ''GuvenFuture.Busi…', CAST(N'2023-06-04T18:57:22.727' AS DateTime), N'{"EnqueueAt":"2023-06-04T19:03:33.6685449Z","ScheduledAt":"2023-06-04T18:57:22.6685450Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (109, 4, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2023-06-04T19:03:38.037' AS DateTime), N'{"EnqueuedAt":"2023-06-04T19:03:38.0343414Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (110, 4, N'Processing', NULL, CAST(N'2023-06-04T19:03:38.040' AS DateTime), N'{"StartedAt":"2023-06-04T19:03:38.0382066Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"07ed18b0-7923-4798-af58-2d1d8149e9d8"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (111, 4, N'Failed', N'An exception occurred during processing of a background job.', CAST(N'2023-06-04T19:03:38.047' AS DateTime), N'{"FailedAt":"2023-06-04T19:03:38.0413783Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.","ExceptionDetails":"System.InvalidOperationException: A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.\r\n   at Microsoft.Extensions.DependencyInjection.ActivatorUtilities.CreateInstance(IServiceProvider provider, Type instanceType, Object[] parameters)\r\n   at Hangfire.Server.CoreBackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.BackgroundJobPerformer.<>c__DisplayClass10_0.<PerformJobWithFilters>b__0()\r\n   at Hangfire.Server.BackgroundJobPerformer.InvokePerformFilter(IServerFilter filter, PerformingContext preContext, Func`1 continuation)\r\n   at Hangfire.Server.BackgroundJobPerformer.PerformJobWithFilters(PerformContext context, IEnumerable`1 filters)\r\n   at Hangfire.Server.BackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.Worker.PerformJob(BackgroundProcessContext context, IStorageConnection connection, String jobId, BackgroundJob backgroundJob, IReadOnlyDictionary`2& customData)","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (112, 4, N'Scheduled', N'Retry attempt 6 of 10: A suitable constructor for type ''GuvenFuture.Busi…', CAST(N'2023-06-04T19:03:38.047' AS DateTime), N'{"EnqueueAt":"2023-06-04T19:14:54.0425081Z","ScheduledAt":"2023-06-04T19:03:38.0425087Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (146, 4, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2023-06-04T19:15:08.703' AS DateTime), N'{"EnqueuedAt":"2023-06-04T19:15:08.7022602Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (147, 4, N'Processing', NULL, CAST(N'2023-06-04T19:15:08.720' AS DateTime), N'{"StartedAt":"2023-06-04T19:15:08.7197823Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"06988809-818f-45f3-957d-dd8820309c5d"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (148, 4, N'Failed', N'An exception occurred during processing of a background job.', CAST(N'2023-06-04T19:15:08.727' AS DateTime), N'{"FailedAt":"2023-06-04T19:15:08.7222154Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.","ExceptionDetails":"System.InvalidOperationException: A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.\r\n   at Microsoft.Extensions.DependencyInjection.ActivatorUtilities.CreateInstance(IServiceProvider provider, Type instanceType, Object[] parameters)\r\n   at Hangfire.Server.CoreBackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.BackgroundJobPerformer.<>c__DisplayClass10_0.<PerformJobWithFilters>b__0()\r\n   at Hangfire.Server.BackgroundJobPerformer.InvokePerformFilter(IServerFilter filter, PerformingContext preContext, Func`1 continuation)\r\n   at Hangfire.Server.BackgroundJobPerformer.PerformJobWithFilters(PerformContext context, IEnumerable`1 filters)\r\n   at Hangfire.Server.BackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.Worker.PerformJob(BackgroundProcessContext context, IStorageConnection connection, String jobId, BackgroundJob backgroundJob, IReadOnlyDictionary`2& customData)","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (149, 4, N'Scheduled', N'Retry attempt 7 of 10: A suitable constructor for type ''GuvenFuture.Busi…', CAST(N'2023-06-04T19:15:08.727' AS DateTime), N'{"EnqueueAt":"2023-06-04T19:37:48.7242162Z","ScheduledAt":"2023-06-04T19:15:08.7242163Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (173, 4, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2023-06-04T20:26:33.103' AS DateTime), N'{"EnqueuedAt":"2023-06-04T20:26:32.9937820Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (177, 4, N'Processing', NULL, CAST(N'2023-06-04T20:26:33.133' AS DateTime), N'{"StartedAt":"2023-06-04T20:26:33.1321879Z","ServerId":"nbtulpar01:33764:641ca083-1453-4167-88e2-b806fe4b1733","WorkerId":"df4cbff1-0472-49e9-a4c6-7839379ae1d3"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (180, 4, N'Failed', N'An exception occurred during processing of a background job.', CAST(N'2023-06-04T20:26:33.247' AS DateTime), N'{"FailedAt":"2023-06-04T20:26:33.1476720Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.","ExceptionDetails":"System.InvalidOperationException: A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.\r\n   at Microsoft.Extensions.DependencyInjection.ActivatorUtilities.CreateInstance(IServiceProvider provider, Type instanceType, Object[] parameters)\r\n   at Hangfire.Server.CoreBackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.BackgroundJobPerformer.<>c__DisplayClass10_0.<PerformJobWithFilters>b__0()\r\n   at Hangfire.Server.BackgroundJobPerformer.InvokePerformFilter(IServerFilter filter, PerformingContext preContext, Func`1 continuation)\r\n   at Hangfire.Server.BackgroundJobPerformer.PerformJobWithFilters(PerformContext context, IEnumerable`1 filters)\r\n   at Hangfire.Server.BackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.Worker.PerformJob(BackgroundProcessContext context, IStorageConnection connection, String jobId, BackgroundJob backgroundJob, IReadOnlyDictionary`2& customData)","ServerId":"nbtulpar01:33764:641ca083-1453-4167-88e2-b806fe4b1733"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (182, 4, N'Scheduled', N'Retry attempt 8 of 10: A suitable constructor for type ''GuvenFuture.Busi…', CAST(N'2023-06-04T20:26:33.247' AS DateTime), N'{"EnqueueAt":"2023-06-04T21:09:05.1589316Z","ScheduledAt":"2023-06-04T20:26:33.1589317Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (214, 4, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2023-06-04T21:29:47.310' AS DateTime), N'{"EnqueuedAt":"2023-06-04T21:29:47.3106722Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (218, 4, N'Processing', NULL, CAST(N'2023-06-04T21:29:47.313' AS DateTime), N'{"StartedAt":"2023-06-04T21:29:47.3124038Z","ServerId":"nbtulpar01:49576:9f4dab9f-54af-48b2-8d73-ac51ac6ae16e","WorkerId":"b6672839-a44a-4875-a263-056410e3d690"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (221, 4, N'Failed', N'An exception occurred during processing of a background job.', CAST(N'2023-06-04T21:29:47.440' AS DateTime), N'{"FailedAt":"2023-06-04T21:29:47.3287674Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.","ExceptionDetails":"System.InvalidOperationException: A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.\r\n   at Microsoft.Extensions.DependencyInjection.ActivatorUtilities.CreateInstance(IServiceProvider provider, Type instanceType, Object[] parameters)\r\n   at Hangfire.Server.CoreBackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.BackgroundJobPerformer.<>c__DisplayClass10_0.<PerformJobWithFilters>b__0()\r\n   at Hangfire.Server.BackgroundJobPerformer.InvokePerformFilter(IServerFilter filter, PerformingContext preContext, Func`1 continuation)\r\n   at Hangfire.Server.BackgroundJobPerformer.PerformJobWithFilters(PerformContext context, IEnumerable`1 filters)\r\n   at Hangfire.Server.BackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.Worker.PerformJob(BackgroundProcessContext context, IStorageConnection connection, String jobId, BackgroundJob backgroundJob, IReadOnlyDictionary`2& customData)","ServerId":"nbtulpar01:49576:9f4dab9f-54af-48b2-8d73-ac51ac6ae16e"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (224, 4, N'Scheduled', N'Retry attempt 9 of 10: A suitable constructor for type ''GuvenFuture.Busi…', CAST(N'2023-06-04T21:29:47.443' AS DateTime), N'{"EnqueueAt":"2023-06-04T22:39:12.3433043Z","ScheduledAt":"2023-06-04T21:29:47.3433047Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (343, 4, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2023-06-04T22:41:25.107' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:41:25.0105701Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (345, 4, N'Processing', NULL, CAST(N'2023-06-04T22:41:25.140' AS DateTime), N'{"StartedAt":"2023-06-04T22:41:25.1383813Z","ServerId":"nbtulpar01:41068:bdaeb192-0f42-4335-874b-de2c203371bc","WorkerId":"53c8f381-0454-41d7-bc77-a1f180107971"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (347, 4, N'Failed', N'An exception occurred during processing of a background job.', CAST(N'2023-06-04T22:41:25.240' AS DateTime), N'{"FailedAt":"2023-06-04T22:41:25.1538961Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.","ExceptionDetails":"System.InvalidOperationException: A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.\r\n   at Microsoft.Extensions.DependencyInjection.ActivatorUtilities.CreateInstance(IServiceProvider provider, Type instanceType, Object[] parameters)\r\n   at Hangfire.Server.CoreBackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.BackgroundJobPerformer.<>c__DisplayClass10_0.<PerformJobWithFilters>b__0()\r\n   at Hangfire.Server.BackgroundJobPerformer.InvokePerformFilter(IServerFilter filter, PerformingContext preContext, Func`1 continuation)\r\n   at Hangfire.Server.BackgroundJobPerformer.PerformJobWithFilters(PerformContext context, IEnumerable`1 filters)\r\n   at Hangfire.Server.BackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.Worker.PerformJob(BackgroundProcessContext context, IStorageConnection connection, String jobId, BackgroundJob backgroundJob, IReadOnlyDictionary`2& customData)","ServerId":"nbtulpar01:41068:bdaeb192-0f42-4335-874b-de2c203371bc"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (348, 4, N'Scheduled', N'Retry attempt 10 of 10: A suitable constructor for type ''GuvenFuture.Busi…', CAST(N'2023-06-04T22:41:25.240' AS DateTime), N'{"EnqueueAt":"2023-06-05T00:31:21.1665136Z","ScheduledAt":"2023-06-04T22:41:25.1665138Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (384, 4, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2023-06-05T08:25:38.063' AS DateTime), N'{"EnqueuedAt":"2023-06-05T08:25:37.9530575Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (387, 4, N'Processing', NULL, CAST(N'2023-06-05T08:25:38.093' AS DateTime), N'{"StartedAt":"2023-06-05T08:25:38.0925480Z","ServerId":"nbtulpar01:38660:86d32442-5d2d-4826-b051-c3074ee0149e","WorkerId":"1fa355b6-0124-44ec-9c84-48951d90c620"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (392, 4, N'Failed', N'An exception occurred during processing of a background job.', CAST(N'2023-06-05T08:25:38.207' AS DateTime), N'{"FailedAt":"2023-06-05T08:25:38.1093586Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.","ExceptionDetails":"System.InvalidOperationException: A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.\r\n   at Microsoft.Extensions.DependencyInjection.ActivatorUtilities.CreateInstance(IServiceProvider provider, Type instanceType, Object[] parameters)\r\n   at Hangfire.Server.CoreBackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.BackgroundJobPerformer.<>c__DisplayClass10_0.<PerformJobWithFilters>b__0()\r\n   at Hangfire.Server.BackgroundJobPerformer.InvokePerformFilter(IServerFilter filter, PerformingContext preContext, Func`1 continuation)\r\n   at Hangfire.Server.BackgroundJobPerformer.PerformJobWithFilters(PerformContext context, IEnumerable`1 filters)\r\n   at Hangfire.Server.BackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.Worker.PerformJob(BackgroundProcessContext context, IStorageConnection connection, String jobId, BackgroundJob backgroundJob, IReadOnlyDictionary`2& customData)","ServerId":"nbtulpar01:38660:86d32442-5d2d-4826-b051-c3074ee0149e"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (12, 5, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T14:26:45.177' AS DateTime), N'{"EnqueuedAt":"2023-06-04T14:26:45.1774868Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (14, 5, N'Processing', NULL, CAST(N'2023-06-04T14:26:45.393' AS DateTime), N'{"StartedAt":"2023-06-04T14:26:45.1832621Z","ServerId":"nbtulpar01:44452:cd403924-2116-4973-867e-b592975adfee","WorkerId":"75435dd4-f785-4522-a33b-9bc7d785dfcd"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (15, 5, N'Succeeded', NULL, CAST(N'2023-06-04T14:26:45.460' AS DateTime), N'{"SucceededAt":"2023-06-04T14:26:45.4342436Z","PerformanceDuration":"25","Latency":"231"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (18, 6, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T14:27:00.200' AS DateTime), N'{"EnqueuedAt":"2023-06-04T14:27:00.2004448Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (20, 6, N'Processing', NULL, CAST(N'2023-06-04T14:27:00.207' AS DateTime), N'{"StartedAt":"2023-06-04T14:27:00.2042852Z","ServerId":"nbtulpar01:44452:cd403924-2116-4973-867e-b592975adfee","WorkerId":"ce1b918a-2be7-4d46-958b-8cf09febaa80"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (22, 6, N'Failed', N'An exception occurred during processing of a background job.', CAST(N'2023-06-04T14:27:00.217' AS DateTime), N'{"FailedAt":"2023-06-04T14:27:00.2072878Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.","ExceptionDetails":"System.InvalidOperationException: A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.\r\n   at Microsoft.Extensions.DependencyInjection.ActivatorUtilities.CreateInstance(IServiceProvider provider, Type instanceType, Object[] parameters)\r\n   at Hangfire.Server.CoreBackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.BackgroundJobPerformer.<>c__DisplayClass10_0.<PerformJobWithFilters>b__0()\r\n   at Hangfire.Server.BackgroundJobPerformer.InvokePerformFilter(IServerFilter filter, PerformingContext preContext, Func`1 continuation)\r\n   at Hangfire.Server.BackgroundJobPerformer.PerformJobWithFilters(PerformContext context, IEnumerable`1 filters)\r\n   at Hangfire.Server.BackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.Worker.PerformJob(BackgroundProcessContext context, IStorageConnection connection, String jobId, BackgroundJob backgroundJob, IReadOnlyDictionary`2& customData)","ServerId":"nbtulpar01:44452:cd403924-2116-4973-867e-b592975adfee"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (23, 6, N'Scheduled', N'Retry attempt 1 of 10: A suitable constructor for type ''GuvenFuture.Busi…', CAST(N'2023-06-04T14:27:00.217' AS DateTime), N'{"EnqueueAt":"2023-06-04T14:27:20.2093154Z","ScheduledAt":"2023-06-04T14:27:00.2093157Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (25, 6, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2023-06-04T14:27:44.323' AS DateTime), N'{"EnqueuedAt":"2023-06-04T14:27:44.0569066Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (28, 6, N'Processing', NULL, CAST(N'2023-06-04T14:27:44.380' AS DateTime), N'{"StartedAt":"2023-06-04T14:27:44.3775569Z","ServerId":"nbtulpar01:23400:1da46675-fb6a-42a3-af57-e245c49e5d67","WorkerId":"3dfa4c3d-fb01-4f00-9f30-a4ebdc61324b"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (29, 6, N'Failed', N'An exception occurred during processing of a background job.', CAST(N'2023-06-04T14:27:44.513' AS DateTime), N'{"FailedAt":"2023-06-04T14:27:44.4110487Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.","ExceptionDetails":"System.InvalidOperationException: A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.\r\n   at Microsoft.Extensions.DependencyInjection.ActivatorUtilities.CreateInstance(IServiceProvider provider, Type instanceType, Object[] parameters)\r\n   at Hangfire.Server.CoreBackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.BackgroundJobPerformer.<>c__DisplayClass10_0.<PerformJobWithFilters>b__0()\r\n   at Hangfire.Server.BackgroundJobPerformer.InvokePerformFilter(IServerFilter filter, PerformingContext preContext, Func`1 continuation)\r\n   at Hangfire.Server.BackgroundJobPerformer.PerformJobWithFilters(PerformContext context, IEnumerable`1 filters)\r\n   at Hangfire.Server.BackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.Worker.PerformJob(BackgroundProcessContext context, IStorageConnection connection, String jobId, BackgroundJob backgroundJob, IReadOnlyDictionary`2& customData)","ServerId":"nbtulpar01:23400:1da46675-fb6a-42a3-af57-e245c49e5d67"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (31, 6, N'Scheduled', N'Retry attempt 2 of 10: A suitable constructor for type ''GuvenFuture.Busi…', CAST(N'2023-06-04T14:27:44.517' AS DateTime), N'{"EnqueueAt":"2023-06-04T14:28:40.4333749Z","ScheduledAt":"2023-06-04T14:27:44.4333750Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (43, 6, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2023-06-04T14:28:44.437' AS DateTime), N'{"EnqueuedAt":"2023-06-04T14:28:44.4305600Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (44, 6, N'Processing', NULL, CAST(N'2023-06-04T14:28:44.467' AS DateTime), N'{"StartedAt":"2023-06-04T14:28:44.4650719Z","ServerId":"nbtulpar01:23400:1da46675-fb6a-42a3-af57-e245c49e5d67","WorkerId":"a403352e-4069-4a53-bc33-3187adc36705"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (45, 6, N'Failed', N'An exception occurred during processing of a background job.', CAST(N'2023-06-04T14:28:44.483' AS DateTime), N'{"FailedAt":"2023-06-04T14:28:44.4698604Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.","ExceptionDetails":"System.InvalidOperationException: A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.\r\n   at Microsoft.Extensions.DependencyInjection.ActivatorUtilities.CreateInstance(IServiceProvider provider, Type instanceType, Object[] parameters)\r\n   at Hangfire.Server.CoreBackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.BackgroundJobPerformer.<>c__DisplayClass10_0.<PerformJobWithFilters>b__0()\r\n   at Hangfire.Server.BackgroundJobPerformer.InvokePerformFilter(IServerFilter filter, PerformingContext preContext, Func`1 continuation)\r\n   at Hangfire.Server.BackgroundJobPerformer.PerformJobWithFilters(PerformContext context, IEnumerable`1 filters)\r\n   at Hangfire.Server.BackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.Worker.PerformJob(BackgroundProcessContext context, IStorageConnection connection, String jobId, BackgroundJob backgroundJob, IReadOnlyDictionary`2& customData)","ServerId":"nbtulpar01:23400:1da46675-fb6a-42a3-af57-e245c49e5d67"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (46, 6, N'Scheduled', N'Retry attempt 3 of 10: A suitable constructor for type ''GuvenFuture.Busi…', CAST(N'2023-06-04T14:28:44.483' AS DateTime), N'{"EnqueueAt":"2023-06-04T14:29:30.4750694Z","ScheduledAt":"2023-06-04T14:28:44.4750696Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (56, 6, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2023-06-04T14:29:44.607' AS DateTime), N'{"EnqueuedAt":"2023-06-04T14:29:44.6015973Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (57, 6, N'Processing', NULL, CAST(N'2023-06-04T14:29:44.637' AS DateTime), N'{"StartedAt":"2023-06-04T14:29:44.6363232Z","ServerId":"nbtulpar01:23400:1da46675-fb6a-42a3-af57-e245c49e5d67","WorkerId":"073be51c-9c81-449d-89cd-2623e6020a59"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (58, 6, N'Failed', N'An exception occurred during processing of a background job.', CAST(N'2023-06-04T14:29:44.653' AS DateTime), N'{"FailedAt":"2023-06-04T14:29:44.6408154Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.","ExceptionDetails":"System.InvalidOperationException: A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.\r\n   at Microsoft.Extensions.DependencyInjection.ActivatorUtilities.CreateInstance(IServiceProvider provider, Type instanceType, Object[] parameters)\r\n   at Hangfire.Server.CoreBackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.BackgroundJobPerformer.<>c__DisplayClass10_0.<PerformJobWithFilters>b__0()\r\n   at Hangfire.Server.BackgroundJobPerformer.InvokePerformFilter(IServerFilter filter, PerformingContext preContext, Func`1 continuation)\r\n   at Hangfire.Server.BackgroundJobPerformer.PerformJobWithFilters(PerformContext context, IEnumerable`1 filters)\r\n   at Hangfire.Server.BackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.Worker.PerformJob(BackgroundProcessContext context, IStorageConnection connection, String jobId, BackgroundJob backgroundJob, IReadOnlyDictionary`2& customData)","ServerId":"nbtulpar01:23400:1da46675-fb6a-42a3-af57-e245c49e5d67"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (59, 6, N'Scheduled', N'Retry attempt 4 of 10: A suitable constructor for type ''GuvenFuture.Busi…', CAST(N'2023-06-04T14:29:44.653' AS DateTime), N'{"EnqueueAt":"2023-06-04T14:32:40.6461229Z","ScheduledAt":"2023-06-04T14:29:44.6461232Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (78, 6, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2023-06-04T18:57:22.633' AS DateTime), N'{"EnqueuedAt":"2023-06-04T18:57:22.6318999Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (81, 6, N'Processing', NULL, CAST(N'2023-06-04T18:57:22.637' AS DateTime), N'{"StartedAt":"2023-06-04T18:57:22.6364895Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"03c477a0-2b1b-4673-b9c3-dfbeb2864db1"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (84, 6, N'Failed', N'An exception occurred during processing of a background job.', CAST(N'2023-06-04T18:57:22.727' AS DateTime), N'{"FailedAt":"2023-06-04T18:57:22.6545634Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.","ExceptionDetails":"System.InvalidOperationException: A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.\r\n   at Microsoft.Extensions.DependencyInjection.ActivatorUtilities.CreateInstance(IServiceProvider provider, Type instanceType, Object[] parameters)\r\n   at Hangfire.Server.CoreBackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.BackgroundJobPerformer.<>c__DisplayClass10_0.<PerformJobWithFilters>b__0()\r\n   at Hangfire.Server.BackgroundJobPerformer.InvokePerformFilter(IServerFilter filter, PerformingContext preContext, Func`1 continuation)\r\n   at Hangfire.Server.BackgroundJobPerformer.PerformJobWithFilters(PerformContext context, IEnumerable`1 filters)\r\n   at Hangfire.Server.BackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.Worker.PerformJob(BackgroundProcessContext context, IStorageConnection connection, String jobId, BackgroundJob backgroundJob, IReadOnlyDictionary`2& customData)","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (85, 6, N'Scheduled', N'Retry attempt 5 of 10: A suitable constructor for type ''GuvenFuture.Busi…', CAST(N'2023-06-04T18:57:22.727' AS DateTime), N'{"EnqueueAt":"2023-06-04T19:03:08.6685446Z","ScheduledAt":"2023-06-04T18:57:22.6685449Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (105, 6, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2023-06-04T19:03:23.020' AS DateTime), N'{"EnqueuedAt":"2023-06-04T19:03:23.0151161Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (106, 6, N'Processing', NULL, CAST(N'2023-06-04T19:03:23.030' AS DateTime), N'{"StartedAt":"2023-06-04T19:03:23.0287592Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"03881e8c-38a6-4d7f-b54d-34ea8d312d34"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (107, 6, N'Failed', N'An exception occurred during processing of a background job.', CAST(N'2023-06-04T19:03:23.037' AS DateTime), N'{"FailedAt":"2023-06-04T19:03:23.0303845Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.","ExceptionDetails":"System.InvalidOperationException: A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.\r\n   at Microsoft.Extensions.DependencyInjection.ActivatorUtilities.CreateInstance(IServiceProvider provider, Type instanceType, Object[] parameters)\r\n   at Hangfire.Server.CoreBackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.BackgroundJobPerformer.<>c__DisplayClass10_0.<PerformJobWithFilters>b__0()\r\n   at Hangfire.Server.BackgroundJobPerformer.InvokePerformFilter(IServerFilter filter, PerformingContext preContext, Func`1 continuation)\r\n   at Hangfire.Server.BackgroundJobPerformer.PerformJobWithFilters(PerformContext context, IEnumerable`1 filters)\r\n   at Hangfire.Server.BackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.Worker.PerformJob(BackgroundProcessContext context, IStorageConnection connection, String jobId, BackgroundJob backgroundJob, IReadOnlyDictionary`2& customData)","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (108, 6, N'Scheduled', N'Retry attempt 6 of 10: A suitable constructor for type ''GuvenFuture.Busi…', CAST(N'2023-06-04T19:03:23.037' AS DateTime), N'{"EnqueueAt":"2023-06-04T19:15:45.0325395Z","ScheduledAt":"2023-06-04T19:03:23.0325396Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (153, 6, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2023-06-04T19:15:53.770' AS DateTime), N'{"EnqueuedAt":"2023-06-04T19:15:53.7677277Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (154, 6, N'Processing', NULL, CAST(N'2023-06-04T19:15:53.787' AS DateTime), N'{"StartedAt":"2023-06-04T19:15:53.7847212Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"29bda983-b790-4792-ba46-7e7d8028b8df"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (155, 6, N'Failed', N'An exception occurred during processing of a background job.', CAST(N'2023-06-04T19:15:53.793' AS DateTime), N'{"FailedAt":"2023-06-04T19:15:53.7875012Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.","ExceptionDetails":"System.InvalidOperationException: A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.\r\n   at Microsoft.Extensions.DependencyInjection.ActivatorUtilities.CreateInstance(IServiceProvider provider, Type instanceType, Object[] parameters)\r\n   at Hangfire.Server.CoreBackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.BackgroundJobPerformer.<>c__DisplayClass10_0.<PerformJobWithFilters>b__0()\r\n   at Hangfire.Server.BackgroundJobPerformer.InvokePerformFilter(IServerFilter filter, PerformingContext preContext, Func`1 continuation)\r\n   at Hangfire.Server.BackgroundJobPerformer.PerformJobWithFilters(PerformContext context, IEnumerable`1 filters)\r\n   at Hangfire.Server.BackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.Worker.PerformJob(BackgroundProcessContext context, IStorageConnection connection, String jobId, BackgroundJob backgroundJob, IReadOnlyDictionary`2& customData)","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (156, 6, N'Scheduled', N'Retry attempt 7 of 10: A suitable constructor for type ''GuvenFuture.Busi…', CAST(N'2023-06-04T19:15:53.793' AS DateTime), N'{"EnqueueAt":"2023-06-04T19:41:07.7897639Z","ScheduledAt":"2023-06-04T19:15:53.7897640Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (174, 6, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2023-06-04T20:26:33.130' AS DateTime), N'{"EnqueuedAt":"2023-06-04T20:26:33.1284854Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (175, 6, N'Processing', NULL, CAST(N'2023-06-04T20:26:33.133' AS DateTime), N'{"StartedAt":"2023-06-04T20:26:33.1327222Z","ServerId":"nbtulpar01:33764:641ca083-1453-4167-88e2-b806fe4b1733","WorkerId":"60032924-ca55-496d-adde-2efd77c63be6"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (179, 6, N'Failed', N'An exception occurred during processing of a background job.', CAST(N'2023-06-04T20:26:33.247' AS DateTime), N'{"FailedAt":"2023-06-04T20:26:33.1477241Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.","ExceptionDetails":"System.InvalidOperationException: A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.\r\n   at Microsoft.Extensions.DependencyInjection.ActivatorUtilities.CreateInstance(IServiceProvider provider, Type instanceType, Object[] parameters)\r\n   at Hangfire.Server.CoreBackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.BackgroundJobPerformer.<>c__DisplayClass10_0.<PerformJobWithFilters>b__0()\r\n   at Hangfire.Server.BackgroundJobPerformer.InvokePerformFilter(IServerFilter filter, PerformingContext preContext, Func`1 continuation)\r\n   at Hangfire.Server.BackgroundJobPerformer.PerformJobWithFilters(PerformContext context, IEnumerable`1 filters)\r\n   at Hangfire.Server.BackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.Worker.PerformJob(BackgroundProcessContext context, IStorageConnection connection, String jobId, BackgroundJob backgroundJob, IReadOnlyDictionary`2& customData)","ServerId":"nbtulpar01:33764:641ca083-1453-4167-88e2-b806fe4b1733"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (181, 6, N'Scheduled', N'Retry attempt 8 of 10: A suitable constructor for type ''GuvenFuture.Busi…', CAST(N'2023-06-04T20:26:33.247' AS DateTime), N'{"EnqueueAt":"2023-06-04T21:08:57.1589328Z","ScheduledAt":"2023-06-04T20:26:33.1589329Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (213, 6, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2023-06-04T21:29:47.310' AS DateTime), N'{"EnqueuedAt":"2023-06-04T21:29:47.3090932Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (216, 6, N'Processing', NULL, CAST(N'2023-06-04T21:29:47.313' AS DateTime), N'{"StartedAt":"2023-06-04T21:29:47.3115010Z","ServerId":"nbtulpar01:49576:9f4dab9f-54af-48b2-8d73-ac51ac6ae16e","WorkerId":"37efcba4-7e93-46e7-a731-4d6be06910d4"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (222, 6, N'Failed', N'An exception occurred during processing of a background job.', CAST(N'2023-06-04T21:29:47.440' AS DateTime), N'{"FailedAt":"2023-06-04T21:29:47.3287630Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.","ExceptionDetails":"System.InvalidOperationException: A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.\r\n   at Microsoft.Extensions.DependencyInjection.ActivatorUtilities.CreateInstance(IServiceProvider provider, Type instanceType, Object[] parameters)\r\n   at Hangfire.Server.CoreBackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.BackgroundJobPerformer.<>c__DisplayClass10_0.<PerformJobWithFilters>b__0()\r\n   at Hangfire.Server.BackgroundJobPerformer.InvokePerformFilter(IServerFilter filter, PerformingContext preContext, Func`1 continuation)\r\n   at Hangfire.Server.BackgroundJobPerformer.PerformJobWithFilters(PerformContext context, IEnumerable`1 filters)\r\n   at Hangfire.Server.BackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.Worker.PerformJob(BackgroundProcessContext context, IStorageConnection connection, String jobId, BackgroundJob backgroundJob, IReadOnlyDictionary`2& customData)","ServerId":"nbtulpar01:49576:9f4dab9f-54af-48b2-8d73-ac51ac6ae16e"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (223, 6, N'Scheduled', N'Retry attempt 9 of 10: A suitable constructor for type ''GuvenFuture.Busi…', CAST(N'2023-06-04T21:29:47.443' AS DateTime), N'{"EnqueueAt":"2023-06-04T22:42:03.3433141Z","ScheduledAt":"2023-06-04T21:29:47.3433144Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (350, 6, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2023-06-04T22:43:00.483' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:43:00.4796280Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (353, 6, N'Processing', NULL, CAST(N'2023-06-04T22:43:00.503' AS DateTime), N'{"StartedAt":"2023-06-04T22:43:00.4969426Z","ServerId":"nbtulpar01:41068:bdaeb192-0f42-4335-874b-de2c203371bc","WorkerId":"4388b42d-713b-4c7b-aff0-71c20abfde17"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (361, 6, N'Failed', N'An exception occurred during processing of a background job.', CAST(N'2023-06-04T22:44:16.253' AS DateTime), N'{"FailedAt":"2023-06-04T22:44:16.2385995Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.","ExceptionDetails":"System.InvalidOperationException: A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.\r\n   at Microsoft.Extensions.DependencyInjection.ActivatorUtilities.CreateInstance(IServiceProvider provider, Type instanceType, Object[] parameters)\r\n   at Hangfire.Server.CoreBackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.BackgroundJobPerformer.<>c__DisplayClass10_0.<PerformJobWithFilters>b__0()\r\n   at Hangfire.Server.BackgroundJobPerformer.InvokePerformFilter(IServerFilter filter, PerformingContext preContext, Func`1 continuation)\r\n   at Hangfire.Server.BackgroundJobPerformer.PerformJobWithFilters(PerformContext context, IEnumerable`1 filters)\r\n   at Hangfire.Server.BackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.Worker.PerformJob(BackgroundProcessContext context, IStorageConnection connection, String jobId, BackgroundJob backgroundJob, IReadOnlyDictionary`2& customData)","ServerId":"nbtulpar01:41068:bdaeb192-0f42-4335-874b-de2c203371bc"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (362, 6, N'Scheduled', N'Retry attempt 10 of 10: A suitable constructor for type ''GuvenFuture.Busi…', CAST(N'2023-06-04T22:44:16.253' AS DateTime), N'{"EnqueueAt":"2023-06-05T00:34:02.2433689Z","ScheduledAt":"2023-06-04T22:44:16.2433690Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (386, 6, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2023-06-05T08:25:38.090' AS DateTime), N'{"EnqueuedAt":"2023-06-05T08:25:38.0887574Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (389, 6, N'Processing', NULL, CAST(N'2023-06-05T08:25:38.093' AS DateTime), N'{"StartedAt":"2023-06-05T08:25:38.0925515Z","ServerId":"nbtulpar01:38660:86d32442-5d2d-4826-b051-c3074ee0149e","WorkerId":"3935d173-b9d1-4fbc-a6ef-4c187ecd6e7b"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (391, 6, N'Failed', N'An exception occurred during processing of a background job.', CAST(N'2023-06-05T08:25:38.207' AS DateTime), N'{"FailedAt":"2023-06-05T08:25:38.1093542Z","ExceptionType":"System.InvalidOperationException","ExceptionMessage":"A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.","ExceptionDetails":"System.InvalidOperationException: A suitable constructor for type ''GuvenFuture.Business.BackgroundJobs.Core.IRecursiveJob'' could not be located. Ensure the type is concrete and all parameters of a public constructor are either registered as services or passed as arguments. Also ensure no extraneous arguments are provided.\r\n   at Microsoft.Extensions.DependencyInjection.ActivatorUtilities.CreateInstance(IServiceProvider provider, Type instanceType, Object[] parameters)\r\n   at Hangfire.Server.CoreBackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.BackgroundJobPerformer.<>c__DisplayClass10_0.<PerformJobWithFilters>b__0()\r\n   at Hangfire.Server.BackgroundJobPerformer.InvokePerformFilter(IServerFilter filter, PerformingContext preContext, Func`1 continuation)\r\n   at Hangfire.Server.BackgroundJobPerformer.PerformJobWithFilters(PerformContext context, IEnumerable`1 filters)\r\n   at Hangfire.Server.BackgroundJobPerformer.Perform(PerformContext context)\r\n   at Hangfire.Server.Worker.PerformJob(BackgroundProcessContext context, IStorageConnection connection, String jobId, BackgroundJob backgroundJob, IReadOnlyDictionary`2& customData)","ServerId":"nbtulpar01:38660:86d32442-5d2d-4826-b051-c3074ee0149e"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (19, 7, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T14:27:00.203' AS DateTime), N'{"EnqueuedAt":"2023-06-04T14:27:00.2047797Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (21, 7, N'Processing', NULL, CAST(N'2023-06-04T14:27:00.210' AS DateTime), N'{"StartedAt":"2023-06-04T14:27:00.2085915Z","ServerId":"nbtulpar01:44452:cd403924-2116-4973-867e-b592975adfee","WorkerId":"edb3c448-c899-4b9c-81f7-e72d81b737d3"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24, 7, N'Succeeded', NULL, CAST(N'2023-06-04T14:27:00.217' AS DateTime), N'{"SucceededAt":"2023-06-04T14:27:00.2169980Z","PerformanceDuration":"3","Latency":"10"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33, 8, N'Enqueued', N'Triggered using recurring job manager', CAST(N'2023-06-04T14:28:06.067' AS DateTime), N'{"EnqueuedAt":"2023-06-04T14:28:06.0677724Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (34, 8, N'Processing', NULL, CAST(N'2023-06-04T14:28:06.077' AS DateTime), N'{"StartedAt":"2023-06-04T14:28:06.0742341Z","ServerId":"nbtulpar01:23400:1da46675-fb6a-42a3-af57-e245c49e5d67","WorkerId":"a045600f-37a4-4154-9b24-37397ec2586e"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (35, 8, N'Succeeded', NULL, CAST(N'2023-06-04T14:28:06.103' AS DateTime), N'{"SucceededAt":"2023-06-04T14:28:06.0863455Z","PerformanceDuration":"9","Latency":"33"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (36, 9, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T14:28:14.090' AS DateTime), N'{"EnqueuedAt":"2023-06-04T14:28:14.0902880Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (37, 9, N'Processing', NULL, CAST(N'2023-06-04T14:28:14.097' AS DateTime), N'{"StartedAt":"2023-06-04T14:28:14.0947399Z","ServerId":"nbtulpar01:23400:1da46675-fb6a-42a3-af57-e245c49e5d67","WorkerId":"3d154432-8643-4aa9-9fbd-44410884b2cc"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (38, 9, N'Succeeded', NULL, CAST(N'2023-06-04T14:28:14.100' AS DateTime), N'{"SucceededAt":"2023-06-04T14:28:14.0991968Z","PerformanceDuration":"0","Latency":"8"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (47, 10, N'Enqueued', N'Triggered using recurring job manager', CAST(N'2023-06-04T14:28:59.523' AS DateTime), N'{"EnqueuedAt":"2023-06-04T14:28:59.5233349Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (48, 10, N'Processing', NULL, CAST(N'2023-06-04T14:28:59.530' AS DateTime), N'{"StartedAt":"2023-06-04T14:28:59.5304715Z","ServerId":"nbtulpar01:23400:1da46675-fb6a-42a3-af57-e245c49e5d67","WorkerId":"71001521-5f09-46a8-a9ce-f6a5403c392a"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (49, 10, N'Succeeded', NULL, CAST(N'2023-06-04T14:28:59.533' AS DateTime), N'{"SucceededAt":"2023-06-04T14:28:59.5327425Z","PerformanceDuration":"0","Latency":"15"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (50, 11, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T14:29:14.210' AS DateTime), N'{"EnqueuedAt":"2023-06-04T14:29:14.2085757Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (51, 11, N'Processing', NULL, CAST(N'2023-06-04T14:29:14.213' AS DateTime), N'{"StartedAt":"2023-06-04T14:29:14.2121985Z","ServerId":"nbtulpar01:23400:1da46675-fb6a-42a3-af57-e245c49e5d67","WorkerId":"a8d88b7c-fa8c-4636-8006-ba936f2bb4e9"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (53, 11, N'Succeeded', NULL, CAST(N'2023-06-04T14:29:14.217' AS DateTime), N'{"SucceededAt":"2023-06-04T14:29:14.2158222Z","PerformanceDuration":"0","Latency":"15"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (52, 12, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T14:29:14.213' AS DateTime), N'{"EnqueuedAt":"2023-06-04T14:29:14.2133897Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (54, 12, N'Processing', NULL, CAST(N'2023-06-04T14:29:14.220' AS DateTime), N'{"StartedAt":"2023-06-04T14:29:14.2177875Z","ServerId":"nbtulpar01:23400:1da46675-fb6a-42a3-af57-e245c49e5d67","WorkerId":"332afd0a-ddfa-4b94-8f15-c6a5118bec28"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (55, 12, N'Succeeded', NULL, CAST(N'2023-06-04T14:29:14.223' AS DateTime), N'{"SucceededAt":"2023-06-04T14:29:14.2212333Z","PerformanceDuration":"0","Latency":"7"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (64, 13, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T14:30:14.387' AS DateTime), N'{"EnqueuedAt":"2023-06-04T14:30:14.3850566Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (65, 13, N'Processing', NULL, CAST(N'2023-06-04T14:30:14.393' AS DateTime), N'{"StartedAt":"2023-06-04T14:30:14.3920779Z","ServerId":"nbtulpar01:23400:1da46675-fb6a-42a3-af57-e245c49e5d67","WorkerId":"88d27d7a-5a90-43de-8bde-7b1cfe6d6a40"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (67, 13, N'Succeeded', NULL, CAST(N'2023-06-04T14:30:14.397' AS DateTime), N'{"SucceededAt":"2023-06-04T14:30:14.3950494Z","PerformanceDuration":"0","Latency":"14"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (66, 14, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T14:30:14.393' AS DateTime), N'{"EnqueuedAt":"2023-06-04T14:30:14.3927912Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (68, 14, N'Processing', NULL, CAST(N'2023-06-04T14:30:14.400' AS DateTime), N'{"StartedAt":"2023-06-04T14:30:14.3981111Z","ServerId":"nbtulpar01:23400:1da46675-fb6a-42a3-af57-e245c49e5d67","WorkerId":"9ecbe6c7-0565-4dcd-830d-d27ae59e642c"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (69, 14, N'Succeeded', NULL, CAST(N'2023-06-04T14:30:14.400' AS DateTime), N'{"SucceededAt":"2023-06-04T14:30:14.4002687Z","PerformanceDuration":"0","Latency":"6"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (70, 15, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T14:31:14.493' AS DateTime), N'{"EnqueuedAt":"2023-06-04T14:31:14.4944411Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (72, 15, N'Processing', NULL, CAST(N'2023-06-04T14:31:14.513' AS DateTime), N'{"StartedAt":"2023-06-04T14:31:14.5117711Z","ServerId":"nbtulpar01:23400:1da46675-fb6a-42a3-af57-e245c49e5d67","WorkerId":"4003acc3-512e-4f43-8672-1892dcc324b7"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (74, 15, N'Succeeded', NULL, CAST(N'2023-06-04T14:31:14.517' AS DateTime), N'{"SucceededAt":"2023-06-04T14:31:14.5159712Z","PerformanceDuration":"0","Latency":"28"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (71, 16, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T14:31:14.510' AS DateTime), N'{"EnqueuedAt":"2023-06-04T14:31:14.5089250Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (73, 16, N'Processing', NULL, CAST(N'2023-06-04T14:31:14.517' AS DateTime), N'{"StartedAt":"2023-06-04T14:31:14.5144411Z","ServerId":"nbtulpar01:23400:1da46675-fb6a-42a3-af57-e245c49e5d67","WorkerId":"84ab68d6-38eb-4cf9-bdfc-09d1bd36cddc"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (75, 16, N'Succeeded', NULL, CAST(N'2023-06-04T14:31:14.520' AS DateTime), N'{"SucceededAt":"2023-06-04T14:31:14.5189105Z","PerformanceDuration":"2","Latency":"9"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (76, 17, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T18:57:22.540' AS DateTime), N'{"EnqueuedAt":"2023-06-04T18:57:22.5281163Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (79, 17, N'Processing', NULL, CAST(N'2023-06-04T18:57:22.637' AS DateTime), N'{"StartedAt":"2023-06-04T18:57:22.6363707Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"4aa9bd0a-91a9-4e49-8930-fd45a90c0b85"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (82, 17, N'Succeeded', NULL, CAST(N'2023-06-04T18:57:22.663' AS DateTime), N'{"SucceededAt":"2023-06-04T18:57:22.6544890Z","PerformanceDuration":"12","Latency":"128"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (87, 18, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T18:58:07.773' AS DateTime), N'{"EnqueuedAt":"2023-06-04T18:58:07.7737329Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (88, 18, N'Processing', NULL, CAST(N'2023-06-04T18:58:07.783' AS DateTime), N'{"StartedAt":"2023-06-04T18:58:07.7812321Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"d1753120-428d-4b99-a8c4-74f2c4d6f972"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (89, 18, N'Succeeded', NULL, CAST(N'2023-06-04T18:58:07.783' AS DateTime), N'{"SucceededAt":"2023-06-04T18:58:07.7842750Z","PerformanceDuration":"0","Latency":"13"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (90, 19, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T18:59:07.887' AS DateTime), N'{"EnqueuedAt":"2023-06-04T18:59:07.8866004Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (91, 19, N'Processing', NULL, CAST(N'2023-06-04T18:59:07.897' AS DateTime), N'{"StartedAt":"2023-06-04T18:59:07.8957952Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"29bda983-b790-4792-ba46-7e7d8028b8df"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (92, 19, N'Succeeded', NULL, CAST(N'2023-06-04T18:59:07.900' AS DateTime), N'{"SucceededAt":"2023-06-04T18:59:07.8978333Z","PerformanceDuration":"0","Latency":"20"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (93, 20, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T19:00:07.953' AS DateTime), N'{"EnqueuedAt":"2023-06-04T19:00:07.9520905Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (94, 20, N'Processing', NULL, CAST(N'2023-06-04T19:00:07.960' AS DateTime), N'{"StartedAt":"2023-06-04T19:00:07.9601996Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"3a9026a2-a955-4d58-a67d-fced0a9a757d"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (95, 20, N'Succeeded', NULL, CAST(N'2023-06-04T19:00:07.963' AS DateTime), N'{"SucceededAt":"2023-06-04T19:00:07.9632328Z","PerformanceDuration":"0","Latency":"19"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (96, 21, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T19:01:08.017' AS DateTime), N'{"EnqueuedAt":"2023-06-04T19:01:08.0157097Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (97, 21, N'Processing', NULL, CAST(N'2023-06-04T19:01:08.023' AS DateTime), N'{"StartedAt":"2023-06-04T19:01:08.0228978Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"a9ceb1eb-12a4-4409-80f9-7ecefcbc85fb"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (98, 21, N'Succeeded', NULL, CAST(N'2023-06-04T19:01:08.023' AS DateTime), N'{"SucceededAt":"2023-06-04T19:01:08.0245433Z","PerformanceDuration":"0","Latency":"11"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (99, 22, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T19:02:08.100' AS DateTime), N'{"EnqueuedAt":"2023-06-04T19:02:08.0985263Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (100, 22, N'Processing', NULL, CAST(N'2023-06-04T19:02:08.110' AS DateTime), N'{"StartedAt":"2023-06-04T19:02:08.1075374Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"24f4e7a1-73f5-42e2-a530-7c44ac8ca887"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (101, 22, N'Succeeded', NULL, CAST(N'2023-06-04T19:02:08.117' AS DateTime), N'{"SucceededAt":"2023-06-04T19:02:08.1141373Z","PerformanceDuration":"0","Latency":"26"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (102, 23, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T19:03:08.163' AS DateTime), N'{"EnqueuedAt":"2023-06-04T19:03:08.1636830Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (103, 23, N'Processing', NULL, CAST(N'2023-06-04T19:03:08.173' AS DateTime), N'{"StartedAt":"2023-06-04T19:03:08.1711790Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"d96ac1c0-47a2-4d85-be9a-25002a9a82e6"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (104, 23, N'Succeeded', NULL, CAST(N'2023-06-04T19:03:08.173' AS DateTime), N'{"SucceededAt":"2023-06-04T19:03:08.1736158Z","PerformanceDuration":"0","Latency":"13"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (113, 24, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T19:04:08.223' AS DateTime), N'{"EnqueuedAt":"2023-06-04T19:04:08.2225879Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (114, 24, N'Processing', NULL, CAST(N'2023-06-04T19:04:08.233' AS DateTime), N'{"StartedAt":"2023-06-04T19:04:08.2316437Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"d89b6dbd-620a-4809-a24e-b5814fc4bdb4"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (115, 24, N'Succeeded', NULL, CAST(N'2023-06-04T19:04:08.233' AS DateTime), N'{"SucceededAt":"2023-06-04T19:04:08.2341700Z","PerformanceDuration":"0","Latency":"20"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (116, 25, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T19:05:08.310' AS DateTime), N'{"EnqueuedAt":"2023-06-04T19:05:08.3096924Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (117, 25, N'Processing', NULL, CAST(N'2023-06-04T19:05:08.320' AS DateTime), N'{"StartedAt":"2023-06-04T19:05:08.3178563Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"ddf159a1-d0ba-4784-b9ea-2e312600eb88"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (118, 25, N'Succeeded', NULL, CAST(N'2023-06-04T19:05:08.320' AS DateTime), N'{"SucceededAt":"2023-06-04T19:05:08.3199647Z","PerformanceDuration":"0","Latency":"19"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (119, 26, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T19:06:08.350' AS DateTime), N'{"EnqueuedAt":"2023-06-04T19:06:08.3501791Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (120, 26, N'Processing', NULL, CAST(N'2023-06-04T19:06:08.360' AS DateTime), N'{"StartedAt":"2023-06-04T19:06:08.3579001Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"4bb6ffcc-332d-49ca-9b55-0be39a27dad7"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (121, 26, N'Succeeded', NULL, CAST(N'2023-06-04T19:06:08.360' AS DateTime), N'{"SucceededAt":"2023-06-04T19:06:08.3605304Z","PerformanceDuration":"0","Latency":"13"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (122, 27, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T19:07:08.423' AS DateTime), N'{"EnqueuedAt":"2023-06-04T19:07:08.4218848Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (123, 27, N'Processing', NULL, CAST(N'2023-06-04T19:07:08.430' AS DateTime), N'{"StartedAt":"2023-06-04T19:07:08.4292407Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"42a4e85a-c2a1-4ce5-a620-46a8a74f052f"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (124, 27, N'Succeeded', NULL, CAST(N'2023-06-04T19:07:08.433' AS DateTime), N'{"SucceededAt":"2023-06-04T19:07:08.4318152Z","PerformanceDuration":"0","Latency":"11"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (125, 28, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T19:08:08.490' AS DateTime), N'{"EnqueuedAt":"2023-06-04T19:08:08.4908320Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (126, 28, N'Processing', NULL, CAST(N'2023-06-04T19:08:08.500' AS DateTime), N'{"StartedAt":"2023-06-04T19:08:08.4995239Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"bdba6877-7cfd-48e3-ac80-b1c5f2ad549c"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (127, 28, N'Succeeded', NULL, CAST(N'2023-06-04T19:08:08.503' AS DateTime), N'{"SucceededAt":"2023-06-04T19:08:08.5018444Z","PerformanceDuration":"0","Latency":"21"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (128, 29, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T19:09:08.577' AS DateTime), N'{"EnqueuedAt":"2023-06-04T19:09:08.5766724Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (129, 29, N'Processing', NULL, CAST(N'2023-06-04T19:09:08.587' AS DateTime), N'{"StartedAt":"2023-06-04T19:09:08.5847175Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"ab7c8048-10d7-4936-8d48-81fc774fcd92"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (130, 29, N'Succeeded', NULL, CAST(N'2023-06-04T19:09:08.587' AS DateTime), N'{"SucceededAt":"2023-06-04T19:09:08.5871801Z","PerformanceDuration":"0","Latency":"19"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (131, 30, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T19:10:08.647' AS DateTime), N'{"EnqueuedAt":"2023-06-04T19:10:08.6470502Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (132, 30, N'Processing', NULL, CAST(N'2023-06-04T19:10:08.657' AS DateTime), N'{"StartedAt":"2023-06-04T19:10:08.6550938Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"83e128ab-a5f0-495f-af7d-33f316a6ec22"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (133, 30, N'Succeeded', NULL, CAST(N'2023-06-04T19:10:08.657' AS DateTime), N'{"SucceededAt":"2023-06-04T19:10:08.6573823Z","PerformanceDuration":"0","Latency":"20"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (134, 31, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T19:11:08.723' AS DateTime), N'{"EnqueuedAt":"2023-06-04T19:11:08.7217154Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (135, 31, N'Processing', NULL, CAST(N'2023-06-04T19:11:08.730' AS DateTime), N'{"StartedAt":"2023-06-04T19:11:08.7291488Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"dfb07281-db61-4d26-a005-b5f26f703331"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (136, 31, N'Succeeded', NULL, CAST(N'2023-06-04T19:11:08.733' AS DateTime), N'{"SucceededAt":"2023-06-04T19:11:08.7319246Z","PerformanceDuration":"0","Latency":"14"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (137, 32, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T19:12:08.787' AS DateTime), N'{"EnqueuedAt":"2023-06-04T19:12:08.7871088Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (138, 32, N'Processing', NULL, CAST(N'2023-06-04T19:12:08.797' AS DateTime), N'{"StartedAt":"2023-06-04T19:12:08.7970414Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"6a637c9b-28ac-4bbe-a6ee-237f08086320"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (139, 32, N'Succeeded', NULL, CAST(N'2023-06-04T19:12:08.800' AS DateTime), N'{"SucceededAt":"2023-06-04T19:12:08.7995766Z","PerformanceDuration":"0","Latency":"22"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (140, 33, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T19:13:08.863' AS DateTime), N'{"EnqueuedAt":"2023-06-04T19:13:08.8619209Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (141, 33, N'Processing', NULL, CAST(N'2023-06-04T19:13:08.870' AS DateTime), N'{"StartedAt":"2023-06-04T19:13:08.8694098Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"4aa9bd0a-91a9-4e49-8930-fd45a90c0b85"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (142, 33, N'Succeeded', NULL, CAST(N'2023-06-04T19:13:08.873' AS DateTime), N'{"SucceededAt":"2023-06-04T19:13:08.8717887Z","PerformanceDuration":"0","Latency":"18"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (143, 34, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T19:14:08.930' AS DateTime), N'{"EnqueuedAt":"2023-06-04T19:14:08.9306144Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (144, 34, N'Processing', NULL, CAST(N'2023-06-04T19:14:08.940' AS DateTime), N'{"StartedAt":"2023-06-04T19:14:08.9388182Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"03c477a0-2b1b-4673-b9c3-dfbeb2864db1"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (145, 34, N'Succeeded', NULL, CAST(N'2023-06-04T19:14:08.943' AS DateTime), N'{"SucceededAt":"2023-06-04T19:14:08.9414109Z","PerformanceDuration":"0","Latency":"21"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (150, 35, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T19:15:08.997' AS DateTime), N'{"EnqueuedAt":"2023-06-04T19:15:08.9973446Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (151, 35, N'Processing', NULL, CAST(N'2023-06-04T19:15:09.003' AS DateTime), N'{"StartedAt":"2023-06-04T19:15:09.0026590Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"d1753120-428d-4b99-a8c4-74f2c4d6f972"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (152, 35, N'Succeeded', NULL, CAST(N'2023-06-04T19:15:09.007' AS DateTime), N'{"SucceededAt":"2023-06-04T19:15:09.0047627Z","PerformanceDuration":"0","Latency":"17"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (157, 36, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T19:16:09.080' AS DateTime), N'{"EnqueuedAt":"2023-06-04T19:16:09.0809490Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (158, 36, N'Processing', NULL, CAST(N'2023-06-04T19:16:09.090' AS DateTime), N'{"StartedAt":"2023-06-04T19:16:09.0882333Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"3a9026a2-a955-4d58-a67d-fced0a9a757d"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (159, 36, N'Succeeded', NULL, CAST(N'2023-06-04T19:16:09.090' AS DateTime), N'{"SucceededAt":"2023-06-04T19:16:09.0901192Z","PerformanceDuration":"0","Latency":"19"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (160, 37, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T19:17:09.153' AS DateTime), N'{"EnqueuedAt":"2023-06-04T19:17:09.1523082Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (161, 37, N'Processing', NULL, CAST(N'2023-06-04T19:17:09.160' AS DateTime), N'{"StartedAt":"2023-06-04T19:17:09.1598214Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"a9ceb1eb-12a4-4409-80f9-7ecefcbc85fb"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (162, 37, N'Succeeded', NULL, CAST(N'2023-06-04T19:17:09.163' AS DateTime), N'{"SucceededAt":"2023-06-04T19:17:09.1616964Z","PerformanceDuration":"0","Latency":"18"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (163, 38, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T19:18:09.213' AS DateTime), N'{"EnqueuedAt":"2023-06-04T19:18:09.2139396Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (164, 38, N'Processing', NULL, CAST(N'2023-06-04T19:18:09.223' AS DateTime), N'{"StartedAt":"2023-06-04T19:18:09.2214305Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"24f4e7a1-73f5-42e2-a530-7c44ac8ca887"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (165, 38, N'Succeeded', NULL, CAST(N'2023-06-04T19:18:09.223' AS DateTime), N'{"SucceededAt":"2023-06-04T19:18:09.2242391Z","PerformanceDuration":"0","Latency":"13"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (166, 39, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T19:19:09.293' AS DateTime), N'{"EnqueuedAt":"2023-06-04T19:19:09.2945856Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (167, 39, N'Processing', NULL, CAST(N'2023-06-04T19:19:09.303' AS DateTime), N'{"StartedAt":"2023-06-04T19:19:09.3019471Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"d96ac1c0-47a2-4d85-be9a-25002a9a82e6"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (168, 39, N'Succeeded', NULL, CAST(N'2023-06-04T19:19:09.307' AS DateTime), N'{"SucceededAt":"2023-06-04T19:19:09.3045400Z","PerformanceDuration":"0","Latency":"11"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (169, 40, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T19:20:09.367' AS DateTime), N'{"EnqueuedAt":"2023-06-04T19:20:09.3679041Z","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (170, 40, N'Processing', NULL, CAST(N'2023-06-04T19:20:09.377' AS DateTime), N'{"StartedAt":"2023-06-04T19:20:09.3760074Z","ServerId":"nbtulpar01:3744:4dc0f31a-2573-4d44-bcf9-20ec3be54fa8","WorkerId":"03881e8c-38a6-4d7f-b54d-34ea8d312d34"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (171, 40, N'Succeeded', NULL, CAST(N'2023-06-04T19:20:09.380' AS DateTime), N'{"SucceededAt":"2023-06-04T19:20:09.3782730Z","PerformanceDuration":"0","Latency":"18"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (172, 41, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T20:26:33.040' AS DateTime), N'{"EnqueuedAt":"2023-06-04T20:26:33.0298211Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (176, 41, N'Processing', NULL, CAST(N'2023-06-04T20:26:33.133' AS DateTime), N'{"StartedAt":"2023-06-04T20:26:33.1322153Z","ServerId":"nbtulpar01:33764:641ca083-1453-4167-88e2-b806fe4b1733","WorkerId":"90e25eb9-8e3c-450d-972b-a18494720330"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (178, 41, N'Succeeded', NULL, CAST(N'2023-06-04T20:26:33.153' AS DateTime), N'{"SucceededAt":"2023-06-04T20:26:33.1473886Z","PerformanceDuration":"10","Latency":"124"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (183, 42, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T20:27:03.153' AS DateTime), N'{"EnqueuedAt":"2023-06-04T20:27:03.1523547Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (184, 42, N'Processing', NULL, CAST(N'2023-06-04T20:27:03.160' AS DateTime), N'{"StartedAt":"2023-06-04T20:27:03.1597410Z","ServerId":"nbtulpar01:33764:641ca083-1453-4167-88e2-b806fe4b1733","WorkerId":"1ef2666c-90ba-47aa-b006-5d4e1dfc39bf"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (185, 42, N'Succeeded', NULL, CAST(N'2023-06-04T20:27:03.163' AS DateTime), N'{"SucceededAt":"2023-06-04T20:27:03.1621280Z","PerformanceDuration":"0","Latency":"11"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (186, 43, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T20:28:03.213' AS DateTime), N'{"EnqueuedAt":"2023-06-04T20:28:03.2138532Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (187, 43, N'Processing', NULL, CAST(N'2023-06-04T20:28:03.223' AS DateTime), N'{"StartedAt":"2023-06-04T20:28:03.2230093Z","ServerId":"nbtulpar01:33764:641ca083-1453-4167-88e2-b806fe4b1733","WorkerId":"9f427186-3576-4dda-a060-f38ad6a1b850"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (188, 43, N'Succeeded', NULL, CAST(N'2023-06-04T20:28:03.227' AS DateTime), N'{"SucceededAt":"2023-06-04T20:28:03.2247749Z","PerformanceDuration":"0","Latency":"21"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (189, 44, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T20:29:03.267' AS DateTime), N'{"EnqueuedAt":"2023-06-04T20:29:03.2670612Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (190, 44, N'Processing', NULL, CAST(N'2023-06-04T20:29:03.277' AS DateTime), N'{"StartedAt":"2023-06-04T20:29:03.2750011Z","ServerId":"nbtulpar01:33764:641ca083-1453-4167-88e2-b806fe4b1733","WorkerId":"babf578e-39a6-4bdd-abb4-10fa30263acd"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (191, 44, N'Succeeded', NULL, CAST(N'2023-06-04T20:29:03.277' AS DateTime), N'{"SucceededAt":"2023-06-04T20:29:03.2773673Z","PerformanceDuration":"0","Latency":"14"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (192, 45, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T20:30:06.770' AS DateTime), N'{"EnqueuedAt":"2023-06-04T20:30:06.7694900Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (193, 45, N'Processing', NULL, CAST(N'2023-06-04T20:30:06.787' AS DateTime), N'{"StartedAt":"2023-06-04T20:30:06.7826987Z","ServerId":"nbtulpar01:33764:641ca083-1453-4167-88e2-b806fe4b1733","WorkerId":"76c191f2-ba39-4995-a565-630f5a000320"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (194, 45, N'Succeeded', NULL, CAST(N'2023-06-04T20:30:06.800' AS DateTime), N'{"SucceededAt":"2023-06-04T20:30:06.7920387Z","PerformanceDuration":"1","Latency":"23"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (195, 46, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T21:02:34.697' AS DateTime), N'{"EnqueuedAt":"2023-06-04T21:02:34.6881157Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (196, 46, N'Processing', NULL, CAST(N'2023-06-04T21:02:34.850' AS DateTime), N'{"StartedAt":"2023-06-04T21:02:34.7740781Z","ServerId":"nbtulpar01:42812:b18ed5c6-f813-485d-aca8-ef0d2a8f0ebc","WorkerId":"db41dc45-6012-4c6a-8185-ae7dbcddde99"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (197, 46, N'Succeeded', NULL, CAST(N'2023-06-04T21:02:34.877' AS DateTime), N'{"SucceededAt":"2023-06-04T21:02:34.8662348Z","PerformanceDuration":"12","Latency":"176"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (198, 47, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T21:04:05.750' AS DateTime), N'{"EnqueuedAt":"2023-06-04T21:04:05.7436437Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (199, 47, N'Processing', NULL, CAST(N'2023-06-04T21:04:05.950' AS DateTime), N'{"StartedAt":"2023-06-04T21:04:05.8470282Z","ServerId":"nbtulpar01:40792:3a507f20-f753-4708-ba89-5b4fcb8ec704","WorkerId":"ecb6c483-601c-485e-a22c-3b85907aef2a"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (200, 47, N'Succeeded', NULL, CAST(N'2023-06-04T21:04:05.977' AS DateTime), N'{"SucceededAt":"2023-06-04T21:04:05.9672890Z","PerformanceDuration":"12","Latency":"221"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (201, 48, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T21:05:26.070' AS DateTime), N'{"EnqueuedAt":"2023-06-04T21:05:26.0602163Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (202, 48, N'Processing', NULL, CAST(N'2023-06-04T21:05:26.250' AS DateTime), N'{"StartedAt":"2023-06-04T21:05:26.1544670Z","ServerId":"nbtulpar01:48972:c4684cb8-5017-4616-9d63-078942ae6439","WorkerId":"3cd2b1ab-e827-4077-9788-4f2f7561cb30"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (203, 48, N'Succeeded', NULL, CAST(N'2023-06-04T21:05:26.277' AS DateTime), N'{"SucceededAt":"2023-06-04T21:05:26.2680065Z","PerformanceDuration":"13","Latency":"204"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (204, 49, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T21:07:54.883' AS DateTime), N'{"EnqueuedAt":"2023-06-04T21:07:54.8738372Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (205, 49, N'Processing', NULL, CAST(N'2023-06-04T21:07:55.057' AS DateTime), N'{"StartedAt":"2023-06-04T21:07:54.9748527Z","ServerId":"nbtulpar01:31900:6407ddd9-ff09-4f8f-81d8-5f587a4deea1","WorkerId":"d3e4a32a-6209-451e-9acd-c3adcc325b39"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (206, 49, N'Succeeded', NULL, CAST(N'2023-06-04T21:07:55.083' AS DateTime), N'{"SucceededAt":"2023-06-04T21:07:55.0735669Z","PerformanceDuration":"12","Latency":"201"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (207, 50, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T21:08:10.957' AS DateTime), N'{"EnqueuedAt":"2023-06-04T21:08:10.9562807Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (208, 50, N'Processing', NULL, CAST(N'2023-06-04T21:08:10.960' AS DateTime), N'{"StartedAt":"2023-06-04T21:08:10.9589609Z","ServerId":"nbtulpar01:31900:6407ddd9-ff09-4f8f-81d8-5f587a4deea1","WorkerId":"a9287545-2dcc-469b-91b2-90ef6153b15a"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (209, 50, N'Succeeded', NULL, CAST(N'2023-06-04T21:08:10.960' AS DateTime), N'{"SucceededAt":"2023-06-04T21:08:10.9605572Z","PerformanceDuration":"0","Latency":"550"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (210, 51, N'Scheduled', NULL, CAST(N'2023-06-04T21:08:25.263' AS DateTime), N'{"EnqueueAt":"2023-06-04T21:08:55.2580111Z","ScheduledAt":"2023-06-04T21:08:25.2580117Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (211, 51, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2023-06-04T21:29:47.280' AS DateTime), N'{"EnqueuedAt":"2023-06-04T21:29:47.1414856Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (217, 51, N'Processing', NULL, CAST(N'2023-06-04T21:29:47.313' AS DateTime), N'{"StartedAt":"2023-06-04T21:29:47.3114953Z","ServerId":"nbtulpar01:49576:9f4dab9f-54af-48b2-8d73-ac51ac6ae16e","WorkerId":"dff83b84-9cc2-4839-9593-56f932412ae9"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (219, 51, N'Succeeded', NULL, CAST(N'2023-06-04T21:29:47.337' AS DateTime), N'{"SucceededAt":"2023-06-04T21:29:47.3274046Z","PerformanceDuration":"10","Latency":"1282057"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (212, 52, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T21:29:47.200' AS DateTime), N'{"EnqueuedAt":"2023-06-04T21:29:47.1854252Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (215, 52, N'Processing', NULL, CAST(N'2023-06-04T21:29:47.313' AS DateTime), N'{"StartedAt":"2023-06-04T21:29:47.3114897Z","ServerId":"nbtulpar01:49576:9f4dab9f-54af-48b2-8d73-ac51ac6ae16e","WorkerId":"79f4ae54-0a41-45ed-bacc-1523a14ebec9"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (220, 52, N'Succeeded', NULL, CAST(N'2023-06-04T21:29:47.337' AS DateTime), N'{"SucceededAt":"2023-06-04T21:29:47.3296690Z","PerformanceDuration":"12","Latency":"147"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (225, 53, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T21:30:02.310' AS DateTime), N'{"EnqueuedAt":"2023-06-04T21:30:02.3102669Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (226, 53, N'Processing', NULL, CAST(N'2023-06-04T21:30:02.313' AS DateTime), N'{"StartedAt":"2023-06-04T21:30:02.3117173Z","ServerId":"nbtulpar01:49576:9f4dab9f-54af-48b2-8d73-ac51ac6ae16e","WorkerId":"b52433b9-bddd-46b2-87dd-68e0199a7fd4"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (227, 53, N'Succeeded', NULL, CAST(N'2023-06-04T21:30:02.313' AS DateTime), N'{"SucceededAt":"2023-06-04T21:30:02.3130772Z","PerformanceDuration":"0","Latency":"2"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (228, 54, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T21:31:03.520' AS DateTime), N'{"EnqueuedAt":"2023-06-04T21:31:03.5183155Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (229, 54, N'Processing', NULL, CAST(N'2023-06-04T21:31:03.527' AS DateTime), N'{"StartedAt":"2023-06-04T21:31:03.5269609Z","ServerId":"nbtulpar01:49576:9f4dab9f-54af-48b2-8d73-ac51ac6ae16e","WorkerId":"484583b8-af0d-41b1-ab1d-329b5a506d55"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (230, 54, N'Succeeded', NULL, CAST(N'2023-06-04T21:31:03.530' AS DateTime), N'{"SucceededAt":"2023-06-04T21:31:03.5297571Z","PerformanceDuration":"0","Latency":"22"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (231, 55, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T21:32:20.960' AS DateTime), N'{"EnqueuedAt":"2023-06-04T21:32:20.9537303Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (232, 55, N'Processing', NULL, CAST(N'2023-06-04T21:32:21.130' AS DateTime), N'{"StartedAt":"2023-06-04T21:32:21.0420878Z","ServerId":"nbtulpar01:48236:fc734bdd-03dc-45a5-a2d0-d56f4cad9195","WorkerId":"d72c49d9-2efc-4264-81ab-a5dedd830473"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (233, 55, N'Succeeded', NULL, CAST(N'2023-06-04T21:32:21.170' AS DateTime), N'{"SucceededAt":"2023-06-04T21:32:21.1610669Z","PerformanceDuration":"26","Latency":"191"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (234, 56, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T21:34:22.457' AS DateTime), N'{"EnqueuedAt":"2023-06-04T21:34:22.4490352Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (235, 56, N'Processing', NULL, CAST(N'2023-06-04T21:34:22.700' AS DateTime), N'{"StartedAt":"2023-06-04T21:34:22.5471582Z","ServerId":"nbtulpar01:23744:39568cb4-790c-417b-9c16-dd0a9bf7df88","WorkerId":"789655d6-306e-43bd-a58d-f89d6c6a32bc"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (236, 56, N'Succeeded', NULL, CAST(N'2023-06-04T21:34:22.723' AS DateTime), N'{"SucceededAt":"2023-06-04T21:34:22.7140495Z","PerformanceDuration":"11","Latency":"265"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (237, 57, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T21:35:07.593' AS DateTime), N'{"EnqueuedAt":"2023-06-04T21:35:07.5937955Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (238, 57, N'Processing', NULL, CAST(N'2023-06-04T21:35:07.603' AS DateTime), N'{"StartedAt":"2023-06-04T21:35:07.6016967Z","ServerId":"nbtulpar01:23744:39568cb4-790c-417b-9c16-dd0a9bf7df88","WorkerId":"17406d03-b959-41ed-a636-8e7df7bb1fdc"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (239, 57, N'Succeeded', NULL, CAST(N'2023-06-04T21:35:07.603' AS DateTime), N'{"SucceededAt":"2023-06-04T21:35:07.6040037Z","PerformanceDuration":"0","Latency":"20"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (240, 58, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T21:53:09.763' AS DateTime), N'{"EnqueuedAt":"2023-06-04T21:53:09.7527527Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (241, 58, N'Processing', NULL, CAST(N'2023-06-04T21:53:09.940' AS DateTime), N'{"StartedAt":"2023-06-04T21:53:09.8502568Z","ServerId":"nbtulpar01:14296:b8ad816d-3ffe-499f-ba35-34f51fe82252","WorkerId":"691baef9-8bb0-43ed-b2c1-af8bb964447b"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (242, 58, N'Succeeded', NULL, CAST(N'2023-06-04T21:53:09.967' AS DateTime), N'{"SucceededAt":"2023-06-04T21:53:09.9585200Z","PerformanceDuration":"13","Latency":"204"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (243, 59, N'Scheduled', NULL, CAST(N'2023-06-04T21:53:24.500' AS DateTime), N'{"EnqueueAt":"2023-06-04T21:53:54.4939155Z","ScheduledAt":"2023-06-04T21:53:24.4939157Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (244, 59, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2023-06-04T21:53:58.223' AS DateTime), N'{"EnqueuedAt":"2023-06-04T21:53:58.2071659Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (245, 59, N'Processing', NULL, CAST(N'2023-06-04T21:53:58.240' AS DateTime), N'{"StartedAt":"2023-06-04T21:53:58.2393206Z","ServerId":"nbtulpar01:14296:b8ad816d-3ffe-499f-ba35-34f51fe82252","WorkerId":"3ec7009b-ad59-4e02-b408-f520030da977"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (246, 59, N'Succeeded', NULL, CAST(N'2023-06-04T21:53:58.243' AS DateTime), N'{"SucceededAt":"2023-06-04T21:53:58.2411686Z","PerformanceDuration":"0","Latency":"33747"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (247, 60, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T21:54:13.220' AS DateTime), N'{"EnqueuedAt":"2023-06-04T21:54:13.2200106Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (248, 60, N'Processing', NULL, CAST(N'2023-06-04T21:54:13.223' AS DateTime), N'{"StartedAt":"2023-06-04T21:54:13.2239964Z","ServerId":"nbtulpar01:14296:b8ad816d-3ffe-499f-ba35-34f51fe82252","WorkerId":"10a4b1d0-5ff4-4575-8ebf-07ae3e393474"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (249, 60, N'Succeeded', NULL, CAST(N'2023-06-04T21:54:13.227' AS DateTime), N'{"SucceededAt":"2023-06-04T21:54:13.2259127Z","PerformanceDuration":"0","Latency":"8"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (250, 61, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T21:55:13.287' AS DateTime), N'{"EnqueuedAt":"2023-06-04T21:55:13.2876457Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (251, 61, N'Processing', NULL, CAST(N'2023-06-04T21:55:13.297' AS DateTime), N'{"StartedAt":"2023-06-04T21:55:13.2946486Z","ServerId":"nbtulpar01:14296:b8ad816d-3ffe-499f-ba35-34f51fe82252","WorkerId":"3ace5a62-08a5-41d4-916b-f34a26335b3b"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (252, 61, N'Succeeded', NULL, CAST(N'2023-06-04T21:55:13.297' AS DateTime), N'{"SucceededAt":"2023-06-04T21:55:13.2961610Z","PerformanceDuration":"0","Latency":"19"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (253, 62, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T21:56:13.337' AS DateTime), N'{"EnqueuedAt":"2023-06-04T21:56:13.3369142Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (254, 62, N'Processing', NULL, CAST(N'2023-06-04T21:56:13.347' AS DateTime), N'{"StartedAt":"2023-06-04T21:56:13.3441062Z","ServerId":"nbtulpar01:14296:b8ad816d-3ffe-499f-ba35-34f51fe82252","WorkerId":"5429d597-4d0d-48c6-96cf-e4a566c56dcb"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (255, 62, N'Succeeded', NULL, CAST(N'2023-06-04T21:56:13.347' AS DateTime), N'{"SucceededAt":"2023-06-04T21:56:13.3463265Z","PerformanceDuration":"0","Latency":"13"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (256, 63, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T21:57:13.407' AS DateTime), N'{"EnqueuedAt":"2023-06-04T21:57:13.4070124Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (257, 63, N'Processing', NULL, CAST(N'2023-06-04T21:57:13.420' AS DateTime), N'{"StartedAt":"2023-06-04T21:57:13.4191592Z","ServerId":"nbtulpar01:14296:b8ad816d-3ffe-499f-ba35-34f51fe82252","WorkerId":"031e7cad-4d23-409a-a2c5-1fbbc02d03e4"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (258, 63, N'Succeeded', NULL, CAST(N'2023-06-04T21:57:13.423' AS DateTime), N'{"SucceededAt":"2023-06-04T21:57:13.4215406Z","PerformanceDuration":"0","Latency":"24"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (259, 64, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T21:58:13.460' AS DateTime), N'{"EnqueuedAt":"2023-06-04T21:58:13.4587932Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (260, 64, N'Processing', NULL, CAST(N'2023-06-04T21:58:13.467' AS DateTime), N'{"StartedAt":"2023-06-04T21:58:13.4664427Z","ServerId":"nbtulpar01:14296:b8ad816d-3ffe-499f-ba35-34f51fe82252","WorkerId":"94fcaf19-bc49-446e-9beb-bebe690e311c"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (261, 64, N'Succeeded', NULL, CAST(N'2023-06-04T21:58:13.470' AS DateTime), N'{"SucceededAt":"2023-06-04T21:58:13.4686918Z","PerformanceDuration":"0","Latency":"21"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (262, 65, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T21:59:13.507' AS DateTime), N'{"EnqueuedAt":"2023-06-04T21:59:13.5050888Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (263, 65, N'Processing', NULL, CAST(N'2023-06-04T21:59:13.513' AS DateTime), N'{"StartedAt":"2023-06-04T21:59:13.5130358Z","ServerId":"nbtulpar01:14296:b8ad816d-3ffe-499f-ba35-34f51fe82252","WorkerId":"7d968cb6-961f-40d0-8496-757a6d46fda1"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (264, 65, N'Succeeded', NULL, CAST(N'2023-06-04T21:59:13.517' AS DateTime), N'{"SucceededAt":"2023-06-04T21:59:13.5152127Z","PerformanceDuration":"0","Latency":"17"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (265, 66, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:00:13.560' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:00:13.5594960Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (266, 66, N'Processing', NULL, CAST(N'2023-06-04T22:00:13.570' AS DateTime), N'{"StartedAt":"2023-06-04T22:00:13.5676408Z","ServerId":"nbtulpar01:14296:b8ad816d-3ffe-499f-ba35-34f51fe82252","WorkerId":"4d0a377f-0055-4b43-be73-d6df918786fb"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (267, 66, N'Succeeded', NULL, CAST(N'2023-06-04T22:00:13.570' AS DateTime), N'{"SucceededAt":"2023-06-04T22:00:13.5699199Z","PerformanceDuration":"0","Latency":"19"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (268, 67, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:01:13.617' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:01:13.6173088Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (269, 67, N'Processing', NULL, CAST(N'2023-06-04T22:01:13.627' AS DateTime), N'{"StartedAt":"2023-06-04T22:01:13.6262007Z","ServerId":"nbtulpar01:14296:b8ad816d-3ffe-499f-ba35-34f51fe82252","WorkerId":"738e24a1-4fc9-4085-9968-f60102666572"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (270, 67, N'Succeeded', NULL, CAST(N'2023-06-04T22:01:13.630' AS DateTime), N'{"SucceededAt":"2023-06-04T22:01:13.6283187Z","PerformanceDuration":"0","Latency":"21"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (271, 68, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:02:04.717' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:02:04.7161289Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (272, 68, N'Processing', NULL, CAST(N'2023-06-04T22:02:04.723' AS DateTime), N'{"StartedAt":"2023-06-04T22:02:04.7236804Z","ServerId":"nbtulpar01:14296:b8ad816d-3ffe-499f-ba35-34f51fe82252","WorkerId":"a8224fd1-95c2-46fc-a323-7d8e33809400"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (273, 68, N'Succeeded', NULL, CAST(N'2023-06-04T22:02:04.727' AS DateTime), N'{"SucceededAt":"2023-06-04T22:02:04.7259181Z","PerformanceDuration":"0","Latency":"12"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (274, 69, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:03:04.767' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:03:04.7675648Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (275, 69, N'Processing', NULL, CAST(N'2023-06-04T22:03:04.777' AS DateTime), N'{"StartedAt":"2023-06-04T22:03:04.7750014Z","ServerId":"nbtulpar01:14296:b8ad816d-3ffe-499f-ba35-34f51fe82252","WorkerId":"e2222d6f-8977-48ec-b96d-3aa6d4051baa"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (276, 69, N'Succeeded', NULL, CAST(N'2023-06-04T22:03:04.780' AS DateTime), N'{"SucceededAt":"2023-06-04T22:03:04.7778163Z","PerformanceDuration":"0","Latency":"14"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (277, 70, N'Scheduled', NULL, CAST(N'2023-06-04T22:03:43.590' AS DateTime), N'{"EnqueueAt":"2023-06-04T22:04:13.5866700Z","ScheduledAt":"2023-06-04T22:03:43.5866701Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (278, 70, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2023-06-04T22:04:13.600' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:04:13.5994437Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (280, 70, N'Processing', NULL, CAST(N'2023-06-04T22:04:13.607' AS DateTime), N'{"StartedAt":"2023-06-04T22:04:13.6057973Z","ServerId":"nbtulpar01:14296:b8ad816d-3ffe-499f-ba35-34f51fe82252","WorkerId":"f712d1c8-c413-4fb5-a963-e13753ec8958"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (282, 70, N'Succeeded', NULL, CAST(N'2023-06-04T22:04:13.607' AS DateTime), N'{"SucceededAt":"2023-06-04T22:04:13.6074328Z","PerformanceDuration":"0","Latency":"30020"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (279, 71, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:04:13.603' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:04:13.6029581Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (281, 71, N'Processing', NULL, CAST(N'2023-06-04T22:04:13.607' AS DateTime), N'{"StartedAt":"2023-06-04T22:04:13.6067309Z","ServerId":"nbtulpar01:14296:b8ad816d-3ffe-499f-ba35-34f51fe82252","WorkerId":"d91bc238-3556-469c-b8a7-4278696eeff6"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (283, 71, N'Succeeded', NULL, CAST(N'2023-06-04T22:04:13.610' AS DateTime), N'{"SucceededAt":"2023-06-04T22:04:13.6083199Z","PerformanceDuration":"0","Latency":"8"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (284, 72, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:05:04.923' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:05:04.9222522Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (285, 72, N'Processing', NULL, CAST(N'2023-06-04T22:05:04.940' AS DateTime), N'{"StartedAt":"2023-06-04T22:05:04.9393336Z","ServerId":"nbtulpar01:14296:b8ad816d-3ffe-499f-ba35-34f51fe82252","WorkerId":"932e813d-aac9-41bc-bff7-786dcef0d341"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (286, 72, N'Succeeded', NULL, CAST(N'2023-06-04T22:05:04.940' AS DateTime), N'{"SucceededAt":"2023-06-04T22:05:04.9409302Z","PerformanceDuration":"0","Latency":"1500"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (287, 73, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:06:06.507' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:06:06.5057905Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (288, 73, N'Processing', NULL, CAST(N'2023-06-04T22:06:06.513' AS DateTime), N'{"StartedAt":"2023-06-04T22:06:06.5134962Z","ServerId":"nbtulpar01:14296:b8ad816d-3ffe-499f-ba35-34f51fe82252","WorkerId":"0341d691-0e44-446f-aad2-729d3ba1a5a0"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (289, 73, N'Succeeded', NULL, CAST(N'2023-06-04T22:06:06.517' AS DateTime), N'{"SucceededAt":"2023-06-04T22:06:06.5158819Z","PerformanceDuration":"0","Latency":"18"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (290, 74, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:07:06.550' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:07:06.5490836Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (291, 74, N'Processing', NULL, CAST(N'2023-06-04T22:07:06.560' AS DateTime), N'{"StartedAt":"2023-06-04T22:07:06.5574163Z","ServerId":"nbtulpar01:14296:b8ad816d-3ffe-499f-ba35-34f51fe82252","WorkerId":"c110cc58-fc72-4697-994e-16c192c0dc16"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (292, 74, N'Succeeded', NULL, CAST(N'2023-06-04T22:07:06.560' AS DateTime), N'{"SucceededAt":"2023-06-04T22:07:06.5601864Z","PerformanceDuration":"0","Latency":"19"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (293, 75, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:08:06.583' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:08:06.5840450Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (294, 75, N'Processing', NULL, CAST(N'2023-06-04T22:08:06.593' AS DateTime), N'{"StartedAt":"2023-06-04T22:08:06.5916101Z","ServerId":"nbtulpar01:14296:b8ad816d-3ffe-499f-ba35-34f51fe82252","WorkerId":"82a3bc45-962c-4b93-b6fe-126aa198e93a"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (295, 75, N'Succeeded', NULL, CAST(N'2023-06-04T22:08:06.593' AS DateTime), N'{"SucceededAt":"2023-06-04T22:08:06.5939622Z","PerformanceDuration":"0","Latency":"20"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (296, 76, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:09:06.630' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:09:06.6284352Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (297, 76, N'Processing', NULL, CAST(N'2023-06-04T22:09:06.637' AS DateTime), N'{"StartedAt":"2023-06-04T22:09:06.6361892Z","ServerId":"nbtulpar01:14296:b8ad816d-3ffe-499f-ba35-34f51fe82252","WorkerId":"4ac4611e-92de-401a-97d4-f897e7da5300"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (298, 76, N'Succeeded', NULL, CAST(N'2023-06-04T22:09:06.640' AS DateTime), N'{"SucceededAt":"2023-06-04T22:09:06.6388620Z","PerformanceDuration":"0","Latency":"21"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (299, 77, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:10:06.663' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:10:06.6639933Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (300, 77, N'Processing', NULL, CAST(N'2023-06-04T22:10:06.680' AS DateTime), N'{"StartedAt":"2023-06-04T22:10:06.6738814Z","ServerId":"nbtulpar01:14296:b8ad816d-3ffe-499f-ba35-34f51fe82252","WorkerId":"e0268d53-689b-43a0-a41a-28e85f47d614"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (301, 77, N'Succeeded', NULL, CAST(N'2023-06-04T22:10:06.690' AS DateTime), N'{"SucceededAt":"2023-06-04T22:10:06.6864353Z","PerformanceDuration":"0","Latency":"26"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (302, 78, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:11:06.720' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:11:06.7191820Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (303, 78, N'Processing', NULL, CAST(N'2023-06-04T22:11:06.727' AS DateTime), N'{"StartedAt":"2023-06-04T22:11:06.7265096Z","ServerId":"nbtulpar01:14296:b8ad816d-3ffe-499f-ba35-34f51fe82252","WorkerId":"691baef9-8bb0-43ed-b2c1-af8bb964447b"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (304, 78, N'Succeeded', NULL, CAST(N'2023-06-04T22:11:06.730' AS DateTime), N'{"SucceededAt":"2023-06-04T22:11:06.7290877Z","PerformanceDuration":"0","Latency":"11"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (305, 79, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:12:06.777' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:12:06.7766262Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (306, 79, N'Processing', NULL, CAST(N'2023-06-04T22:12:06.787' AS DateTime), N'{"StartedAt":"2023-06-04T22:12:06.7840372Z","ServerId":"nbtulpar01:14296:b8ad816d-3ffe-499f-ba35-34f51fe82252","WorkerId":"3ec7009b-ad59-4e02-b408-f520030da977"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (307, 79, N'Succeeded', NULL, CAST(N'2023-06-04T22:12:06.787' AS DateTime), N'{"SucceededAt":"2023-06-04T22:12:06.7865307Z","PerformanceDuration":"0","Latency":"13"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (308, 80, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:21:33.320' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:21:33.2991943Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (309, 80, N'Processing', NULL, CAST(N'2023-06-04T22:21:33.540' AS DateTime), N'{"StartedAt":"2023-06-04T22:21:33.4221733Z","ServerId":"nbtulpar01:30824:9aa9ba0f-7cfb-42eb-8b82-7161b4121214","WorkerId":"43d5dd4d-47f8-47b8-bf3d-3bc3d63897ab"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (310, 80, N'Succeeded', NULL, CAST(N'2023-06-04T22:21:33.567' AS DateTime), N'{"SucceededAt":"2023-06-04T22:21:33.5588992Z","PerformanceDuration":"13","Latency":"262"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (311, 81, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:22:07.547' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:22:07.5461449Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (312, 81, N'Processing', NULL, CAST(N'2023-06-04T22:22:07.560' AS DateTime), N'{"StartedAt":"2023-06-04T22:22:07.5540518Z","ServerId":"nbtulpar01:30824:9aa9ba0f-7cfb-42eb-8b82-7161b4121214","WorkerId":"3f7e38c9-f0ec-4213-a354-46f2ac28f19f"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (313, 81, N'Succeeded', NULL, CAST(N'2023-06-04T22:22:07.570' AS DateTime), N'{"SucceededAt":"2023-06-04T22:22:07.5633207Z","PerformanceDuration":"0","Latency":"20"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (314, 82, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:23:13.860' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:23:13.8585705Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (315, 82, N'Processing', NULL, CAST(N'2023-06-04T22:23:13.867' AS DateTime), N'{"StartedAt":"2023-06-04T22:23:13.8658307Z","ServerId":"nbtulpar01:30824:9aa9ba0f-7cfb-42eb-8b82-7161b4121214","WorkerId":"7e8054e7-808f-49a4-a9fd-540237f51571"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (316, 82, N'Succeeded', NULL, CAST(N'2023-06-04T22:23:13.870' AS DateTime), N'{"SucceededAt":"2023-06-04T22:23:13.8684042Z","PerformanceDuration":"0","Latency":"10"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (317, 83, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:24:05.007' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:24:05.0056231Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (318, 83, N'Processing', NULL, CAST(N'2023-06-04T22:24:05.027' AS DateTime), N'{"StartedAt":"2023-06-04T22:24:05.0244138Z","ServerId":"nbtulpar01:30824:9aa9ba0f-7cfb-42eb-8b82-7161b4121214","WorkerId":"f9fd1434-8be0-4027-b155-00bb0a850868"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (319, 83, N'Succeeded', NULL, CAST(N'2023-06-04T22:24:05.027' AS DateTime), N'{"SucceededAt":"2023-06-04T22:24:05.0268218Z","PerformanceDuration":"0","Latency":"1693"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (320, 84, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:25:05.067' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:25:05.0682318Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (321, 84, N'Processing', NULL, CAST(N'2023-06-04T22:25:05.077' AS DateTime), N'{"StartedAt":"2023-06-04T22:25:05.0761087Z","ServerId":"nbtulpar01:30824:9aa9ba0f-7cfb-42eb-8b82-7161b4121214","WorkerId":"10e64407-89b0-4169-83ed-782a820b0f58"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (322, 84, N'Succeeded', NULL, CAST(N'2023-06-04T22:25:05.080' AS DateTime), N'{"SucceededAt":"2023-06-04T22:25:05.0786766Z","PerformanceDuration":"0","Latency":"21"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (323, 85, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:26:05.113' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:26:05.1125413Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (324, 85, N'Processing', NULL, CAST(N'2023-06-04T22:26:05.120' AS DateTime), N'{"StartedAt":"2023-06-04T22:26:05.1203390Z","ServerId":"nbtulpar01:30824:9aa9ba0f-7cfb-42eb-8b82-7161b4121214","WorkerId":"07f51fde-3851-4c0a-b477-910318ce3bfd"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (325, 85, N'Succeeded', NULL, CAST(N'2023-06-04T22:26:05.123' AS DateTime), N'{"SucceededAt":"2023-06-04T22:26:05.1223620Z","PerformanceDuration":"0","Latency":"19"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (326, 86, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:27:06.220' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:27:06.2184702Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (327, 86, N'Processing', NULL, CAST(N'2023-06-04T22:27:06.227' AS DateTime), N'{"StartedAt":"2023-06-04T22:27:06.2263237Z","ServerId":"nbtulpar01:30824:9aa9ba0f-7cfb-42eb-8b82-7161b4121214","WorkerId":"b6e9c14f-20c6-4ee0-b744-847a10610f9e"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (328, 86, N'Succeeded', NULL, CAST(N'2023-06-04T22:27:06.230' AS DateTime), N'{"SucceededAt":"2023-06-04T22:27:06.2283292Z","PerformanceDuration":"0","Latency":"21"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (329, 87, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:28:00.770' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:28:00.7579526Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (330, 87, N'Processing', NULL, CAST(N'2023-06-04T22:28:00.950' AS DateTime), N'{"StartedAt":"2023-06-04T22:28:00.8748288Z","ServerId":"nbtulpar01:47480:a4fce854-4e6e-41ce-b1bc-917543de21d6","WorkerId":"33d36a23-fce0-47a0-8dd5-6dcd68daf67d"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (331, 87, N'Succeeded', NULL, CAST(N'2023-06-04T22:28:00.973' AS DateTime), N'{"SucceededAt":"2023-06-04T22:28:00.9650278Z","PerformanceDuration":"10","Latency":"207"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (332, 88, N'Scheduled', NULL, CAST(N'2023-06-04T22:28:24.487' AS DateTime), N'{"EnqueueAt":"2023-06-04T22:28:54.4714010Z","ScheduledAt":"2023-06-04T22:28:24.4714013Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (336, 88, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2023-06-04T22:29:05.537' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:29:05.5104673Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (337, 88, N'Processing', NULL, CAST(N'2023-06-04T22:29:05.540' AS DateTime), N'{"StartedAt":"2023-06-04T22:29:05.5381375Z","ServerId":"nbtulpar01:47480:a4fce854-4e6e-41ce-b1bc-917543de21d6","WorkerId":"d7cbdbe7-0001-4249-810b-1f0d145977dd"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (338, 88, N'Succeeded', NULL, CAST(N'2023-06-04T22:29:05.540' AS DateTime), N'{"SucceededAt":"2023-06-04T22:29:05.5391762Z","PerformanceDuration":"0","Latency":"41066"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (333, 89, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:29:05.517' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:29:05.5170970Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (334, 89, N'Processing', NULL, CAST(N'2023-06-04T22:29:05.530' AS DateTime), N'{"StartedAt":"2023-06-04T22:29:05.5275953Z","ServerId":"nbtulpar01:47480:a4fce854-4e6e-41ce-b1bc-917543de21d6","WorkerId":"3e8c555e-3426-4b79-bbd7-79ecc6ea46bb"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (335, 89, N'Succeeded', NULL, CAST(N'2023-06-04T22:29:05.533' AS DateTime), N'{"SucceededAt":"2023-06-04T22:29:05.5338537Z","PerformanceDuration":"0","Latency":"23"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (339, 90, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:30:06.837' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:30:06.8359850Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (340, 90, N'Processing', NULL, CAST(N'2023-06-04T22:30:06.843' AS DateTime), N'{"StartedAt":"2023-06-04T22:30:06.8435401Z","ServerId":"nbtulpar01:47480:a4fce854-4e6e-41ce-b1bc-917543de21d6","WorkerId":"aa5ff3ab-a0b7-4b43-a724-908692b94a50"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (341, 90, N'Succeeded', NULL, CAST(N'2023-06-04T22:30:06.847' AS DateTime), N'{"SucceededAt":"2023-06-04T22:30:06.8455024Z","PerformanceDuration":"0","Latency":"12"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (342, 91, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:41:25.053' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:41:25.0450902Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (344, 91, N'Processing', NULL, CAST(N'2023-06-04T22:41:25.140' AS DateTime), N'{"StartedAt":"2023-06-04T22:41:25.1383870Z","ServerId":"nbtulpar01:41068:bdaeb192-0f42-4335-874b-de2c203371bc","WorkerId":"d6db8e8f-b6f2-4efe-9cbe-030c22d0d1da"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (346, 91, N'Succeeded', NULL, CAST(N'2023-06-04T22:41:25.163' AS DateTime), N'{"SucceededAt":"2023-06-04T22:41:25.1536194Z","PerformanceDuration":"10","Latency":"110"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (349, 92, N'Scheduled', NULL, CAST(N'2023-06-04T22:41:53.240' AS DateTime), N'{"EnqueueAt":"2023-06-04T22:42:23.2358991Z","ScheduledAt":"2023-06-04T22:41:53.2358993Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (356, 92, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2023-06-04T22:44:16.240' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:43:00.4943675Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (357, 92, N'Processing', NULL, CAST(N'2023-06-04T22:44:16.247' AS DateTime), N'{"StartedAt":"2023-06-04T22:44:16.2459833Z","ServerId":"nbtulpar01:41068:bdaeb192-0f42-4335-874b-de2c203371bc","WorkerId":"bfcfc481-5fa8-4dbd-8b06-133719fcf873"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (360, 92, N'Succeeded', NULL, CAST(N'2023-06-04T22:44:16.253' AS DateTime), N'{"SucceededAt":"2023-06-04T22:44:16.2517687Z","PerformanceDuration":"0","Latency":"143013"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (351, 93, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:43:00.493' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:43:00.4936007Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (352, 93, N'Processing', NULL, CAST(N'2023-06-04T22:43:00.503' AS DateTime), N'{"StartedAt":"2023-06-04T22:43:00.4999014Z","ServerId":"nbtulpar01:41068:bdaeb192-0f42-4335-874b-de2c203371bc","WorkerId":"aa897fd5-0f2d-4533-9752-29a7c0f943b3"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (354, 93, N'Succeeded', NULL, CAST(N'2023-06-04T22:43:00.507' AS DateTime), N'{"SucceededAt":"2023-06-04T22:43:00.5045212Z","PerformanceDuration":"0","Latency":"24"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (355, 94, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:44:16.240' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:44:16.2377599Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (358, 94, N'Processing', NULL, CAST(N'2023-06-04T22:44:16.247' AS DateTime), N'{"StartedAt":"2023-06-04T22:44:16.2478040Z","ServerId":"nbtulpar01:41068:bdaeb192-0f42-4335-874b-de2c203371bc","WorkerId":"456c5a93-c868-4402-9ee2-7afe4bc237c2"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (359, 94, N'Succeeded', NULL, CAST(N'2023-06-04T22:44:16.253' AS DateTime), N'{"SucceededAt":"2023-06-04T22:44:16.2517828Z","PerformanceDuration":"0","Latency":"17"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (363, 95, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:45:01.293' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:45:01.2918395Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (364, 95, N'Processing', NULL, CAST(N'2023-06-04T22:45:01.300' AS DateTime), N'{"StartedAt":"2023-06-04T22:45:01.2990853Z","ServerId":"nbtulpar01:41068:bdaeb192-0f42-4335-874b-de2c203371bc","WorkerId":"c413c486-f6c2-4521-a192-a4aebc2e9e59"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (365, 95, N'Succeeded', NULL, CAST(N'2023-06-04T22:45:01.303' AS DateTime), N'{"SucceededAt":"2023-06-04T22:45:01.3015150Z","PerformanceDuration":"0","Latency":"10"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (366, 96, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:46:13.637' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:46:13.6365579Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (367, 96, N'Processing', NULL, CAST(N'2023-06-04T22:46:14.787' AS DateTime), N'{"StartedAt":"2023-06-04T22:46:14.7757326Z","ServerId":"nbtulpar01:41068:bdaeb192-0f42-4335-874b-de2c203371bc","WorkerId":"314b8628-526b-4b29-9f68-d648aeb551d1"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (368, 96, N'Succeeded', NULL, CAST(N'2023-06-04T22:46:14.807' AS DateTime), N'{"SucceededAt":"2023-06-04T22:46:14.7976641Z","PerformanceDuration":"0","Latency":"9807"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (369, 97, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:47:53.370' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:47:53.3609391Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (370, 97, N'Processing', NULL, CAST(N'2023-06-04T22:47:53.533' AS DateTime), N'{"StartedAt":"2023-06-04T22:47:53.4512691Z","ServerId":"nbtulpar01:51232:91c57c3c-7333-4832-b8f4-5967f94b9130","WorkerId":"06d01a63-6d03-4962-846c-92a6d41ddf16"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (371, 97, N'Succeeded', NULL, CAST(N'2023-06-04T22:47:53.570' AS DateTime), N'{"SucceededAt":"2023-06-04T22:47:53.5586930Z","PerformanceDuration":"19","Latency":"188"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (372, 98, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:48:08.463' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:48:08.4620657Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (373, 98, N'Processing', NULL, CAST(N'2023-06-04T22:48:08.463' AS DateTime), N'{"StartedAt":"2023-06-04T22:48:08.4634978Z","ServerId":"nbtulpar01:51232:91c57c3c-7333-4832-b8f4-5967f94b9130","WorkerId":"16d13ac6-316f-43a2-9446-344e4acfb21b"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (374, 98, N'Succeeded', NULL, CAST(N'2023-06-04T22:48:08.463' AS DateTime), N'{"SucceededAt":"2023-06-04T22:48:08.4645136Z","PerformanceDuration":"0","Latency":"4"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (375, 99, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:49:14.240' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:49:14.2383141Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (376, 99, N'Processing', NULL, CAST(N'2023-06-04T22:49:14.780' AS DateTime), N'{"StartedAt":"2023-06-04T22:49:14.2515699Z","ServerId":"nbtulpar01:51232:91c57c3c-7333-4832-b8f4-5967f94b9130","WorkerId":"e47a9404-c99e-49a0-884e-426a82eb7be2"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (377, 99, N'Succeeded', NULL, CAST(N'2023-06-04T22:49:15.410' AS DateTime), N'{"SucceededAt":"2023-06-04T22:49:14.7883293Z","PerformanceDuration":"0","Latency":"8875"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (378, 100, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:50:00.153' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:50:00.1522696Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (379, 100, N'Processing', NULL, CAST(N'2023-06-04T22:50:00.160' AS DateTime), N'{"StartedAt":"2023-06-04T22:50:00.1601211Z","ServerId":"nbtulpar01:51232:91c57c3c-7333-4832-b8f4-5967f94b9130","WorkerId":"dae45cd0-c12f-4283-86f9-213bbe544d96"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (380, 100, N'Succeeded', NULL, CAST(N'2023-06-04T22:50:00.163' AS DateTime), N'{"SucceededAt":"2023-06-04T22:50:00.1619664Z","PerformanceDuration":"0","Latency":"18"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (381, 101, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-04T22:51:00.217' AS DateTime), N'{"EnqueuedAt":"2023-06-04T22:51:00.2175645Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (382, 101, N'Processing', NULL, CAST(N'2023-06-04T22:51:00.227' AS DateTime), N'{"StartedAt":"2023-06-04T22:51:00.2270173Z","ServerId":"nbtulpar01:51232:91c57c3c-7333-4832-b8f4-5967f94b9130","WorkerId":"b362e22e-9650-4b23-a340-b78a7f91b443"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (383, 101, N'Succeeded', NULL, CAST(N'2023-06-04T22:51:00.230' AS DateTime), N'{"SucceededAt":"2023-06-04T22:51:00.2294294Z","PerformanceDuration":"0","Latency":"22"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (385, 102, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T08:25:37.997' AS DateTime), N'{"EnqueuedAt":"2023-06-05T08:25:37.9882132Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (388, 102, N'Processing', NULL, CAST(N'2023-06-05T08:25:38.093' AS DateTime), N'{"StartedAt":"2023-06-05T08:25:38.0925421Z","ServerId":"nbtulpar01:38660:86d32442-5d2d-4826-b051-c3074ee0149e","WorkerId":"bbc39f3e-ad31-4afd-a74b-4ea178bbd600"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (390, 102, N'Succeeded', NULL, CAST(N'2023-06-05T08:25:38.117' AS DateTime), N'{"SucceededAt":"2023-06-05T08:25:38.1089216Z","PerformanceDuration":"10","Latency":"128"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (393, 103, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T08:26:08.117' AS DateTime), N'{"EnqueuedAt":"2023-06-05T08:26:08.1160678Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (394, 103, N'Processing', NULL, CAST(N'2023-06-05T08:26:08.120' AS DateTime), N'{"StartedAt":"2023-06-05T08:26:08.1182137Z","ServerId":"nbtulpar01:38660:86d32442-5d2d-4826-b051-c3074ee0149e","WorkerId":"0aaa4f5f-4ace-404f-b53e-b3fb41bf8b6d"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (395, 103, N'Succeeded', NULL, CAST(N'2023-06-05T08:26:08.120' AS DateTime), N'{"SucceededAt":"2023-06-05T08:26:08.1196471Z","PerformanceDuration":"0","Latency":"6"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (396, 104, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T08:29:29.943' AS DateTime), N'{"EnqueuedAt":"2023-06-05T08:29:29.9330104Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (397, 104, N'Processing', NULL, CAST(N'2023-06-05T08:29:30.107' AS DateTime), N'{"StartedAt":"2023-06-05T08:29:30.0245842Z","ServerId":"nbtulpar01:6464:eff31930-a2d0-4e94-8a72-ff385faf8cdf","WorkerId":"ccfdf79c-0c0b-460a-8606-549728a0f700"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (398, 104, N'Succeeded', NULL, CAST(N'2023-06-05T08:29:30.137' AS DateTime), N'{"SucceededAt":"2023-06-05T08:29:30.1274830Z","PerformanceDuration":"16","Latency":"188"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (399, 105, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T08:30:00.040' AS DateTime), N'{"EnqueuedAt":"2023-06-05T08:30:00.0389586Z","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (400, 105, N'Processing', NULL, CAST(N'2023-06-05T08:30:00.047' AS DateTime), N'{"StartedAt":"2023-06-05T08:30:00.0468360Z","ServerId":"nbtulpar01:6464:eff31930-a2d0-4e94-8a72-ff385faf8cdf","WorkerId":"370f72fd-dc8d-4f3a-9e6a-c80108a33aaf"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (401, 105, N'Succeeded', NULL, CAST(N'2023-06-05T08:30:00.050' AS DateTime), N'{"SucceededAt":"2023-06-05T08:30:00.0492646Z","PerformanceDuration":"0","Latency":"12"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (402, 106, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T08:31:15.923' AS DateTime), N'{"EnqueuedAt":"2023-06-05T08:31:15.9245811Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (403, 106, N'Processing', NULL, CAST(N'2023-06-05T08:31:15.937' AS DateTime), N'{"StartedAt":"2023-06-05T08:31:15.9345260Z","ServerId":"nbtulpar01:6464:eff31930-a2d0-4e94-8a72-ff385faf8cdf","WorkerId":"41302a05-5501-4b6a-8b1b-b4e3a773ecaa"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (404, 106, N'Succeeded', NULL, CAST(N'2023-06-05T08:31:15.947' AS DateTime), N'{"SucceededAt":"2023-06-05T08:31:15.9408692Z","PerformanceDuration":"0","Latency":"17"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (405, 107, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T08:32:00.963' AS DateTime), N'{"EnqueuedAt":"2023-06-05T08:32:00.9622330Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (406, 107, N'Processing', NULL, CAST(N'2023-06-05T08:32:00.970' AS DateTime), N'{"StartedAt":"2023-06-05T08:32:00.9693864Z","ServerId":"nbtulpar01:6464:eff31930-a2d0-4e94-8a72-ff385faf8cdf","WorkerId":"df00fbc7-e654-4708-b63c-49adb19669a4"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (407, 107, N'Succeeded', NULL, CAST(N'2023-06-05T08:32:00.973' AS DateTime), N'{"SucceededAt":"2023-06-05T08:32:00.9715112Z","PerformanceDuration":"0","Latency":"11"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (408, 108, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T08:33:01.017' AS DateTime), N'{"EnqueuedAt":"2023-06-05T08:33:01.0165171Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (409, 108, N'Processing', NULL, CAST(N'2023-06-05T08:33:01.027' AS DateTime), N'{"StartedAt":"2023-06-05T08:33:01.0262244Z","ServerId":"nbtulpar01:6464:eff31930-a2d0-4e94-8a72-ff385faf8cdf","WorkerId":"9faed383-e02f-4694-a30c-6d29c9db1604"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (410, 108, N'Succeeded', NULL, CAST(N'2023-06-05T08:33:01.027' AS DateTime), N'{"SucceededAt":"2023-06-05T08:33:01.0277697Z","PerformanceDuration":"0","Latency":"20"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (411, 109, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T08:52:26.120' AS DateTime), N'{"EnqueuedAt":"2023-06-05T08:52:26.1102735Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (412, 109, N'Processing', NULL, CAST(N'2023-06-05T08:52:26.287' AS DateTime), N'{"StartedAt":"2023-06-05T08:52:26.2060772Z","ServerId":"nbtulpar01:49272:9787492f-3a47-489e-980a-1258686f40a0","WorkerId":"604838e0-63ad-417f-b512-fb5d1cfbe677"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (413, 109, N'Succeeded', NULL, CAST(N'2023-06-05T08:52:26.307' AS DateTime), N'{"SucceededAt":"2023-06-05T08:52:26.2993790Z","PerformanceDuration":"10","Latency":"191"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (414, 110, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T08:53:48.330' AS DateTime), N'{"EnqueuedAt":"2023-06-05T08:53:48.3197308Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (415, 110, N'Processing', NULL, CAST(N'2023-06-05T08:53:48.503' AS DateTime), N'{"StartedAt":"2023-06-05T08:53:48.4141241Z","ServerId":"nbtulpar01:26384:faaaf843-c0aa-4620-b1e1-e4aa69f052d8","WorkerId":"8e63dcd4-9ff2-4e56-aab5-7e72c603c8b9"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (416, 110, N'Succeeded', NULL, CAST(N'2023-06-05T08:53:48.530' AS DateTime), N'{"SucceededAt":"2023-06-05T08:53:48.5208828Z","PerformanceDuration":"12","Latency":"201"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (417, 111, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T08:54:03.430' AS DateTime), N'{"EnqueuedAt":"2023-06-05T08:54:03.4304634Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (418, 111, N'Processing', NULL, CAST(N'2023-06-05T08:54:03.440' AS DateTime), N'{"StartedAt":"2023-06-05T08:54:03.4376414Z","ServerId":"nbtulpar01:26384:faaaf843-c0aa-4620-b1e1-e4aa69f052d8","WorkerId":"20198171-0dd6-4097-b3f4-f7b21f1ec61e"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (419, 111, N'Succeeded', NULL, CAST(N'2023-06-05T08:54:03.440' AS DateTime), N'{"SucceededAt":"2023-06-05T08:54:03.4392713Z","PerformanceDuration":"0","Latency":"12"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (420, 112, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T12:32:46.470' AS DateTime), N'{"EnqueuedAt":"2023-06-05T12:32:46.4633542Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (421, 112, N'Processing', NULL, CAST(N'2023-06-05T12:32:46.657' AS DateTime), N'{"StartedAt":"2023-06-05T12:32:46.5650623Z","ServerId":"nbtulpar01:39896:94ca5487-1064-45fd-b96d-2f2105ac962c","WorkerId":"c1400acb-3e00-4214-a31b-6373046b4645"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (422, 112, N'Succeeded', NULL, CAST(N'2023-06-05T12:32:46.683' AS DateTime), N'{"SucceededAt":"2023-06-05T12:32:46.6734187Z","PerformanceDuration":"11","Latency":"209"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (423, 113, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T12:33:17.570' AS DateTime), N'{"EnqueuedAt":"2023-06-05T12:33:17.5580381Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (424, 113, N'Processing', NULL, CAST(N'2023-06-05T12:33:17.737' AS DateTime), N'{"StartedAt":"2023-06-05T12:33:17.6536374Z","ServerId":"nbtulpar01:16100:e1a5445a-b13e-411f-89a5-fd87da820486","WorkerId":"515eb8a6-835b-4bbe-88ef-53699f6ebe28"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (425, 113, N'Succeeded', NULL, CAST(N'2023-06-05T12:33:17.760' AS DateTime), N'{"SucceededAt":"2023-06-05T12:33:17.7523543Z","PerformanceDuration":"11","Latency":"217"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (426, 114, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T12:34:02.680' AS DateTime), N'{"EnqueuedAt":"2023-06-05T12:34:02.6791704Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (427, 114, N'Processing', NULL, CAST(N'2023-06-05T12:34:02.687' AS DateTime), N'{"StartedAt":"2023-06-05T12:34:02.6857629Z","ServerId":"nbtulpar01:16100:e1a5445a-b13e-411f-89a5-fd87da820486","WorkerId":"060d2bde-a4e7-4ccb-9cb0-52cf6ce772be"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (428, 114, N'Succeeded', NULL, CAST(N'2023-06-05T12:34:02.687' AS DateTime), N'{"SucceededAt":"2023-06-05T12:34:02.6874179Z","PerformanceDuration":"0","Latency":"10"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (429, 115, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T12:36:48.367' AS DateTime), N'{"EnqueuedAt":"2023-06-05T12:36:48.3578977Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (430, 115, N'Processing', NULL, CAST(N'2023-06-05T12:36:48.520' AS DateTime), N'{"StartedAt":"2023-06-05T12:36:48.4456256Z","ServerId":"nbtulpar01:55588:f207ab9d-2063-4d20-a3a8-1f1c508f26ab","WorkerId":"db3ac253-8d07-434c-9cb0-fdc4b2699e56"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (431, 115, N'Succeeded', NULL, CAST(N'2023-06-05T12:36:48.540' AS DateTime), N'{"SucceededAt":"2023-06-05T12:36:48.5345264Z","PerformanceDuration":"11","Latency":"176"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (432, 116, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T12:37:03.463' AS DateTime), N'{"EnqueuedAt":"2023-06-05T12:37:03.4627432Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (433, 116, N'Processing', NULL, CAST(N'2023-06-05T12:37:03.463' AS DateTime), N'{"StartedAt":"2023-06-05T12:37:03.4642068Z","ServerId":"nbtulpar01:55588:f207ab9d-2063-4d20-a3a8-1f1c508f26ab","WorkerId":"9b0d218b-355a-438a-a1d5-f3fba0d10984"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (434, 116, N'Succeeded', NULL, CAST(N'2023-06-05T12:37:03.467' AS DateTime), N'{"SucceededAt":"2023-06-05T12:37:03.4651584Z","PerformanceDuration":"0","Latency":"5"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (435, 117, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T12:40:31.427' AS DateTime), N'{"EnqueuedAt":"2023-06-05T12:40:31.4183546Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (436, 117, N'Processing', NULL, CAST(N'2023-06-05T12:40:31.597' AS DateTime), N'{"StartedAt":"2023-06-05T12:40:31.5079581Z","ServerId":"nbtulpar01:10152:d958295d-502d-4bd7-a3b9-8008612e5351","WorkerId":"ed798c64-92e2-4a1e-adf1-315cf0173ebe"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (437, 117, N'Succeeded', NULL, CAST(N'2023-06-05T12:40:31.623' AS DateTime), N'{"SucceededAt":"2023-06-05T12:40:31.6131117Z","PerformanceDuration":"12","Latency":"193"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (438, 118, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T12:41:01.533' AS DateTime), N'{"EnqueuedAt":"2023-06-05T12:41:01.5317057Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (439, 118, N'Processing', NULL, CAST(N'2023-06-05T12:41:01.533' AS DateTime), N'{"StartedAt":"2023-06-05T12:41:01.5335736Z","ServerId":"nbtulpar01:10152:d958295d-502d-4bd7-a3b9-8008612e5351","WorkerId":"0e544a12-b4bd-4a64-bd5e-745f3eef5a37"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (440, 118, N'Succeeded', NULL, CAST(N'2023-06-05T12:41:01.537' AS DateTime), N'{"SucceededAt":"2023-06-05T12:41:01.5351341Z","PerformanceDuration":"0","Latency":"4"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (441, 119, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T12:43:06.063' AS DateTime), N'{"EnqueuedAt":"2023-06-05T12:43:06.0616200Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (442, 119, N'Processing', NULL, CAST(N'2023-06-05T12:43:06.073' AS DateTime), N'{"StartedAt":"2023-06-05T12:43:06.0715105Z","ServerId":"nbtulpar01:10152:d958295d-502d-4bd7-a3b9-8008612e5351","WorkerId":"de0ab59d-170a-4c8a-81d4-ac3b3667aaa6"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (443, 119, N'Succeeded', NULL, CAST(N'2023-06-05T12:43:06.077' AS DateTime), N'{"SucceededAt":"2023-06-05T12:43:06.0765558Z","PerformanceDuration":"0","Latency":"16"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (444, 120, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T12:48:09.883' AS DateTime), N'{"EnqueuedAt":"2023-06-05T12:48:09.8666017Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (445, 120, N'Processing', NULL, CAST(N'2023-06-05T12:48:10.077' AS DateTime), N'{"StartedAt":"2023-06-05T12:48:09.9757375Z","ServerId":"nbtulpar01:1448:f1655bfe-bf55-40ee-8f56-df0f7b4daa7b","WorkerId":"daf2e725-5d7e-48e4-9feb-a79328137a36"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (446, 120, N'Succeeded', NULL, CAST(N'2023-06-05T12:48:10.110' AS DateTime), N'{"SucceededAt":"2023-06-05T12:48:10.0975201Z","PerformanceDuration":"13","Latency":"230"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (447, 121, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T12:49:55.233' AS DateTime), N'{"EnqueuedAt":"2023-06-05T12:49:55.2343175Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (448, 121, N'Processing', NULL, CAST(N'2023-06-05T12:49:55.247' AS DateTime), N'{"StartedAt":"2023-06-05T12:49:55.2441830Z","ServerId":"nbtulpar01:1448:f1655bfe-bf55-40ee-8f56-df0f7b4daa7b","WorkerId":"f9475ec8-cf87-4ff1-8d0e-ebb9e7f826a9"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (449, 121, N'Succeeded', NULL, CAST(N'2023-06-05T12:49:55.247' AS DateTime), N'{"SucceededAt":"2023-06-05T12:49:55.2461864Z","PerformanceDuration":"0","Latency":"15"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (450, 122, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T12:50:10.260' AS DateTime), N'{"EnqueuedAt":"2023-06-05T12:50:10.2614206Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (451, 122, N'Processing', NULL, CAST(N'2023-06-05T12:50:10.270' AS DateTime), N'{"StartedAt":"2023-06-05T12:50:10.2684672Z","ServerId":"nbtulpar01:1448:f1655bfe-bf55-40ee-8f56-df0f7b4daa7b","WorkerId":"5f904cfc-e517-490e-82d7-7ffd7b7ee3ed"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (452, 122, N'Succeeded', NULL, CAST(N'2023-06-05T12:50:10.273' AS DateTime), N'{"SucceededAt":"2023-06-05T12:50:10.2715251Z","PerformanceDuration":"0","Latency":"18"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (453, 123, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T12:51:10.320' AS DateTime), N'{"EnqueuedAt":"2023-06-05T12:51:10.3201606Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (454, 123, N'Processing', NULL, CAST(N'2023-06-05T12:51:10.330' AS DateTime), N'{"StartedAt":"2023-06-05T12:51:10.3284933Z","ServerId":"nbtulpar01:1448:f1655bfe-bf55-40ee-8f56-df0f7b4daa7b","WorkerId":"5a2f1e1f-c9a9-4b9f-9e17-890e0cffe052"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (455, 123, N'Succeeded', NULL, CAST(N'2023-06-05T12:51:10.333' AS DateTime), N'{"SucceededAt":"2023-06-05T12:51:10.3311654Z","PerformanceDuration":"0","Latency":"20"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (456, 124, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T13:45:49.617' AS DateTime), N'{"EnqueuedAt":"2023-06-05T13:45:49.6097286Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (457, 124, N'Processing', NULL, CAST(N'2023-06-05T13:45:49.867' AS DateTime), N'{"StartedAt":"2023-06-05T13:45:49.7220375Z","ServerId":"nbtulpar01:12876:5f637b4d-dedd-49a3-8023-45ac76bd6d08","WorkerId":"6e98f404-14d3-4a33-88e7-5ee2c4ff4b66"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (458, 124, N'Succeeded', NULL, CAST(N'2023-06-05T13:45:49.893' AS DateTime), N'{"SucceededAt":"2023-06-05T13:45:49.8828806Z","PerformanceDuration":"11","Latency":"273"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (459, 125, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T13:46:04.740' AS DateTime), N'{"EnqueuedAt":"2023-06-05T13:46:04.7386515Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (460, 125, N'Processing', NULL, CAST(N'2023-06-05T13:46:04.740' AS DateTime), N'{"StartedAt":"2023-06-05T13:46:04.7402951Z","ServerId":"nbtulpar01:12876:5f637b4d-dedd-49a3-8023-45ac76bd6d08","WorkerId":"3270fa96-ef1a-4f91-80d0-b66c77c227f2"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (461, 125, N'Succeeded', NULL, CAST(N'2023-06-05T13:46:04.743' AS DateTime), N'{"SucceededAt":"2023-06-05T13:46:04.7418020Z","PerformanceDuration":"0","Latency":"4"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (462, 126, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T13:47:04.787' AS DateTime), N'{"EnqueuedAt":"2023-06-05T13:47:04.7860769Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (463, 126, N'Processing', NULL, CAST(N'2023-06-05T13:47:04.797' AS DateTime), N'{"StartedAt":"2023-06-05T13:47:04.7951980Z","ServerId":"nbtulpar01:12876:5f637b4d-dedd-49a3-8023-45ac76bd6d08","WorkerId":"7835a2f3-17c0-4ac6-8d51-92fa881fc3a3"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (464, 126, N'Succeeded', NULL, CAST(N'2023-06-05T13:47:04.800' AS DateTime), N'{"SucceededAt":"2023-06-05T13:47:04.7989984Z","PerformanceDuration":"0","Latency":"15"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (465, 127, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T13:48:04.843' AS DateTime), N'{"EnqueuedAt":"2023-06-05T13:48:04.8417177Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (466, 127, N'Processing', NULL, CAST(N'2023-06-05T13:48:04.850' AS DateTime), N'{"StartedAt":"2023-06-05T13:48:04.8492779Z","ServerId":"nbtulpar01:12876:5f637b4d-dedd-49a3-8023-45ac76bd6d08","WorkerId":"5487bead-11a2-4bc1-9c4b-eb09950957f3"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (467, 127, N'Succeeded', NULL, CAST(N'2023-06-05T13:48:04.853' AS DateTime), N'{"SucceededAt":"2023-06-05T13:48:04.8518038Z","PerformanceDuration":"0","Latency":"11"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (468, 128, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T13:49:04.900' AS DateTime), N'{"EnqueuedAt":"2023-06-05T13:49:04.9011346Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (469, 128, N'Processing', NULL, CAST(N'2023-06-05T13:49:04.913' AS DateTime), N'{"StartedAt":"2023-06-05T13:49:04.9097106Z","ServerId":"nbtulpar01:12876:5f637b4d-dedd-49a3-8023-45ac76bd6d08","WorkerId":"1deda521-05c2-42c1-84b1-96db895cdcb0"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (470, 128, N'Succeeded', NULL, CAST(N'2023-06-05T13:49:04.913' AS DateTime), N'{"SucceededAt":"2023-06-05T13:49:04.9129542Z","PerformanceDuration":"0","Latency":"22"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (471, 129, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-06-05T13:50:04.960' AS DateTime), N'{"EnqueuedAt":"2023-06-05T13:50:04.9605011Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (472, 129, N'Processing', NULL, CAST(N'2023-06-05T13:50:04.970' AS DateTime), N'{"StartedAt":"2023-06-05T13:50:04.9687502Z","ServerId":"nbtulpar01:12876:5f637b4d-dedd-49a3-8023-45ac76bd6d08","WorkerId":"d4b71265-6218-41d9-a402-04736c2630ad"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (473, 129, N'Succeeded', NULL, CAST(N'2023-06-05T13:50:04.973' AS DateTime), N'{"SucceededAt":"2023-06-05T13:50:04.9712442Z","PerformanceDuration":"0","Latency":"21"}')
SET IDENTITY_INSERT [HangFire].[State] OFF
GO
/****** Object:  Index [IX_HangFire_AggregatedCounter_ExpireAt]    Script Date: 05/06/2023 17:22:01 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_AggregatedCounter_ExpireAt] ON [HangFire].[AggregatedCounter]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 05/06/2023 17:22:01 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 05/06/2023 17:22:01 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_ExpireAt] ON [HangFire].[Job]
(
	[ExpireAt] ASC
)
INCLUDE([StateName]) 
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 05/06/2023 17:22:01 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)
WHERE ([StateName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 05/06/2023 17:22:01 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Server_LastHeartbeat]    Script Date: 05/06/2023 17:22:01 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Server_LastHeartbeat] ON [HangFire].[Server]
(
	[LastHeartbeat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 05/06/2023 17:22:01 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Set_Score]    Script Date: 05/06/2023 17:22:01 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Score] ON [HangFire].[Set]
(
	[Key] ASC,
	[Score] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_State_CreatedAt]    Script Date: 05/06/2023 17:22:01 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_State_CreatedAt] ON [HangFire].[State]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [HangFire].[JobParameter]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_JobParameter_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[JobParameter] CHECK CONSTRAINT [FK_HangFire_JobParameter_Job]
GO
ALTER TABLE [HangFire].[State]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_State_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[State] CHECK CONSTRAINT [FK_HangFire_State_Job]
GO
USE [master]
GO
ALTER DATABASE [GDDb] SET  READ_WRITE 
GO
