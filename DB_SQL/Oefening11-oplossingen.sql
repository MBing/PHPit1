# Oefening 11

# Vermenigvuldig het GNP van de Afrikaanse landen met 1.2
UPDATE country SET gnp = gnp * 1.2 WHERE continent = "Africa"
# Deel het GNP van de Aziatische landen met een oppervlakte groter dan 100000 door 2
UPDATE country SET gnp = gnp / 2 WHERE surfacearea > 100000 AND continent = "Asia"
# Toon de gemiddelde levensverwachting van Europese landen
SELECT AVG(lifeexpectancy) AS avg_lifeexp FROM country WHERE continent="Europe"
# Toon de gemiddelde populatie van landen uit de regio centraal afrika
SELECT AVG(population) AS avg_pop FROM country WHERE region="Central Africa"
# Toon het totaal aantal Amerikaanse landen
SELECT COUNT(name) AS tot_names FROM country WHERE continent LIKE "%america%"
# Toon de eerste stad uit de tabel city
SELECT name FROM city LIMIT 1
# Toon het laatste land uit de tabel country
SELECT name FROM country ORDER BY code DESC LIMIT 1 # 'code' via de PK ga je sorteren en niet op naam !!
# Toon de som van de bevolkingsaantallen van de Franse steden
SELECT SUM(city.population) AS sum_city_pop FROM city 
INNER JOIN country ON city.countrycode = country.code 
WHERE country.name = "France"
# Toon de gemiddelde populatie van een stad per land sorteer op gemiddelde populatie hoog naar laag
SELECT AVG(city.population) AS sum_city_pop, country.name FROM city 
INNER JOIN country ON city.countrycode = country.code 
GROUP BY country.name # in de vraag zie je 'per' staan bij land, dus dit komt hier bij de group by!!
ORDER BY sum_city_pop DESC
# Toon de gemiddelde populatie van een stad per district per land, sorteer van Z-> A op land en dan op district
SELECT AVG(city.population) AS sum_city_pop, district, country.name AS country FROM city 
INNER JOIN country ON city.countrycode = country.code 
GROUP BY country, district
ORDER BY country DESC, district DESC
# Toon de gemiddelde populatie per district van de Nederlandse steden sorteer alfabetisch op district
SELECT AVG(city.population) AS sum_city_pop, district FROM city 
INNER JOIN country ON city.countrycode = country.code 
GROUP BY district, country.name 
HAVING country.name = "Netherlands" # WHERE lukte niet, country.name toon je niet!!
ORDER BY district
# Toon de gemiddelde populatie van een stad per land van de landen met meer dan 15 steden
SELECT AVG(city.population) AS sum_city_pop, country.name FROM city 
INNER JOIN country ON city.countrycode = country.code 
GROUP BY country.name 
HAVING COUNT(city.name) > 15
# Toon de grootste populatie van een stad per land van die landen waar de grootste populatie 
	# van een stad groter is dan 1000000 sorteer op populatie van hoog naar laag
SELECT MAX(city.population) AS sum_city_pop, country.name FROM city 
INNER JOIN country ON city.countrycode = country.code 
GROUP BY country.name 
HAVING sum_city_pop > 1000000
ORDER BY sum_city_pop DESC
# Toon de kleinste populatie van een stad per land van die landen waar de gemiddelde populatie 
	# van een stad groter is dan 100000 sorteer op naam land
SELECT MIN(city.population) AS sum_city_pop, country.name FROM city 
INNER JOIN country ON city.countrycode = country.code 
GROUP BY country.name 
HAVING AVG(city.population) > 100000
ORDER BY country.name
# Toon het percentage (door hoeveel personen de taal gesproken) van de kleinste onofficiële taal per land
SELECT percentage FROM countrylanguage
INNER JOIN country ON countrylanguage.countrycode=country.code
GROUP BY country
HAVING MIN(percentage) AND isofficial = "F"
# Toon de namen van de steden die meer dan 1x voorkomen
SELECT name FROM city 
GROUP BY name 
HAVING COUNT(name) > 1
# Toon de naam van de brouwerijen waar het gemiddelde alcoholpercentage van de gebrouwen bieren hoger ligt dan 5
SELECT brouwers.brnaam AS brouwerij FROM brouwers
INNER JOIN bieren ON brouwers.brouwernr= bieren.brouwernr
GROUP BY brouwerij
HAVING AVG(alcohol) > 5