USE [master]
GO
/****** Object:  Database [MaurianeNgueti_GestioneStrutture]    Script Date: 2/18/2022 3:42:29 PM ******/
CREATE DATABASE [MaurianeNgueti_GestioneStrutture]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MaurianeNgueti_GestioneStrutture', FILENAME = N'C:\Users\m.ngueti.sontsa\MaurianeNgueti_GestioneStrutture.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MaurianeNgueti_GestioneStrutture_log', FILENAME = N'C:\Users\m.ngueti.sontsa\MaurianeNgueti_GestioneStrutture_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MaurianeNgueti_GestioneStrutture].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET ARITHABORT OFF 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET  MULTI_USER 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET QUERY_STORE = OFF
GO
USE [MaurianeNgueti_GestioneStrutture]
GO
/****** Object:  Table [dbo].[Tipologia]    Script Date: 2/18/2022 3:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipologia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pernottamento]    Script Date: 2/18/2022 3:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pernottamento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [nvarchar](50) NOT NULL,
	[Costo] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Strutture]    Script Date: 2/18/2022 3:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Strutture](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
	[Città] [nvarchar](50) NOT NULL,
	[Nazione] [nvarchar](50) NOT NULL,
	[IdTipo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StruttServizi]    Script Date: 2/18/2022 3:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StruttServizi](
	[IdStuttura] [int] NOT NULL,
	[IdServizi] [int] NOT NULL,
	[IdPernottamento] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clienti]    Script Date: 2/18/2022 3:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clienti](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
	[Cognome] [nvarchar](50) NOT NULL,
	[DataNascita] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prenotazioni]    Script Date: 2/18/2022 3:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prenotazioni](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdStruttura] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[DataArrivo] [date] NOT NULL,
	[DataPartenza] [date] NOT NULL,
	[NumPersone] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PrenotazioniView]    Script Date: 2/18/2022 3:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PrenotazioniView]
AS
(
	SELECT DISTINCT
		Cliente           = cl.Nome + ' ' + cl.Cognome,
		DataArrivo        = pr.DataArrivo,
		DataPartenza      = pr.DataPartenza,
		NumeroPersone     = pr.NumPersone,
		Struttura         = s.Nome,
		TipoStruttura     = t.Nome,
		--TipoPernottamento = pn.Tipo,
		PrezzoTotale      = pn.Costo * (SELECT DATEDIFF(day, pr.DataArrivo, pr.DataPartenza)) * pr.NumPersone

	FROM dbo.Prenotazioni AS pr
		JOIN dbo.Strutture AS s
		ON s.Id = pr.IdStruttura
		JOIN dbo.Clienti AS cl
		ON cl.id = pr.IdCliente
		JOIN dbo.Tipologia AS t
		ON t.Id = s.IdTipo
		JOIN dbo.StruttServizi AS ss
		ON s.Id = ss.IdStuttura
		JOIN dbo.Pernottamento AS pn
		ON pn.Id = ss.IdPernottamento
	--WHERE s.Nome = @nomeStruttura
	--	AND cl.Nome = @nomeCliente
)
GO
/****** Object:  View [dbo].[GuadagnoStruttura]    Script Date: 2/18/2022 3:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GuadagnoStruttura]
AS
(
	SELECT
		pv.Struttura,
		SUM(pv.PrezzoTotale) as [Guadagno]
	
	FROM [dbo].[PrenotazioniView] AS pv
	GROUP BY pv.Struttura
)
GO
/****** Object:  Table [dbo].[Servizi]    Script Date: 2/18/2022 3:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servizi](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descrizione] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[StampaStrutture]    Script Date: 2/18/2022 3:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StampaStrutture]
AS
(
	SELECT DISTINCT
		 Struttura         = s.Nome
		,TipoStruttura     = t.Nome
		,Servizi           = sv.Descrizione
		,TipoPernottamento = pn.Tipo

	FROM dbo.Strutture AS s
		 JOIN dbo.Tipologia AS t
		ON t.Id = s.IdTipo
		JOIN dbo.StruttServizi AS ss
		ON s.Id = ss.IdStuttura
		JOIN dbo.Pernottamento AS pn
		ON pn.Id = ss.IdPernottamento
		JOIN dbo.Servizi AS sv
		ON sv.Id = ss.IdServizi
)
GO
SET IDENTITY_INSERT [dbo].[Clienti] ON 

INSERT [dbo].[Clienti] ([id], [Nome], [Cognome], [DataNascita]) VALUES (1, N'Marco', N'Rossi', CAST(N'1992-09-17' AS Date))
INSERT [dbo].[Clienti] ([id], [Nome], [Cognome], [DataNascita]) VALUES (2, N'Anna', N'Forchetta', CAST(N'1985-11-27' AS Date))
INSERT [dbo].[Clienti] ([id], [Nome], [Cognome], [DataNascita]) VALUES (3, N'Demetrio', N'Scinardo', CAST(N'1980-06-30' AS Date))
INSERT [dbo].[Clienti] ([id], [Nome], [Cognome], [DataNascita]) VALUES (4, N'Cinzia', N'Lambert', CAST(N'1995-05-29' AS Date))
INSERT [dbo].[Clienti] ([id], [Nome], [Cognome], [DataNascita]) VALUES (5, N'Pino', N'Sgorbissa', CAST(N'1972-02-18' AS Date))
SET IDENTITY_INSERT [dbo].[Clienti] OFF
GO
SET IDENTITY_INSERT [dbo].[Pernottamento] ON 

INSERT [dbo].[Pernottamento] ([Id], [Tipo], [Costo]) VALUES (1, N'Solo Pernottamento', 70)
INSERT [dbo].[Pernottamento] ([Id], [Tipo], [Costo]) VALUES (2, N'Pernottamento e Prima Colazione', 80)
INSERT [dbo].[Pernottamento] ([Id], [Tipo], [Costo]) VALUES (3, N'Mezza Pensione', 90)
INSERT [dbo].[Pernottamento] ([Id], [Tipo], [Costo]) VALUES (4, N'Pensione Completa', 180)
SET IDENTITY_INSERT [dbo].[Pernottamento] OFF
GO
SET IDENTITY_INSERT [dbo].[Prenotazioni] ON 

INSERT [dbo].[Prenotazioni] ([Id], [IdStruttura], [IdCliente], [DataArrivo], [DataPartenza], [NumPersone]) VALUES (1, 1, 1, CAST(N'2022-02-22' AS Date), CAST(N'2022-02-23' AS Date), 2)
INSERT [dbo].[Prenotazioni] ([Id], [IdStruttura], [IdCliente], [DataArrivo], [DataPartenza], [NumPersone]) VALUES (2, 2, 2, CAST(N'2022-02-18' AS Date), CAST(N'2022-02-25' AS Date), 2)
INSERT [dbo].[Prenotazioni] ([Id], [IdStruttura], [IdCliente], [DataArrivo], [DataPartenza], [NumPersone]) VALUES (3, 3, 3, CAST(N'2021-10-15' AS Date), CAST(N'2022-10-19' AS Date), 1)
INSERT [dbo].[Prenotazioni] ([Id], [IdStruttura], [IdCliente], [DataArrivo], [DataPartenza], [NumPersone]) VALUES (4, 4, 4, CAST(N'2021-08-15' AS Date), CAST(N'2021-09-02' AS Date), 3)
INSERT [dbo].[Prenotazioni] ([Id], [IdStruttura], [IdCliente], [DataArrivo], [DataPartenza], [NumPersone]) VALUES (5, 2, 5, CAST(N'2021-12-18' AS Date), CAST(N'2021-12-19' AS Date), 2)
INSERT [dbo].[Prenotazioni] ([Id], [IdStruttura], [IdCliente], [DataArrivo], [DataPartenza], [NumPersone]) VALUES (6, 4, 4, CAST(N'2022-03-22' AS Date), CAST(N'2022-03-28' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Prenotazioni] OFF
GO
SET IDENTITY_INSERT [dbo].[Servizi] ON 

INSERT [dbo].[Servizi] ([Id], [Descrizione]) VALUES (1, N'Piscina')
INSERT [dbo].[Servizi] ([Id], [Descrizione]) VALUES (2, N'Wifi')
INSERT [dbo].[Servizi] ([Id], [Descrizione]) VALUES (3, N'CassaForte')
INSERT [dbo].[Servizi] ([Id], [Descrizione]) VALUES (4, N'Spa&Centro Benessere')
INSERT [dbo].[Servizi] ([Id], [Descrizione]) VALUES (5, N'Animali Ammessi')
SET IDENTITY_INSERT [dbo].[Servizi] OFF
GO
INSERT [dbo].[StruttServizi] ([IdStuttura], [IdServizi], [IdPernottamento]) VALUES (1, 2, 1)
INSERT [dbo].[StruttServizi] ([IdStuttura], [IdServizi], [IdPernottamento]) VALUES (1, 4, 1)
INSERT [dbo].[StruttServizi] ([IdStuttura], [IdServizi], [IdPernottamento]) VALUES (1, 1, 4)
INSERT [dbo].[StruttServizi] ([IdStuttura], [IdServizi], [IdPernottamento]) VALUES (2, 1, 2)
INSERT [dbo].[StruttServizi] ([IdStuttura], [IdServizi], [IdPernottamento]) VALUES (2, 2, 3)
INSERT [dbo].[StruttServizi] ([IdStuttura], [IdServizi], [IdPernottamento]) VALUES (2, 3, 4)
INSERT [dbo].[StruttServizi] ([IdStuttura], [IdServizi], [IdPernottamento]) VALUES (2, 4, 1)
INSERT [dbo].[StruttServizi] ([IdStuttura], [IdServizi], [IdPernottamento]) VALUES (3, 2, 1)
INSERT [dbo].[StruttServizi] ([IdStuttura], [IdServizi], [IdPernottamento]) VALUES (3, 5, 3)
INSERT [dbo].[StruttServizi] ([IdStuttura], [IdServizi], [IdPernottamento]) VALUES (3, 1, 2)
INSERT [dbo].[StruttServizi] ([IdStuttura], [IdServizi], [IdPernottamento]) VALUES (4, 1, 1)
INSERT [dbo].[StruttServizi] ([IdStuttura], [IdServizi], [IdPernottamento]) VALUES (4, 5, 2)
INSERT [dbo].[StruttServizi] ([IdStuttura], [IdServizi], [IdPernottamento]) VALUES (4, 3, 3)
INSERT [dbo].[StruttServizi] ([IdStuttura], [IdServizi], [IdPernottamento]) VALUES (4, 4, 4)
GO
SET IDENTITY_INSERT [dbo].[Strutture] ON 

INSERT [dbo].[Strutture] ([Id], [Nome], [Città], [Nazione], [IdTipo]) VALUES (1, N'Casa Relax', N'Milano Malpensa', N'Italia', 1)
INSERT [dbo].[Strutture] ([Id], [Nome], [Città], [Nazione], [IdTipo]) VALUES (2, N'BlueLake Inn', N'Parigi', N'Francia', 2)
INSERT [dbo].[Strutture] ([Id], [Nome], [Città], [Nazione], [IdTipo]) VALUES (3, N'Piccolo Nido', N'Milano Bergamo', N'Italia', 3)
INSERT [dbo].[Strutture] ([Id], [Nome], [Città], [Nazione], [IdTipo]) VALUES (4, N'Residenza Miro', N'Bruxelles', N'Belgio', 4)
SET IDENTITY_INSERT [dbo].[Strutture] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipologia] ON 

INSERT [dbo].[Tipologia] ([Id], [Nome]) VALUES (1, N'Agriturismi')
INSERT [dbo].[Tipologia] ([Id], [Nome]) VALUES (2, N'Hotel')
INSERT [dbo].[Tipologia] ([Id], [Nome]) VALUES (3, N'Case Vacanze')
INSERT [dbo].[Tipologia] ([Id], [Nome]) VALUES (4, N'Residenze')
SET IDENTITY_INSERT [dbo].[Tipologia] OFF
GO
ALTER TABLE [dbo].[Prenotazioni]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clienti] ([id])
GO
ALTER TABLE [dbo].[Prenotazioni]  WITH CHECK ADD FOREIGN KEY([IdStruttura])
REFERENCES [dbo].[Strutture] ([Id])
GO
ALTER TABLE [dbo].[StruttServizi]  WITH CHECK ADD FOREIGN KEY([IdPernottamento])
REFERENCES [dbo].[Pernottamento] ([Id])
GO
ALTER TABLE [dbo].[StruttServizi]  WITH CHECK ADD FOREIGN KEY([IdServizi])
REFERENCES [dbo].[Servizi] ([Id])
GO
ALTER TABLE [dbo].[StruttServizi]  WITH CHECK ADD FOREIGN KEY([IdStuttura])
REFERENCES [dbo].[Strutture] ([Id])
GO
ALTER TABLE [dbo].[Strutture]  WITH CHECK ADD  CONSTRAINT [FK_Strutt_Tipologia] FOREIGN KEY([IdTipo])
REFERENCES [dbo].[Tipologia] ([Id])
GO
ALTER TABLE [dbo].[Strutture] CHECK CONSTRAINT [FK_Strutt_Tipologia]
GO
ALTER TABLE [dbo].[Pernottamento]  WITH CHECK ADD  CONSTRAINT [Chk_Tipo] CHECK  (([Tipo]='Pensione Completa' OR [Tipo]='Mezza Pensione' OR [Tipo]='Pernottamento e Prima Colazione' OR [Tipo]='Solo Pernottamento'))
GO
ALTER TABLE [dbo].[Pernottamento] CHECK CONSTRAINT [Chk_Tipo]
GO
ALTER TABLE [dbo].[Servizi]  WITH CHECK ADD  CONSTRAINT [Chk_Descr] CHECK  (([Descrizione]='Animali Ammessi' OR [Descrizione]='Spa&Centro Benessere' OR [Descrizione]='CassaForte' OR [Descrizione]='Wifi' OR [Descrizione]='Piscina'))
GO
ALTER TABLE [dbo].[Servizi] CHECK CONSTRAINT [Chk_Descr]
GO
ALTER TABLE [dbo].[Tipologia]  WITH CHECK ADD  CONSTRAINT [Chk_Nome] CHECK  (([Nome]='Residenze' OR [Nome]='Case Vacanze' OR [Nome]='Hotel' OR [Nome]='Agriturismi'))
GO
ALTER TABLE [dbo].[Tipologia] CHECK CONSTRAINT [Chk_Nome]
GO
/****** Object:  StoredProcedure [dbo].[GestionePrenotazione]    Script Date: 2/18/2022 3:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GestionePrenotazione]
@idStruttura int, @idCliente int, @dataArrivo date, @dataPartenza date, @numPersone int
AS

INSERT INTO dbo.Prenotazioni
VALUES (@idStruttura, @idCliente, @dataArrivo, @dataPartenza, @numPersone)

SELECT
	s.Nome AS Struttura,
	Cliente  = cl.Nome + ' ' + cl.Cognome,
	pr.DataArrivo,
	pr.DataPartenza,
	pr.NumPersone
FROM dbo.Prenotazioni AS pr
JOIN dbo.Strutture AS s
ON s.Id = pr.IdStruttura
JOIN dbo.Clienti AS cl
ON cl.id = pr.IdCliente
GO
/****** Object:  StoredProcedure [dbo].[StruttureByPernottamento]    Script Date: 2/18/2022 3:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StruttureByPernottamento]
@pernottamento nvarchar(50)
AS

SELECT 
	s.Nome AS NomeStruttura,
	s.Città,
	s.IdTipo
FROM dbo.StruttServizi AS ss
JOIN dbo.Pernottamento AS pn
ON pn.Id = ss.IdPernottamento
JOIN dbo.Strutture AS s
ON s.Id = ss.IdStuttura
WHERE pn.Tipo = @pernottamento
GO
/****** Object:  StoredProcedure [dbo].[StruttureByServizi]    Script Date: 2/18/2022 3:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StruttureByServizi]
@servizio nvarchar(50)
AS

SELECT
	st.Nome AS NomeStruttura,
	st.Città,
	se.Descrizione AS Servizio
FROM dbo.StruttServizi AS ss
JOIN dbo.Servizi AS se
ON se.Id = ss.IdServizi
JOIN dbo.Strutture AS st
ON st.Id = ss.IdStuttura
WHERE se.Descrizione = @servizio
GO
/****** Object:  StoredProcedure [dbo].[StruttureByTipologia]    Script Date: 2/18/2022 3:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StruttureByTipologia]
@tipologia nvarchar(50)
AS

SELECT 
	s.Nome AS NomeStruttura,
	s.Città,
	t.Nome AS Tipologia
FROM dbo.Strutture AS s
JOIN dbo.Tipologia AS t
ON t.Id = s.IdTipo
WHERE t.Nome = @tipologia
GO
USE [master]
GO
ALTER DATABASE [MaurianeNgueti_GestioneStrutture] SET  READ_WRITE 
GO
