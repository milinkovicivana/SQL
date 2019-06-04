USE AthleticsGym;

--upit vraca osnovne podatke o svim klubovima, kao i ime naselja i grada u kome se nalaze
SELECT Objekat.Klub.klubID, dbo.Naselje.ime, Objekat.Klub.adresa, dbo.Naselje.postanskiBroj, dbo.Grad.ime as grad, Objekat.Klub.telefon, Objekat.Klub.brojKardioSprava, Objekat.Klub.brojMasina, Objekat.Klub.velicinaProstora
FROM Objekat.Klub
INNER JOIN dbo.Naselje ON dbo.Naselje.naseljeID = Objekat.Klub.naseljeID
INNER JOIN dbo.Grad ON dbo.Grad.gradID = dbo.Naselje.gradID; 

--upit vraca sve programe i njihove tipove koji postoje u odredjenom klubu
SELECT Ponuda.TipPrograma.naziv as tip, Ponuda.Program.naziv as program
FROM Ponuda.TipPrograma
INNER JOIN Ponuda.Program ON Ponuda.TipPrograma.tipID = Ponuda.Program.tipID
INNER JOIN Ponuda.KlubProgram ON Ponuda.Program.programID = Ponuda.KlubProgram.programID
WHERE Ponuda.KlubProgram.klubID = 1;

--upit vraca programe koji imaju potprograme
SELECT DISTINCT Ponuda.Program.naziv
FROM Ponuda.Program
INNER JOIN Ponuda.Potprogram ON Ponuda.Program.programID = Ponuda.Potprogram.programID
WHERE Ponuda.Program.programID = Ponuda.Potprogram.programID;

--upit vraca programe koji imaju potprograme (exists)
SELECT Ponuda.Program.programID, Ponuda.Program.naziv
FROM Ponuda.Program
WHERE EXISTS (SELECT * FROM Ponuda.Potprogram WHERE Ponuda.Program.programID = Ponuda.Potprogram.programID);

--upit vraca sve potprograme odredjenog programa
SELECT naziv, putanjaDoSlike, opis
FROM Ponuda.Potprogram
WHERE Ponuda.Potprogram.programID = (SELECT programID FROM Ponuda.Program WHERE naziv = N'Samostalni trening');

--upit vraca sve detalje o programu u odredjenom klubu
SELECT Ponuda.Program.opis, Ponuda.Program.putanjaDoSlike, HR.Zaposlen.ime+' '+HR.Zaposlen.prezime AS instruktor, Ponuda.Cenovnik.cena, Ponuda.Termin.dan, Ponuda.Termin.vreme
FROM Ponuda.Program
INNER JOIN Ponuda.KlubProgram ON Ponuda.Program.programID = Ponuda.KlubProgram.programID
INNER JOIN Ponuda.Termin ON Ponuda.KlubProgram.id = Ponuda.Termin.id
INNER JOIN Ponuda.Cenovnik ON Ponuda.Program.programID = Ponuda.Cenovnik.programID
INNER JOIN HR.Zaposlen ON Ponuda.Program.programID = HR.Zaposlen.programID
INNER JOIN HR.Tim ON HR.Zaposlen.zaposlenID = HR.Tim.zaposlenID
WHERE Ponuda.KlubProgram.klubID = 1 AND Ponuda.KlubProgram.programID = (SELECT programID FROM Ponuda.Program WHERE naziv = N'Pilates') AND Ponuda.Cenovnik.nivoPlacanja = N'mesecno' AND HR.Tim.klubID = 1
ORDER BY Ponuda.Termin.vreme;

--upit vraca sve termine u odredjenom klubu
SELECT Ponuda.Termin.terminID, Ponuda.Termin.dan, Ponuda.Termin.vreme, Program.naziv as program 
FROM Ponuda.Termin
INNER JOIN Ponuda.KlubProgram ON Ponuda.KlubProgram.id = Ponuda.Termin.id
INNER JOIN Ponuda.Program ON Ponuda.Program.programID = Ponuda.KlubProgram.programID
WHERE Ponuda.KlubProgram.klubID = 1
--ORDER BY Ponuda.Termin.vreme
ORDER BY CASE
          WHEN dan = 'Ponedeljak' THEN 1
          WHEN dan = 'Utorak' THEN 2
          WHEN dan = 'Sreda' THEN 3
          WHEN dan = 'Cetvrtak' THEN 4
          WHEN dan = 'Petak' THEN 5
          WHEN dan = 'Subota' THEN 6
          WHEN dan = 'Nedelja' THEN 7
     END ASC, Ponuda.Termin.vreme ASC

--upit vraca sve slike odredjenog kluba
SELECT slikaID, putanjaDoSlike
FROM Objekat.Galerija 
INNER JOIN Objekat.Klub ON Objekat.Klub.klubID = Objekat.Galerija.klubID
WHERE Objekat.Klub.klubID = 1;

