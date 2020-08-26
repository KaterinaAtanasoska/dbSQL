/*
Create multi-statement table value function that for specific Teacher and Course will return list of students (FirstName, LastName) who passed the exam, together with Grade and CreatedDate
*/

drop function if exists fn_TeacherCourseReturnStudent_MultiStatement
go


create function fn_TeacherCourseReturnStudent_MultiStatement(@TeacherId tinyint, @CourseId tinyint)
returns @output table (FirstName nvarchar(100), LastName nvarchar(100), Grade int, CreatedDate date)
as
begin
		insert into @output
		select s.FirstName, s.LastName, g.Grade, g.CreatedDate
		from Student as s
		inner join Grade as g on s.ID = g.StudentID
		where g.TeacherID = @TeacherId and g.CourseID = @CourseId
return
end
go


select * from fn_TeacherCourseReturnStudent_MultiStatement(3, 3)

declare @TeacherId tinyint = 4
declare @CourseId tinyint = 4

select * from fn_TeacherCourseReturnStudent_MultiStatement(@TeacherId, @CourseId)