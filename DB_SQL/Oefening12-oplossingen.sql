# Oefening 12:

# Maak een database aan webshop. 
# Maak een tabel articles met de volgende velden:
# id (INT PK auto increment), name (VARCHAR 50), description (TEXT), price (FLOAT of 
	# DOUBLE), date_creation (DATE), date_last_modified (DATE) 

# Voeg 3 records toe via 1 INSERT INTO waarbij date_creation en date_last_modified de datum van vandaag krijgen
INSERT INTO `articles`(`name`, `description`, `price`, `date_creation`, `date_last_modified`) 
VALUES ("artikelke1","artikel de beschrijving van het eerste",4.56,CURDATE(),CURDATE()),
("artikelke2","artikel de beschrijving van het tweede",7.96,CURDATE(),CURDATE()),
("artikelke3","artikel de beschrijving van het derde",14.86,CURDATE(),CURDATE())

# Pas 1 record aan zodat de date_creation van dat artikel niet langer gelijk is aan vandaag, maar 14 dagen geleden
UPDATE `articles` SET `date_creation`=CURDATE()-14 WHERE name="artikelke1"
# Toon nu enkel die records waarbij het artikel moet aangemaakt zijn in de laatste 7 dagen
SELECT * FROM articles WHERE date_creation > (CURDATE()-7)
# Toon de Afrikaanse landen waar de levensverwachting hoger is dan 60 in hoofdletters en de 
	# Afrikaanse landen waar de levensverwachting lager of gelijk is dan 60 in kleine letters 
	# sorteer op naam land alfabetisch
SELECT UCASE(name) AS country FROM country WHERE continent="Africa" AND lifeexpectancy > 60
UNION
SELECT LCASE(name) FROM country WHERE continent="Africa" AND lifeexpectancy <= 60
ORDER BY country #je kan geen order doen op iets dat niet weergegeven wordt

# Geef de citycode (=eerste 3 karakters) van elke stad waarvan het land geregeerd wordt door Elisabeth II
SELECT MID(city.name,1,3) AS stadscode FROM city INNER JOIN country ON city.countrycode=country.code
WHERE headofstate="Elisabeth II"
# Geef de namen van de steden waarvan de benaming langer is dan 20 karakters
SELECT name FROM city GROUP BY name HAVING LENGTH(name) > 20
# Toon de naam van de landen waar Elisabeth II regeert. 
	# Toon ook in elke record Her Majesty The Queen Elisabeth II
SELECT name, CONCAT('Her Majesty The Queen ',headofstate) FROM country
WHERE headofstate="Elisabeth II"
# Toon de gemiddelde levensverwachting in de wereld. Rond af tot 2 cijfers na de komma
SELECT ROUND(AVG(lifeexpectancy), 2) AS life_world_exp FROM country
# Toon een willekeurig land en de huidige systeemdatum&tijd in formaat DD-MM-YYYY HH:MM:SS
SELECT name, DATE_FORMAT(NOW(),'%d-%m-%Y %T') AS cur_date FROM country
ORDER BY RAND() LIMIT 1
# Toon een willekeurig artikel uit uw webshop (formaat datum creatie en laatst gewijzigd = dd/mm/’yy
SELECT name, DATE_FORMAT(date_last_modified, '%d/%m/\'%y') FROM articles ORDER BY RAND() LIMIT 1