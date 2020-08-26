/*
Declare scalar variable for storing FirstName values
	Assign value ‘Antonio’ to the FirstName variable
	Find all Students having FirstName same as the variable

Declare table variable that will contain StudentId, Student Name and DateOfBirth
	Fill the table variable with all Female students

Declare temp table that will contain LastName and EnrolledDate columns
	Fill the temp table with all Male students having First Name starting with ‘A’
	Retrieve the students from the table which last name is with 7 characters

Find all teachers whose FirstName length is less than 5
	, and the first 3 characters of their FirstName and LastName are the same
*/


--Declare scalar variable for storing FirstName values
	--Assign value ‘Antonio’ to the FirstName variable
	--Find all Students having FirstName same as the variable
DECLARE @FirstName nvarchar(100)
SET @FirstName = 'Antonio'

SELECT * FROM Student
WHERE FirstName = @FirstName
GO


-- Declare table variable that will contain StudentId, Student Name and DateOfBirth
	--Fill the table variable with all Female students
DECLARE @StudentsInfo TABLE
(StudentId int ,FirstName nvarchar(100), DateOfBirth date)

INSERT INTO @StudentsInfo 
SELECT ID, FirstName, DateOfBirth
FROM dbo.Student
WHERE Gender = 'F'

SELECT * FROM @StudentsInfo
GO

-- Declare temp table that will contain LastName and EnrolledDate columns
	--Fill the temp table with all Male students having First Name starting with ‘A’
	--Retrieve the students from the table which last name is with 7 characters
CREATE TABLE #StudentList 
(LastName NVARCHAR(100), EnrolledDate date);

INSERT INTO #StudentList
SELECT LastName, EnrolledDate 
FROM Student
WHERE Gender = 'M' and FirstName like 'A%' 

SELECT * 
FROM #StudentList
WHERE Len(LastName) = 7
--Find all teachers whose FirstName length is less than 5
	--, and the first 3 characters of their FirstName and LastName are the same
	CREATE TABLE #TeacherList 
(FirstName NVARCHAR(100), LastName NVARCHAR(100));

INSERT INTO #TeacherList
SELECT FirstName, LastName
FROM Teacher
WHERE Len(FirstName) < 5 and left(FirstName, 3) = left(LastName, 3)

SELECT * 
FROM #TeacherList