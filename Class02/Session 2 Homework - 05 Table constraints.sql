/*
Create Foreign key constraints from diagram or with script
*/
ALTER TABLE Grade WITH CHECK
ADD CONSTRAINT FK_Grade
FOREIGN KEY(StudentID)
REFERENCES Student (ID)
GO

alter Table dbo.Grade
add constraint [FK_Course_Student_ID]  
FOREIGN KEY ([CourseID])  
REFERENCES dbo.Course (ID);  