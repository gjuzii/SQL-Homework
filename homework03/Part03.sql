--Create new view (vv_StudentGrades) that will List all StudentIdsand count of Grades per student
CREATE VIEW vv_StudentGrades 
as 
SELECT g.ID, COUNT (Grade) as GradeCount
FROM dbo.Grade as g 
INNER JOIN dbo.Student as s  on s.ID = g.StudentID
group by g.ID
GO
SELECT * 
FROM vv_StudentGrades 
GO

--Change the view to show Student First and Last Names instead of StudentID
ALTER VIEW vv_StudentGrades as 
SELECT s.FirstName , s.LastName, COUNT (Grade) as GradeCount 
FROM dbo.Grade as g 
INNER JOIN dbo.Student as s  on s.ID = g.StudentID
group by s.FirstName, s.LastName
GO

--List all rows from view ordered by biggest Grade Count
SELECT *
FROM vv_StudentGrades 
order by GradeCount desc 
GO

--Create new view (vv_StudentGradeDetails) that will List all Students (FirstName and LastName) and Count the courses he passed through the exam(Ispit)
CREATE VIEW vv_StudentGradeDetails
as 
SELECT s.FirstName, s.LastName, COUNT (c.[Name]) as CoursesPassed
FROM dbo.Student as s 
INNER JOIN dbo.Grade as g on s.ID = g.StudentID
INNER JOIN dbo.Course as c on c.ID = g.CourseID
INNER JOIN dbo.GradeDetails as gd on gd.GradeID = g.ID
INNER JOIN dbo.AchievementType as at on at.ID = gd.AchievementTypeID
WHERE at.[Name] = 'Ispit' 
group by s.FirstName, s.LastName
GO

SELECT *
FROM vv_StudentGradeDetails
GO


