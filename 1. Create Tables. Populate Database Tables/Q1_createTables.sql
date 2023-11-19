USE FIRMA
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DEPARTAMENTE]')
and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[DEPARTAMENTE]

GO

CREATE TABLE DEPARTAMENTE (
IdDept int PRIMARY KEY IDENTITY,
Denumire varchar(20) NOT NULL)
		

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FUNCTII]') and
OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[FUNCTII]

GO

CREATE TABLE FUNCTII (
IdFunctie int PRIMARY KEY IDENTITY,
Denumire varchar(20) NOT NULL,
Salariu decimal)

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ANGAJATI]') and
OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[ANGAJATI]

GO

CREATE TABLE ANGAJATI (
IdAngajat int PRIMARY KEY IDENTITY,
Nume varchar(20) NOT NULL,
Prenume varchar(20) NOT NULL,
Marca int NOT NULL UNIQUE,
DataNasterii date,
DataAngajarii date,
Adresa_jud varchar(20),
IdFunctie int NOT NULL,
IdDept int NOT NULL
)

GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VANZARI]') and
OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[VANZARI]

GO

CREATE TABLE VANZARI (
IdVanzare int PRIMARY KEY IDENTITY,
DataVanz date,
NrProduse int,
PretVanz decimal,
IdProdus int NOT NULL,
IdClient int NOT NULL,
IdAngajat int NOT NULL)

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CLIENTI]') and
OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[CLIENTI]

GO

CREATE TABLE CLIENTI (
IdClient int PRIMARY KEY IDENTITY,
Denumire varchar(20),
Tip_cl varchar(20),
Adresa_jud varchar(20))

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PRODUSE]') and
OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[PRODUSE]

GO

CREATE TABLE PRODUSE (
IdProdus int PRIMARY KEY IDENTITY,
Denumire varchar(20),
IdCateg int NOT NULL)

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CATEGORII_PROD]') and
OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[CATEGORII_PROD]

GO

CREATE TABLE CATEGORII_PROD (
IdCateg int PRIMARY KEY IDENTITY,
Denumire varchar(20))

GO