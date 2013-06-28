# Oefening 16:

# Breidt de volgende velden uit met de opgegeven veldeigenschappen:
	# id : AUTO INCREMENT, NOT NULL & PK 
ALTER TABLE cars ADD PRIMARY KEY(id) # automatisch NOT NULL
ALTER TABLE cars CHANGE id id INT UNSIGNED AUTO_INCREMENT
	# type : NOT NULL DEFAULT Type niet beschikbaar
ALTER TABLE cars CHANGE type type VARCHAR(50) DEFAULT 'Type niet beschikbaar'
	# brand_id: UNSIGNED & INDEX
ALTER TABLE cars CHANGE brand_id brand_id INT UNSIGNED
ALTER TABLE cars ADD INDEX (brand_id)
	# date_creation: DEFAULT CURRENT_TIMESTAMP()
ALTER TABLE cars CHANGE date_creation date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
	# date_last_modified: NOT NULL
ALTER TABLE cars CHANGE date_last_modified date_last_modified TIMESTAMP NOT NULL

# Dan zou je een tabel cars moeten hebben met als Storage engine InnoDB, karakterset
	# latin1 en collatie latin1_general_ci
	# en de velden: 
	# id (INT NOT NULL UNSIGNED AUTO_INCREMENT PK)
	# type (VARCHAR 50 NOT NULL COMMENTAAR … DEFAULT …)
	# brand_id (INT UNSIGNED INDEX)
	# description (TEXT KARAKTERSET utf8 COLLATIE utf8_general_ci)
	# price (DOUBLE)
	# date_creation (TIMESTAMP DEFAULT CURRENT_TIMESTAMP())
	# date_last_modified (DATE NOT NULL)

# Verwijder de tabel cars en tracht nu bovenstaande tabel in zijn totaliteit aan te maken via CREATE TABLE
CREATE TABLE cars (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
type VARCHAR(50) NOT NULL COMMENT "het type van de auto" DEFAULT 'Type niet beschikbaar',
brand_id INT UNSIGNED,
description TEXT CHARACTER SET utf8 COLLATE utf8_general_ci,
price DOUBLE,
date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
date_last_modified DATE NOT NULL,
INDEX(brand_id)
) ENGINE=InnoDB 
DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci 
# DEFAULT enkel bij CREATE op de volledige table en niet op aparte velden, kan je wel via ALTER doen.

# Doe hetzelfde voor tabel brands met als Storage engine InnoDB, karakterset latin1 en collatie latin1_general_ci
	# en de velden: 
	# id (INT NOT NULL UNSIGNED AUTO_INCREMENT PK)
	# brand (VARCHAR 255 NOT NULL KARAKTERSET utf8 COLLATIE utf8_general_ci COMMENTAAR: het merk van de auto)
CREATE TABLE brands (
id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
brand VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL  COMMENT 'het merk vna de auto'
) ENGINE=InnoDB 
DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci 