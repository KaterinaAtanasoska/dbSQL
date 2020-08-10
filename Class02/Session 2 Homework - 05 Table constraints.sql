/*
Create Foreign key constraints from diagram or with script
*/
ALTER TABLE Grade WITH CHECK
ADD CONSTRAINT FK_Grade
FOREIGN KEY(StudentID)
REFERENCES Student (ID)
GO
