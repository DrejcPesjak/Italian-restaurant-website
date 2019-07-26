/*
Created		29-Apr-17
Modified		07-May-17
Project		
Model		
Company		
Author		
Version		
Database		MS SQL 7 
*/


--Drop table [REZERVACIJE] 
--go
--Drop table [REZERVIRANE_MIZE] 
--go
--Drop table [MIZE] 
--go
--Drop table [PLACA] 
--go
--Drop table [NABAVA] 
--go
--Drop table [SESTAVINE] 
--go
--Drop table [SESTAVINA_V_JEDI] 
--go
--Drop table [MENI] 
--go
--Drop table [NAROCILA_MENI] 
--go
--Drop table [NAROCILA] 
--go
--Drop table [TELEFONSKA] 
--go
--Drop table [POSTA] 
--go
--Drop table [DELOVNI_DAN] 
--go
--Drop table [ZAPOSLENI] 
--go

Create database [RestavracijaAnatra]
go

Use [RestavracijaAnatra]
go


Create table [ZAPOSLENI] (
	[emsa] Char(13) NOT NULL,
	[ime] Nvarchar(20) NOT NULL,
	[priimek] Nvarchar(30) NOT NULL,
	[polozaj] Nvarchar(30) NOT NULL,
	[naslov] Nvarchar(50) NOT NULL,
	[email] Nvarchar(50) NOT NULL,
	[davcna_st] Nvarchar(8) NOT NULL,
	[postna_st] Integer NOT NULL,
Primary Key  ([emsa])
) 
go

Create table [DELOVNI_DAN] (	
	[pricetek] Datetime NOT NULL,
	[konec] Datetime NULL,
	[emsa] Char(13) NOT NULL,
Primary Key  ([pricetek],[emsa])
) 
go

Create table [POSTA] (
	[postna_st] Integer NOT NULL,
	[kraj] Nvarchar(50) NOT NULL,
Primary Key  ([postna_st])
) 
go

Create table [TELEFONSKA] (
	[telefonska] Char(11) NOT NULL,
	[vrsta_tel] Nvarchar(30) NOT NULL,
	[emsa] Char(13) NOT NULL,
Primary Key  ([telefonska],[emsa])
) 
go

Create table [NAROCILA] (
	[id_narocila] Integer Identity(1,1) NOT NULL,
	[datum_cas] Datetime NOT NULL,
	[emsa] Char(13) NOT NULL,
	[st_mize] Integer NOT NULL,
Primary Key  ([id_narocila])
) 
go

Create table [NAROCILA_MENI] (
	[id_naroci_meni] Integer Identity(1,1) NOT NULL,
	[id_narocila] Integer NOT NULL,
	[stevilka_artikla] Integer NOT NULL,
Primary Key  ([id_naroci_meni])
) 
go

Create table [MENI] (
	[stevilka_artikla] Integer Identity(1,1) NOT NULL,
	[ime_artikla] Nvarchar(50) NOT NULL,
	[italijansko_ime_art] Nvarchar(50) NULL,
	[opis_artilka] Nvarchar(255) NULL,
	[kategorija] Nvarchar(40) NOT NULL,
	[cena] Money NOT NULL,
Primary Key  ([stevilka_artikla])
) 
go

Create table [SESTAVINA_V_JEDI] (
	[stevilka_artikla] Integer NOT NULL,
	[id_sestavine] Integer NOT NULL,
	[kolicina] Decimal(6,2) NOT NULL,
Primary Key  ([stevilka_artikla],[id_sestavine])
) 
go

Create table [SESTAVINE] (
	[id_sestavine] Integer Identity(1,1) NOT NULL,
	[ime] Nvarchar(40) NOT NULL,
	[merska_enota] Nvarchar(40) NOT NULL,
Primary Key  ([id_sestavine])
) 
go

Create table [NABAVA] (
	[datum_cas] Datetime NOT NULL,
	[kolicina] Decimal(6,2) NOT NULL,
	[cena] Money NULL,
	[dobavitelj] Nvarchar(50) NULL,
	[id_sestavine] Integer NOT NULL,
Primary Key  ([datum_cas],[id_sestavine])
) 
go

