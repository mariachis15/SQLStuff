USE firma_L7
GO

-- 1. Scrieți și testați o funcție care returnează angajații a căror funcții conține o secvență de caractere primită ca parametru.

 CREATE FUNCTION dbo.returnEmployee(@secvCaract VARCHAR(10))
 RETURNS TABLE
 AS 
 RETURN
		SELECT A.Nume, A.Prenume, F.Denumire 
		FROM Angajati A JOIN Functii F ON (A.IdFunctie = F.IdFunctie)
		WHERE F.denumire LIKE '%' + @secvCaract + '%';

		--TESTARE

 SELECT * FROM dbo.returnEmployee('ngi');
 SELECT Nume, Prenume FROM dbo.returnEmployee('ngi');
 
-- 2. Scrieți și testați o funcție care returnează salariile dintr-un departament primit ca parametru. Câți angajați beneficiază de fiecare salariu?

 CREATE FUNCTION dbo.returnSalary(@departament VARCHAR(30))
 RETURNS TABLE
 AS
 RETURN
		SELECT F.Salariu, COUNT(*) AS NR_SALARIATI 
		FROM FUNCTII F
		JOIN Angajati A ON (A.IdFunctie = F.IdFunctie) 
		JOIN Departamente D ON (A.IdDept = D.IdDept)
		WHERE D.Denumire = @departament
		GROUP BY F.Salariu;

		--TESTARE

 GO
 SELECT * FROM dbo.returnSalary('MANAGEMENT');

-- 3. Scrieți și testați o funcție care returnează salariul minim și maxim dintr-un departament primit ca parametru.
 
 CREATE FUNCTION dbo.returnSalaryMinMax (@departament VARCHAR(30))
 RETURNS TABLE
 AS
 RETURN
		SELECT MIN(F.Salariu) AS MinSalary, MAX(F.Salariu) AS MaxSalary
		FROM ANGAJATI A JOIN DEPARTAMENTE D ON (A.IdDept = D. IdDept)
		JOIN Functii F ON (A.IdFunctie = F.IdFunctie)
		WHERE D.Denumire = @departament;

		--TESTARE

 SELECT * FROM dbo.returnSalaryMinMax('PRODUCTIE');

-- 4. Scrieți și testați o funcție care returnează produsele vândute într-o anumită perioadă de timp. Limitele perioadei de timp sunt trimise ca parametri către funcție.

  CREATE FUNCTION dbo.returnProductSold (@dataVanz1 DATE, @dataVanz2 DATE)
  RETURNS TABLE
  AS
  RETURN
		SELECT	P.Denumire, V.DataVanz  
		FROM Produse P JOIN Vanzari V ON (P.IdProdus = V.IdProdus)
		WHERE V.DataVanz > @dataVanz1 AND V.DataVanz < @dataVanz2;

		--TESTARE

 GO
 SELECT * FROM dbo.returnProductSold ('05/01/2016','09/07/2019');

-- 5. Scrieți și testați o funcție care returnează suma totală încasată de un vânzător al cărui nume este trimis ca parametru.

CREATE FUNCTION dbo.returnSum (@employyName VARCHAR(20))
RETURNS TABLE
AS
RETURN
		SELECT SUM(V.PretVanz) AS IncasariTotale
		FROM Angajati A JOIN Vanzari V ON (A.IdAngajat = V.IdVanzator)
		WHERE A.Nume = @employyName;

		--TESTARE

 GO
 SELECT * FROM dbo.returnSum('N1');

-- Scrieți si testați o funcție care se bazează pe prima și care verifică dacă suma depășește un anumit prag minim trimis ca parametru. Afișați angajații care au vândut produse în valoare mai mare decât 100 RON.

 CREATE FUNCTION dbo.returnVanz (@prag INT)
 RETURNS TABLE
 AS
 RETURN
		SELECT A.nume, A.Prenume
		FROM Angajati A JOIN Vanzari V ON (A.IdAngajat = V.IdVanzator)
		GROUP BY A.nume, A.prenume
		HAVING SUM(V.PretVanz) > @prag;

		--TESTARE

 GO
 SELECT * FROM dbo.returnVanz(100);

-- 6. Scrieți și testați o funcție care returnează cele mai vândute N produse, într-o anumită perioadă de timp. Valoarea lui N și limitele perioadei de timp sunt trimise ca parametri către funcție. 
 
 CREATE FUNCTION dbo.ProductSold (@FIRST INT, @date1 DATE, @date2 DATE)
 RETURNS TABLE
 AS
 RETURN
		 (
		 SELECT TOP (@FIRST) P.DENUMIRE, SUM(V.NrProduse)
		 FROM Produse P JOIN Vanzari V ON (P.IdProdus = V.IdProdus)
		 WHERE V.DataVanz > @date1 AND V.DataVanz < @date2 
		 GROUP BY P.DENUMIRE
		 ORDER BY SUM(V.NrProduse)
	 	 )
		 --TESTARE

 GO
 SELECT * FROM dbo.ProductSold (3,'05/01/2016','09/07/2019')
 
-- 7. Scrieți și testați o funcție care returnează clienții ordonați descrescător după sumele cheltuite, într-o anumită perioadă de timp ale cărei limite sunt trimise ca parametri.