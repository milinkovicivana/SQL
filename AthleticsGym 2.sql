USE AthleticsGym;

--unos podataka u tabelu dbo.Grad
INSERT INTO [dbo].[Grad] ([ime], [pozivniBroj]) VALUES (N'Beograd', '011');

--ispis svih redova i kolona iz tabele dbo.Grad (provera unosa)
SELECT * FROM [dbo].[Grad];

--unos podataka u tabelu dbo.Naselje
INSERT INTO [dbo].[Naselje] ([ime], [gradID], [postanskiBroj]) 
VALUES 
(N'Banovo brdo', 1, 11131),
(N'Vidikovac', 1, 11090),
(N'Crveni krst', 1, 11050),
(N'Vozdovac', 1, 11010);

--ispis svih redova i kolona iz tabele dbo.Naselje(provera unosa)
SELECT * FROM [dbo].[Naselje];

--unos podataka u tabelu Objekat.Klub
INSERT INTO [Objekat].[Klub] ([naseljeID], [adresa], [telefon], [brojKardioSprava], [brojMasina], [velicinaProstora])
VALUES
((SELECT naseljeID FROM dbo.Naselje WHERE ime = N'Banovo brdo'), N'Nodilova 9', '011/354-91-91', 17, 40, null),
((SELECT naseljeID FROM dbo.Naselje WHERE ime = N'Vidikovac'), N'Vidikovački Venac 102a', '011/23-42-799', 16, 22, 400),
((SELECT naseljeID FROM dbo.Naselje WHERE ime = N'Crveni krst'), N'Golubačka 5', '011/386-21-40', 15, 21, 300),
((SELECT naseljeID FROM dbo.Naselje WHERE ime = N'Vozdovac'), N'Vojvode Stepe 363', '011/40-12-841', 30, 60, 1000);

--ispis svih redova i kolona iz tabele Objekat.Klub(provera unosa)
SELECT * FROM [Objekat].[Klub];

--unos podataka u tabelu Objekat.Galerija
INSERT INTO [Objekat].[Galerija] ([putanjaDoSlike], [klubID])
VALUES 
(N'slika11.jpg', 1), 
(N'slika12.jpg', 1), 
(N'slika13.jpg', 1), 
(N'slika14.jpg', 1), 
(N'slika15.jpg', 1),
(N'slika16.jpg', 1), 
(N'slika17.jpg', 1),
(N'slika18.jpg', 1),
(N'slika19.jpg', 1),
(N'slika110.jpg', 1),
(N'slika21.jpg', 2),
(N'slika22.jpg', 2),
(N'slika23.jpg', 2),
(N'slika24.jpg', 2),
(N'slika25.jpg', 2),
(N'slika26.jpg', 2),
(N'slika27.jpg', 2),
(N'slika28.jpg', 2),
(N'slika29.jpg', 2),
(N'slika210.jpg', 2),
(N'slika31.jpg', 3),
(N'slika32.jpg', 3),
(N'slika33.jpg', 3),
(N'slika34.jpg', 3),
(N'slika35.jpg', 3),
(N'slika36.jpg', 3),
(N'slika37.jpg', 3),
(N'slika38.jpg', 3),
(N'slika39.jpg', 3),
(N'slika310.jpg', 3),
(N'slika41.jpg', 4),
(N'slika42.jpg', 4),
(N'slika43.jpg', 4),
(N'slika44.jpg', 4),
(N'slika45.jpg', 4),
(N'slika46.jpg', 4),
(N'slika47.jpg', 4),
(N'slika48.jpg', 4),
(N'slika49.jpg', 4),
(N'slika410.jpg', 4);

--ispis svih redova i kolona iz tabele Objekat.Galerija(provera unosa)
SELECT * FROM [Objekat].[Galerija];

--unos podataka u tabelu Ponuda.TipPrograma
INSERT INTO  [Ponuda].[TipPrograma] ([naziv], [opis])
VALUES 
(N'Fitnes programi u teretani', null),
(N'Grupni fitnes programi', null),
(N'Spa programi', null);

--ispis svih redova i kolona iz tabele Ponuda.TipPrograma(provera unosa)
SELECT * FROM [Ponuda].[TipPrograma];

--unos podataka u tabelu Ponuda.Program
INSERT INTO [Ponuda].[Program] ([tipID], [naziv], [opis], [putanjaDoSlike])
VALUES 
(1, N'Samostalni trening', null, N'samostalnitrening.jpg'),
(1, N'Vođeni trening', N'Vođeni trening predstavlja osnovni tip personalnih treninga i jedan je od zaštitnih znakova Athletic`s Gym-a. Podrazumeva vežbanje u grupama od nekoliko vežbača uz nadzor trenera. Takođe u okviru vođenog treninga, pored trenera koji će planirati i pratiti svaki vaš trening dobijate i mogućnost pravljenja programa i savetovanja oko ishrane i suplementacije, a sve u cilju što boljeg postizanja ciljeva odnosno ispunjenju vaših želja.', N'vodjenitrening.jpg'),
(1, N'Vođeni funkcionalni trening', N'Funkcionalni trening utiče na povećanje kondicije i snage, ubrzava metabolizam i sagorevanje kalorija. Namenjen je vežbacima svih uzrasta koji žele bitnije da redukuju (smanje ili povećaju) svoju telesnu masu. Treninzi se održavaju u grupi od 5-8 vežbaca što omogućuje odličnu interakciju između vežbača i trenera.', N'vodjenifunktrening.jpg'),
(1, N'Personalni trening', N'Personalni trening se zasniva na tzv. jedan na jedan osnovi (jedan vežbač - jedan personalni trener). Tada je personalni trener u savršenoj poziciji da prati napredak, motiviše i sprovodi celokupan trenažni proces.', N'personalnitrening.jpg'),
(2, N'Pilates', N'U poslednjih nekoliko godina jedan od najpopularnijih vidova rekreacije kako u svetu tako i kod nas je pilates. Razlog tome je sto vežbanje pilatesa osim fizičke aktivnosti, telu daje i neophodno opuštanje i uspostavlja ravnotežu između fizičkog i mentalnog.', N'pilates.jpg'),
(2, N'Zumba', N'Zumba je zanimljiv način vežbanja. Jednostavno trening gde se prvenstveno zabavljamo, a i uz dobru zabavu trošimo kalorije. Osnivač zumbe je Alberto "Beto" Perez. Zumba program je stvoren kao jedinstvena kombinacija plesa i vežbanja zbog Betove strasti za latino muzikom, egzotičnim plesnim ritmovima i fitnesom. Shvativši da grupni fitness programi trebaju biti prvenstveno zabavni sa "ne mislećim" elementima kako bi bili dostupni masama a ne samo koordiniranim polaznicima u formi, hteo je da svako bez obzira na nivo utreniranosti može pohađati Zumbu. Zumba plesno ludilo koje je već odavno zarazilo čitav svet, munjevitom brzinom ulazi u sve više fitness centara u Srbiji i osvaja hipnotičkim ritmovima i jednostavnim ali zabavnim plesnim pokretima.', N'zumba.jpg'),
(2, N'Full body workout', N'Full body workout je sat vremena kvalitetnog treninga za angažovanje mišica celog tela. Reč je o fitnes programu koji predstavlja kombinaciju kardiovežbi i vežbi snage, koje dovode do poboljšanja motorike, fleksibilnosti, izgradnje i zategnutosti mišića kao i do sagorevanja masnih naslaga. Trening je sačinjen od početne faze (zagrevanja uz vežbe aerobika), glavnog dela treninga (akcenat je na mišićima stomaka, nogu i gluteusa, uz neizostavnu aktivaciju ruku i leđa) i završne faze (istezanja).', N'fullbodyworkout.jpg'),
(2, N'Mix aerobic', N'Mix Aerobic je dinamičan i zabavan fitnes program koji će vam omogućiti da u 60 minuta sagorite veliki broj kalorija bez osećaja iscrpljenosti koji se javlja posle mnogih kardio programa. Svaki trening je drugačije osmišljen i time sprečava rutinu i jednoličnost. Upravo to mu omogućava kombinacija različitih fitnes programa: klasičan aerobik, hi-low, tai bo, latino, work out, pilates, yoga... što i jeste suština MIX AEROBIKA. Upravo zbog toga ovo i jeste najzastupljeniji vid grupnog treninga kod nas.', N'mixaerobic.jpg'),
(2, N'Core workout', N'To je grupni fitness program srednjeg i visokog intenziteta koji stavlja focus na vežbe snage i izdržljivosti, uz povremeni HIIT kardio trening. Trening je koncipiran tako da se aktivira određena grupa mišića aktivira po jednom treningu. Team Workout nastavlja druženje na fejsbuk grupi gde se sire informacije, pruža edukacija na temu zdrave i balansirane ishrane i pruža podršku novim članovima u ishrani.', N'coreworkout.jpg'),
(2, N'Yoga', N'Hatha yoga je jedna od najpoznatijih i najrasprostranjenijih vrsta joge na svetu. Joga nije samo fizičko vežbanje, već učenje pre svega kako da umirimo um i postignemo stanje potpunog mira i opuštenosti. Usmerena je na upostavljanje harmonije uma, tela i duha, odnosno postizanje stanja opuštenosti, sreće i pozitivne energije.', N'yoga.jpg'),
(2, N'Boot camp', N'Boot camp Serbia je funkcionalni fitnes program prilagođen uzrastu i nivou fizičke spremnosti polaznika. Fitnes revoluciju pod imenom Boot camp Serbia pokrenuo je 2011. godine uz podršku Fakulteta Sporta i Fizičkog Vaspitanja - Marko Mažar, sportski novinar i fitnes trener, po uzoru na istoimene fitnes programe koji postoje širom sveta.', N'bootcamp.jpg'),
(2, N'Funkcionalni trening', N'Funkcionalni trening je predviđen za vežbače svih uzrasta. Trener je tu da vas nauči i vodi računa o pravilnosti vašeg pokreta, i da svaku vežbu prilagodi vašoj trenutnoj fizičkoj formi. Funkcionalni trening utiče na povećanje kondicije i snage, ubrzavanje metabolizma i sagorevanje kalorija.', N'funkcionalnitrening.jpg'),
(2, N'Cardio box', N'Cardio Box predstavlja visoko intenzivan trening inspirisan borilačkim veštinama koji se izvodi na džakovima. Kombinacija udaraca iz različitih borilačkih veština, najviše iz boksa i kik boksa, uz korišćenje ručne i nožne tehnike na džaku koje se uklapaju u jednostavne koreografije prilagođene vezbačima, kako početnicima tako i onima koji su se susretali sa sličnim programima.', N'cardiobox.jpg'),
(2, N'Piloxing', N'PILOXING je uzbudljiv fitness program koji sadrži i inspiriran je pojedinim pokretima iz pilatesa, boksa i plesa spojenim u visoko-intenzivni intervalni trening. Sastoji se od intervalnog treninga u kojem se trenira bosih nogu; zbog izmene intervala dolazi do povećanja potrošnje kalorija i povećava se izdržljivost, jača se kardio-vaskularni sistem, a što se tiče treniranja bez obuće dobijamo na jačanju mišića stopala, nogu.', N'piloxing.jpg'),
(3, N'Sauna', N'Tvoje utočište od sveta. Oaza mira i mesto gde ćeš regenerisati svoje telo i duh. Sauna je i mnogo više od toga. Sauna sagoreva kalorije, poboljšava sveukupno zdravlje i čini imuni sistem jačim, kožu lepšom i elastičnijom, oslobađa od stresa i bolova. Iz saune ćeš izaći fizički i mentalno obnovljen.', N'sauna.jpg'),
(3, N'Masaža', N'Da, masaža veoma, veoma prija. Masaža će te učiniti opuštenim i smirenim. Oslobodiće te celulita. Oporaviće tvoje mišiće i zglobove od stresa. Učiniće te fleksibilnim. Uticaće povoljno na san. Poboljšaće tvoje opšte raspoloženje.', N'masaza.jpg');

