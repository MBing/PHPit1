#Oefening 4:

# Toon de naam van alle landen uit Azië waar de leeftijdsverwachting > 70 sorteer op leeftijdsverwachting van hoog naar laag
SELECT `Name` FROM `country` WHERE `Continent` = "Asia" AND `LifeExpectancy` > 70 ORDER BY `LifeExpectancy` DESC (22)
# Toon de naam en district van alle steden uit België waar de populatie >= 100000 en sorteer op populatie van laag naar hoog
SELECT `Name`,`District` FROM `city` WHERE `CountryCode` = "BEL" AND `Population` >= 100000 ORDER BY `Population` ASC (8)
# Toon de naam en staatshoofd van alle republieken waar de onafhankelijkheid voor 1960 is gevierd en sorteer alfabetisch op naam land
SELECT `Name`,`HeadOfState` FROM `country` WHERE `GovernmentForm` = "Republic" AND `IndepYear` < 1960 ORDER BY `Name` ASC (50)
# Toon de naam van de landen waar de lokale naam gelijk is aan de naam en sorteer alfabetisch
SELECT `Name` FROM `country` WHERE `Name` = `LocalName` ORDER BY `Name` ASC (104)
# Toon de unieke districten van alle steden die beginnen met de letter g en sorteer op district alfabetisch
SELECT DISTINCT `District` FROM `city` WHERE `Name` LIKE "g%" ORDER BY `District` ASC (114)
# Toon de naam en district van alle steden uit de Bahamas waar de populatie kleiner is dan 100000 sorteer op populatie van hoog naar laag
SELECT * FROM `country` WHERE Name = "Bahamas" # Get the CountryCode first
SELECT `Name`,`District` FROM `city` WHERE `CountryCode` = "BHS" AND `Population` < 100000 ORDER BY `Population` DESC (0)
# Toon de naam van alle steden met landcode gelijk aan DSA, ASM, AND of AGO en waar de populatie niet tussen 100000 en 200000 ligt sorteer op naam stad van Z -> A
SELECT `Name` FROM `city` WHERE `CountryCode` IN ("DSA","ASM","AND","AGO") AND `Population` NOT BETWEEN 100000 AND 200000 ORDER BY `Name` DESC (4)
# Toon de naam en landcode van de steden waar naam gelijk is aan district sorteer op district alfabetisch en dan op naam stad alfabetisch
SELECT `Name`,`CountryCode` FROM `city` WHERE `Name` = `District` ORDER BY `District` ASC, `Name` ASC (550)
# Toon de naam van alle steden waar de landcode niet gelijk is aan NLD en waar de populatie < 100000 of > 1000000 sorteer op naam stad alfabetisch
SELECT `Name` FROM `city` WHERE `CountryCode` <> "NLD" AND `Population` NOT BETWEEN 100000 AND 1000000 ORDER BY `Name` ASC (751)
SELECT `Name` FROM `city` WHERE `CountryCode` != "NLD" AND (`Population` < 100000 OR `Population` > 1000000) ORDER BY `Name` ASC (751)
# Toon de naam en populatie van alle steden waar de landcode gelijk is ARM, BGR, COG of DNK en waar het district de letter f bevat sorteer op naam stad van Z -> A
SELECT `Name`,`Population` FROM `city` WHERE `CountryCode` IN ("ARM","BGR","COG","DNK") AND `District` LIKE "%f%" ORDER BY `Name` DESC (3)
# Toon de naam van alle steden waar de letter a niet in voorkomt sorteer op district alfabetisch en dan op naam van de stad
SELECT `Name` FROM `city` WHERE `Name` NOT LIKE "%a%" ORDER BY `District` ASC, `Name` ASC (1,044)
# Toon de naam van alle landen die beginnen met de letter f en waar de onafhankelijkheid 
# vóór 1945 is gevierd sorteer op continent alfabetisch en dan op regio alfabetisch
SELECT `Name` FROM `country` WHERE `Name` LIKE "f%" AND `IndepYear` < 1945 ORDER BY `Continent` ASC, `Region` ASC (2)
# Toon de naam van alle talen die niet eindigen met de letter n sorteer op landcode alfabetisch en dan op naam van de taal alfabetisch
SELECT `Language` FROM `countrylanguage` WHERE `Language` NOT LIKE "%n" ORDER BY `CountryCode` ASC, `Language` ASC (811)
# Toon de naam van alle steden waar de landcode niet gelijk is USA, waar het district niet 
# de letter e bevat en waar de populatie > 200000 sorteer op landcode alfabetisch en dan op populatie van hoog naar laag
SELECT `Name` FROM `city` WHERE `CountryCode` <> "USA" AND `District` NOT LIKE "%e%" AND `Population` > 200000 ORDER BY `CountryCode` ASC, `Population` DESC (928)
# Toon de naam en de landcode van de officiële talen die door meer dan 50% van de bevolking worden gesproken sorteer op percentage gesproken van hoog naar laag
SELECT `Language`, `CountryCode` FROM `countrylanguage` WHERE `Percentage` > 50 AND `IsOfficial` = 'T' ORDER BY `Percentage` DESC (130)