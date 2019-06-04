USE AthleticsGym;
GO

-- kreiranje pogleda cija naredba vraca sve informacije o klubovima i broj zaposlenih u svakom od njih
CREATE VIEW Objekat.KluboviInfo
AS
SELECT Objekat.Klub.klubID, dbo.Naselje.ime, Objekat.Klub.adresa, dbo.Naselje.postanskiBroj, dbo.Grad.ime as grad, Objekat.Klub.telefon, Objekat.Klub.brojKardioSprava, Objekat.Klub.brojMasina, Objekat.Klub.velicinaProstora, COUNT(HR.Zaposlen.zaposlenID) as BrojZaposlenih 
FROM HR.Zaposlen
INNER JOIN HR.Tim ON HR.Zaposlen.zaposlenID = HR.Tim.zaposlenID
INNER JOIN Objekat.Klub ON Objekat.Klub.klubID = HR.Tim.klubID
INNER JOIN dbo.Naselje ON dbo.Naselje.naseljeID = Objekat.Klub.naseljeID
INNER JOIN dbo.Grad ON dbo.Grad.gradID = dbo.Naselje.gradID
GROUP BY Objekat.Klub.klubID, dbo.Naselje.ime, Objekat.Klub.adresa, dbo.Naselje.postanskiBroj, dbo.Grad.ime, Objekat.Klub.telefon, Objekat.Klub.brojKardioSprava, Objekat.Klub.brojMasina, Objekat.Klub.velicinaProstora;
GO

--testiranje pogleda
SELECT * FROM Objekat.KluboviInfo;

--kreiranje nove tabele u kojoj ce se cuvati informacije o greskama
CREATE TABLE dbo.GreskeInfo (
	
	greskaid int not null IDENTITY(1,1) PRIMARY KEY,
	brojGreske int not null,
	poruka varchar(max) not null,
	nivo int not null,
	linija int not null
);
GO

--kreiranje procedure koja omogucava unosenje informacija o greskama u tabelu dbo.GreskeInfo
CREATE PROC dbo.SnimiGresku
AS
BEGIN
	INSERT INTO dbo.GreskeInfo (brojGreske, poruka, nivo, linija) VALUES (ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_SEVERITY(), ERROR_LINE());
END
GO

--kreiranje procedure koja omogucava unos novog zaposlenog
CREATE PROC HR.ZaposlenUnos (@ime nvarchar(25), @prezime nvarchar(30), @radnoMesto nvarchar(50), @programID int, @jmbg nvarchar(13), @telefon nvarchar(20), @adresa nvarchar(100), @email nvarchar(50), @putanjaDoSlike nvarchar(255))
AS
BEGIN
	BEGIN TRY
		INSERT INTO HR.Zaposlen (ime, prezime, radnoMesto, programID, jmbg, telefon, adresa, email, putanjaDoSlike) 
		VALUES (@ime, @prezime, @radnoMesto, @programID, @jmbg, @telefon, @adresa, @email, @putanjaDoSlike);
	END TRY
	BEGIN CATCH
		EXEC dbo.SnimiGresku;
	END CATCH
END
GO

--testiranje HR.ZaposlenUnos procedure
EXEC HR.ZaposlenUnos @ime = N'Ivana', @prezime = N'Milinkovic', @radnoMesto = N'Instruktor full body workout programa', @programID = 7, @jmbg = null, @telefon = null, @adresa = null, @email = N'ivana@raf.rs', @putanjaDoSlike = N'zaposleni26.jpg';

--provera unosa
SELECT * FROM HR.Zaposlen ORDER BY zaposlenID DESC;

--ponovni pokusaj unosa, namerno se pravi greska kako bi se testirala procedura dbo.SnimiGresku
EXEC HR.ZaposlenUnos @ime = N'Ivana', @prezime = N'Milinkovic', @radnoMesto = null, @programID = 7, @jmbg = null, @telefon = null, @adresa = null, @email = 123, @putanjaDoSlike = N'zaposleni26.jpg';

--pregled tabele dbo.GreskeInfo
SELECT * FROM dbo.GreskeInfo
GO

