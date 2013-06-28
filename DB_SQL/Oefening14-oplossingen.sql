# Oefening 14:

# Maak een database aan carshop met karakter set latin1 en collatie latin1_general_ci. 
CREATE DATABASE carshop DEFAULT CHARACTER SET  latin1 COLLATE latin1_general_ci
# Maak een tabel cars aan (als deze nog niet bestaat) met de volgende velden:
	# id (INT)
	# type (VARCHAR 50) 
	# description (VARCHAR 255)
	# price (DOUBLE)
	# promoprice (DOUBLE)
	# date_creation (DATE)
	# date_last_modified (DATE) 
	# storage engine InnoDB
	# de karakterset en collatie mogen dezelfde zijn als de database
CREATE TABLE IF NOT EXISTS cars (
id INT,
type VARCHAR (50), 
description VARCHAR (255),
price DOUBLE,
promoprice DOUBLE,
date_creation DATE,
date_last_modified DATE
) ENGINE=InnoDB

# Verwijder nu de tabel en de database en tracht bovenstaande uit te voeren 
DROP TABLE cars (vanop database niveau);
DROP DATABASE carshop 
	# via 1 reeks SQL queries vanop het server niveau
CREATE DATABASE carshop DEFAULT CHARACTER SET  latin1 COLLATE latin1_general_ci;
# USE carshop
CREATE TABLE IF NOT EXISTS carshop.cars (
id INT,
type VARCHAR (50), 
description VARCHAR (255),
price DOUBLE,
promoprice DOUBLE,
date_creation DATE,
date_last_modified DATE
) ENGINE=InnoDB