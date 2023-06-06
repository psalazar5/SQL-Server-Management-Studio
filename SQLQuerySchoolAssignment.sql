CREATE DATABASE School_db


 CREATE TABLE Classes(
 Class_ID INT NOT NULL PRIMARY KEY IDENTITY (1,1),
 Class_Name VARCHAR(50) NOT NULL
);

CREATE TABLE Students(
Student_ID INT NOT NULL PRIMARY KEY IDENTITY (1,1),
Student_Name VARCHAR(50) NOT NULL,
Class_ID INT,
Instructor_ID INT
);

CREATE TABLE Instructors (
Instructor_ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
Instructor_Name VARCHAR(50) NOT NULL
);



INSERT INTO Classes VALUES 
('Software Developer Bootcamp'),
('C# Boot Camp')
;

INSERT INTO Students VALUES 
('Paul Sadu', 1, 1),
('Pedro Sor', 1, 1),
('Liam Arch', 2, 2),
('Jerry Cro', 2, 1),
('Jerimiah Ner', 2, 1);

INSERT INTO Instructors VALUES 
('John Paul'),
('Jordan Snare');

ALTER TABLE Students 
ADD FOREIGN KEY (Class_ID) REFERENCES Classes(Class_ID);

ALTER TABLE Students
ADD FOREIGN KEY (Instructor_ID) REFERENCES Instructors(Instructor_ID);

SELECT * FROM students
SELECT * FROM instructors 
SELECT * FROM classes

--Run a query to display all Instructor names.--
SELECT instructor_name 
FROM Instructors

--Run a query to display all student names in alphabetical order.--
SELECT Student_Name 
FROM Students
ORDER BY Student_Name ASC

--Run a query that displays all classes, with the students and Instructors assigned to each.==

SELECT 
Student_Name, Class_Name, Instructor_Name
FROM Students
inner join Classes ON Classes.Class_ID = Students.Class_ID
inner join Instructors ON Instructors.Instructor_ID = Students.Instructor_ID

