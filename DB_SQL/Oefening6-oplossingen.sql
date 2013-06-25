# Oefening 6:

# Update de stad Mechelen met een ander district en populatie
UPDATE city SET district="Vlaams",population=120000 WHERE name="Mechelen" (1)
# Update de stad Leuven met een andere landcode
UPDATE city SET countrycode="BLG" WHERE name="Leuven" (0)
# Update alle steden met landcode BEL met een populatie + 10000
UPDATE city SET population=population + 10000 WHERE countrycode="BEL" (10)
# Geef alle steden de nieuwe waarde Brabant voor het district waar het woord Brabant vookomt in het district
UPDATE city SET district="Brabant" WHERE district LIKE "%Brabant%" (4)
# Geef de landen waar het jaar van onafhankelijkheid null is 2011 als jaar van onafhankelijkheid
UPDATE country SET indepyear="2011" WHERE indepyear IS NULL (47)
# Pas de levensverwachting aan van de landen uit de continenten Noord-Amerika en ZuidAmerika met -5
UPDATE country SET lifeexpectancy=lifeexpectancy -5 WHERE continent IN ("North America", "South America") (51)
# Geef u zelf op als staatshoofd bij die landen waar er momenteel geen staatshoofd is
UPDATE country SET headofstate="Martin" WHERE headofstate IS NULL OR headofstate = '' (3)
# Pas alle republieken aan naar dictaturen
UPDATE country SET governmentform="Dictatorship" WHERE governmentform LIKE "%Republic%" (144)
# Pas de populatie aan naar 0 van alle steden waar de landcode gelijk is ARM, TUR, POL of GTM en waar het district de letter h bevat
UPDATE city SET population=0 WHERE countrycode IN ("ARM","TUR","POL","GTM") AND district LIKE "%h%" (7)
# Pas het percentage van de officiële taal van Dreamland aan naar 60%
UPDATE countrylanguage SET percentage=60 WHERE countrycode="DRL" AND isofficial="T" (1)
# Pas het percentage van de onofficiële taal van Dreamland aan naar 40%
UPDATE countrylanguage SET percentage=40 WHERE countrycode="DRL" AND isofficial="F" (1)
# Pas de naam aan naar naamcursistland (bv. Davyland) van alle landen die beginnen met de letter h en waar de onafhankelijkheid na 1935 is gevierd
UPDATE country SET name="Bingland" WHERE name LIKE "h%" AND indepyear > 1935 (2)