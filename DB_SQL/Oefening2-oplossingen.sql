# Oefening 2:

# Toon de naam van alle landen
SELECT `Name` FROM `country` (239)
# Toon de naam, district en populatie van alle steden
SELECT `Name`,`District`,`Population` FROM `city` (4,079)
# Toon de naam en staatshoofd van alle landen
SELECT `Name`,`HeadOfState` FROM `country` (239)
# Toon de unieke districten van alle steden
SELECT DISTINCT `District` FROM `city` (1,367)
# Toon de unieke continenten van alle landen
SELECT DISTINCT `Continent` FROM `country` (7)
# Toon de unieke talen
SELECT DISTINCT `Language` FROM `countrylanguage` (457)
# Toon de naam en district van alle steden waar de populatie kleiner is dan 100000
SELECT `Name`,`District` FROM `city` WHERE `Population` < 100000 (517)
# Toon de naam van alle steden waar de populatie tussen 100000 en 200000 ligt
SELECT `Name` FROM `city` WHERE `Population` BETWEEN 100000 AND 200000 (1,906)
# Toon de naam van alle steden waar de landcode gelijk is aan NLD
SELECT `Name` FROM `city` WHERE `CountryCode` = "NLD" (28)
# Toon de naam en populatie van alle steden waar de landcode gelijk is ARM, BGR, COG of DNK
SELECT `Name`,`Population` FROM `city` WHERE `CountryCode` IN ("ARM","BGR","COG","DNK") (20)
# Toon de naam van alle steden waar de letter a in voorkomt
SELECT `Name` FROM `city` WHERE `Name` LIKE '%a%' (3,035)
# Toon de naam van alle landen die beginnen met de letter f
SELECT `Name` FROM `country` WHERE `Name` LIKE 'f%' (8)
# Toon de naam van alle talen die eindigen met de letter n
SELECT `Language` FROM `countrylanguage` WHERE `Language` LIKE '%n' (173)
# Toon de naam van alle steden waar de landcode niet gelijk is USA
SELECT `Name` FROM `city` WHERE `CountryCode` <> 'USA' (3,805)
SELECT `Name` FROM `city` WHERE `CountryCode` != 'USA' (3,805)