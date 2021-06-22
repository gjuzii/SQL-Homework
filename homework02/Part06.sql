--List all possible combinations of Courses names and AchievementTypenames that can be passed by student 
SELECT c.Name as CourseName, ac.Name as Achievement 
FROM [dbo].[Course] as c 
CROSS JOIN [dbo].[AchievementType] as ac 
GO
--List all Teachers that has any exam Grade

SELECT distinct  t.FirstName, t.LastName 
FROM dbo.Teacher as t
INNER JOIN dbo.Grade as g on t.ID = g.TeacherID 
GO

--List all Teachers without exam Grade

SELECT distinct t.FirstName, t.LastName 
FROM dbo.Teacher as t
LEFT JOIN dbo.Grade as g on t.ID = g.TeacherID
WHERE g.ID is null
GO

--List all Students without exam Grade (using Right Join)
SELECT s.* 
FROM dbo.Grade as g 
RIGHT JOIN dbo.Student as s on g.StudentID = s.ID
WHERE g.StudentID = null 
GO
