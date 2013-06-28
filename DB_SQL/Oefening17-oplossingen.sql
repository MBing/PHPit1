# Oefening 17:

# Plaats een Foreign Key constraint (relatie) ON DELETE RESTRICT en ON UPDATE 
	# RESTRICT tussen de bestaande tabellen cars en brands via de velden cars.brand_id en brands.id
ALTER TABLE cars ADD CONSTRAINT fk_car_bra FOREIGN KEY (brand_id) 
REFERENCES brands(id) ON DELETE RESTRICT ON UPDATE RESTRICT
# Controleer via Relatieoverzicht en designer of deze constraint succesvol is toegepast
YES
# Pas de Foreign Key constraint aan zodat ON UPDATE CASCADE is.
ALTER TABLE cars DROP CONSTRAINT FOREIGN KEY fk_car_bra;
ALTER TABLE cars ADD CONSTRAINT fk_car_bra FOREIGN KEY (brand_id) 
REFERENCES brands(id) ON DELETE RESTRICT ON UPDATE CASCADE
# Controleer via Relatieoverzicht en designer of deze constraint succesvol is toegepast
YES
# Verwijder de Foreign Key constraint
ALTER TABLE cars DROP FOREIGN KEY fk_car_bra
# Verwijder de tabel cars en bouw deze terug op mét onmiddellijk de Foreign Key 
	# constraint erbij met ON DELETE RESTRICT en ON UPDATE CASCADE
DROP TABLE cars;
CREATE TABLE cars (
id INT UNSIGNED AUTO_INCREMENT,
type VARCHAR(50) NOT NULL COMMENT "het type van de auto" DEFAULT 'Type niet beschikbaar',
brand_id INT UNSIGNED,
description TEXT CHARACTER SET utf8 COLLATE utf8_general_ci,
price DOUBLE,
date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
date_last_modified DATE NOT NULL,
PRIMARY KEY(id),
CONSTRAINT fk_car_bra FOREIGN KEY (brand_id)
REFERENCES brands(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB 
DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci 