--ispis svih redova i kolona iz tabele Ponuda.Program(provera unosa)
SELECT * FROM [Ponuda].[Program];

--unos podataka u tabelu Ponuda.Potprogram
INSERT INTO [Ponuda].[Potprogram] ([programID], [naziv], [opis], [putanjaDoSlike])
VALUES
(1, N'Body fitness', N'Body fitness je tipično ženski, specifičan program koji poseban akcenat baca na one delove ženskog tela koji najpre dolaze na udar celulita i masnih naslaga. To su obično bokovi, zadnjica, butine i stomak. Body fitness trening ima za cilj toniziranje i oblikovanje muskulature bez straha od povećanja mišićne mase. Pun efekat postiže se uz odgovarajuću ishranu, a prave savete uvek možete dobiti od naših trenera.', N'bodyfitness.jpg'),
(1, N'Bodibilding', N'Bodibilding je sport koji se zasniva na razvoju skladne mišicne muskulature ili težnji da dovedemo svoje telo do savršenstva (podjednaku razvijenost svih mišića i naravno što veću separaciju istih). Sa punim pravom možemo reći da je bodybuilding način života, kada jednom osetite čari ovog sporta ostajete mu zauvek verni!', N'bodibilding.jpg'),
(1, N'Kardio trening', N'Kardio treningom, definiše se bilo koji oblik telesne aktivnosti koja se izvodi aktiviranjem velikih mišićnih grupa, koja je u osnovi cikličnog karaktera, a intenzitet vežbanja je prilagođen opsegu od 55-90% maksimalne frekvencije srca izračunate za svakog pojedinca.', N'kardiotrening.jpg'),
(1, N'Mršavljenje', N'Ohrabrujuće je saznanje da je ovaj veliki problem lako rešiv!!! Uz Vašu dobru volju i naš tim stručnjaka koji će Vas usmeriti na pravi put i pomoći Vam da na tom putu i istrajete!!! Redukcija telesne mase (mršavljenje) danas je jedan od najpopularnijih i najtraženijih programa u fitnes centirima.', N'mrsavljenje.jpg');