--upit vraca mesecne i dnevne cene za svaki program
SELECT Ponuda.Cenovnik.cenaID, Ponuda.Program.naziv as program, Ponuda.Cenovnik.nivoPlacanja, Ponuda.Cenovnik.brojTreninga, Ponuda.Cenovnik.brojVezbaca, Ponuda.Cenovnik.cena
FROM Ponuda.Cenovnik
INNER JOIN Ponuda.Program ON Ponuda.Program.programID = Ponuda.Cenovnik.programID
ORDER BY Ponuda.Cenovnik.nivoPlacanja;

--upit vraca tim odredjenog kluba
SELECT HR.Zaposlen.ime+' '+HR.Zaposlen.prezime as zaposleni, HR.Zaposlen.radnoMesto, HR.Zaposlen.email, HR.Zaposlen.putanjaDoSlike
FROM HR.Zaposlen
INNER JOIN HR.Tim ON HR.Zaposlen.zaposlenID = HR.Tim.zaposlenID
WHERE HR.Tim.klubID = 1;

--vraca klubove koji u timu imaju personalne trenere
SELECT DISTINCT HR.Tim.klubID
FROM HR.Tim 
WHERE Hr.Tim.zaposlenID IN (SELECT zaposlenID FROM HR.Zaposlen WHERE radnoMesto = N'Personalni trener');

--upit vraca broj zaposlenih u odredjenom klubu
SELECT COUNT(zaposlenID) as brZaposlenih
FROM HR.Tim
WHERE klubID = 1;

--upit vraca broj nedeljnih termina, kojih je vise od 5, po svakom zaposlenom u odredjenom klubu 
SELECT COUNT(*) as brTermina, HR.Zaposlen.zaposlenID, HR.Zaposlen.ime+' '+HR.Zaposlen.prezime as zaposleni, HR.Zaposlen.radnoMesto
FROM Ponuda.Termin
INNER JOIN Ponuda.KlubProgram ON Ponuda.KlubProgram.id = Ponuda.Termin.id
INNER JOIN Ponuda.Program ON Ponuda.Program.programID = Ponuda.KlubProgram.programID
INNER JOIN HR.Zaposlen ON Ponuda.Program.programID = HR.Zaposlen.programID
INNER JOIN HR.Tim ON HR.Zaposlen.zaposlenID = HR.Tim.zaposlenID
WHERE HR.Tim.klubID = 1 AND Ponuda.KlubProgram.klubID = 1
GROUP BY HR.Zaposlen.zaposlenID, HR.Zaposlen.ime+' '+HR.Zaposlen.prezime, HR.Zaposlen.radnoMesto
HAVING COUNT(*) > 5;

--upit vraca prosek mesecnih cena po tipu programa 
SELECT AVG(Ponuda.Cenovnik.cena) as 'prosecna cena', Ponuda.TipPrograma.naziv as 'tip programa'
FROM Ponuda.Cenovnik
INNER JOIN Ponuda.Program ON Ponuda.Program.programID = Ponuda.Cenovnik.programID
INNER JOIN Ponuda.TipPrograma ON Ponuda.TipPrograma.tipID = Ponuda.Program.tipID
WHERE Ponuda.Cenovnik.nivoPlacanja = N'mesecno'
GROUP BY Ponuda.Program.tipID, Ponuda.TipPrograma.naziv;

--upit vraca sve redove i kolone iz tabele program
SELECT * FROM Ponuda.Program;

--upit vraca prvih 8 redova iz tabele program
SELECT programID, naziv
FROM Ponuda.Program
ORDER BY programID
OFFSET 0 ROWS FETCH FIRST 8 ROWS ONLY;

--upit vraca 8-16 redove iz iste tabele
SELECT programID, naziv
FROM Ponuda.Program
ORDER BY programID
OFFSET 8 ROWS FETCH FIRST 8 ROWS ONLY;

--upit ispisuje sve redove i kolone iz tabele zaposleni
SELECT * FROM HR.Zaposlen;

--upiti dodaju vrednosti polju telefon za zaposlenog sa id-jem 1 i adresu za zaposlenog sa id-jem 4 
UPDATE HR.Zaposlen SET telefon = N'0616709030' WHERE zaposlenID = 1;
UPDATE HR.Zaposlen SET adresa = N'Banijska 6' WHERE zaposlenID = 4;

--upit ispisuje sve redove i kolone iz tabele klub
SELECT * FROM Objekat.Klub;

--upit menja vrednost polju brojMasina za klub koji se nalazi u naselju sa id-jem 1
UPDATE Objekat.Klub SET brojMasina = 45 WHERE klubID = (SELECT klubID FROM Objekat.Klub WHERE naseljeID = 1);

--upit brise zaposlene koji rade za info pultom
DELETE FROM HR.Zaposlen WHERE radnoMesto = N'Info pult';

--upit brise potprogram mrsavljenje
DELETE FROM Ponuda.Potprogram WHERE naziv = N'Mršavljenje';

