# SQL voor MySQL ontwikkelaars voorbeeld db:
CREATE DATABASE tennisvereniging;
USE tennisvereniging;
CREATE TABLE spelers (
spelersnr INT UNSIGNED,
naam VARCHAR(50),
voorletters VARCHAR(10),
geb_datum DATE,
geslacht ENUM ('M','V') DEFAULT 'M',
jaartoe TIMESTAMP,
straat VARCHAR(50),
huisnr VARCHAR(10),
postcode VARCHAR(10),
plaats VARCHAR(50),
telefoon VARCHAR(20),
bondsnr INT UNSIGNED UNIQUE,
PRIMARY KEY (spelersnr)
);
CREATE TABLE teams (
teamnr INT UNSIGNED,
spelersnr INT UNSIGNED,
divisie VARCHAR(50),
PRIMARY KEY (teamnr)
);
CREATE TABLE wedstrijden (
wedstrijdnr INT UNSIGNED AUTO_INCREMENT,
teamnr INT UNSIGNED,
spelersnr INT UNSIGNED,
gewonnen INT UNSIGNED,
verloren INT UNSIGNED,
PRIMARY KEY (wedstrijdnr)
);
CREATE TABLE boetes (
betalingsnr INT UNSIGNED,
spelersnr INT UNSIGNED,
datum DATE,
bedrag INT,
PRIMARY KEY (betalingsnr)
);
CREATE TABLE bestuursleden (
spelersnr INT UNSIGNED,
begin_datum TIMESTAMP,
eind_datum TIMESTAMP,
functie VARCHAR(50),
PRIMARY KEY (spelersnr,begin_datum)
);

# toevoegen van data aan spelers tabel:
INSERT INTO spelers 
(spelersnr, naam, voorletters, geb_datum, geslacht, jaartoe, straat, huisnr, postcode, plaats, telefoon, bondsnr) 
VALUES 
(2, 'Elfring', 'R', 1948-09-01, 'M', 1975, 'Steden', '43', '3575NH', 'Den Haag', '070-237893', '2411'),
(6, 'Permentier', 'R', 1964-06-25, 'M', 1977, 'Hazensteinln', '80', '1234KK', 'Den Haag', '070-476537', '8467'),
(7, 'Wijers', 'GWS', 1963-05-11, 'M', 1981, 'Erasmusweg', '39', '9758VB', 'Den Haag', '070-347689', '?'),
(8, 'Niewenburg', 'B', 1962-07-08, 'V', 1980, 'Spoorlaan', '4', '6584RO', 'Rijswijk', '070-458458', '2983'),
;

# toevoegen van data aan teams tabel
INSERT INTO teams 
(spelersnr,divisie) 
VALUES 
(6, 'ere'),
(27, 'tweede')
;

# toevoegen van data aan wedstrijden tabel
INSERT INTO wedstrijden
()
VALUES
()
;

INSERT INTO boetes
()
VALUES
()
;

INSERT INTO bestuursleden
()
VALUES
()
;