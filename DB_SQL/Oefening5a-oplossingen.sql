# Oefening 5a:

# Voeg de stad Mechelen toe met de juiste landcode, district en populatie (1ste manier)
INSERT INTO `city` VALUES (null,'Mechelen','BEL','Antwerpen', 100000)
# Voeg de stad Leuven toe met de juiste landcode, district en populatie (2de manier)
INSERT INTO `city`( `Name`, `CountryCode`, `District`, `Population`) VALUES ('Leuven','BEL','Vlaams Brabant', 100000)
# Voeg de steden Oostende en De Panne toe met de juiste landcode, district en populatie (via 1 INSERT INTO – 1ste manier)
INSERT INTO `city` VALUES (null,'Oostende','BEL','West Flanderi', 100000), (null,'De Panne','BEL','West Flanderi', 100000)
# Voeg de steden De Haan, Koksijde en Blankenberge toe met de juiste landcode, district en populatie (via 1 INSERT INTO – 2de manier)
INSERT INTO `city`( `Name`, `CountryCode`, `District`, `Population`) 
VALUES ('De Haan','BEL','West Flanderi', 100000),
('Koksijde','BEL','West Flanderi', 100000),
('Blankenberge','BEL','West Flanderi', 100000)
# Voeg het land Dreamland toe (de overige velden zijn vrij te kiezen)
INSERT INTO `country`(`Code`, `Name`, `Continent`, `Region`, `SurfaceArea`, `IndepYear`, `Population`,
 `LifeExpectancy`, `GNP`, `GNPOld`, `LocalName`, `GovernmentForm`, `HeadOfState`, `Capital`, `Code2`) 
VALUES ("DRL","Dreamland","North America","Carribbean", 20, 2012,2,100,3000,0,"Swentibold","Republic", "Me", "Hut 1", "DL")
# Voeg de talen Dutch (Officieel – 57.5%) en French (42.5%) toe voor het land Dreamland
INSERT INTO `countrylanguage`(`CountryCode`, `Language`, `IsOfficial`, `Percentage`) 
VALUES ("DRL","Dutch","T","57.5"),("DRL","French","F","42.5")