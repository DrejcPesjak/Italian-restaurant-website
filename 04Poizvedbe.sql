SET DATEFORMAT DMY
GO

--1.Koliko rezervacij je bilo prejšnji mesec?
SELECT Count(st_rezervacije)
FROM REZERVACIJE
WHERE REZERVACIJE.datum_klica BETWEEN '1-04-2017' AND '30-04-2017'	

--2.Koliko ur je Ambrož dalal aprila 2017?
	--potrebno seštevati - še nismo učili

--3.Kakšno plačo je imel Tilen meseca aprila?
SELECT PLACA.placa
FROM PLACA JOIN ZAPOSLENI ON
	 PLACA.emsa = ZAPOSLENI.emsa
WHERE ime LIKE 'Tilen' AND
	  mesec_leto BETWEEN '1-04-2017' AND '30-04-2017'

--4.Koliko plač v letu 2017 ni bilo izplačanih?
SELECT Count(PLACA.placa)
FROM PLACA 
WHERE izplacana LIKE 'NE'

--5.Kje živi Jure, da mu pošljem pismo?
SELECT naslov, POSTA.postna_st, kraj
FROM ZAPOSLENI JOIN POSTA ON
	 POSTA.postna_st = ZAPOSLENI.postna_st
WHERE ime LIKE 'Jure'

--6.Kolikšen znesek denarja je portrebno nakazati vsakemu zaposlenemu (s kakšno davčno) za pretekli mesec?
SELECT PLACA.placa, davcna_st
FROM PLACA JOIN ZAPOSLENI ON
	 PLACA.emsa = ZAPOSLENI.emsa
WHERE mesec_leto BETWEEN '1-04-2017' AND '30-04-2017'

--7.Katere so sestavine v lazanji?
SELECT SESTAVINE.ime
FROM MENI JOIN SESTAVINA_V_JEDI ON
	 MENI.stevilka_artikla=SESTAVINA_V_JEDI.stevilka_artikla
	 JOIN SESTAVINE ON
	 SESTAVINE.id_sestavine=SESTAVINA_V_JEDI.id_sestavine
WHERE ime_artikla LIKE 'Pesto lazanja'

--8.Od koga so kupovali hrano prejšnji mesec?
SELECT DISTINCT dobavitelj
FROM NABAVA
WHERE datum_cas BETWEEN '1-04-2017' AND '30-04-2017'

--9.Katere mize so že rezervirane na dan 23. april 2017 ob 20. uri?
SELECT st_mize
FROM REZERVIRANE_MIZE
WHERE datum = '23-04-2017 20:00'

--10.Katera jed je najdražja in kaj vsebuje?
SELECT ime_artikla, SESTAVINE.ime
FROM MENI JOIN SESTAVINA_V_JEDI ON
	 MENI.stevilka_artikla=SESTAVINA_V_JEDI.stevilka_artikla
	 JOIN SESTAVINE ON
	 SESTAVINE.id_sestavine=SESTAVINA_V_JEDI.id_sestavine
WHERE MENI.cena = (SELECT MAX(MENI.cena) FROM MENI)

--11.Kdo od zaposlenih živi v Celju?
SELECT ZAPOSLENI.ime, ZAPOSLENI.priimek
FROM ZAPOSLENI JOIN POSTA ON 
	 POSTA.postna_st = ZAPOSLENI.postna_st
WHERE kraj LIKE 'Celje'

--12.Kdo ima kakšno vlogo v restavraciji?
SELECT ime, priimek, polozaj
FROM ZAPOSLENI 

--13.Koliko stolov ima zadnja rezervirana miza?
SELECT st_stolov , MIZE.st_mize
FROM MIZE JOIN REZERVIRANE_MIZE ON
	 MIZE.st_mize=REZERVIRANE_MIZE.st_mize
ORDER BY datum ASC 

--14.Katere mize je Janez postregel 19. aprila?
SELECT DISTINCT NAROCILA.st_mize
FROM NAROCILA JOIN ZAPOSLENI ON
	 NAROCILA.emsa = ZAPOSLENI.emsa
WHERE ime LIKE 'Janez' AND
	  datum_cas BETWEEN '19-04-2017' AND '20-04-2017'

--15.Katere jedi vsebujejo brokoli?
SELECT ime_artikla
FROM MENI JOIN SESTAVINA_V_JEDI ON
	 MENI.stevilka_artikla=SESTAVINA_V_JEDI.stevilka_artikla
	 JOIN SESTAVINE ON
	 SESTAVINE.id_sestavine=SESTAVINA_V_JEDI.id_sestavine
WHERE SESTAVINE.ime LIKE 'brokoli'

--16.Koliko paradižnika je kuhar na zadnje naročil?
SELECT kolicina, merska_enota
FROM NABAVA JOIN SESTAVINE ON
	 NABAVA.id_sestavine=SESTAVINE.id_sestavine
