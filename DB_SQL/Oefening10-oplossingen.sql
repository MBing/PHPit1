# Oefening 10:

# Toon de naam & populatie van de Nederlandse steden.
# Toon ook de naam & populatie van de Belgische steden.
SELECT city.name, city.population FROM city INNER JOIN
country ON city.countrycode=country.code
WHERE country.name="Netherlands"
UNION
SELECT city.name, city.population FROM city INNER JOIN
country ON city.countrycode=country.code
WHERE country.name="Belgium"
## ANDERE/KORTERE MOGELIJKHEID: 
SELECT city.name, city.population FROM city INNER JOIN
country ON city.countrycode=country.code
WHERE country.name IN ("Netherlands","Belgium")

# Toon de naam van de Aziatische steden waar de onafhankelijkheid van het land is gevierd voor 1955. 
	# Toon ook de naam van de Europese steden waar de onafhankelijkheid van het land is gevierd na 1925.
SELECT city.name FROM city INNER JOIN
country ON city.countrycode=country.code
WHERE continent="Asia" AND indepyear < 1955
UNION
SELECT city.name FROM city INNER JOIN
country ON city.countrycode=country.code
WHERE continent="Europe" AND indepyear > 1925

# Toon de naam van de Europese steden waar de levensverwachting hoger is dan 60 en 
	# de populatie (vd. stad) groter is dan 200000. 
	# Toon ook de naam en levensverwachting van het land. 	
		# Toon ook de naam van de Amerikaanse steden waar de levensverwachting lager is dan 60. 
			# Toon ook de naam en levensverwachting van het land. 
			# Sorteer alfabetisch op de naam van het land.
SELECT city.name, lifeexpectancy, country.name FROM city INNER JOIN
country ON city.countrycode=country.code
WHERE continent="Europe" AND lifeexpectancy > 60 AND city.population > 200000
UNION
SELECT city.name, lifeexpectancy, country.name FROM city INNER JOIN
country ON city.countrycode=country.code
WHERE continent="America" AND lifeexpectancy < 60 
ORDER BY 3


# Toon de naam van de Europese landen, de officiële taal & door hoeveel percent van de bevolking ze gesproken wordt
	# Toon ook de naam van de Afrikaanse landen, de officiële taal & door hoeveel percent van de bevolking ze gesproken wordt
	# Maak geen gebruik van aliassen
	# Sorteer alfabetisch op naam land
SELECT country.name, language, percentage FROM country INNER JOIN
countrylanguage ON country.code=countrylanguage.countrycode
WHERE continent="Europe" AND isofficial="T"
UNION
SELECT country.name, language, percentage FROM country INNER JOIN
countrylanguage ON country.code=countrylanguage.countrycode
WHERE continent="Africa" AND isofficial="T"
ORDER BY 1 # enkel sorteren op kolommen die in de result set steken!

# Toon de naam van de Spaanse steden met een bevolking > 300000. 
# Toon ook de naam, continent en region van het land en de officiële taal die ze er spreken.
	# Toon ook de naam van de Engelse steden met een bevolking > 500000. 
		# Toon ook de naam, continent en region van het land en de officiële taal die ze er spreken.
		# Sorteer alfabetisch op naam van het land, dan op naam stad

SELECT city.name, continent, region, language FROM country INNER JOIN
(city INNER JOIN countrylanguage ON city.countrycode=countrylanguage.countrycode)
ON country.code = city.countrycode
WHERE country.name="Spain" AND isofficial="T" AND city.population > 300000
UNION
SELECT city.name, continent, region, language FROM country INNER JOIN
(city INNER JOIN countrylanguage ON city.countrycode=countrylanguage.countrycode)
ON country.code = city.countrycode
WHERE country.name="United Kingdom" AND isofficial="T" AND city.population > 500000
ORDER BY 1 # enkel sorteren op kolommen die in de result set steken!