-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
CREATE PROC dbo.uspGetAddress3 @City nvarchar(30), @PostalCode nvarchar(10)
AS 
SELECT * FROM Person.Address
WHERE City LIKE @City + '%' AND PostalCode LIKE @PostalCode
GO 
EXEC dbo.uspGetAddress3 @City = 'New', @PostalCode = '[98]%'

/*SELECT DISTINCT */
SELECT DISTINCT StateProvinceID
FROM person.address;


/*SELECT TOP */

SELECT TOP 5 AddressID 
FROM Person.Address
WHERE AddressID > 1
-- --
--MIN AND MAX FUNCTION --

SELECT MIN(AddressID) AS LowestID 
FROM Person.Address;
SELECT MAX(AddressID) AS MAXID
FROM Person.Address
-- --
--SQL LIKE OPERATOR -- --a% finds any values that end with "a"--

SELECT * FROM Person.Address
WHERE Addressline1 LIKE '2%'

-- -- 

--SQL []wild card, used  --

SELECT * FROM Person.Address
WHERE CITY LIKE 'New%';

--SQL BETWEEN OPERATOR --
SELECT * FROM Person.Address
WHERE StateProvinceID NOT BETWEEN 9 AND 12;
--another--
SELECT * FROM Person.Address
WHERE 