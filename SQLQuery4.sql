

/* 
*CONVERT(VARCHAR(50), @totalHab) = This is converting the data type from MONEY to String Characters
*char(9) = Line Break 
*char(13) = tab key
*/
DECLARE @totalHab MONEY;
DECLARE @totalNut MONEY;
DECLARE @results MONEY; 
SET @totalHab = (Select SUM(habitat_cost) From tbl_habitat);
SET @totalNut = (SELECT SUM(nutrition_cost) FROM tbl_nutrition);
SET @results = (@totalHab + @totalNut)
PRINT (
	CONVERT(varchar(50), @totalHab) + char(9) + ' - The total Habitat Cost' + char(13) +
	CONVERT(varchar(50), @totalNut) + char(9) + ' - The Total Nutrition Cost' + char(13) + '-------' + char(13) +
	CONVERT(varchar(50), @results)
);