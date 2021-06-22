--Change GradeDetailstable always to insert value 100 in AchievementMaxPointscolumn if no value is provided on insert
ALTER TABLE GradeDetails 
add CONSTRAINT df_GradeDetails_AchievementMaxPoints
DEFAULT 100 for [AchievementMaxPoints]
GO

--Change GradeDetailstable to prevent inserting AchievementPoints that will more than AchievementMaxPoints

ALTER TABLE GradeDetails with check 
add CONSTRAINT chk_GradeDetails_AchievementPoints
check (AchievementPoints <= AchievementMaxPoints)
GO

--Change AchievementTypetable to guarantee unique names across the Achievement types
ALTER TABLE AchievementType with check
add CONSTRAINT uc_AchievementType_Name
UNIQUE (Name)
GO