Create table [PLACA] (
	[mesec_leto] Datetime NOT NULL,
	[placa] Money NOT NULL,
	[izplacana] Char(2) NOT NULL Check (izplacana='DA' OR izplacana='NE' ),
	[emsa] Char(13) NOT NULL,
Primary Key  ([mesec_leto],[emsa])
) 
go

Create table [MIZE] (
	[st_mize] Integer Identity(1,1) NOT NULL,
	[st_stolov] Integer NOT NULL,
Primary Key  ([st_mize])
) 
go

Create table [REZERVIRANE_MIZE] (
	[st_rezervacije] Integer NOT NULL,
	[st_mize] Integer NOT NULL,
	[datum] Datetime NOT NULL,
Primary Key  ([st_rezervacije],[st_mize])
) 
go

Create table [REZERVACIJE] (
	[st_rezervacije] Integer Identity(1,1) NOT NULL,
	[ime_priimek] Nvarchar(30) NOT NULL,
	[st_oseb] Integer NOT NULL,
	[datum_klica] Datetime NOT NULL,
	[1telefonska] Char(11) NOT NULL,
Primary Key  ([st_rezervacije])
) 
go





Alter table [DELOVNI_DAN] add  foreign key([emsa]) references [ZAPOSLENI] ([emsa]) 
go
Alter table [TELEFONSKA] add  foreign key([emsa]) references [ZAPOSLENI] ([emsa]) 
go
Alter table [PLACA] add  foreign key([emsa]) references [ZAPOSLENI] ([emsa]) 
go
Alter table [NAROCILA] add  foreign key([emsa]) references [ZAPOSLENI] ([emsa]) 
go
Alter table [ZAPOSLENI] add  foreign key([postna_st]) references [POSTA] ([postna_st]) 
go
Alter table [NAROCILA_MENI] add  foreign key([id_narocila]) references [NAROCILA] ([id_narocila]) 
go
Alter table [NAROCILA_MENI] add  foreign key([stevilka_artikla]) references [MENI] ([stevilka_artikla]) 
go
Alter table [SESTAVINA_V_JEDI] add  foreign key([stevilka_artikla]) references [MENI] ([stevilka_artikla]) 
go
Alter table [SESTAVINA_V_JEDI] add  foreign key([id_sestavine]) references [SESTAVINE] ([id_sestavine]) 
go
Alter table [NABAVA] add  foreign key([id_sestavine]) references [SESTAVINE] ([id_sestavine]) 
go
Alter table [REZERVIRANE_MIZE] add  foreign key([st_mize]) references [MIZE] ([st_mize]) 
go
Alter table [NAROCILA] add  foreign key([st_mize]) references [MIZE] ([st_mize]) 
go
Alter table [REZERVIRANE_MIZE] add  foreign key([st_rezervacije]) references [REZERVACIJE] ([st_rezervacije]) 
go


Set quoted_identifier on
go

Set quoted_identifier off
go

/* Roles permissions */

/* Users permissions */

--*****************************************************************************************************************************************************
INSERT INTO [dbo].[POSTA]([postna_st],[kraj])
     VALUES
           (3310, 'Žalec'),
		   (3000, 'Celje'),
		   (1000, 'Ljubljana'),
		   (6000, 'Koper'),
		   (4000, 'Kranj'),
		   (2000, 'Maribor'),
		   (9000, 'Murska Sobota'),
		   (8000, 'Novo mesto'),
		   (5000, 'Nova Gorica'),
		   (3210, 'Slovenske Konjice'),
		   (3212, 'Vojnik'), 
		   (3214, 'Zreče'),
		   (3220, 'Štore'),
		   (3230, 'Šentjur'),
		   (3250, 'Rogaška Slatina'),
		   (3270, 'Laško'),
		   (3272, 'Rimske Toplice'),
		   (3301, 'Petrovče'),
		   (3302, 'Griže'),
		   (3305, 'Vransko'),
		   (3311, 'Šempeter v Savinjski dolini'),
		   (3312, 'Prebold'),
		   (3313, 'Polzela'),
		   (3320, 'Velenje'),
		   (3330, 'Mozirje')