--ispis svih redova i kolona iz tabele Ponuda.Potprogram(provera unosa)
SELECT * FROM [Ponuda].[Potprogram];

--unos podataka u tabelu Ponuda.Cenovnik
INSERT INTO [Ponuda].[Cenovnik] ([programID], [nivoPlacanja], [brojTreninga], [brojVezbaca], [cena])
VALUES
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Vođeni trening'), N'mesecno', 8, null, 4500),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Vođeni trening'), N'mesecno', 12, null, 5500),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Vođeni trening'), N'mesecno', 16, null, 6000),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Personalni trening'), N'mesecno', 8, 1, 13500),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Personalni trening'), N'mesecno', 12, 1, 16500),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Personalni trening'), N'mesecno', 16, 1, 20000),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Personalni trening'), N'mesecno', 8, 2, 20500),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Personalni trening'), N'mesecno', 12, 2, 24500),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Personalni trening'), N'mesecno', 16, 2, 30000),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Vođeni trening'), N'dnevni', 1, null, 1000),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Personalni trening'), N'dnevni', 1, null, 2000),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Samostalni trening'), N'mesecno', 30, null, 2800),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Samostalni trening'), N'dnevni', 1, null, 500),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Pilates'), N'mesecno', 24, null, 2500),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Pilates'), N'dnevni', 1, null, 500),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Zumba'), N'mesecno', 24, null, 2500),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Zumba'), N'dnevni', 1, null, 500),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Full body workout'), N'mesecno', 24, null, 2500),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Full body workout'), N'dnevni', 1, null, 500),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Mix aerobic'), N'mesecno', 24, null, 2500),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Mix aerobic'), N'dnevni', 1, null, 500),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Core workout'), N'mesecno', 24, null, 2500),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Core workout'), N'dnevni', 1, null, 500),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Yoga'), N'mesecno', 24, null, 2500),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Yoga'), N'dnevni', 1, null, 500),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Boot camp'), N'mesecno', 24, null, 2500),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Boot camp'), N'dnevni', 1, null, 500),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Funkcionalni trening'), N'mesecno', 24, null, 2500),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Funkcionalni trening'), N'dnevni', 1, null, 500),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Cardio box'), N'mesecno', 24, null, 2500),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Cardio box'), N'dnevni', 1, null, 500),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Piloxing'), N'mesecno', 24, null, 2500),
((SELECT programID FROM Ponuda.Program WHERE naziv = N'Piloxing'), N'dnevni', 1, null, 500);

