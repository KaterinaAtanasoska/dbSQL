/*
--  List all student First Name that are duplicated more than 3 time

--  List the First Name for all the student's that their Last Name is duplicated and they are born in 1985  (Hint use View)

--  Find how many courses each student (using Name and Last Name) has attended

--  Find the students (using Name and Last Name) that have attended less than 20 courses and get their Min, Max and Average grade ordered by the Average Grade ascending

--  For all the students (using First Name and Last Name) get their Min, Max and Average grade (Create view vv_StudentSuccess)

--  Find all the students that have achieved less than 25% from the AchievementMaxPoints for the AchievementType  'Domasni'

--  For the Students from the above list check what is their Success (Min, Max and Average grade) and order them by the AVG grade
 */


--  List all student First Name that are duplicated more than 3 time
SELECT FirstName, 
COUNT(FirstName) AS Duplicates
FROM Student
GROUP BY FirstName
HAVING ( COUNT(FirstName) > 2 )

--  List the First Name for all the student's that their Last Name is duplicated and they are born in 1985  (Hint use View)
SELECT FirstName, 
COUNT(LastName) AS DuplicatedLastName
FROM Student
WHERE DateOfBirth  >= '1985-01-01' and DateOfBirth  < '1986-01-01'
GROUP BY FirstName
HAVING ( COUNT(LastName) > 1 )

--  Find how many courses each student (using Name and Last Name) has attended
SELECT Student.FirstName, Student.LastName,
COUNT(Grade.CourseID) Courses
FROM Grade 
INNER JOIN Student  on Grade.StudentID = Student.ID
GROUP BY Student.FirstName, Student.LastName


--  Find the students (using Name and Last Name) that have attended less than 20 courses and get their Min, Max and Average grade ordered by the Average Grade ascending
SELECT Student.FirstName, Student.LastName,  min(Grade) MinGrade, max(Grade) MaxGrade, avg(Grade) AverageGrade
FROM Grade 
INNER JOIN Student on Grade.StudentID = Student.ID
GROUP BY Student.FirstName, Student.LastName
HAVING COUNT(Grade.CourseID) < 20
ORDER BY AverageGrade ASC


--  For all the students (using First Name and Last Name) get their Min, Max and Average grade (Create view vv_StudentSuccess)
CREATE VIEW vv_StudentSuccess
AS
SELECT Student.FirstName, Student.LastName,  min(Grade) MinGrade, max(Grade) MaxGrade, avg(Grade) AverageGrade
FROM Grade
INNER JOIN Student ON Grade.StudentID = Student.ID
GROUP BY Student.FirstName, Student.LastName

--  Find all the students that have achieved less than 25% from the AchievementMaxPoints for the AchievementType  'Domasni'
SELECT Student.FirstName, Student.LastName,  min(Grade) MinGrade, max(Grade) MaxGrade, avg(Grade) AverageGrade, AchievementType.Name AchievmentType, GradeDetails.AchievementPoints
FROM Grade 
INNER JOIN Student ON Grade.StudentID = Student.ID
INNER JOIN GradeDetails ON Grade.ID = GradeDetails.GradeID
INNER JOIN AchievementType ON GradeDetails.AchievementTypeID = AchievementType.ID
WHERE AchievementType.Name = 'Domashni' and GradeDetails.AchievementPoints < GradeDetails.AchievementMaxPoints * 0.25
GROUP BY Student.FirstName, Student.LastName, AchievementType.Name, GradeDetails.AchievementPoints


--  For the Students from the above list check what is their Success (Min, Max and Average grade) and order them by the AVG grade
SELECT * 
FROM vv_StudentSuccess
ORDER BY AverageGrade