GO

INSERT INTO [dbo].[ZAPOSLENI]([emsa],[ime],[priimek],[polozaj],[naslov],[email],[davcna_st],[postna_st])
     VALUES
           ('2004987500123', 'Ambrož', 'Frank', 'natakar', 'Kraigherjeva ulica 16', 'frank.amb@siol.net','73461525', 3000),
		   ('1212980500349', 'Tilen', 'Gorc', 'kuhar', 'Ulica Karla Vovka 6', 'gorcTiln2@gmail.com', '44585117', 3220),
		   ('2506991500027', 'Jure', 'Barle', 'natakar', 'Kratka pot 10', 'barlenic@ita.si', '92158755', 3212),
		   ('3105989505146', 'Mojca', 'Cvenkelj', 'tajnica', 'Vrtna ulica 5', 'mojca@cvenkelj.com', '78526415', 3311),
		   ('1602990500038', 'Janez', 'Keber', 'natakar', 'Petrovče 182', 'keberkeber@siol.net', '31684927', 3301),
		   ('1111988505209', 'Petra', 'Hrušovar', 'kuhar', 'Lilijska ulica 6', 'petra@petra.si', '86685458', 3320)
GO

SET DATEFORMAT DMY
GO

--restavracija odprta od 9.00 do 23.00
--dve izmeni 9-17 in 15-23
INSERT INTO [dbo].[DELOVNI_DAN]([pricetek],[konec],[emsa])
     VALUES
		   ('17-04-2017 09:00:20', '17-4-2017 17:09:01', '2004987500123'),
		   ('17-04-2017 08:58:16', '17-4-2017 17:00:07', '1212980500349'),		   
		   ('17-04-2017 14:54:35', '17-4-2017 23:01:03', '2506991500027'),
		   ('17-04-2017 11:54:41', '17-4-2017 20:11:12', '3105989505146'),
		   ('17-04-2017 15:06:01', '17-4-2017 23:15:16', '1602990500038'),
		   ('17-04-2017 15:18:10', '17-4-2017 23:14:23', '1111988505209'),

           ('18-04-2017 09:01:08', '18-4-2017 17:10:30', '2004987500123'),
		   ('18-04-2017 09:04:44', '18-4-2017 17:02:12', '1212980500349'),		   
		   ('18-04-2017 14:58:12', '18-4-2017 23:07:27', '2506991500027'),
		   ('18-04-2017 12:01:08', '18-4-2017 20:01:40', '3105989505146'),
		   ('18-04-2017 14:55:14', '18-4-2017 23:01:15', '1602990500038'),
		   ('18-04-2017 15:00:55', '18-4-2017 22:04:56', '1111988505209'),

		   ('19-04-2017 09:01:08', '19-4-2017 17:10:30', '2004987500123'),
		   ('19-04-2017 09:04:44', '19-4-2017 17:02:12', '1212980500349'),		   
		   ('19-04-2017 14:58:12', '19-4-2017 23:07:27', '2506991500027'),
		   ('19-04-2017 12:01:08', '19-4-2017 20:01:40', '3105989505146'),
		   ('19-04-2017 14:55:14', '19-4-2017 23:01:15', '1602990500038'),
		   ('19-04-2017 15:00:55', '19-4-2017 22:04:56', '1111988505209'),

		   ('20-04-2017 09:01:08', '20-4-2017 17:10:30', '2004987500123'),
		   ('20-04-2017 09:04:44', '20-4-2017 17:02:12', '1212980500349'),		   
		   ('20-04-2017 14:58:12', '20-4-2017 23:07:27', '2506991500027'),
		   ('20-04-2017 12:01:08', '20-4-2017 20:01:40', '3105989505146'),
		   ('20-04-2017 14:55:14', '20-4-2017 23:01:15', '1602990500038'),
		   ('20-04-2017 15:00:55', '20-4-2017 22:04:56', '1111988505209'),

		   ('21-04-2017 09:01:08', '21-4-2017 17:10:30', '2004987500123'),
		   ('21-04-2017 09:04:44', '21-4-2017 17:02:12', '1212980500349'),		   
		   ('21-04-2017 14:58:12', '21-4-2017 23:07:27', '2506991500027'),
		   ('21-04-2017 12:01:08', '21-4-2017 20:01:40', '3105989505146'),
		   ('21-04-2017 14:55:14', '21-4-2017 23:01:15', '1602990500038'),
		   ('21-04-2017 15:00:55', '21-4-2017 22:04:56', '1111988505209')		   
		   
