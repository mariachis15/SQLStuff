USE firma_L4
GO

--Să se populeze tabela Vanzari, cu cel puțin 15 înregistrări cât mai variate.

INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (1, 1, 13, '01/10/2011', 5, 61);
INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (2, 2, 13, '02/12/2012', 10, 600);
INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (3, 3, 13, '03/14/2013', 15, 1000);
INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (4, 4, 13, '04/18/2014', 6, 33);
INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (5, 5, 13, '05/20/2015', 18, 1110);
INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (6, 6, 14, '06/02/2016', 12, 600);
INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (7, 7, 14, '07/11/2017', 2, 400);
INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (8, 8, 14, '08/23/2018', 9, 1230);
INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (9, 9, 14, '09/27/2019', 10, 2300);
INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (10, 10, 14, '10/30/2016', 22, 9000);
INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (11, 1, 15, '11/28/2020', 11, 230);
INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (12, 2, 15, '12/08/2021', 3, 43);
INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (13, 3, 15, '01/22/2022', 2, 90);
INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (14, 4, 15, '02/26/2023', 1, 87);
INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (15, 5, 15, '03/27/2023', 8, 1000);


 --Să se șteargă toți clienții dintr-un anumit judet.

 DELETE FROM CLIENTI WHERE Adresa_jud = 'Timisoara'; --am sters un client care nu a cumparat nimic.

 --Pentru a sterge un client care a facut cumparaturi am facut o steregere cascada astfel: 

ALTER TABLE [dbo].[VANZARI] DROP CONSTRAINT [FK_VANZARI_CLIENTI]
GO

ALTER TABLE [dbo].[VANZARI]  WITH CHECK ADD  CONSTRAINT [FK_VANZARI_CLIENTI] FOREIGN KEY([IDClient])
REFERENCES [dbo].[CLIENTI] ([IdClient]) ON DELETE CASCADE
GO

ALTER TABLE [dbo].[VANZARI] CHECK CONSTRAINT [FK_VANZARI_CLIENTI]


DELETE FROM CLIENTI WHERE Adresa_jud = 'Bihor'; --clientii din Bihor impreuna cu vanzarile la care au fost participanti s-au sters 

-- Să se șteargă toate vânzările mai vechi de 1 an.

DELETE FROM VANZARI WHERE DATEDIFF(year, DataVanz, GETDATE()) > 1;

-- Să se șteargă angajații din departamentul PROIECTARE, angajați dupa 01.01.2018 (se folosește funcția DATEDIFF).

DELETE FROM ANGAJATI WHERE IdDept = 3 AND DATEDIFF(dy, '01/01/2018', DataAngajarii) > 1;

-- Să se transfere toți angajații cu vechime mai mare de 5 ani, din departamentul PRODUCTIE în departamentul VANZARI.

INSERT INTO ANGAJATI(Nume, Prenume, Marca, DataNasterii, DataAngajarii, Adresa_jud, IdFunctie, IdDept) VALUES ('N50', 'P50', 100, '10/20/1981', '10/15/2023', 'Bihor', 2, 2);
INSERT INTO ANGAJATI(Nume, Prenume, Marca, DataNasterii, DataAngajarii, Adresa_jud, IdFunctie, IdDept) VALUES ('N51', 'P51', 101, '10/20/1981', '10/15/2022', 'Bihor', 2, 2);
INSERT INTO ANGAJATI(Nume, Prenume, Marca, DataNasterii, DataAngajarii, Adresa_jud, IdFunctie, IdDept) VALUES ('N52', 'P52', 102, '10/20/1981', '10/15/2012', 'Bihor', 2, 2);
INSERT INTO ANGAJATI(Nume, Prenume, Marca, DataNasterii, DataAngajarii, Adresa_jud, IdFunctie, IdDept) VALUES ('N53', 'P53', 103, '10/20/1981', '10/15/2014', 'Bihor', 2, 2);
INSERT INTO ANGAJATI(Nume, Prenume, Marca, DataNasterii, DataAngajarii, Adresa_jud, IdFunctie, IdDept) VALUES ('N54', 'P54', 104, '10/20/1981', '10/15/2013', 'Bihor', 2, 2);

UPDATE ANGAJATI SET IdDept = 4 WHERE IdDept = 2 AND DATEDIFF(yyyy, DataAngajarii, GETDATE()) > 5;


 --Să se adauge secvența ’-v2’ (se folosește funcția CONCAT) la toate denumirile de produse cu valoarea cheii primare numere impare.

 UPDATE PRODUSE SET Denumire = CONCAT(Denumire, '-v2') WHERE (IdProdus % 2) = 1;

-- Să se modifice prețul de vânzare (creștere cu 10%) la toate produsele din categoria ADAPTOARE vândute după o anumită dată (Am ales data: 02/10/2017)

INSERT INTO PRODUSE(Denumire, IDCateg) VALUES ('Adaptor 1', 2);
INSERT INTO PRODUSE(Denumire, IDCateg) VALUES ('Adaptor 2', 2);
INSERT INTO PRODUSE(Denumire, IDCateg) VALUES ('Adaptor 3', 2);
INSERT INTO PRODUSE(Denumire, IDCateg) VALUES ('Adaptor 4', 2);
INSERT INTO PRODUSE(Denumire, IDCateg) VALUES ('Adaptor 5', 2);

INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (25, 1, 13, '02/15/2018', 1, 10);
INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (25, 2, 14, '02/16/2019', 2, 20);
INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (26, 3, 15, '02/17/2020', 3, 30);
INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (27, 5, 13, '02/19/2022', 4, 40);
INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (28, 5, 15, '02/20/2023', 5, 50);


UPDATE VANZARI SET PretVanz = PretVanz * 0.1 + PretVanz WHERE DATEDIFF(day, '02/10/2017', GETDATE()) > 0 AND IDProdus > = 7 AND IDProdus < = 9 OR IDProdus > = 25 AND IDProdus < = 28; 