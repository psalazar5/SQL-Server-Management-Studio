USE AdventureWorks2017
GO 
CREATE PROCEDURE dbo.uspGetAddress
AS 
SELECT * FROM Person.Address
GO
EXEC dbo.uspGetAddress

DROP PROCEDURE IF EXISTS dbo.uspGetAdddress

CREATE SCHEMA [ACADEMY_HR] AUTHORIZATION [dbo]
DROP SCHEMA IF EXISTS [ACADEMY_HR]

BEGIN TRY 
	SELECT 1000/0 AS Result; 
END TRY 

BEGIN CATCH 
	SELECT 
		ERROR_NUMBER() AS [Error_Code],
		ERROR_PROCEDURE() AS [Invalid_PROC],
		ERROR_MESSAGE() AS [Error_Details];
END CATCH 

-- first line will create the stored procedure-- --The N in NVARCHAR means uNicode. --
CREATE PROC dbo.uspGetEmployeeRecords @EmpID nvarchar(30)
--It is the same as VARCHAR except it uses Unicode. As a reminder, unicode is short for unique, unified and universal encoding.--
AS 
SELECT * FROM tblEmployees.Portland 
WHERE empKey = @EmpID
GO 
EXEC dbo.GetEmployeeRecords @EmpID = '98002zd89'

