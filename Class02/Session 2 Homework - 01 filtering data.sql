/*
Find all Students with FirstName = Antonio
Find all Students with DateOfBirth greater than ‘01.01.1999’
Find all Male students
Find all Students with LastName starting With ‘T’
Find all Students Enrolled in January/1998
Find all Students with LastName starting With ‘J’ enrolled in January/1998
*/

-- Find all Students with FirstName = Antonio
SELECT *
FROM Student
WHERE FirstName = 'Antonio'
GO

--Find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT *
FROM Student
WHERE DateOfBirth > '01-01-1999'

--Find all Male students
SELECT *
FROM Student
WHERE Gender = 'm'

--Find all Students with LastName starting With ‘T’
SELECT *
FROM Student
WHERE LastName like 'T%'

--Find all Students Enrolled in January/1998
SELECT *
FROM Student
WHERE EnrolledDate >= '1998-01-01' and EnrolledDate < '1998-02-01'
GO

--Find all Students with LastName starting With ‘J’ enrolled in January/1998
SELECT *
FROM Student
WHERE LastName like 'J%'
and EnrolledDate >= '1998-01-01' and EnrolledDate < '1998-02-01'
GO