USE [master]
GO
/****** Object:  Database [Hastane]    Script Date: 5.04.2023 11:55:10 ******/
CREATE DATABASE [Hastane]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hastane', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Hastane.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hastane_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Hastane_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Hastane] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hastane].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hastane] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hastane] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hastane] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hastane] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hastane] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hastane] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hastane] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hastane] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hastane] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hastane] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hastane] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hastane] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hastane] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hastane] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hastane] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hastane] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hastane] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hastane] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hastane] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hastane] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hastane] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hastane] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hastane] SET RECOVERY FULL 
GO
ALTER DATABASE [Hastane] SET  MULTI_USER 
GO
ALTER DATABASE [Hastane] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hastane] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hastane] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hastane] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hastane] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hastane] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Hastane', N'ON'
GO
ALTER DATABASE [Hastane] SET QUERY_STORE = ON
GO
ALTER DATABASE [Hastane] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Hastane]
GO
/****** Object:  Table [dbo].[Doktorlar]    Script Date: 5.04.2023 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doktorlar](
	[DoktorNo] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [varchar](50) NULL,
	[Brans] [varchar](50) NULL,
	[Uzmanlık] [varchar](50) NULL,
	[RaporNo] [int] NULL,
 CONSTRAINT [PK_Doktorlar] PRIMARY KEY CLUSTERED 
(
	[DoktorNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HastaBilgileri]    Script Date: 5.04.2023 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HastaBilgileri](
	[BilgiNo] [int] IDENTITY(1,1) NOT NULL,
	[Teshis] [varchar](50) NOT NULL,
	[MUcret] [int] NULL,
	[Recete] [varchar](50) NULL,
	[TakipDurum] [varchar](50) NULL,
	[HastaNo] [int] NULL,
 CONSTRAINT [PK_HastaBilgileri] PRIMARY KEY CLUSTERED 
(
	[BilgiNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hastalar]    Script Date: 5.04.2023 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hastalar](
	[HastaNo] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [varchar](50) NULL,
	[Yas] [int] NULL,
	[Adres] [varchar](50) NULL,
 CONSTRAINT [PK_Hastalar] PRIMARY KEY CLUSTERED 
(
	[HastaNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 5.04.2023 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanicilar](
	[KullaniciNo] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [varchar](50) NULL,
	[Sifre] [varchar](50) NULL,
 CONSTRAINT [PK_Kullanicilar] PRIMARY KEY CLUSTERED 
(
	[KullaniciNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Raporlar]    Script Date: 5.04.2023 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Raporlar](
	[RaporNo] [int] IDENTITY(1,1) NOT NULL,
	[RaporTanimi] [varchar](50) NULL,
	[OlusturmaTarihi] [varchar](50) NULL,
	[SonTarihi] [varchar](50) NULL,
	[HastaNo] [int] NULL,
 CONSTRAINT [PK_Raporlar] PRIMARY KEY CLUSTERED 
(
	[RaporNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Doktorlar] ON 

INSERT [dbo].[Doktorlar] ([DoktorNo], [AdSoyad], [Brans], [Uzmanlık], [RaporNo]) VALUES (1, N'Ayşe', N'Dahiliye', N'Profesör', 1)
INSERT [dbo].[Doktorlar] ([DoktorNo], [AdSoyad], [Brans], [Uzmanlık], [RaporNo]) VALUES (2, N'Elif', N'Dahiliye', N'Doçent', 2)
SET IDENTITY_INSERT [dbo].[Doktorlar] OFF
GO
SET IDENTITY_INSERT [dbo].[HastaBilgileri] ON 

INSERT [dbo].[HastaBilgileri] ([BilgiNo], [Teshis], [MUcret], [Recete], [TakipDurum], [HastaNo]) VALUES (1, N'Mide Bulantısı', 400, N'ZXC', N'Takipli', 1)
INSERT [dbo].[HastaBilgileri] ([BilgiNo], [Teshis], [MUcret], [Recete], [TakipDurum], [HastaNo]) VALUES (2, N'Ateş', 550, N'QWE', N'Takipsiz', 2)
SET IDENTITY_INSERT [dbo].[HastaBilgileri] OFF
GO
SET IDENTITY_INSERT [dbo].[Hastalar] ON 

INSERT [dbo].[Hastalar] ([HastaNo], [AdSoyad], [Yas], [Adres]) VALUES (1, N'Hilal ÇİL', 29, N'Levent')
INSERT [dbo].[Hastalar] ([HastaNo], [AdSoyad], [Yas], [Adres]) VALUES (2, N'Başak YILMAZ', 25, N'Ümraniye')
INSERT [dbo].[Hastalar] ([HastaNo], [AdSoyad], [Yas], [Adres]) VALUES (3, N'Emre Demir', 47, N'Bakırköy')
SET IDENTITY_INSERT [dbo].[Hastalar] OFF
GO
SET IDENTITY_INSERT [dbo].[Kullanicilar] ON 

INSERT [dbo].[Kullanicilar] ([KullaniciNo], [KullaniciAdi], [Sifre]) VALUES (1, N'Hilal', N'123')
INSERT [dbo].[Kullanicilar] ([KullaniciNo], [KullaniciAdi], [Sifre]) VALUES (2, N'Elif', N'741')
INSERT [dbo].[Kullanicilar] ([KullaniciNo], [KullaniciAdi], [Sifre]) VALUES (3, N'Ayşen', N'456')
SET IDENTITY_INSERT [dbo].[Kullanicilar] OFF
GO
SET IDENTITY_INSERT [dbo].[Raporlar] ON 

INSERT [dbo].[Raporlar] ([RaporNo], [RaporTanimi], [OlusturmaTarihi], [SonTarihi], [HastaNo]) VALUES (1, N'Kontrol', N'Mayıs', N'Haziran', 1)
INSERT [dbo].[Raporlar] ([RaporNo], [RaporTanimi], [OlusturmaTarihi], [SonTarihi], [HastaNo]) VALUES (2, N'Check-up', N'Mart', N'Nisan', 2)
SET IDENTITY_INSERT [dbo].[Raporlar] OFF
GO
ALTER TABLE [dbo].[Doktorlar]  WITH CHECK ADD  CONSTRAINT [FK_Doktorlar_Raporlar] FOREIGN KEY([RaporNo])
REFERENCES [dbo].[Raporlar] ([RaporNo])
GO
ALTER TABLE [dbo].[Doktorlar] CHECK CONSTRAINT [FK_Doktorlar_Raporlar]
GO
ALTER TABLE [dbo].[HastaBilgileri]  WITH CHECK ADD  CONSTRAINT [FK_HastaBilgileri_Hastalar] FOREIGN KEY([HastaNo])
REFERENCES [dbo].[Hastalar] ([HastaNo])
GO
ALTER TABLE [dbo].[HastaBilgileri] CHECK CONSTRAINT [FK_HastaBilgileri_Hastalar]
GO
ALTER TABLE [dbo].[Raporlar]  WITH CHECK ADD  CONSTRAINT [FK_Raporlar_Hastalar] FOREIGN KEY([HastaNo])
REFERENCES [dbo].[Hastalar] ([HastaNo])
GO
ALTER TABLE [dbo].[Raporlar] CHECK CONSTRAINT [FK_Raporlar_Hastalar]
GO
/****** Object:  StoredProcedure [dbo].[DoktorEkle]    Script Date: 5.04.2023 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DoktorEkle] 
@AdSoyad varchar (50),
@Brans varchar (50),
@Uzmanlık varchar(50),
@RaporNo int
as begin 
insert into Doktorlar(AdSoyad ,Brans ,Uzmanlık,RaporNo) values (@AdSoyad ,@Brans ,@Uzmanlık,@RaporNo)
end
GO
/****** Object:  StoredProcedure [dbo].[DoktorListele]    Script Date: 5.04.2023 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DoktorListele]
as begin
select * from Doktorlar  
end
GO
/****** Object:  StoredProcedure [dbo].[DoktorSil]    Script Date: 5.04.2023 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DoktorSil]
@DoktorNo int
as begin 
delete from Doktorlar where DoktorNo =@DoktorNo
end
GO
/****** Object:  StoredProcedure [dbo].[DoktorYenile]    Script Date: 5.04.2023 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DoktorYenile]
@DoktorNo int,
@AdSoyad varchar (50),
@Brans varchar (50),
@Uzmanlık varchar(50),
@RaporNo int
as begin
update Doktorlar set AdSoyad =@AdSoyad ,Brans =@Brans ,Uzmanlık=@Uzmanlık,RaporNo=@RaporNo where DoktorNo =@DoktorNo 
end
GO
/****** Object:  StoredProcedure [dbo].[HastaBilgileriEkle]    Script Date: 5.04.2023 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HastaBilgileriEkle] 
@Teshis varchar (50),
@MUcret money ,
@Recete varchar(50),
@TakipDurum varchar(50),
@HastaNo int
as begin 
insert into HastaBilgileri(Teshis,MUcret ,Recete ,TakipDurum ,HastaNo) values (@Teshis,@MUcret ,@Recete ,@TakipDurum ,@HastaNo)
end
GO
/****** Object:  StoredProcedure [dbo].[HastaBilgileriSil]    Script Date: 5.04.2023 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HastaBilgileriSil]
@BilgiNo int
as begin 
delete from HastaBilgileri where BilgiNo =@BilgiNo
end
GO
/****** Object:  StoredProcedure [dbo].[HastaBilgileriYenile]    Script Date: 5.04.2023 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HastaBilgileriYenile]
@BilgiNo int,
@Teshis varchar (50),
@MUcret money ,
@Recete varchar(50),
@TakipDurum varchar(50),
@HastaNo int
as begin
update HastaBilgileri set Teshis =@Teshis ,MUcret =@MUcret ,Recete=@Recete,TakipDurum=@TakipDurum,HastaNo=@HastaNo where BilgiNo =@BilgiNo 
end
GO
/****** Object:  StoredProcedure [dbo].[HastaBilgisiListele]    Script Date: 5.04.2023 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HastaBilgisiListele]
as begin
select * from HastaBilgileri 
end
GO
/****** Object:  StoredProcedure [dbo].[HastaEkle]    Script Date: 5.04.2023 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HastaEkle] 
@AdSoyad varchar (50),
@Yas int,
@Adres varchar(50)
as begin 
insert into Hastalar (AdSoyad ,Yas ,Adres) values (@AdSoyad ,@Yas ,@Adres)
end
GO
/****** Object:  StoredProcedure [dbo].[HastaListele]    Script Date: 5.04.2023 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HastaListele]
as begin
select * from Hastalar 
end
GO
/****** Object:  StoredProcedure [dbo].[HastaSil]    Script Date: 5.04.2023 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HastaSil]
@HastaNo int
as begin 
delete from Hastalar where HastaNo =@HastaNo
end
GO
/****** Object:  StoredProcedure [dbo].[HastaYenile]    Script Date: 5.04.2023 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HastaYenile]
@HastaNo int,
@AdSoyad varchar (50),
@Yas int,
@Adres varchar(50)
as begin
update Hastalar set AdSoyad =@AdSoyad ,Yas =@Yas ,Adres=@Adres where HastaNo =@HastaNo 
end
GO
/****** Object:  StoredProcedure [dbo].[KullaniciGiris]    Script Date: 5.04.2023 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KullaniciGiris]
@KullaniciAdi varchar(50),
@Sifre varchar(50)
as begin
select * from Kullanicilar where KullaniciAdi =@KullaniciAdi and Sifre=@Sifre
end
GO
/****** Object:  StoredProcedure [dbo].[RaporEkle]    Script Date: 5.04.2023 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RaporEkle] 
@RaporTanimi varchar (50),
@OlusturmaTarihi varchar (50),
@SonTarihi varchar(50),
@HastaNo int
as begin 
insert into Raporlar(RaporTanimi,OlusturmaTarihi,SonTarihi,HastaNo) values (@RaporTanimi,@OlusturmaTarihi,@SonTarihi,@HastaNo)
end
GO
/****** Object:  StoredProcedure [dbo].[RaporListele]    Script Date: 5.04.2023 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RaporListele]
as begin
select * from Raporlar 
end
GO
/****** Object:  StoredProcedure [dbo].[RaporSil]    Script Date: 5.04.2023 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RaporSil]
@RaporNo int
as begin 
delete from Raporlar where RaporNo =@RaporNo
end
GO
/****** Object:  StoredProcedure [dbo].[RaporYenile]    Script Date: 5.04.2023 11:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RaporYenile]
@RaporNo int,
@RaporTanimi varchar (50),
@OlusturmaTarihi varchar (50),
@SonTarihi varchar(50),
@HastaNo int
as begin
update Raporlar set RaporTanimi =@RaporTanimi ,OlusturmaTarihi =@OlusturmaTarihi ,SonTarihi=@SonTarihi,HastaNo=@HastaNo where RaporNo =@RaporNo 
end
GO
USE [master]
GO
ALTER DATABASE [Hastane] SET  READ_WRITE 
GO
