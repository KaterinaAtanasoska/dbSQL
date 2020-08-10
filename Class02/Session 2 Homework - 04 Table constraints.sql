/*
Change GradeDetails table always to insert value 100 in AchievementMaxPoints column if no value is provided on insert
Change GradeDetails table to prevent inserting AchievementPoints that will more than AchievementMaxPoints
Change AchievementType table to guarantee unique names across the Achievement types
*/

--Change GradeDetails table always to insert value 100 in AchievementMaxPoints column if no value is provided on insert
ALTER TABLE GradeDetails
ADD CONSTRAINT DF_Achievment_Max_Points
DEFAULT 100 FOR AchievementMaxPoints
GO

--Change GradeDetails table to prevent inserting AchievementPoints that will more than AchievementMaxPoints
ALTER TABLE GradeDetails WITH CHECK
ADD CONSTRAINT CHK_Achievment_Max_Points
CHECK (AchievementPoints <= AchievementMaxPoints )
GO

--Change AchievementType table to guarantee unique names across the Achievement types
ALTER TABLE AchievementType WITH CHECK
ADD CONSTRAINT UC_Achievment_Types UNIQUE (Name)
GO