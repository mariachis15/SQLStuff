USE FIRMA
GO

INSERT INTO Departamente (Denumire) VALUES ('MANAGEMENT')
INSERT INTO Departamente (Denumire) VALUES ('RESURSE UMANE')
INSERT INTO Departamente (Denumire) VALUES ('IT')

GO

INSERT INTO Functii (Denumire, Salariu) VALUES ('MANAGER', 10000)
INSERT INTO Functii (Denumire, Salariu) VALUES ('INGINER', 6000)
INSERT INTO Functii (Denumire, Salariu) VALUES ('HR', 4500)
INSERT INTO FUNCTII (Denumire, Salariu) VALUES ('Programator', 8000)

GO

INSERT INTO ANGAJATI(Nume, Prenume, Marca, DataNasterii, DataAngajarii, 
Adresa_jud, IdFunctie, IdDept) 
VALUES ('Andreea', 'Ciurdurean', 1, '11/21/1978', '12/31/2002', 'Bucuresti', 1, 1);
INSERT INTO ANGAJATI(Nume, Prenume, Marca, DataNasterii, DataAngajarii, 
Adresa_jud, IdFunctie, IdDept) 
VALUES ('Eusebiu', 'Florean', 2, '10/03/2001', '07/16/2021','Cluj', 4, 4)
INSERT INTO ANGAJATI(Nume, Prenume, Marca, DataNasterii, DataAngajarii, 
Adresa_jud, IdFunctie, IdDept) 
VALUES ('Maria', 'Chis', 3, '03/15/2002', '08/11/2023','Maramures', 3, 3)
INSERT INTO ANGAJATI(Nume, Prenume, Marca, DataNasterii, DataAngajarii, 
Adresa_jud, IdFunctie, IdDept) 
VALUES ('Alexandru', 'Vancea', 4, '01/17/1992', '12/20/2000', 'Sibiu', 1, 3);
INSERT INTO ANGAJATI(Nume, Prenume, Marca, DataNasterii, DataAngajarii, 
Adresa_jud, IdFunctie, IdDept) 
VALUES ('Elena', 'Vasiliu', 5, '03/28/1999', '05/26/2020','Targu-Mures', 4, 1)
INSERT INTO ANGAJATI(Nume, Prenume, Marca, DataNasterii, DataAngajarii, 
Adresa_jud, IdFunctie, IdDept) 
VALUES ('Simona', 'Mihai', 6, '09/30/1984', '10/19/2006','Timisoara', 3, 4)

GO

INSERT INTO CATEGORII_PROD(Denumire) VALUES ('Accesorii')
INSERT INTO CATEGORII_PROD(Denumire) VALUES ('Electronice')
INSERT INTO CATEGORII_PROD(Denumire) VALUES ('Electrocasnice')

GO 
INSERT INTO PRODUSE(Denumire, IdCateg) VALUES ('Aspirator', 3)
INSERT INTO PRODUSE(Denumire, IdCateg) VALUES ('Geanta laptop', 1)
INSERT INTO PRODUSE(Denumire, IdCateg) VALUES ('Televizor', 2)
INSERT INTO PRODUSE(Denumire, IdCateg) VALUES ('Masina de spalat', 3)
INSERT INTO PRODUSE(Denumire, IdCateg) VALUES ('Husa telefon', 1)
INSERT INTO PRODUSE(Denumire, IdCateg) VALUES ('Boxa portabila', 2)
INSERT INTO PRODUSE(Denumire, IdCateg) VALUES ('Cuptor cu microunde', 3)
INSERT INTO PRODUSE(Denumire, IdCateg) VALUES ('Telecomanda', 1)
INSERT INTO PRODUSE(Denumire, IdCateg) VALUES ('Monitor', 2)

GO

INSERT INTO CLIENTI(Denumire, Tip_cl, Adresa_jud) VALUES ('Client1', 'activ', 'Cluj')
INSERT INTO CLIENTI(Denumire, Tip_cl, Adresa_jud) VALUES ('Client2', 'activ', 'Sibiu')
INSERT INTO CLIENTI(Denumire, Tip_cl, Adresa_jud) VALUES ('Client3', 'activ', 'Bucuresti')

GO

INSERT INTO VANZARI(DataVanz, NrProduse, PretVanz, IdAngajat, IdClient, IdProdus) VALUES ('06/21/2021', 6, 2900, 1, 2, 1)
INSERT INTO VANZARI(DataVanz, NrProduse, PretVanz, IdAngajat, IdClient, IdProdus) VALUES ('02/11/2020', 2, 300, 3, 2, 1)
INSERT INTO VANZARI(DataVanz, NrProduse, PretVanz, IdAngajat, IdClient, IdProdus) VALUES ('11/01/2019', 3, 1000, 4, 1, 2)
INSERT INTO VANZARI(DataVanz, NrProduse, PretVanz, IdAngajat, IdClient, IdProdus) VALUES ('02/18/2011', 4, 900, 1, 1, 2)

INSERT INTO VANZARI(DataVanz, NrProduse, PretVanz, IdAngajat, IdClient, IdProdus) VALUES ('06/02/2021', 1, 2350, 2, 3, 4)
INSERT INTO VANZARI(DataVanz, NrProduse, PretVanz, IdAngajat, IdClient, IdProdus) VALUES ('12/11/2021', 5, 1670, 5, 3, 4)
INSERT INTO VANZARI(DataVanz, NrProduse, PretVanz, IdAngajat, IdClient, IdProdus) VALUES ('05/27/2021', 2, 280, 6, 2, 3)
INSERT INTO VANZARI(DataVanz, NrProduse, PretVanz, IdAngajat, IdClient, IdProdus) VALUES ('09/02/2021', 6, 8900, 4, 2, 3)
INSERT INTO VANZARI(DataVanz, NrProduse, PretVanz, IdAngajat, IdClient, IdProdus) VALUES ('07/12/2021', 10, 9800, 1, 1, 5)
INSERT INTO VANZARI(DataVanz, NrProduse, PretVanz, IdAngajat, IdClient, IdProdus) VALUES ('11/13/2021', 1, 500, 2, 2, 5)

GO