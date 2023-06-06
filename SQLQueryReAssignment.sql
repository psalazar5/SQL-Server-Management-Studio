Create DATABASE db_Movies3

CREATE TABLE tbl_actors (
	actors_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	actors_name VARCHAR(50) NOT NULL,
	movie_name VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_directors (
	director_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	director_name varchar(50) NOT NULL,
	movie_name varchar(50) NOT NULL,
	actor INT NOT NULL CONSTRAINT fk_actor_id FOREIGN KEY REFERENCES tbl_actors(actors_id) ON UPDATE CASCADE ON DELETE CASCADE,
);

INSERT INTO tbl_actors
	(actors_name, movie_name)
		VALUES 
	('bob jones', 'startrek'),
	('billy bob', 'starwars'),
	('jones king', 'king kong'),
	('king julian', 'needforspeed'),
	('julian bob', 'transformers')
;
INSERT INTO tbl_directors
(director_name, movie_name, actor)
VALUES 
('mars bob', 'startrek', 1),
('matt milly', 'spongebob', 2),
('jesse miller', 'spiderman', 3),
('harold king', 'superman', 4),
('arnold ofer', 'avengers', 5)
;

SELECT * FROM tbl_actors
SELECT * FROM tbl_directors

SELECT tbl_actors.actors_name, tbl_directors.director_name
FROM tbl_actors
inner join tbl_directors ON tbl_actors.actors_id = actor