GO

INSERT INTO [dbo].[TELEFONSKA]([telefonska],[vrsta_tel],[emsa])
     VALUES
           ('031-654-888', 'mobilni', '2004987500123'),
		   ('040-587-123', 'mobilni', '1212980500349'),		   
		   ('051-999-999', 'mobilni', '2506991500027'),
		   ('056-546-879', 'mobilni', '3105989505146'),
		   ('050-080-080', 'služba', '3105989505146'),
		   ('021-334-811', 'mobilni', '1602990500038'),
		   ('050-881-881', 'mobilni', '1111988505209')
GO

INSERT INTO [dbo].[PLACA]([mesec_leto],[placa],[izplacana],[emsa])
     VALUES
           ('30-04-2017', 950, 'DA', '2004987500123'),
		   ('30-04-2017', 1000, 'DA', '1212980500349'),		   
		   ('30-04-2017', 950, 'DA', '2506991500027'),
		   ('30-04-2017', 900, 'DA', '3105989505146'),
		   ('30-04-2017', 950, 'DA', '1602990500038'),
		   ('30-04-2017', 1000, 'DA', '1111988505209')
GO

INSERT INTO [dbo].[MIZE]([st_stolov])
     VALUES
           (2),(6),(4),(4),(4),(5),(6),(6),(6),(6),(7),(4),(4),(2),(4),(4),(2)
GO

INSERT INTO [dbo].[SESTAVINE]([ime],[merska_enota])
     VALUES
           ('skuta', 'g'),
		   ('tuna ošiščena', 'g'),
		   ('špageti', 'g'),
		   ('sol', 'g'),
		   ('rdeče vino Chianti', 'l'),
		   ('sveži brancin', 'g'),
		   ('pršut', 'g'),
		   ('mozzarella', 'g'),
		   ('paradižnik', 'g'),
		   ('olive', 'g'),
		   ('sladoled', 'g'),
		   ('jajce', 'kos'),
		   ('maline', 'g')
GO

INSERT INTO [dbo].[REZERVACIJE]([ime_priimek],[st_oseb],[datum_klica],[1telefonska])
     VALUES
           ('Jože Potrebuješ', 2, '18-04-2017 18:34', '051-363-489'),
		   ('Marija Krancl', 5, '20-04-2017 13:45', '040-155-236'),
		   ('Robert Brin', 2, '21-04-2017 20:15', '031-416-465') 
GO



