﻿-- EXERCITII:

USE firma_L5

-- Care sunt angajații dintr-un anumit departament a căror nume conține caracterele ‘escu’ ? (dacă nu există nume cu astfel de caractere puteți schimba secvența de caractere sau puteți modifica numele angajaților)

INSERT INTO ANGAJATI(Nume, Prenume, Marca, DataNasterii, DataAngajarii, Adresa_jud, IdFunctie, IdDept) VALUES ('Sorescu', 'Vasile', 77, '08/12/1975', '09/16/2010', 'Cluj', 3, 2);
INSERT INTO ANGAJATI(Nume, Prenume, Marca, DataNasterii, DataAngajarii, Adresa_jud, IdFunctie, IdDept) VALUES ('Ionescu', 'Ioan', 78, '05/10/1977', '08/26/2011', 'Galati', 6, 2);
INSERT INTO ANGAJATI(Nume, Prenume, Marca, DataNasterii, DataAngajarii, Adresa_jud, IdFunctie, IdDept) VALUES ('Popescu', 'Vlad', 79, '07/17/1975', '12/12/2010', 'Vaslui', 9, 2)
INSERT INTO ANGAJATI(Nume, Prenume, Marca, DataNasterii, DataAngajarii, Adresa_jud, IdFunctie, IdDept) VALUES ('Orescu', 'Andrei', 80, '09/09/1985', '05/30/2012', 'Bucuresti', 9, 2);

SELECT Nume FROM vAngajati WHERE Nume LIKE '%escu%' AND Departament LIKE 'PRODUCTIE';

-- Care sunt angajații dintr-un anumit departament a căror nume începe cu caracterele ‘po’ ?

SELECT Nume FROM vAngajati WHERE Nume LIKE 'po%' AND Departament LIKE 'PRODUCTIE';

-- Care sunt angajații dintr-un anumit departament (dat prin denumire) (opțional: ordonați după salariu crescător/descrescător)? (ORDER BY)

SELECT * FROM vAngajati WHERE Departament LIKE 'VANZARI';

-- Câți angajați sunt într-un anumit departament dat prin denumire ? (COUNT)

SELECT COUNT (*) FROM vAngajati WHERE Departament LIKE 'VANZARI';

-- Care este suma salariilor angajaților din companie ? (SUM)

SELECT SUM (Salariu) FROM vAngajati;