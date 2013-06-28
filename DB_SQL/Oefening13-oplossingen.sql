# Oefening 13

# Toon de naam van de stad met het grootste bevolkingsaantal
SELECT name FROM city WHERE population = (SELECT MAX(population) FROM city)
# Toon de naam van de stad (en het land waarin die gelegen is) met het grootste bevolkingsaantal
SELECT city.name, country.name FROM city 
INNER JOIN country ON city.countrycode=country.code
WHERE city.population = (SELECT MAX(population) FROM city)
# Toon de naam van de steden met een bevolkingsaantal hoger dan het gemiddelde bevolkingsaantal van alle steden
SELECT name FROM city WHERE population > (SELECT AVG(population) FROM city)
# Toon de naam van de Nederlandse steden met een bevolkingsaantal lager dan het gemiddelde bevolkingsaantal 
	# van Nederlandse steden
SELECT city.name FROM city INNER JOIN country ON city.countrycode=country.code
WHERE country.name="Netherlands" AND city.population < 
(SELECT AVG(city.population) FROM city INNER JOIN country ON city.countrycode=country.code 
	WHERE country.name="Netherlands")
# Toon de naam van de Franse steden met een bevolkingsaantal hoger dan de Belgische stad met 
	# het hoogste bevolkingsaantal
SELECT city.name FROM city INNER JOIN country ON city.countrycode=country.code
WHERE country.name="France" AND city.population > 
(SELECT MAX(city.population) AS max_pop FROM city INNER JOIN country ON city.countrycode=country.code 
	WHERE country.name="Belgium")
# Toon de naam van de steden van alle Afrikaanse landen
SELECT city.name FROM city INNER JOIN country ON city.countrycode=country.code
WHERE continent LIKE "%africa%"
#(SELECT country.name FROM country WHERE continent LIKE "%africa%")

# Toon de naam van het Aziatisch land met de grootste bevolking
SELECT name FROM city 
WHERE population = 
	(SELECT MAX(city.population) FROM city 
		INNER JOIN country ON city.countrycode=country.code
		WHERE continent="Asia")
# Toon de naam van de landen met een GNP groter dan het gemiddelde GNP van alle landen
SELECT name FROM country WHERE gnp >
(SELECT AVG(gnp) FROM country )

# Toon de naam van het land met de grootste oppervlakte
SELECT name FROM country WHERE surfacearea =
(SELECT MAX(surfacearea) FROM country )
# Toon het land met de hoogste levensverwachting
SELECT name FROM country WHERE lifeexpectancy = 
	(SELECT MAX(lifeexpectancy) FROM country)

	# Stap 1: Toon de Europese landen met een levensverwachting die 
		#hoger is dan de gemiddelde levensverwachting van Afrikaanse landen
	SELECT name FROM country WHERE continent= "Europe" AND lifeexpectancy > 
		(SELECT AVG(lifeexpectancy) FROM country WHERE continent="africa")
	# Stap 2: Toon de Europese landen en hun officiële taal met een 
		# levensverwachting die hoger is dan de gemiddelde levensverwachting van Afrikaanse landen 
	SELECT name, language FROM country INNER JOIN countrylanguage ON country.code=countrylanguage.countrycode
		WHERE continent= "Europe" AND isofficial="T" AND lifeexpectancy > 
		(SELECT AVG(lifeexpectancy) FROM country WHERE continent="africa")
	# Stap 3: Toon de Europese landen en hun officiële taal met een 
		# levensverwachting die hoger is dan de gemiddelde levensverwachting van Afrikaanse landen 
		# waar Frans de officiële taal is 
	SELECT name, language FROM country INNER JOIN countrylanguage ON country.code=countrylanguage.countrycode
		WHERE continent= "Europe" AND isofficial="T" AND language="French" AND lifeexpectancy > 
		(SELECT AVG(lifeexpectancy) FROM country WHERE continent="africa")

# Toon het land met de laagste levensverwachting uit het continent Afrika
SELECT name FROM country WHERE continent LIKE "%africa%" AND lifeexpectancy =
	(SELECT MIN(lifeexpectancy) FROM country WHERE continent LIKE "%africa%")
	 

# Toon de naam en bevolkingsaantal van het Aziatisch land met de kleinste oppervlakte
SELECT name, population FROM country WHERE continent= "asia" AND surfacearea =
	(SELECT MIN(surfacearea) FROM country WHERE continent = "asia")
# Toon de naam van de talen die slechts in 1 land gesproken worden (via subquery in FROM)
SELECT language FROM 
(SELECT DISTINCT countrycode, language FROM countrylanguage) AS taal 
GROUP BY language HAVING count(*) = 1
# Toon de naam en bevolkingsaantal van de stad met het minste inwoners uit Angola
SELECT city.name, city.population FROM city INNER JOIN country ON city.countrycode=country.code
	WHERE country.name="Angola" AND city.population = 
	(SELECT MIN(city.population) FROM city INNER JOIN country ON city.countrycode=country.code
	WHERE country.name="Angola" AND country.name="Angola")