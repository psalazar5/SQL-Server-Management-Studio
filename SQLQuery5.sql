
CREATE PROCEDURE dbo.uspGetAddress4 @CityName nvarchar(30) OUTPUT 
AS 
SELECT City FROM Person.Address
WHERE AddressID = 38 AND PostalCode = 48226 
GO 
DECLARE @CityName nvarchar(30)
EXEC dbo.uspGetAddress4 @CityName = @CityName OUTPUT 
PRINT @CityName 

