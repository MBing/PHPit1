# Oefening 7:

# Verwijder de stad Mechelen op basis van de naam
DELETE FROM `city` WHERE name = "Mechelen" (1)
# Verwijder de stad Leuven op basis van het id
DELETE FROM `city` WHERE id = 4081 (1)
# Verwijder alle steden met landcode BEL
DELETE FROM `city` WHERE countrycode = "BEL" (9)
# Verwijder alle steden waar de waarde Brabant voorkomt in het district
DELETE FROM `city` WHERE district LIKE "%Brabant%" (4) # bij gebruik van LIKE doet er niet toe van hoofdletters!!
# Verwijder de landen waar het jaar van onafhankelijkheid 2011 is
DELETE FROM `country` WHERE indepyear=2011 (CASCADE ERROR -> zet ON DELETE OP 'CASCADE' via de FK) 
# Verwijder de landen waar u het staatshoofd bent
DELETE FROM `country` WHERE headofstate="Martin" (CASCADE ERROR)
# Verwijder alle dictaturen
DELETE FROM `country` WHERE governmentform="Dictatorship" (CASCADE ERROR)
# Verwijder alle steden waar de landcode gelijk is ARM en TUR en waar het district de letter g bevat
DELETE FROM `city` WHERE countrycode IN ("ARM","TUR") AND district LIKE "%g%" (5)
# Verwijder alle steden die beginnen met de letter f en waar de populatie < 100000 of > 700000
DELETE FROM `city` WHERE name LIKE "f%" AND population NOT BETWEEN 100000 AND 700000 (45)
# Verwijder alle steden uit Nederland waar de populatie kleiner is dan 400000
DELETE FROM `city` WHERE countrycode = "NLD" AND population < 400000 (20) # werkt ook met kleine letters "nld"
# Verwijder alle onofficiële talen die door minder dan 10% van de bevolking worden gesproke
DELETE FROM `countrylanguage` WHERE isofficial = "F" AND percentage < 10 (569)