/*  antipasti-predjedi
	primo-prvi hod/začetna jed
	secondo-drugi hod/glavna jed
	contorni-priloge
	dolce-sladice
	bevande
		vino bianco/rosso/rose
*/
INSERT INTO [dbo].[MENI]([ime_artikla],[italijansko_ime_art],[opis_artilka],[kategorija],[cena])
     VALUES           
		   ('Olive v slanici', 'Olive in salamoia', '', 'Predjed', 3),
		   ('Grisini s pršutom', 'Grissini al prosciutto', '', 'Predjed', 2),
		   ('Hudičevo jajce', 'Uova alla diavola', 'Jajce s svežim tuninim nadevom', 'Predjed', 4),
		   ('Solatna torta z bučkami, mozzarello in paradižniki', 'Torta salata con zucchine, mozzarella e pomodorini', 'Bučke, mozzarella in paradižniki v testu', 'Predjed', 7),

		   ('Špageti z mesnimi kroglicami', 'Spaghetti con le polpettine', '', 'Začetna jed', 8),
		   ('Pesto lazanja', 'Pesto Lasagne', 'Lazanja s pesto nadevom', 'Začetna jed', 12),
		   ('Špageti s česnom in olivnim oljem', 'Spaghetti all olio', '', 'Začetna jed', 6),
		   ('Špageti s školjkami', 'Spaghetti alle vongole', '','Začetna jed', 7),
		   ('Špageti s tuno', 'Spaghetti al tonno', '', 'Začetna jed', 7),
		   ('Pašta fižol', 'Pasta e fagioli', 'Fižolova enolončnica s koščki klobase in testeninami', 'Začetna jed', 8),

		   ('Omleta s šparglji', 'Frittata di asparagi', 'Omleta iz jajc z dodanimi šparglji.', 'Glavna jed', 7),
		   ('Piščanec po sicilijasnko', 'Pollo alla siciliana', 'Piščanec dušen z olivami, paradižnikom in kaprami', 'Glavna jed', 8),
		   ('Brancin iz peči', 'Branzino al forno', '', 'Glavna jed', 15),
		   ('Oblečena telečja mesna štruca', 'Polpettone di vitello vestito', 'Telečja mesna štruca polnjena z bučkami, paradižnikom, pršutom in korenčkom.', 'Glavna jed', 14),

		   ('Šamrole - rolice z vanilijevo kremo', 'Cannoncini alla crema', 'Sladka crema zavita v biskvitno testo', 'Sladica', 8),
		   ('Panna cotta z malinami', 'Panna cotta ai lamponi', 'Želatinasta smetana', 'Sladica', 5),
		   ('Tiramisu', 'Tiramisu', '', 'Sladica', 6.35),
		   ('Sladoledni espresso', 'Gelato Affogato', 'Sladoled utopljen v svežem espresotu.', 'Sladica', 5),
		   ('Skutina torta', 'Torta di ricotta', '', 'Sladica', 4),
		   ('Rdeče vino Chianti', '', '', 'Rdeče vino', 6)
GO

INSERT INTO [dbo].[NABAVA]([datum_cas],[kolicina],[cena],[dobavitelj],[id_sestavine])
     VALUES
           ('17-04-2017', 30, 6, 'Mercator d.d.', 12),
		   ('17-04-2017', 1000, 4, 'Mercator d.d.', 4),
		   ('17-04-2017', 450, 12, 'Mercator d.d.', 8),
		   ('17-04-2017', 1000, 3.8, 'Mercator d.d.', 10),
		   ('17-04-2017', 1200, 26.89, 'Mercator d.d.', 7),
		   ('17-04-2017', 2000, 3.58, 'Mercator d.d.', 9),
		   ('17-04-2017', 0.75, 6.69, 'Mercator d.d.', 5)
GO

INSERT INTO [dbo].[NAROCILA]([datum_cas],[emsa],[st_mize])
     VALUES
           ('19-04-2017 12:00', '2004987500123', 1),
		   ('19-04-2017 20:00', '1602990500038', 3)
GO

INSERT INTO [dbo].[NAROCILA_MENI]([id_narocila],[stevilka_artikla])
     VALUES
           (1,2), (1,3), (1,6), (1,10), (1,12), (1,13), (1,17), (1,17),
		   (2,4), (2,3), (2,3), (2,3), (2,7), (2,7), (2,8), (2,9), (2,11), (2,11), (2,14), (2,14), (2,15), (2,20), (2,20)
GO

INSERT INTO [dbo].[SESTAVINA_V_JEDI]([stevilka_artikla],[id_sestavine],[kolicina])
     VALUES
           (13, 6, 800),
		   (13, 4, 5),
		   (13, 9, 250)
GO

INSERT INTO [dbo].[REZERVIRANE_MIZE]([st_rezervacije],[st_mize],[datum])
     VALUES
           (1, 14, '20-04-2017 19:00'),
		   (2, 6, '23-04-2017 20:00'),
		   (3, 1, '23-04-2017 20:00')
GO
