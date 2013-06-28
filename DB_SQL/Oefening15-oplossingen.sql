# Oefening 15:

# Voeg het volgende veld toe na het type veld: 
	# brand_id (INT)
# database niveau
ALTER TABLE cars ADD brand_id INT AFTER type

# Verwijder het volgende veld:
	# promoprice
ALTER TABLE cars DROP promoprice

# Pas het datatype aan naar TEXT van het volgend veld:
	# description
ALTER TABLE cars CHANGE description description TEXT
# Breidt de volgende velden uit met de opgegeven veldeigenschappen:
	# id : attribuut unsigned
ALTER TABLE cars CHANGE id id INT UNSIGNED
	# type : commentaar: Het type van de wagen
ALTER TABLE cars CHANGE type type VARCHAR(50) COMMENT "Het type van de wagen"
	# description: karakterset utf8 en collatie utf8_general_ci #case insensitive
ALTER TABLE cars CHANGE description description TEXT CHARACTER SET utf8 COLLATE utf8_general_ci