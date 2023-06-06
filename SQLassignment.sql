Create DATABASE db_Movies

CREATE TABLE tbl_actors (
	actors_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	actors_name VARCHAR(50) NOT NULL,
	movie_name VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_directors (
	director_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	director_name varchar(50) NOT NULL,
	movie_name varchar(50) NOT NULL
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
(director_name, movie_name)
VALUES 
('mars bob', 'startrek'),
('matt milly', 'spongebob'),
('jesse miller', 'spiderman'),
('harold king', 'superman'),
('arnold ofer', 'avengers')
;

SELECT * FROM tbl_actors
SELECT * FROM tbl_directors

DECLARE @actor varchar(50);
DECLARE @director varchar(50);
SET @actor = (SELECT actors_name FROM tbl_actors WHERE actors_name = 'bob jones');
SET @director = (SELECT director_name FROM tbl_directors WHERE director_name = 'arnold ofer');
PRINT (
CONVERT(varchar(50),@actor) + ' is an amazing character' + char(13)+
CONVERT(varchar(50),@director) + ' is not really that amazing'
);