# Oefening 8:

# Toon de naam&leeftijdsverwachting van 5 landen uit Amerika waar de leeftijdsverwachting > 50 
 # sorteer op leeftijdsverwachting van hoog naar laag
SELECT name, lifeexpectancy FROM country WHERE continent LIKE '%america%' AND lifeexpectancy > 50 ORDER BY lifeexpectancy DESC LIMIT 5
# Toon de naam, district & populatie van 3 steden uit Argentinië waar de populatie >= 100000 en sorteer op populatie van hoog naar laag
SELECT name, district, population FROM city WHERE countrycode="ARG" AND population > = 100000 ORDER BY population DESC LIMIT 3
# Toon de naam, staatshoofd & jaar onafhankelijkheid van 4 monarchieën waar de onafhankelijkheid voor 1980 is gevierd en 
 # sorteer alfabetisch op naam land
SELECT name, headofstate, indepyear FROM country 
WHERE governmentform LIKE '%monarch%' 
AND indepyear > 1980 
ORDER BY name # kan je ook 1 zetten, eerste kolom die getoond wordt 
LIMIT 4
# Verwijder 1 stad met landcode NLD
DELETE FROM city WHERE countrycode="NLD" LIMIT 1
# Verwijder 1 land waar het jaar van onafhankelijkheid 1993 is
DELETE FROM country WHERE indepyear=1993 LIMIT 1
# Verwijder 1 monarchie uit de verschillende soorten monarchieën
DELETE FROM country WHERE governmentform LIKE "%monarch%" LIMIT 1
# Toon de naam van de landen waar de lokale naam begint met eender welke letter gevolgd door de letter e en 
 # sorteer alfabetisch (bv. Belize)
SELECT name FROM country WHERE localname LIKE "_e" ORDER BY 1 # of name
# Toon de naam van de talen die eindigen met de letter a gevolgd door een willekeurige letter (bv. Turkmenian)
SELECT language FROM countrylanguage WHERE language LIKE "%a_"
# Toon de naam van de steden die beginnen en eindigen met de letter e en waar nog 1 willekeurige letter kan tussenstaan
SELECT name FROM city WHERE name LIKE "e_e"
# Toon de naam van alle landen die eindigen met de letter n en waar de onafhankelijkheid vóór 1925 is gevierd 
 # sorteer op naam alfabetisch en dan op regio Z->A, hernoem het naam veld naar independanceBeforeWWII
SELECT name AS independanceBeforeWWII FROM country # niet gebruikelijk uiteraard om AS zo te gebruiken!!
WHERE name LIKE "%n" AND indepyear < 1925 
ORDER BY name, region DESC 
# Toon de staatshoofden van alle dictaturen en hernoem het veld naar dictators
SELECT headofstate AS dictators FROM country WHERE governmentform = "Dictatorship" # of LIKE "%dicta%"
# Toon de Name, Surface, IndepYear, LifeExpectancy van de landen uit de Caribbean, 
 # sorteer op Surface van hoog naar laag en hernoem de velden naar naam, Oppervlakte, 
 # Onafhankelijkheid, Levensverwachting
SELECT name AS naam, surfacearea AS Oppervlakte, indepyear AS onafhankelijkheid, lifeexpectancy AS levensverwachting
FROM country WHERE region="Caribbean" 
ORDER BY surfacearea DESC
# Toon de naam van de steden met 5 karakters die beginnen met n en eindigen op n
SELECT name FROM city WHERE name LIKE "n___n"
# Toon de naam van de steden met 7 karakters
SELECT name FROM city WHERE name LIKE "_______" 