--kreiranje procedure koja omogucava izmenu programa
CREATE PROC Ponuda.IzmeniProgram (@programID int, @tipID int, @naziv nvarchar(50), @opis nvarchar(max), @putanjaDoSlike nvarchar(255))
AS
BEGIN
	BEGIN TRY
		UPDATE Ponuda.Program SET tipID = @tipID, naziv = @naziv, opis = @opis, putanjaDoSlike = @putanjaDoSlike WHERE programID = @programID;
	END TRY
	BEGIN CATCH
		EXEC dbo.SnimiGresku;
	END CATCH
END
GO

--kreiranje nove tabele
CREATE TABLE ProgramiIzmene (	
	programID int not null,
	datumIzmene datetime2 not null CONSTRAINT DF_ProgramiIzmene_datumIzmene DEFAULT SYSDATETIME() 
);
GO

--kreiranje trigera koji nakon izmene programa smesta informacije o tim izmenama u novu tabelu
CREATE TRIGGER tg_ProgramUpdateInfo
ON Ponuda.Program
AFTER UPDATE 
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @programID int;
	SELECT @programID = programID FROM inserted;
	INSERT INTO ProgramiIzmene (programID) VALUES (@programID);
END;

SELECT * FROM Ponuda.Program;

--testiranje procedure Ponuda.IzmeniProgram
EXEC Ponuda.IzmeniProgram @programID = 16, @tipID = 3, @naziv = N'Masaža', @opis = N'Opis masaze', @putanjaDoSlike = N'masaza1.jpg';

--pregled ProgramIizmene tabele
SELECT * FROM ProgramiIzmene;

--ponovna izmena, unos sa greskom
EXEC Ponuda.IzmeniProgram @programID = 16, @tipID = 4, @naziv = N'Masaža', @opis = N'Opis masazeee', @putanjaDoSlike = N'masaza1.jpg';

--pregled tabele dbo.GreskeInfo
SELECT * FROM dbo.GreskeInfo
GO

--kreiranje procedure Ponuda.IzbrisiSliku
CREATE PROC Ponuda.IzbrisiSliku (@slikaID int) 
AS
BEGIN
	BEGIN TRY
		DELETE FROM Objekat.Galerija WHERE slikaID = @slikaID;
	END TRY
	BEGIN CATCH
		EXEC dbo.SnimiGresku;
	END CATCH
END
GO

--kreiranje trigera koji umesto brisanja slike stavlja njen klubID na null
CREATE TRIGGER tg_BrisanjeSlike
ON Objekat.Galerija
INSTEAD OF DELETE 
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Objekat.Galerija SET klubID = NULL FROM Objekat.Galerija INNER JOIN deleted ON Objekat.Galerija.slikaID = deleted.slikaID;
END
GO

--poziv procedure za brisanje slike
EXEC Ponuda.IzbrisiSliku @slikaID = 22;
GO

--provera
SELECT * FROM Objekat.Galerija WHERE slikaID = 22;
GO

--kreiranje funkcije koja vraca email zaposlenog
CREATE FUNCTION dbo.Email(@ime nvarchar(25), @prezime nvarchar(30))
RETURNS nvarchar(50)
AS
BEGIN
	DECLARE @email nvarchar(50) = (SELECT email FROM HR.Zaposlen WHERE ime = @ime AND prezime = @prezime);
	RETURN @email
END
GO

--poziv funkcije
SELECT dbo.Email(N'Nikola', N'Cvetkovic');
GO

--kreiranje funkcije koja vraca sve termine odredjenog kluba
CREATE FUNCTION Ponuda.TerminiPoKlubu(@idKluba int)
RETURNS TABLE
AS
RETURN (SELECT Ponuda.Termin.terminID, Ponuda.Termin.dan, Ponuda.Termin.vreme as vreme, Program.naziv as program 
FROM Ponuda.Termin
INNER JOIN Ponuda.KlubProgram ON Ponuda.KlubProgram.id = Ponuda.Termin.id
INNER JOIN Ponuda.Program ON Ponuda.Program.programID = Ponuda.KlubProgram.programID
WHERE Ponuda.KlubProgram.klubID = @idKluba);
GO

--poziv funkcije
SELECT * FROM Ponuda.TerminiPoKlubu(1) ORDER BY vreme;
GO

