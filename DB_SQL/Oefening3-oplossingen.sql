# Oefening 3 Oplossingen:

# Toon de naam van de landen uit centraal Afrika waar de leeftijdsverwachting > 60
SELECT `Name` FROM `country` WHERE `Region` = "Central Africa" AND `LifeExpectancy` > 60 (1)
# Toon de naam, district en populatie van alle steden uit Nederland waar de populatie >= 200000
SELECT `Name`, `District`, `Population` FROM `city` WHERE `CountryCode` = "NLD" AND `Population` >= 200000 (5)
# Toon de naam en staatshoofd van alle landen waar de oppervlakte > 100000 of < 1000
SELECT `Name`, `HeadOfState` FROM `country` WHERE `SurfaceArea` > 100000 OR `SurfaceArea` < 1000 (163)
# Toon de unieke districten van alle steden die beginnen met de letter a en waar de populatie < 200000 of > 500000
SELECT DISTINCT `District` FROM `city` WHERE `Name` LIKE 'a%' AND (`Population` < 200000 OR `Population` > 500000) (148)
SELECT DISTINCT `District` FROM `city` WHERE `Name` LIKE 'a%' AND `Population` NOT BETWEEN 200000 AND 500000 (148)
# Toon de naam en district van alle steden uit Zimbabwe waar de populatie kleiner is dan 100000
# Eerst in tabel Country de code zoeken:
SELECT * FROM `country` WHERE `Name` = "Zimbabwe"
# nu weten we dat de code ZWE is van Zimbabwe
SELECT `Name`,`District` FROM `city` WHERE `CountryCode` = "ZWE" AND `Population` < 100000 (0)
# Toon de naam van alle steden met landcode gelijk aan DSA, ASM, AND of AGO en waar de populatie tussen 100000 en 200000 ligt
SELECT `Name` FROM `city` WHERE `CountryCode` IN ("DSA","ASM","AND","AGO") AND `Population` BETWEEN 100000 AND 200000 (4) 
# Toon de naam van alle steden waar de landcode niet gelijk is aan NLD en waar de populatie < 100000 of > 1000000
SELECT `Name` FROM `city` WHERE `CountryCode` <> "NLD" AND (`Population` < 100000 OR `Population` > 1000000) (751)
SELECT `Name` FROM `city` WHERE `CountryCode` != "NLD" AND `Population` NOT BETWEEN 100000 AND 1000000 (751)
# Toon de naam en populatie van alle steden waar de landcode gelijk is ARM, BGR, COG of DNK en waar het district de letter f bevat
SELECT `Name`,`Population` FROM `city` WHERE `CountryCode` IN ("ARM","BGR","COG","DNK") AND `District` LIKE "%f%" (3)
# Toon de naam van alle steden waar de letter a niet in voorkomt
SELECT `Name` FROM `city` WHERE `Name` NOT LIKE "%a%" (1,044)
# Toon de naam van alle landen die beginnen met de letter f en waar de onafhankelijkheid vóór 1945 is gevierd
SELECT `Name` FROM `country` WHERE `Name` LIKE "f%" AND `IndepYear` < 1945 (2)
# Toon de naam van alle talen die niet eindigen met de letter n
SELECT `Language` FROM `countrylanguage` WHERE `Language` NOT LIKE "%n" (811)
# Toon de naam van alle steden waar de landcode niet gelijk is USA, 
# waar het district niet de letter e bevat en waar de populatie > 200000
SELECT `Name` FROM `city` WHERE `CountryCode` <> "USA" AND `District` NOT LIKE "%e%" AND `Population` > 200000 (928)