

PRINT 'Hello World!'

DECLARE @myvariable INT 
SET @myVariable = 6
PRINT @myVariable

PRINT 'Having fun with' + ' TSQL and MS SQL SERVER!'

DECLARE @var1 INT, @var2 INT 
SET @var1 = 3
SET @var2 = 5

--Made these into two variables, then converted @var1 below into a varchar with limit of 50 characters
PRINT char(9) + 'I have ' + CONVERT (varchar(50), @var1) + char(13) +' dollars...'
--By passing in the ASCII '13' to the built in method, "char()" to look like the char(13), this tells the software that the ENTER KEY was pressed and will need to start on the next line. 
--The ASCII value char(9), this tells the software that the TAB KEY was pressed adn will need to indent a specific number of spaces to the right 


PRINT 'Variable 1 = ' + convert(varchar(5), @var1) + char(13) + 'Variable 2 = ' + convert(varchar(5), @var2) + char(13) + 'Total : '
PRINT @var1 + @var2

IF @var1 < 2
	BEGIN 
		PRINT '@var1 1 < 2'
	END 
ELSE IF @var1 > 1 AND @var1 < 3
	BEGIN 
		PRINT '@var1 > 1 AND @var1 < 3'
	END 
ELSE IF @var1 = 4 OR @var1 < 6  
	BEGIN 
		PRINT '@var1 = 4 OR @var1 < 6'
	END 
ELSE 
	PRINT '@var1 does not qualify'