WHERE ime LIKE 'paradižnik'

--17.Kdo je delal nadure?
SELECT ime, (DATEDIFF(MINUTE, DELOVNI_DAN.pricetek, DELOVNI_DAN.konec)/60) AS nadure
FROM ZAPOSLENI JOIN DELOVNI_DAN ON
	 ZAPOSLENI.emsa = DELOVNI_DAN.emsa
WHERE ((DATEDIFF(MINUTE, DELOVNI_DAN.pricetek, DELOVNI_DAN.konec)/60)-8)>0

--18.Koliko nadur je naredil Ambrož?
SELECT DISTINCT (DATEDIFF(hour, DELOVNI_DAN.pricetek, DELOVNI_DAN.konec)-8)
FROM DELOVNI_DAN JOIN ZAPOSLENI ON
	 DELOVNI_DAN.emsa=ZAPOSLENI.emsa
WHERE ZAPOSLENI.ime LIKE 'Ambrož'

--19.Kdo je rezerviral mizo 6?
SELECT ime_priimek
FROM REZERVACIJE JOIN REZERVIRANE_MIZE ON 
	 REZERVACIJE.st_rezervacije=REZERVIRANE_MIZE.st_rezervacije
WHERE st_mize = 6
	 
--20.Ali je pri kateri mizi prostora za 10 ljudi?
SELECT st_mize
FROM MIZE
WHERE st_stolov = 10

--21.Seznam vseh rezervacij za naslednji petek?
SELECT REZERVACIJE.*
FROM REZERVACIJE JOIN REZERVIRANE_MIZE ON 
	 REZERVACIJE.st_rezervacije = REZERVIRANE_MIZE.st_rezervacije
WHERE datum BETWEEN '12-05-2017' AND '13-05-2017'

--22.Katera bela vina ponujajo?
SELECT ime_artikla
FROM MENI 
WHERE kategorija LIKE 'Bela vina'

--23.Katere jedi ne vsebujejo arašidov?
SELECT DISTINCT ime_artikla
FROM MENI LEFT JOIN SESTAVINA_V_JEDI ON
	 MENI.stevilka_artikla=SESTAVINA_V_JEDI.stevilka_artikla
	 LEFT JOIN SESTAVINE ON
	 SESTAVINE.id_sestavine=SESTAVINA_V_JEDI.id_sestavine
WHERE SESTAVINE.ime NOT LIKE 'arašidi'

--24.Kdo je rezervriral več miz?
--SELECT REZERVACIJE.ime_priimek, st_mize
--FROM REZERVACIJE JOIN REZERVIRANE_MIZE ON
--	 REZERVACIJE.st_rezervacije = REZERVIRANE_MIZE.st_rezervacije
--GROUP BY st_mize
--HAVING Count(st_mize)>1

--25.Kdo od zaposlenih ima najvišjo plačo?
SELECT PLACA.placa, ZAPOSLENI.ime, ZAPOSLENI.priimek
FROM PLACA JOIN ZAPOSLENI ON
	 PLACA.emsa = ZAPOSLENI.emsa
WHERE PLACA.placa = (SELECT MAX(PLACA.placa) FROM PLACA)

--26.Kliko denarja so porabili za nabavo hrane?
SELECT SUM(NABAVA.cena)
FROM NABAVA 
--WHERE datum_cas BETWEEN '1-04-2017' AND '30-04-2017'

--27.Koliko dobička so ustvarili v letu 2017?
--SELECT SUM(MENI.cena)		   
--	  -SUM(NABAVA.CENA)
--	  -SUM(PLACA.placa)			
--FROM NABAVA, PLACA, MENI
--Še potrebno dodelati

--28.Na kateri datum je bilo prevzeto najdražjo naročilo?
--SELECT SUM(cena), id_narocila
--FROM MENI JOIN NAROCILA_MENI ON
--	 MENI.stevilka_artikla = NAROCILA_MENI.stevilka_artikla
--WHERE SUM(cena) = (SELECT MAX(SUM(cena)) FROM MENI)

--29.Katera jed vsebuje največ sladkorja?
SELECT ime_artikla
FROM MENI JOIN SESTAVINA_V_JEDI ON
	 MENI.stevilka_artikla=SESTAVINA_V_JEDI.stevilka_artikla
	 JOIN SESTAVINE ON
	 SESTAVINE.id_sestavine=SESTAVINA_V_JEDI.id_sestavine
WHERE kolicina = (SELECT MAX(kolicina) 
				  FROM SESTAVINA_V_JEDI JOIN SESTAVINE ON
				  SESTAVINE.id_sestavine=SESTAVINA_V_JEDI.id_sestavine 
				  WHERE SESTAVINE.ime LIKE 'sol') 

--30.Na kateri dan v tednu je največ prometa?


