USE db_zoo;   

CREATE TABLE tbl_animalia (
	animalia_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	animalia_type VARCHAR(50) NOT NULL
);

INSERT INTO tbl_animalia
	(animalia_type)
	VALUES
	('vertebrate'),
	('invertebrate')
;
SELECT * FROM tbl_animalia

CREATE TABLE tbl_class(
	class_id INT PRIMARY KEY NOT NULL IDENTITY(100,1),
	class_type VARCHAR(50) NOT NULL
);

SELECT * FROM tbl_class;

INSERT INTO tbl_class
	(class_type)
	VALUES
	('bird'),
	('reptillian'),
	('mammal'),
	('arthropod'),
	('fish'),
	('worm'),
	('cnidaria'),
	('echinoderm')
;

SELECT * FROM tbl_class;

UPDATE tbl_class SET class_type = 'bird' WHERE class_type = 'birds';

SELECT REPLACE(class_type, 'birds', 'bird') FROM tbl_class;

SELECT class_type FROM tbl_class WHERE class_type = 'bird';

CREATE TABLE tbl_persons (
	persons_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	persons_fname VARCHAR(50) NOT NULL,
	persons_lname VARCHAR(50) NOT NULL,
	persons_contact VARCHAR(50) NOT NULL
);

INSERT INTO tbl_persons(persons_fname, persons_lname, persons_contact)
	VALUES
	('bob', 'smith', '276-273-2738'),
	('john', 'curry', '277-283-2783'),
	('matt', 'faze', '277-321-2444'),
	('jerry', 'coat', '272-342-1445'),
	('king', 'sat', '213-134-1122')
;

SELECT * FROM tbl_persons;

UPDATE tbl_persons SET persons_fname = 'mars' WHERE persons_fname = 'bob';

SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_lname LIKE '_a%e';

SELECT persons_fname AS 'FIRSTNAME', persons_lname AS 'LASTNAME', persons_contact AS 'PHONE:'  FROM tbl_persons WHERE persons_fname LIKE 'm%' ORDER BY persons_lname ;

DELETE FROM tbl_persons WHERE persons_lname = 'smith';

DROP TABLE tbl_persons;

INSERT INTO tbl_class
	(class_type)
	VALUES
	('bird'),
	('reptillian'),
	('mammal'),
	('arthropod'),
	('fish'),
	('worm'),
	('cnidaria'),
	('echinoderm')
;

SELECT * FROM tbl_class;

CREATE TABLE tbl_order(
	order_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	order_type VARCHAR(50) NOT NULL,
);

CREATE TABLE tbl_care(
	care_id VARCHAR(50) PRIMARY KEY NOT NULL,
	care_type VARCHAR(50) NOT NULL,
	care_specialist INT NOT NULL
);

CREATE TABLE tbl_nutrition(
	nutrition_id INT PRIMARY KEY NOT NULL IDENTITY (2200,1),
	nutrition_type VARCHAR(50) NOT NULL, 
	nutrition_cost MONEY NOT NULL
);

CREATE TABLE tbl_habitat (
	habitat_id INT PRIMARY KEY NOT NULL IDENTITY(5000,1),
	habitat_type VARCHAR(50) NOT NULL, 
	habitat_cost MONEY NOT NULL
);

CREATE TABLE tbl_specialist(
	specialist_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	specialist_fname VARCHAR(50) NOT NULL,
	specialist_lname VARCHAR(50) NOT NULL,
	specialist_contact VARCHAR(50) NOT NULL
);

INSERT INTO tbl_order
	(order_type)
	VALUES 
	('carnivore'),
	('herbivore'),
	('omnivore')
;
SELECT * FROM tbl_order;

INSERT INTO tbl_care
	(care_id, care_type, care_specialist)
	VALUES
	('care_0','replace the straw', 1),
	('care_1', 'repair or replace broken toys', 4), 
	('care_2', 'bottle feed vitamins', 1),
	('care_3', 'human contact_pet subject', 2),
	('care_4', 'clean up animal waste', 1), 
	('care_5', 'move subject to exeercise pen', 3), 
	('care_6', 'drain and refill aquarium', 1),
	('care_7', 'extensive dental work', 3)
;
SELECT * FROM tbl_care;

INSERT INTO tbl_nutrition
	(nutrition_type, nutrition_cost)
		VALUES 
		('raw fish', 1500),
		('living rodents', 600), 
		('mixture of fruit and rice', 800),
		('warm bottle of milk', 600),
		('syringe feed broth', 600),
		('lard and seed mix', 300),
		('aphids', 150), 
		('vitamins and marrow', 3500)
;

SELECT * FROM tbl_nutrition;

INSERT INTO tbl_habitat
	(habitat_type, habitat_cost)
	VALUES 
	('tundra', 40000), 
	('grass groll with trees', 12000),
	('10 ft pond and rocks', 30000),
	('icy aquirium with snowy facade', 50000), 
	('short grass, shade, and meat', 50000),
	('netted forest atrium', 10000),
	('jungle vines and winding branches', 15000),
	('cliff with shaded cave', 15000)
;

INSERT INTO tbl_specialist
	(specialist_fname, specialist_lname, specialist_contact)
	VALUES 
	('margret', 'nyguen', '265-876-9876'),
	('mary', 'fischer', '625-876-0543'),
	('arnold', 'holden', '786-987-9287'),
	('kem', 'byesan', '988-998-0998'),
	('delmonte', 'fyedo', '736-987-8387')
;
SELECT * FROM tbl_specialist;

