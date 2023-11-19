USE firma_L4
GO

--Să se introducă un câmp nou (Cod_produs CHAR(6)) în tabela Produse ce admite numai valori unice. Să se introduca produse noi cu date pentru Cod_produs.
GO

ALTER TABLE PRODUSE ADD Cod_produs CHAR(6)
ALTER TABLE PRODUSE ADD UNIQUE (Cod_produs)

GO

INSERT INTO PRODUSE(Denumire, IDCateg, Cod_produs) VALUES ('Cablu USB-mini USB, 1m', 1, '231287');
INSERT INTO PRODUSE(Denumire, IDCateg, Cod_produs) VALUES ('Cablu USB-micro USB, 1m', 1, '835439');
INSERT INTO PRODUSE(Denumire, IDCateg, Cod_produs) VALUES ('Cablu USB-micro USB-C, 2m', 1, '269646');
INSERT INTO PRODUSE(Denumire, IDCateg, Cod_produs) VALUES ('Cablu USB-micro USB-C, 2m', 1, '093712');
INSERT INTO PRODUSE(Denumire, IDCateg, Cod_produs) VALUES ('Adaptor USB-mini USB-C', 2, '975739');
INSERT INTO PRODUSE(Denumire, IDCateg, Cod_produs) VALUES ('Alimentator 12V-5V USB 3o', 3, '542380');