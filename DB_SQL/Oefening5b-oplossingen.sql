# Oefening 5b:

# Voeg de landcodes toe aan een nieuwe tabel landcodes
INSERT INTO `landcodes` SELECT  DISTINCT `Code` FROM `Country` # we selecteren maar 1 kolom, dus vullen we ook maar 1 kolom
# Voeg de unieke talen toe aan een nieuwe tabel talen
INSERT INTO `talen` SELECT DISTINCT `Language` FROM `countrylanguage`
# Voeg de steden en districten toe aan een nieuwe tabel city_district
INSERT INTO `city_district` SELECT DISTINCT `Name`, `District` FROM `city` # 2 kolommen aan beide kanten, dus hoef je niet te vermelden
# Voeg de inhoud van de tabel city toe aan een nieuwe tabel bck_city
# Via `Operations` tab --> `copy table to` .. en `bck_city` ingeven (zorg dat je in de juiste tabel staat)
 CREATE  TABLE  `world`.`bck_city` (  `ID` int( 11  )  NOT  NULL  AUTO_INCREMENT ,
 `Name` char( 35  )  NOT  NULL DEFAULT  '',
 `CountryCode` char( 3  )  NOT  NULL DEFAULT  '',
 `District` char( 20  )  NOT  NULL DEFAULT  '',
 `Population` int( 11  )  NOT  NULL DEFAULT  '0',
 PRIMARY  KEY (  `ID`  ) ,
 KEY  `CountryCode` (  `CountryCode`  )  ) ENGINE  = InnoDB  DEFAULT CHARSET  = latin1;

SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

INSERT INTO `world`.`bck_city` SELECT * FROM `world`.`city`;

# Voeg de inhoud van de tabel country toe aan een nieuwe tabel country in een database bck_world
# zelfde als hierboven maar dan eerst een nieuwe db aanmaken en in de tabel `country` gaan staan
CREATE  TABLE  `bck_world`.`country` (  `Code` char( 3  )  NOT  NULL DEFAULT  '',
 `Name` char( 52  )  NOT  NULL DEFAULT  '',
 `Continent` enum(  'Asia',  'Europe',  'North America',  'Africa',  'Oceania',  'Antarctica',  'South America'  )  NOT  NULL DEFAULT  'Asia',
 `Region` char( 26  )  NOT  NULL DEFAULT  '',
 `SurfaceArea` float( 10, 2  )  NOT  NULL DEFAULT  '0.00',
 `IndepYear` smallint( 6  )  DEFAULT NULL ,
 `Population` int( 11  )  NOT  NULL DEFAULT  '0',
 `LifeExpectancy` float( 3, 1  )  DEFAULT NULL ,
 `GNP` float( 10, 2  )  DEFAULT NULL ,
 `GNPOld` float( 10, 2  )  DEFAULT NULL ,
 `LocalName` char( 45  )  NOT  NULL DEFAULT  '',
 `GovernmentForm` char( 45  )  NOT  NULL DEFAULT  '',
 `HeadOfState` char( 60  )  DEFAULT NULL ,
 `Capital` int( 11  )  DEFAULT NULL ,
 `Code2` char( 2  )  NOT  NULL DEFAULT  '',
 PRIMARY  KEY (  `Code`  )  ) ENGINE  = InnoDB  DEFAULT CHARSET  = latin1;

SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

INSERT INTO `bck_world`.`country` SELECT * FROM `world`.`country`;
