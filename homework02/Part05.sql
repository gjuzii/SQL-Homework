--Create Foreign key constraints from diagram or with script

ALTER table [dbo].[Grade]
with check add CONSTRAINT [FK_Grade_Course]
Foreign Key ([CourseID]) 
REFERENCES [dbo].[Course] ([ID])

ALTER table [dbo].[Grade]
with check add CONSTRAINT [FK_Grade_Student]
Foreign Key ([StudentID]) 
REFERENCES [dbo].[Student] ([ID])

ALTER table [dbo].[Grade]
with check add CONSTRAINT [FK_Grade_Teacher]
Foreign Key ([TeacherID]) 
REFERENCES [dbo].[Teacher] ([ID])

ALTER table [dbo].[GradeDetails]
with check add CONSTRAINT [FK_GradeDetails_AchievementType]
Foreign Key ([AchievementTypeID]) 
REFERENCES [dbo].[AchievementType] ([ID])

ALTER table [dbo].[GradeDetails]
with check add CONSTRAINT [FK_GradeDetails_Grade]
Foreign Key ([GradeID]) 
REFERENCES [dbo].[Grade] ([ID])