--kreiranje procedure koja sadrzi obradu transakcije
CREATE PROC Ponuda.UnosProgramaICene (@tipID int, @naziv nvarchar(50), @opis nvarchar(max), @putanjaDoSlike nvarchar(255), @programID int, @nivoPlacanja nvarchar(10), @brojTreninga int, @brojVezbaca int, @cena int)
AS
BEGIN
	SET XACT_ABORT ON;
	BEGIN TRY
		BEGIN TRAN;

		INSERT INTO Ponuda.Program (tipID, naziv, opis, putanjaDoSlike) VALUES (@tipID, @naziv, @opis, @putanjaDoSlike);
		INSERT INTO Ponuda.Cenovnik (programID, nivoPlacanja, brojTreninga, brojVezbaca, cena) VALUES (@programID, @nivoPlacanja, @brojTreninga, @brojVezbaca, @cena);

		COMMIT TRAN;
	END TRY
	BEGIN CATCH
		IF XACT_STATE() = -1
		BEGIN
			ROLLBACK TRAN;
		END
	END CATCH
END
GO 

--poziv procedure

--DECLARE @idPrograma int = (SELECT MAX(programID) FROM Ponuda.Program) + 1;
DECLARE @idPrograma int = IDENT_CURRENT('Ponuda.Program') + 1;
EXEC Ponuda.UnosProgramaICene @tipID = 2, @naziv = N'Proba', @opis = N'Neki opis', @putanjaDoSlike = N'proba.jpg', @programID = @idPrograma, @nivoPlacanja = N'mesecno', @brojTreninga = 8, @brojVezbaca = null, @cena = 1200;

--pregled tabela Program i Cenovnik
SELECT * FROM Ponuda.Program;
SELECT * FROM Ponuda.Cenovnik;

-----------------------------------------------------------------------------------------------------
--transakcije sa REPEATABLE READ izolacionim nivoom
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--Konekcija 1, zapocinjanje transakcije, ispis podataka o programima
BEGIN TRAN
SELECT programID, Ponuda.TipPrograma.naziv as tipPrograma, Ponuda.Program.naziv, Ponuda.Program.opis
FROM Ponuda.Program
INNER JOIN Ponuda.TipPrograma ON Ponuda.TipPrograma.tipID = Ponuda.Program.tipID;

--Konekcija 2, pokusaj promene opisa programa sa id-jem 1, ceka jer zapocetna transakcija iz prethodnog koraka nije commit-ovana
UPDATE Ponuda.Program SET opis = N'Samostalni trening opis' WHERE programID = 1;

--Konekcija 1, commit transakcije, nakon cega je odblokirana
SELECT programID, Ponuda.TipPrograma.naziv as tipPrograma, Ponuda.Program.naziv, Ponuda.Program.opis
FROM Ponuda.Program
INNER JOIN Ponuda.TipPrograma ON Ponuda.TipPrograma.tipID = Ponuda.Program.tipID;
COMMIT TRAN;

--ukoliko sada ponovo izvrsimo samo SELECT iz prethodnog koraka videcemo izmene
--------------------------------------------------------------------------------------------------------
-- deadlock

--Konekcija 1, zapocinjanje transakcije, update cene
BEGIN TRAN;
UPDATE Ponuda.Cenovnik SET cena += 100 WHERE cenaID = 44;

--Konekcija 2, zapocinjanje transakcije, update programa
BEGIN TRAN;
UPDATE Ponuda.Program SET opis = N'Samostalni trening opissss' WHERE programID = 1;

--Konekcija 1 pokusava select programa koji je zakljucala konekcija 2
SELECT programID, Ponuda.TipPrograma.naziv as tipPrograma, Ponuda.Program.naziv, Ponuda.Program.opis
FROM Ponuda.Program
INNER JOIN Ponuda.TipPrograma ON Ponuda.TipPrograma.tipID = Ponuda.Program.tipID
WHERE Ponuda.Program.programID = 1;
COMMIT TRAN;

--Konekcija 2 pokusava select cene koju je zakljucala konekcija 1
SELECT cenaID, programID, cena
FROM Ponuda.Cenovnik
WHERE cenaID = 44;
COMMIT TRAN;
GO

--SQL server sam razresava ovo, odredjuje zrtvu i podize gresku

------------------------------------------------------------------------------------------------------

--kreiranje trigera koji sprecava brisanje tabela
CREATE TRIGGER tg_BrisanjeTabela
ON DATABASE
FOR DROP_TABLE
AS 
PRINT 'Ne mozete obrisati tabelu!';
ROLLBACK TRAN;
GO

--testiranje
DROP TABLE Objekat.Galerija;
