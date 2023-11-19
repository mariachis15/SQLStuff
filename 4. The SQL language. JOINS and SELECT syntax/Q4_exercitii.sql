USE firma_L6
GO

-- Care sunt salariile din departamentul ‘PRODUCTIE’ ?
SELECT A.Nume, A.Prenume, F.Salariu FROM Angajati A, Departamente D, Functii F WHERE (A.IdDept = D.IdDept AND A.IdFunctie = F.IdFunctie) AND D.Denumire = 'PRODUCTIE' ORDER BY F.salariu DESC, A.nume, A.prenume

SELECT A.Nume, A.Prenume, F.Salariu FROM Angajati A JOIN Departamente D ON A.IdDept = D.IdDept JOIN Functii F ON A.IdFunctie = F.IdFunctie WHERE D.Denumire = 'PRODUCTIE' ORDER BY F.salariu DESC, A.nume, A.prenume

-- Care sunt angajații din departamentul PROIECTARE, ordonați alfabetic (nume, prenume) ?
SELECT A.Nume, A.Prenume, D.Denumire Departament FROM Angajati A JOIN Departamente D ON (A.IdDept = D.IdDept) WHERE (D.Denumire = 'PROIECTARE') ORDER BY Nume, Prenume

-- Care sunt mediile salariilor grupate pe funcții ?
SELECT F.Denumire, AVG(F.Salariu) Sal_med FROM Angajati A JOIN Functii F ON (A.IdFunctie = F.IdFunctie) GROUP BY F.Denumire

-- Care este totalul salariilor grupate pe funcții ordonate descendent ?
SELECT F.Denumire AS Functia, Sum(F.Salariu) Total_sal FROM Angajati A JOIN Functii F ON (A.IdFunctie = F.IdFunctie) GROUP BY F.Denumire ORDER BY Sum(F.Salariu) DESC
