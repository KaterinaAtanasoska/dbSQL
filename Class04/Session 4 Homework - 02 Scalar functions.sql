

/*
Declare scalar function (fn_FormatStudentName) for retrieving the Student description for specific StudentId in the following format:
	- StudentCardNumber without “sc-”
	- “ – “
	- First character of student FirstName
	- “.”
	- Student LastName
	
	example:
	sc-77712 => 77712-K.Spasevska

*/

CREATE FUNCTION dbo.fn_FormatStudtName(@StudentId int)
RETURNS Nvarchar(100)
AS 
BEGIN
DECLARE @Output Nvarchar(100)
SELECT @Output = SUBSTRING(StudentCardNumber,4,5) + '-' + left(FirstName,1) + '.' + LastName
FROM Student
WHERE ID = @StudentId
RETURN @Output
END
GO

SELECT *, dbo.fn_FormatStudtName(ID) as GeneratedID
FROM dbo.Student