CREATE DATABASE Library_db3

--Creating tables--

CREATE TABLE Library_Branch(
	BranchID INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL
);

CREATE TABLE Publisher(
	PublisherName VARCHAR(50) NOT NULL PRIMARY KEY,
	Address VARCHAR(50) NOT NULL, 
	Phone VARCHAR(50) NOT NULL
);


CREATE TABLE Borrower(
	CardNo INT NOT NULL PRIMARY KEY IDENTITY (1,1), 
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL, 
	Phone VARCHAR(50) NOT NULL
);

CREATE TABLE Books(
	BookID INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES Publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE,
);

CREATE TABLE Book_Copies(
	BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE, 
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL
);


CREATE TABLE Book_Authors(
	BookID INT NOT NULL CONSTRAINT fk_BookID2 FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL 
);


CREATE TABLE Book_Loans(
	BookID INT NOT NULL CONSTRAINT fk_BookID3 FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID2 FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNO INT NOT NULL CONSTRAINT fk_CardNO FOREIGN KEY REFERENCES Borrower(CardNO) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut VARCHAR(50) NOT NULL,
	DateDue VARCHAR(50) NOT NULL
);


--INSERTING TABLES--

INSERT INTO Library_Branch VALUES 
('Sharpstown', '128 Clement Dr'),
('Derpertown', '127 Cement Dr'),
('Jenkintown', '123 Darby Rd'),
('Tenkitown', '190 Copper Dr'),
('Teriyakitown', '543 Terri Rd'),
('Allentown', '213 Allen Rd')
;

INSERT INTO Borrower VALUES 
('Derek', '345 Cement Dr', '234-532-9459'),
('Chad', '954 Topple Rd', '294-183-2983'),
('Tim', '102 Redbarn Ln', '970-234-1823'),
('Ren', '192 Walnut Bank', '292-181-1284'),
('Pedro', '122 Warren Rd', '475-283-9485'),
('Erin', '857 Torri Ln', '294-986-3294'),
('Peter', '1332 Linger Ln', '215-224-2206'),
('Luke', '1384 Hungarian Rd', '345-294-1393')
;

INSERT INTO Publisher VALUES
('Luke Arthor', '867 toople Rd', '348-204-7768'),
('Matt Cutt', '1041 Huntington Rd', '204-750-3050'),
('Tim Tom', '1121 Winter Rd', '238-502-8579'),
('Anthony Carter', '130 Clement Dr', '347-204-1006'),
('Pedro Silenez', '1039 Serverside Rd', '204-803-1050'),
('David White', '1028 Colombian Dr', '482-128-3984'),
('Chuck Norris', '1034 Stuart Dr', '215-765-3929'),
('Evan Whitley', '1023 Yeerezstone Rd', '347-876-9150'),
('Edison Cim', '60 Caradon Hill', '267-908-5547'),
('Peter Tran', '25 Ronald Crescent', '267-204-9115'),
('Oliver Clean', '25 Center Avenue', '267-403-5104')
;

INSERT INTO Books VALUES 
('In Search', 'Anthony Carter'),
('Ulysses', 'Tim Tom'), 
('Don Quixote', 'Anthony Carter'),
('The Great', 'Edison Cim'),
('War and Peace', 'Peter Tran'),
('Odyssy', 'Oliver Clean'),
('Lolita', 'Evan Whitley'),
('The brothers', 'Chuck Norris'),
('Pride', 'Edison Cim'),
('The Adventures', 'Tim Tom'),
('Catch', 'David White'),
('The Lost Tribe', 'Anthony Carter'),
('Asolom', 'Pedro Silenez'),
('To kill', 'Oliver Clean'), 
('The grapes', 'Luke Arthor'),
('One thousand', 'Pedro Silenez'),
('Beloved', 'Edison Cim'),
('Red and black', 'Evan Whitley'),
('Magic Mountain', 'Peter Tran'),
('Midnights Children', 'Tim Tom')
;

INSERT INTO Book_Authors VALUES 
(2, 'Tom Oliver'),
(2, 'Darby Hasson'),
(3, 'Tommy Harran'),
(2, 'Henry Sor'),
(5, 'Sonroe Halmar'),
(7, 'Harold Henry'),
(9, 'Peter Arnold'),
(10, 'Jean Tom'),
(4, 'Jimmy Carry'),
(11, 'Jones Aim')
;

INSERT INTO Book_Copies VALUES 
(3, 4, 2),
(2, 2, 1),
(2, 1, 1),
(3, 3, 2),
(4, 6, 1)
;

INSERT INTO Book_Loans Values 
(3, 4, 4, '12-01-2023', '12-20-2023'),
(2, 5, 3, '12-02-2023', '12-24-2023'),
(4, 2, 1,'11-12-2023', '12-1-2023'),
(2, 5, 3, '10-23-2023', '11-23-2023'),
(5, 5, 5, '09-11-2023', '10-11-2023'),
(3, 6, 7, '01-13-2023', '02-24-2023'),
(5, 4, 8, '03-13-2023', '04-08-2023'),
(7, 3, 5, '04-24-2023', '05-01-2023'),
(3, 6, 6, '05-01-2023', '06-01-2023'),
(6, 1, 5, '06-02-2023', '06-28-2023')
;


SELECT * FROM Publisher
SELECT* FROM Book_Authors
SELECT * FROM Book_Copies
SELECT * FROM Books
SELECT * FROM Library_Branch
SELECT * FROM Borrower
SELECT* FROM Book_Loans

SELECT * FROM ((Book_Loans FULL OUTER JOIN Borrower ON Book_Loans.CardNO = Borrower.CardNo) 
FULL OUTER JOIN books ON Book_Loans.BookID = Books.BookID)

--Using the library database you created, create a query that returns all book titles and the authors name.--
SELECT Title, AuthorName
FROM Books 
INNER JOIN Book_Authors ON Book_Authors.BookID = Books.BookID

--EX--
CREATE PROCEDURE Queryproc
AS
SELECT * FROM Publisher
GO;
EXEC Queryproc
--

--How many copies of the book titled "In Search" are owned by the library branch whose name is "Sharpstown"?--
CREATE PROC librarybranch
AS 
SELECT Number_Of_Copies From Book_Copies
INNER JOIN Library_Branch ON Library_Branch.BranchID = Book_Copies.BranchID
INNER JOIN Books ON Books.BookID = Book_copies.BookID
WHERE Books.BookID = 2 and Library_Branch.BranchID = 1;

SELECT Number_of_Copies FROM book_copies 
INNER JOIN Library_branch ON Library_Branch.BranchID = Book_Copies.BranchID
INNER JOIN Books ON Books.BookID = Book_Copies.BookID
WHERE books.bookID = 2

SELECT Name FROM Borrower 
Inner join Book_Loans ON Book_Loans.CardNO = Borrower.CardNo
WHERE Book_Loans.CardNO = 9
GO
EXEC librarybranch

--How many copies of the book titled "In Search" are owned by each library branch?--

SELECT Number_of_Copies FROM book_copies 
INNER JOIN Library_branch ON Library_Branch.BranchID = Book_Copies.BranchID
INNER JOIN Books ON Books.BookID = Book_Copies.BookID
WHERE books.bookID = 2

--Retrieve the names of all borrowers who do not have any books checked out--

SELECT Name FROM Borrower 
Inner join Book_Loans ON Book_Loans.CardNO = Borrower.CardNo
WHERE Book_Loans.CardNO = 9