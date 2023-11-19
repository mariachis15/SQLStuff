USE firma_L6
GO

-- Care sunt angajații a căror funcții conține secvența de caractere ‘ngi’ ?

 SELECT A.nume, A.prenume, F.denumire 
	FROM Angajati A JOIN Functii F ON (A.IdFunctie = F.IdFunctie)
	WHERE F.denumire LIKE '%ngi%';

-- Care sunt salariile din departamentul ‘PRODUCTIE’ și câți angajați au aceste salarii ?

 SELECT F.Salariu, COUNT(*) AS NR_SALARIATI 
	FROM FUNCTII F
	JOIN Angajati A ON (A.IdFunctie = F.IdFunctie) 
	JOIN Departamente D ON (A.IdDept = D.IdDept)
	WHERE D.Denumire = 'PRODUCTIE'
	GROUP BY F.Salariu


-- Care sunt cele mai mici/mari salarii din departamente ?
 
 SELECT D.Denumire, MIN(F.Salariu) AS SALARIU_MINIM 
	FROM FUNCTII F
	JOIN Angajati A ON (A.IdFunctie = F.IdFunctie) 
	JOIN Departamente D ON (A.IdDept = D.IdDept)
	GROUP BY D.Denumire

 SELECT D.Denumire, MAX(F.Salariu) AS salariu_maxim
	FROM FUNCTII F
	JOIN Angajati A ON (A.IdFunctie = F.IdFunctie) 
	JOIN Departamente D ON (A.IdDept = D.IdDept)
	GROUP BY D.Denumire

-- Care sunt produsele vândute într-o anumită perioadă de timp (ultimii 5 ani) ?

 SELECT	P.Denumire, V.DataVanz  
	FROM Produse P JOIN Vanzari V ON (P.IdProdus = V.IdProdus)
	WHERE DATEDIFF(YEAR, DataVanz, GETDATE()) < 5;

-- Care sunt clienții ce au cumpărat produse prin intermediul unui vânzător anume ?

 SELECT V.IdVanzator, C.Denumire
	FROM Vanzari V JOIN Clienti C ON (V.IdClient = C.IdClient)
	WHERE V.IdVanzator = 14;

-- Care sunt clienții ce au cumpărat două produse ?

 SELECT V.NrProduse, C.Denumire
	FROM Vanzari V JOIN Clienti C ON (V.IdClient = C.IdClient)
	WHERE V.NrProduse = 2;

-- Care sunt clienții ce au cumpărat cel puțin două produse ?

 SELECT V.NrProduse, C.Denumire
	FROM Vanzari V JOIN Clienti C ON (V.IdClient = C.IdClient)
	WHERE V.NrProduse > = 2;

-- Câți clienți au cumpărat (la o singură cumpărare) produse în valoare mai mare decât o sumă dată (de ex. 26) ?

 SELECT V.PretVanz, C.Denumire
	FROM Vanzari V JOIN Clienti C ON (V.IdClient = C.IdClient)
	WHERE V.PretVanz > = 26;
 
-- Care sunt clienții din CLUJ care au cumpărat produse în valoare mai mare de 200 ?

INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (1, 1, 13, '05/01/2016', 5, 500);
INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (1, 1, 14, '05/01/2016', 3, 600);
INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (2, 2, 14, '06/02/2016', 10, 800);
INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (2, 2, 15, '06/02/2016', 1, 900);

 SELECT V.PretVanz, C.Adresa_jud, C.Denumire
	FROM Vanzari V JOIN Clienti C ON (V.IdClient = C.IdClient)
	WHERE V.PretVanz > 200 AND C.Adresa_jud = 'CLUJ';

-- Care sunt mediile vânzărilor pe o anumită perioadă de timp, grupate pe produse (ultimii 5 ani)?

SELECT P.Denumire, AVG(V.PretVanz) AS MediePret
	FROM VANZARI V JOIN PRODUSE P ON (V.IdProdus = P.IdProdus)
	WHERE DATEDIFF(YEAR, DataVanz, GETDATE()) < 5
	GROUP BY P.Denumire;

-- Care este numărul total de produse vândute pe o anumită perioadă de timp (ultimii 6 ani)?

SELECT COUNT(*) AS NR_PRODUSE
	FROM VANZARI V JOIN PRODUSE P ON (V.IdProdus = P.IdProdus)
	WHERE DATEDIFF(YEAR, DataVanz, GETDATE()) < 6;

-- Care este numărul de total de produse vândute de un vânzător precizat prin nume ?

 SELECT COUNT(*) AS NrTotalProduseVandute
	FROM ANGAJATI A JOIN VANZARI V ON(A.IdAngajat = V.IdVanzator)
	WHERE A.nume = 'N13';

-- Care sunt clienții ce au cumpărat produse în valoare mai mare decât media vânzărilor din luna august 2016 ?

INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (1, 1, 13, '08/01/2016', 5, 6);
INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (2, 2, 14, '08/01/2016', 3, 9);
INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (4, 3, 14, '08/02/2016', 10, 8);
INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (5, 5, 15, '08/02/2016', 1, 9);
INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (4, 6, 14, '08/02/2016', 10, 8);


 SELECT C.IdClient, SUM(V.PretVanz) AS VANZARI_TOTALE 
	FROM CLIENTI C
	JOIN VANZARI V ON(C.IdClient = V.IDClient)
	GROUP BY C.IdClient
	HAVING SUM(V.PretVanz) > (
	 SELECT AVG(V.PretVanz) 
	FROM VANZARI V 
	WHERE YEAR(V.DataVanz) = 2016 AND MONTH(V.DataVanz) = 08
	)
 

-- Care sunt produsele care s-au vândut la mai mult de un client ?

 SELECT P.Denumire FROM PRODUSE P WHERE P.IdProdus IN (
 SELECT P.IdProdus
	FROM PRODUSE P 
	JOIN VANZARI V ON (P.IdProdus = V.IDProdus)
	JOIN CLIENTI C ON (V.IDClient = C.IdClient)
	GROUP BY P.IdProdus
	HAVING COUNT(DISTINCT C.IdClient) > 1
)

-- Care sunt vânzările valorice realizate de fiecare vânzător, grupate pe produse și clienți, cu subtotaluri ?

SELECT A.Nume AS Vanzator, C.Denumire AS Client, P.Denumire AS Produs, SUM(V.PretVanz) AS TotalVanzari
    FROM ANGAJATI A
    JOIN VANZARI V ON (A.IdAngajat = V.IDVanzator)
    JOIN CLIENTI C ON (V.IDClient = C.IdClient)
    JOIN PRODUSE P ON (V.IDProdus = P.IdProdus)
    GROUP BY A.Nume, C.Denumire, P.Denumire
		