create database MaurianeNgueti_GestioneStrutture;

use MaurianeNgueti_GestioneStrutture;


create table [dbo].[Tipologia]
(
	[Id] [int] primary key identity(1,1) not null,
	[Nome] [nvarchar](50) not null,

	constraint Chk_Nome check(Nome in ('Agriturismi', 'Hotel', 'Case Vacanze', 'Residenze'))
)

----- Inserire Tipo Di Struttura -----
INSERT INTO [dbo].[Tipologia]
			(Nome)
VALUES ('Agriturismi'),
	   ('Hotel'),
	   ('Case Vacanze'),
	   ('Residenze')


create table [dbo].[Servizi]
(
	[Id] [int] primary key identity(1,1) not null,
	[Descrizione] [nvarchar](50) not null,

	constraint Chk_Descr check(Descrizione in ('Piscina', 'Wifi', 'CassaForte', 'Spa&Centro Benessere', 'Animali Ammessi'))
)

----- Inserire Servizi -----
INSERT INTO dbo.Servizi
	   (Descrizione)
VALUES ('Piscina'),
	   ('Wifi'),
	   ('CassaForte'),
	   ('Spa&Centro Benessere'),
	   ('Animali Ammessi')


create table [dbo].[Pernottamento]
(
	[Id] [int] primary key identity(1,1) not null,
	[Tipo] [nvarchar](50) not null,
	[Costo] [float] not null,

	constraint Chk_Tipo check(Tipo in ('Solo Pernottamento', 'Pernottamento e Prima Colazione', 'Mezza Pensione', 'Pensione Completa'))
)

----- Inserire Pernottamento -----
INSERT INTO dbo.Pernottamento
	   (Tipo, Costo)
VALUES ('Solo Pernottamento', 70.00),
       ('Pernottamento e Prima Colazione', 80.00),
	   ('Mezza Pensione', 90.00),
	   ('Pensione Completa', 180.00)


create table [dbo].[Strutture]
(
	[Id] [int] primary key identity(1,1) not null,
	[Nome] [nvarchar](50) not null,
	[Città] [nvarchar](50) not null,
	[Nazione] [nvarchar](50) not null,
	[IdTipo] [int] not null,

	constraint FK_Strutt_Tipologia foreign key (IdTipo) references [dbo].[Tipologia](Id),
)

INSERT INTO dbo.Strutture
	   (Nome, Città, Nazione, IdTipo)
VALUES ('Casa Relax', 'Milano Malpensa', 'Italia', 1),
	   ('BlueLake Inn', 'Parigi', 'Francia', 2),
	   ('Piccolo Nido', 'Milano Bergamo', 'Italia', 3),
	   ('Residenza Miro', 'Bruxelles', 'Belgio', 4)
	   

create table StruttServizi
(
	[IdStuttura] [int] not null foreign key references [dbo].[Strutture](Id),
	[IdServizi] [int] not null foreign key references [dbo].[Servizi](Id),
	[IdPernottamento] [int] not null foreign key references [dbo].[Pernottamento](Id)
)

INSERT INTO StruttServizi
	   (IdStuttura, IdServizi, IdPernottamento)
VALUES (1, 2, 1),
	   (1, 4, 1),
	   (1, 1, 4),
	   (2, 1, 2),
	   (2, 2, 3),
	   (2, 3, 4),
	   (2, 4, 1),
	   (3, 2, 1),
	   (3, 5, 3),
	   (3, 1, 2),
	   (4, 1, 1),
	   (4, 5, 2),
	   (4, 3, 3),
	   (4, 4, 4)


create table Clienti
(
	[id] [int] primary key identity(1,1) not null,
	[Nome] [nvarchar](50) not null,
	[Cognome] [nvarchar](50) not null,
	[DataNascita] [date] not null
)

----- Inserire Cliente -----
INSERT INTO dbo.Clienti
       (Nome, Cognome, DataNascita)
VALUES ('Marco', 'Rossi', '1992-09-17'),
       ('Anna', 'Forchetta', '1985-11-27'),
	   ('Demetrio', 'Scinardo', '1980-06-30'),
	   ('Cinzia', 'Lambert', '1995-05-29'),
	   ('Pino', 'Sgorbissa', '1972-02-18')

create table Prenotazioni
(
	[Id] [int] primary key identity(1,1) not null,
	[IdStruttura] [int] not null foreign key references [dbo].[Strutture](Id),
	[IdCliente] [int] not null foreign key references [dbo].[Clienti](Id),
	[DataArrivo] [date] not null,
	[DataPartenza] [date] not null,
	[NumPersone] [int] not null
)

INSERT INTO dbo.Prenotazioni
	   (IdStruttura, IdCliente, DataArrivo, DataPartenza, NumPersone)
VALUES (1, 1, '2022-02-22', '2022-02-23', 2),
	   (2, 2, '2022-02-18', '2022-02-25', 2),
	   (3, 3, '2021-10-15', '2022-10-19', 1),
	   (4, 4, '2021-08-15', '2021-09-02', 3),
	   (2, 5, '2021-12-18', '2021-12-19', 2)


--Creare una stored procedure che, scelto un servizio, mostri tutte le strutture che lo offrono.

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

EXEC StruttureByServizi @servizio;

--Creare una stored procedure che, scelto un tipo di struttura, mostri le strutture di quel tipo.

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

EXEC StruttureByTipologia @tipologia;

--Creare una stored procedure che, scelto un tipo di pernottamento, mostri le strutture di quel tipo.

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

EXEC StruttureByPernottamento @pernottamento;

--Creare una stored procedure che scelta una struttura, una data di arrivo, una data di partenza 
--e il numero di persone per cui si vuole prenotare, salvi le informazioni in una tabella 
--chiamata Prenotazioni.

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

EXEC GestionePrenotazione @idStruttura, @idCliente, @DataArrivo, @DataPartenza, @numPersone;


--Creare una vista che mostri tutte le prenotazioni(cliente, data arrivo, data partenza, numero persone,
--nome struttura, tipo struttura, totale(prezzo * giorni * persone)

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
)

SELECT * FROM dbo.PrenotazioniView

--Creare una vista che mostri il guadagno di ogni struttura.

CREATE VIEW [dbo].[GuadagnoStruttura]
AS
(
	SELECT
		pv.Struttura,
		SUM(pv.PrezzoTotale) as [Guadagno]
	
	FROM [dbo].[PrenotazioniView] AS pv
	GROUP BY pv.Struttura
)

select * from dbo.GuadagnoStruttura

--Creare una vista mostri tutti le strutture disponibili, la tipologia della struttura,
--i servizi offerti separati da virgola, le tipologie di pernottamento con i relativi prezzi.

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

select * from dbo.StampaStrutture


----- ESECUZIONE DELLE QUERY ------

EXEC StruttureByServizi 'Piscina';
EXEC StruttureByTipologia 'Hotel';
EXEC StruttureByPernottamento 'Solo Pernottamento';
EXEC GestionePrenotazione 4, 4, '2022-03-22', '2022-03-28', 1;