CREATE TABLE tbl_species(
	species_id INT PRIMARY KEY NOT NULL IDENTITY (1,1), 
	species_name VARCHAR(50) NOT NULL,
	species_animalia INT NOT NULL CONSTRAINT fk_animalia_id FOREIGN KEY REFERENCES tbl_animalia(animalia_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_class INT NOT NULL CONSTRAINT fk_class_id FOREIGN KEY REFERENCES tbl_class(class_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_order INT NOT NULL CONSTRAINT fk_order_id FOREIGN KEY REFERENCES tbl_order(order_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_habitat INT NOT NULL CONSTRAINT fk_habitat_id FOREIGN KEY REFERENCES tbl_habitat(habitat_id) ON UPDATE CASCADE ON DELETE CASCADE, 
	species_nutrition INT NOT NULL CONSTRAINT fk_nutrition_id FOREIGN KEY REFERENCES tbl_nutrition(nutrition_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_care VARCHAR(50) NOT NULL CONSTRAINT fk_care_id FOREIGN KEY REFERENCES tbl_care(care_id) ON UPDATE CASCADE ON DELETE CASCADE
);


INSERT INTO tbl_species
	(species_name, species_animalia, species_class, species_order, species_habitat, species_nutrition, species_care)
	VALUES 
	('brown bear', 1, 102, 3, 5007, 2200, 'care_1'),
	('jaguar', 1, 102, 1, 5007, 2200, 'care_4'),
	('penguin', 1, 100, 1, 5003, 2200, 'care_6'),
	('ghost bat', 1, 102, 1, 5007, 2204, 'care_2'),
	('chicken', 1, 100, 3, 5001, 2205, 'care_0'),
	('panda', 1, 102, 3, 5006, 2202, 'care_4'),
	('bobcat', 1, 102, 1, 5001, 2204, 'care_5'),
	('grey wolf', 1, 102, 1, 5000, 2201, 'care_4')
; 
SELECT * FROM tbl_species WHERE species_name = 'chicken';

SELECT 
	a1.species_name, a2.animalia_type, 
	a3.class_type, a4.order_type, a5.habitat_type,
	a6.nutrition_type, a7.care_type
	FROM tbl_species a1
	INNER JOIN tbl_animalia a2 ON a2.animalia_id = a1.species_animalia
	INNER JOIN tbl_class a3 ON a3.class_id = a1.species_class
	INNER JOIN tbl_order a4 ON a4.order_id = a1.species_order
	INNER JOIN tbl_habitat a5 ON a5.habitat_id = a1.species_habitat
	INNER JOIN tbl_nutrition a6 ON a6.nutrition_id = a1.species_nutrition
	INNER JOIN tbl_care a7 ON a7.care_id = a1.species_care
	WHERE species_name = 'ghost bat'
;

SELECT 
	a1.species_name, a2.habitat_type, a2.habitat_cost, 
	a3.nutrition_type, a3.nutrition_cost
	FROM tbl_species a1 
	INNER JOIN tbl_habitat a2 ON a2.habitat_id = a1.species_habitat
	INNER JOIN tbl_nutrition a3 ON a3.nutrition_id = a1.species_nutrition
	WHERE species_name = 'ghost bat'
	;

SELECT 
	a1.species_name, a2.animalia_type,
	a3.nutrition_type, a3.nutrition_cost
	FROM tbl_species a1
	INNER JOIN tbl_animalia a2 ON a2.animalia_id = a1.species_animalia
	INNER JOIN tbl_nutrition a3 ON a3.nutrition_id = a1.species_nutrition
	WHERE species_name = 'jaguar'
	;

Select * from tbl_species;

SELECT * FROM tbl_nutrition; 
SELECT * FROM tbl_species;




/*Retrieve all names from the species_name column of the tbl_species table that have a species_order value of 3. */

SELECT species_name, species_order
FROM tbl_species
WHERE species_order = 3;

/*Retrieve only the types from the column nutrition_type of the tbl_nutrition table that have a nutrition_cost of 600.00 or less.*/

SELECT nutrition_type
FROM tbl_nutrition
WHERE nutrition_cost <= 600.00

/*Retrieve all species_names from tbl_nutrition that have a nutrition_id between 2202 and 2206. 
(Note: You will need to INNER JOIN tbl_species and tbl_nutrition to complete the assignment.)*/

SELECT species_name
FROM tbl_nutrition
INNER JOIN tbl_species ON species_nutrition = nutrition_id
WHERE nutrition_id BETWEEN 2202 AND 2206

/*Retrieve all names from the species_name column in the tbl_species table and their corresponding nutrition_type from the tbl_nutrition table.
(Note: You will need to INNER JOIN tbl_species and tbl_nutrition to complete the assignment.) */

SELECT species_name AS "Species Name:", nutrition_type AS "Nutrition Type:"
FROM tbl_species
INNER JOIN tbl_nutrition ON nutrition_id = species_nutrition;  

SELECT * FROM tbl_species
SELECT * FROM tbl_nutrition

/*From the specialist table, retrieve the first name, last name and contact number for the people that provide care to penguins.
You will need to use two INNER JOINs to connect the three tables needed: tbl_specialist, tbl_species, and tbl_care. */

SELECT specialist_fname, specialist_lname, specialist_contact
FROM tbl_specialist
INNER JOIN tbl_care ON care_specialist = specialist_id
INNER JOIN tbl_species ON Care_id = species_care 
WHERE species_name = 'penguin'

SELECT * FROM tbl_specialist
SELECT * FROM tbl_species
SELECT * FROM tbl_care


/*