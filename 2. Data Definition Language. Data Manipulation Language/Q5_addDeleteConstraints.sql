USE firma_L4
GO

--Să se introducă o constrângere ce verifică că în câmpul Tip_cl din tabela Clienti se pot introduce numai valorile: PF, PFA, SRL, SA. Să se verifice funcționarea constrângerii.
GO

ALTER TABLE CLIENTI ADD CONSTRAINT checkValue CHECK(Tip_cl IN('PF', 'PFA', 'SRL', 'SA'));

INSERT INTO CLIENTI(Denumire, Adresa_jud, Tip_cl) VALUES ('Sabrina', 'Timisoara', 'nimic');
--La incercarea introducerii clientului in baza de date se afiseaza eroarea: The INSERT statement conflicted with the CHECK constraint "checkValue".The conflict occurred in database "firma_L4", table "dbo.CLIENTI", column 'Tip_cl'.

INSERT INTO CLIENTI(Denumire, Adresa_jud, Tip_cl) VALUES ('Sabrina', 'Timisoara', 'PF');
--In cazul in care Tip_cl este modificat din 'nimic' in 'PF' se permite inserarea clientului in baza de date.


--Să se introducă o constrângere ce verifică că în câmpul DataVanz din tabela Vanzari nu se pot introduce date din viitor (se folosesc funcțiile GETDATE și DATEDIFF). Să se verifice funcționarea constrângerii
GO

ALTER TABLE VANZARI ADD CONSTRAINT checkDate CHECK(DataVanz <= GETDATE());

INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (6, 3, 15, '11/01/2023', 4, 210);
--EROARE: The INSERT statement conflicted with the CHECK constraint "checkDate". The conflict occurred in database "firma_L4", table "dbo.VANZARI", column 'DataVanz'.

INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (6, 3, 15, '11/01/2022', 4, 210);
--FUNCTIONEAZA
INSERT INTO VANZARI(IDProdus, IDClient, IDVanzator, DataVanz, NrProduse, PretVanz) VALUES (2, 1, 13, '10/28/2023', 6, 710);
--FUNCTIONEAZA 
