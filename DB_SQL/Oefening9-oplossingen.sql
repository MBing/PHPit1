# Oefening 9

# Toon de naam, district & populatie van 3 steden uit Mexico waar de populatie > = 100000 en sorteer op populatie van hoog naar laag.
	# Geef een oplossing zonder en met tabel aliassen.
SELECT city.name, district, city.population FROM city 
INNER JOIN country ON city.countrycode = country.code 
WHERE country.name= "Mexico" AND city.population > = 100000 
ORDER BY city.population DESC LIMIT 3

# Toon de naam van de Nederlandse steden
	# Toon ook de naam, continent en regio van het land en gebruik eventueel aliassen om alles te verduidelijken
SELECT city.name, country.name, country.continent, country.region FROM city 
INNER JOIN country ON city.countrycode = country.code
WHERE country.name = "Netherlands"

# Toon de naam van de Belgische steden waar de populatie < 1000000.
	# Toon ook de naam, continent en region van het land en gebruik eventueel aliassen om alles te verduidelijken.
SELECT city.name, country.name, country.continent, country.region FROM city 
INNER JOIN country ON city.countrycode = country.code
WHERE country.name = "Belgium" AND city.population < 1000000

# Toon de naam van de Afrikaanse steden waar de onafhankelijkheid van het land is gevierd voor 1945. 
	# Toon ook de naam en jaar van onafhankelijkheid van het land. 
	# Sorteer alfabetisch op naam land en dan op jaar van onafhankelijkheid van eerst naar 
	# laatst en gebruik eventueel aliassen om alles te verduidelijken.
SELECT city.name, country.name, indepyear FROM city 
INNER JOIN country ON city.countrycode = country.code
WHERE country.name = "Africa" AND indepyear < 1945
ORDER BY country.name, indepyear

# Toon de naam van de Aziatische steden waar de levensverwachting hoger is dan 60 en 
	# de populatie (vd. stad) groter is dan 300000.
	# Toon ook de naam en levensverwachting van het land. Sorteer alfabetisch op naam land 
	# en dan op levensverwachting van hoog naar laag en gebruik eventueel aliassen om alles te verduidelijken.
SELECT city.name, country.name, country.lifeexpectancy FROM city 
INNER JOIN country ON city.countrycode = country.code
WHERE country.region = "Asia" AND lifeexpectancy < 60 AND city.population > 300000
ORDER BY country.name, lifeexpectancy DESC

# Toon de naam van de steden uit de landen met een oppervlakte kleiner dan 100. 
	# Toon ook de naam en oppervlakte van het land en sorteer alfabetisch op naam land en dan 
	# op oppervlakte van laag naar hoog en gebruik eventueel aliassen om alles te verduidelijken.
SELECT city.name, country.name, surfacearea FROM city 
INNER JOIN country ON city.countrycode = country.code
WHERE surfacearea < 100
ORDER BY country.name, surfacearea

# Toon de naam van de Afrikaanse landen, de officiële taal & door hoeveel percent van de 
	# bevolking ze gesproken wordt, sorteer op naam land
SELECT name, language, percentage FROM country 
INNER JOIN countrylanguage ON country.code = countrylanguage.countrycode
WHERE continent="Africa" AND isofficial="T"
ORDER BY name

# Toon de naam van de Franse steden met een bevolking > 400000.
	# Toon ook de naam, continent en region van het land en de officiële taal die ze er 
	# spreken en gebruik eventueel aliassen om alles te verduidelijken.
SELECT city.name, country.name, continent, region, language 
FROM city INNER JOIN 
(country INNER JOIN countrylanguage 
	ON country.code = countrylanguage.countrycode)
ON country.code=city.countrycode
WHERE country.name="France" AND isofficial="T" AND city.population > 400000

##################################################################################################################
# Toon de naam van de Duitse steden waar de populatie < 1000000.												 #
	# Toon ook de officiële taal die ze er spreken en gebruik eventueel aliassen om alles te verduidelijken.	 #
SELECT city.name, language FROM countrylanguage 																 #
INNER JOIN (city INNER JOIN country ON city.countrycode = country.code)											 #
ON countrylanguage.countrycode=city.countrycode																	 #
WHERE country.name="Germany" AND isofficial="T" AND city.population < 1000000									 #
##################################################################################################################

# Toon de naam van de stad en levensverwachting in Gent
SELECT city.name, lifeexpectancy FROM city 
INNER JOIN country ON country.code=city.countrycode
WHERE city.name="Gent"

# Toon de naam en de government form in de steden Berlijn, Parijs, Londen en Peking
SELECT city.name, governmentform FROM city 
INNER JOIN country ON country.code=city.countrycode
WHERE city.name IN ("Berlin", "Paris", "London", "Peking")

# Toon de naam en Head of state van de steden uit Angola
SELECT city.name, headofstate FROM city 
INNER JOIN country ON country.code=city.countrycode
WHERE country.name = "Angola" 

# Toon de naam van alle landen en steden sorteer alfabetisch op naam land
SELECT country.name, city.name FROM city
INNER JOIN country ON country.code = city.countrycode
ORDER BY country.name

# Gebruik zowel eens een INNER als een LEFT/RIGHT JOIN en kijk of er verschillen zijn op het aantal records in de result-set

# Toon de naam, soort en brouwerij van de bieren die beginnen met de letter a
SELECT bieren.naam, soort, brouwers.brnaam FROM bieren
INNER JOIN (brouwers INNER JOIN soorten ON bieren.soortnr = soorten.soortnr)
ON bieren.brouwernr = brouwers.brouwernr
WHERE bieren.naam LIKE "a%"

# Toon de naam, soort en brouwerij van de bieren met een soort die de letter t bevat
	# sorteer op brouwerij alfabetisch en dan op naam alfabetisch
SELECT bieren.naam, soort, brouwers.brnaam FROM bieren
INNER JOIN (brouwers INNER JOIN soorten ON bieren.soortnr = soorten.soortnr)
ON bieren.brouwernr = brouwers.brouwernr
WHERE soort LIKE "%t%"
ORDER BY 3,1

# Toon de naam, soort en brouwerij van de bieren uit brouwerijen die een omzet hebben 
	# van meer dan 100000 sorteer op naam bier alfabetisch
SELECT bieren.naam, soort, brouwers.brnaam FROM bieren
INNER JOIN (brouwers INNER JOIN soorten ON bieren.soortnr = soorten.soortnr)
ON bieren.brouwernr = brouwers.brouwernr
WHERE brouwers.omzet > 100000
ORDER BY 1

# Toon een overzicht van alle brouwers en de (unieke) soorten die ze brouwen, sorteer op 
	# brouwer alfabetisch en dan op soort alfabetisch
SELECT DISTINCT brouwers.brnaam, soort FROM bieren
INNER JOIN (brouwers INNER JOIN soorten ON bieren.soortnr = soorten.soortnr)
ON bieren.brouwernr = brouwers.brouwernr
ORDER BY 1

