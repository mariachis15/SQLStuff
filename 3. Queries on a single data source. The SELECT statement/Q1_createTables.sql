
USE firma_L5
GO

--Tabela Departamente
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DEPARTAMENTE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DEPARTAMENTE]
GO

CREATE TABLE DEPARTAMENTE (
 IdDept int PRIMARY KEY IDENTITY,
 Denumire varchar(30) NOT NULL
)
GO


-- Tabela Functii
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FUNCTII]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FUNCTII]
GO

CREATE TABLE FUNCTII (
 IdFunctie int PRIMARY KEY IDENTITY,
 Denumire varchar(30) NOT NULL,
 Salariu int CHECK (Salariu > 0)
)
GO


-- Tabela Angajati
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ANGAJATI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ANGAJATI]
GO

CREATE TABLE ANGAJATI (
 IdAngajat int PRIMARY KEY IDENTITY,
 Nume varchar(20) NOT NULL,
 Prenume varchar(20) NOT NULL,
 Marca int NOT NULL UNIQUE,
 DataNasterii date,
 DataAngajarii date,
 Adresa_jud varchar(20) NOT NULL,
 IdFunctie int NOT NULL,
 IdDept int NOT NULL
)
GO


-- Tabela Clienti
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CLIENTI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CLIENTI]
GO

CREATE TABLE CLIENTI (
 IdClient int PRIMARY KEY IDENTITY,
 Denumire varchar(20) NOT NULL,
 Tip_cl varchar(10) NOT NULL, -- PF, PFA, SRL, SA, RA
 Adresa_jud varchar(20) NOT NULL
)
GO


-- Tabela Categorii_prod
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CATEGORII_PROD]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CATEGORII_PROD]
GO

CREATE TABLE CATEGORII_PROD (
 IdCateg int PRIMARY KEY IDENTITY,
 Denumire varchar(20) NOT NULL
)
GO


-- Tabela Produse
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PRODUSE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PRODUSE]
GO

CREATE TABLE PRODUSE (
 IdProdus int PRIMARY KEY IDENTITY,
 Denumire varchar(36) NOT NULL,
 IdCateg int NOT NULL
)
GO


-- Tabela Vanzari
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VANZARI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[VANZARI]
GO

CREATE TABLE VANZARI (
 IdVanzare int PRIMARY KEY IDENTITY,
 IDProdus int NOT NULL,
 IDClient int NOT NULL,
 IDVanzator int NOT NULL,
 DataVanz date DEFAULT GetDate(),
 NrProduse int DEFAULT 1 CHECK (NrProduse > 0),
 PretVanz int CHECK (PretVanz > 0)
)
GO
