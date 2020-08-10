/*
List all possible combinations of Courses names and AchievementType names that can be passed by student
List all Teachers that has any exam Grade
List all Teachers without exam Grade
List all Students without exam Grade (using Right Join)
*/

--List all possible combinations of Courses names and AchievementType names that can be passed by student
SELECT c.Name as CoursesName, a.Name as AchievementName
FROM Course c
cross join AchievementType a

--List all Teachers that has any exam Grade
SELECT DISTINCT t.FirstName as Teacher
FROM Grade g
inner join Teacher t on g.Grade = t.ID

--List all Teachers without exam Grade
SELECT DISTINCT t.FirstName as Teacher
FROM Teacher t
left join Grade g on t.ID = g.TeacherID
WHERE g.TeacherID is null

--List all Students without exam Grade (using Right Join)
SELECT DISTINCT s.FirstName
FROM Grade g
right join Student s on g.StudentID = s.ID
WHERE g.StudentID is null