--ispis svih redova i kolona iz tabele Ponuda.Cenovnik
SELECT * FROM [Ponuda].[Cenovnik];

--unos podataka u tabelu Ponuda.KlubProgram
INSERT INTO [Ponuda].[KlubProgram] ([klubID], [programID])
VALUES 
(1, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Samostalni trening')),
(1, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Vođeni trening')),
(1, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Personalni trening')),
(1, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Pilates')),
(1, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Zumba')),
(1, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Full body workout')),
(1, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Mix aerobic')),
(1, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Funkcionalni trening')),
(1, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Boot camp')),
(1, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Sauna')),
(1, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Masaža')),
(2, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Samostalni trening')),
(2, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Vođeni trening')),
(2, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Personalni trening')),
(2, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Zumba')),
(2, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Mix aerobic')),
(2, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Pilates')),
(2, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Funkcionalni trening')),
(2, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Full body workout')),
(3, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Samostalni trening')),
(3, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Vođeni trening')),
(3, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Personalni trening')),
(3, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Zumba')),
(3, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Mix aerobic')),
(3, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Pilates')),
(3, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Cardio box')),
(3, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Full body workout')),
(3, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Funkcionalni trening')),
(4, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Samostalni trening')),
(4, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Vođeni trening')),
(4, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Vođeni funkcionalni trening')),
(4, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Personalni trening')),
(4, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Zumba')),
(4, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Mix aerobic')),
(4, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Pilates')),
(4, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Full body workout')),
(4, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Yoga')),
(4, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Funkcionalni trening')),
(4, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Piloxing')),
(4, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Sauna')),
(4, (SELECT programID FROM Ponuda.Program WHERE naziv = N'Masaža'));

--ispis svih redova i kolona iz tabele Ponuda.KlubProgram
SELECT * FROM [Ponuda].[KlubProgram];

--ispisuje sve kolone iz tabele KlubProgram i naziv programa kako bih lakse unela podatke u tabelu Termin
SELECT id, klubID, Ponuda.KlubProgram.programID, Ponuda.Program.naziv 
FROM Ponuda.KlubProgram
INNER JOIN Ponuda.Program ON Ponuda.Program.programID = Ponuda.KlubProgram.programID;

--unos podataka u tabelu Ponuda.Termin
INSERT INTO [Ponuda].[Termin] ([id], [dan], [vreme])
VALUES
(4, N'Ponedeljak', '09:00'),
(4, N'Utorak', '18:00'),
(4, N'Utorak', '19:00'),
(4, N'Sreda', '09:00'),
(4, N'Cetvrtak', '18:00'),
(4, N'Cetvrtak', '19:00'),
(4, N'Petak', '09:00'),
(6, N'Ponedeljak', '18:00'),
(6, N'Sreda', '18:00'),
(6, N'Petak', '18:00'),
(7, N'Ponedeljak', '19:00'),
(7, N'Sreda', '19:00'),
(7, N'Petak', '19:00'),
(8, N'Ponedeljak', '20:00'),
(8, N'Ponedeljak', '21:00'),
(8, N'Sreda', '20:00'),
(8, N'Sreda', '21:00'),
(8, N'Petak', '20:00'),
(8, N'Petak', '21:00'),
(9, N'Utorak', '20:00'),
(9, N'Cetvrtak', '20:00'),
(9, N'Subota', '12:00'),
(5, N'Utorak', '21:00'),
(5, N'Cetvrtak', '21:00'),
(5, N'Subota', '15:00'),
(17, N'Ponedeljak', '18:00'),
(17, N'Ponedeljak', '19:00'),
(17, N'Sreda', '18:00'),
(17, N'Sreda', '19:00'),
(17, N'Petak', '18:00'),
(17, N'Petak', '19:00'),
(19, N'Ponedeljak', '20:00'),
(19, N'Sreda', '20:00'),
(19, N'Petak', '20:00'),
(15, N'Ponedeljak', '21:00'),
(15, N'Sreda', '21:00'),
(15, N'Petak', '21:00'),
(16, N'Utorak', '20:00'),
(16, N'Utorak', '21:00'),
(16, N'Cetvrtak', '20:00'),
(16, N'Cetvrtak', '21:00'),
(16, N'Subota', '11:00'),
(18, N'Utorak', '19:00'),
(18, N'Cetvrtak', '19:00'),
(18, N'Subota', '12:00'),
(25, N'Ponedeljak', '18:00'),
(25, N'Ponedeljak', '19:00'),
(25, N'Sreda', '18:00'),
(25, N'Sreda', '19:00'),
(25, N'Petak', '18:00'),
(25, N'Petak', '19:00'),
(23, N'Ponedeljak', '20:00'),
(23, N'Sreda', '20:00'),
(23, N'Petak', '20:00'),
(27, N'Utorak', '20:00'),
(27, N'Cetvrtak', '20:00'),
(27, N'Subota', '10:00'),
(24, N'Ponedeljak', '21:00'),
(24, N'Sreda', '21:00'),
(24, N'Petak', '21:00'),
(26, N'Utorak', '21:00'),
(26, N'Cetvrtak', '21:00'),
(26, N'Subota', '11:00'),
(35, N'Ponedeljak', '19:00'),
(35, N'Utorak', '19:00'),
(35, N'Sreda', '19:00'),
(35, N'Cetvrtak', '19:00'),
(35, N'Petak', '19:00'),
(37, N'Utorak', '18:00'),
(37, N'Utorak', '18:00'),
(37, N'Cetvrtak', '18:00'),
(37, N'Petak', '10:00'),
(38, N'Ponedeljak', '18:00'),
(38, N'Sreda', '18:00'),
(38, N'Petak', '18:00'),
(33, N'Ponedeljak', '20:00'),
(33, N'Sreda', '20:00'),
(33, N'Petak', '20:00'),
(34, N'Ponedeljak', '21:00'),
(34, N'Sreda', '21:00'),
(34, N'Petak', '21:00'),
(39, N'Utorak', '20:00'),
(39, N'Cetvrtak', '20:00'),
(36, N'Utorak', '21:00'),
(36, N'Cetvrtak', '21:00');

--ispis svih redova i kolona iz tabele Ponuda.Termin
SELECT * FROM [Ponuda].[Termin];

--unos podataka u tabelu HR.Zaposlen
INSERT INTO [HR].[Zaposlen] ([ime], [prezime], [radnoMesto], [programID], [email], [putanjaDoSlike])
VALUES
(N'Aleksandar', N'Pajovic', N'Personalni trener', (SELECT programID FROM Ponuda.Program WHERE naziv = N'Personalni trening'), N'aleksandar.p@gym.rs', N'zaposleni1.jpg'),
(N'Lazar', N'Savic', N'Personalni trener', (SELECT programID FROM Ponuda.Program WHERE naziv = N'Personalni trening'), N'lazar@gym.rs', N'zaposleni2.jpg'),
(N'Ana', N'Vidakovic', N'Instruktor pilatesa', (SELECT programID FROM Ponuda.Program WHERE naziv = N'Pilates'), N'ana.predragovic@gmail.com', N'zaposleni3.jpg'),
(N'Nikola', N'Cvetkovic', N'Instruktor zumbe', (SELECT programID FROM Ponuda.Program WHERE naziv = N'Zumba'), N'cvelito.zumba@gmail.com', N'zaposleni4.jpg'),
(N'Bojana', N'Radanovic', N'Instruktor funkcionalnog treninga', (SELECT programID FROM Ponuda.Program WHERE naziv = N'Funkcionalni trening'), N'boka@prvitim.com', N'zaposleni5.jpg'),
(N'Natasa', N'Arsic', N'Instruktor mix aerobika', (SELECT programID FROM Ponuda.Program WHERE naziv = N'Mix aerobic'), N'narsic986@gmail.com', N'zaposleni6.jpg'),
(N'Irena', N'Jusufi', N'Instruktor boot camp programa', (SELECT programID FROM Ponuda.Program WHERE naziv = N'Boot camp'), N'jusufiirena1989@gmail.com', N'zaposleni7.jpg'),
(N'Dragana', N'Stosic', N'Info pult', null, N'dragana.stosic@gym.rs', N'zaposleni8.jpg'),
(N'Katarina', N'Vasic', N'Info pult', null, N'katarina.vassic@gym.rs', N'zaposleni9.jpg'),
(N'Tijana', N'Mirosavljevic', N'Instruktor zumbe', (SELECT programID FROM Ponuda.Program WHERE naziv = N'Zumba'), N'tijana.zumba@gmail.com', N'zaposleni10.jpg'),
(N'Sanja', N'Radovanovic', N'Instruktor full body workout programa', (SELECT programID FROM Ponuda.Program WHERE naziv = N'Full body workout'), N'sanjaa@gmail.com', N'zaposleni11.jpg'),
(N'Nemanja', N'Popovic', N'Personalni trener', (SELECT programID FROM Ponuda.Program WHERE naziv = N'Personalni trening'), N'nemanja@gym.rs', N'zaposleni12.jpg'),
(N'Andrea', N'Nikolic', N'Info pult', null, N'andrea@gym.rs', N'zaposleni13.jpg'),
(N'Branislava', N'Teodosic', N'Info pult', null, N'branislava@gym.rs', N'zaposleni14.jpg'),
(N'Jelena', N'Milosavljevic', N'Instruktor zumbe', (SELECT programID FROM Ponuda.Program WHERE naziv = N'Zumba'), N'jelena.zumba@gmail.com', N'zaposleni15.jpg'),
(N'Marina', N'Markovic', N'Instruktor pilatesa', (SELECT programID FROM Ponuda.Program WHERE naziv = N'Pilates'), N'marinac@gmail.com', N'zaposleni16.jpg'),
(N'Sladjana', N'Djuric', N'Info pult', null, N'sladja@gym.rs', N'zaposleni17.jpg'),
(N'Marija', N'Simeunovic', N'Info pult', null, N'marija@gym.rs', N'zaposleni18.jpg'),
(N'Dejana', N'Stankovic', N'Instruktor joge', (SELECT programID FROM Ponuda.Program WHERE naziv = N'Yoga'), N'dejana@gmail.com', N'zaposleni19.jpg'),
(N'Slobodana', N'Kocic', N'Info pult', null, N'slobodana@gym.rs', N'zaposleni20.jpg'),
(N'Natasa', N'Bulajic', N'Instruktor pilatesa', (SELECT programID FROM Ponuda.Program WHERE naziv = N'Pilates'), N'natasa@gmail.com', N'zaposleni21.jpg'),
(N'Stojan', N'Lazic', N'Personalni trener', (SELECT programID FROM Ponuda.Program WHERE naziv = N'Personalni trening'), N'lazic@gym.rs', N'zaposleni22.jpg'),
(N'Nenad', N'Simeunovic', N'Personalni trener', (SELECT programID FROM Ponuda.Program WHERE naziv = N'Personalni trening'), N'nenad@gym.rs', N'zaposleni23.jpg'),
(N'Marina', N'Guduric', N'Instruktor mix aerobika', (SELECT programID FROM Ponuda.Program WHERE naziv = N'Mix aerobic'), N'nmarina@gmail.com', N'zaposleni24.jpg'),
(N'Dordje', N'Jovanovic', N'Personalni trener', (SELECT programID FROM Ponuda.Program WHERE naziv = N'Personalni trening'), N'jova@gym.rs', N'zaposleni25.jpg');

--ispis svih redova i kolona iz tabele HR.Zaposlen
SELECT * FROM [HR].[Zaposlen];

--unos podataka u tabelu HR.Tim
INSERT INTO [HR].[Tim] ([klubID], [zaposlenID])
VALUES 
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 12),
(2, 3),
(2, 2),
(2, 10),
(2, 11),
(2, 6),
(2, 12),
(2, 13),
(2, 14),
(3, 15),
(3, 16),
(3, 5),
(3, 24),
(3, 25),
(3, 17),
(3, 18),
(4, 4),
(4, 21),
(4, 22),
(4, 23),
(4, 19),
(4, 20);

--ispis svih redova i kolona iz tabele HR.Tim
SELECT * FROM [HR].[Tim];