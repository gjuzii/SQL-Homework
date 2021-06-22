--Calculate the count of all grades in the system

SELECT Count (Grade) GradeCount 
FROM Grade
GO

--Calculate the count of all grades per Teacher in the system
SELECT t.FirstName, t.LastName, COUNT (Grade) as GradeCount
FROM dbo.Grade as g
INNER JOIN dbo.Teacher t on t.ID = g.TeacherID
Group by t.FirstName , t.LastName 
GO

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)

SELECT t.FirstName, t.LastName, COUNT (Grade) as GradeCount
FROM dbo.Grade g
INNER JOIN dbo.Teacher t on t.ID = g.TeacherID
WHERE g.StudentID < 100 group by t.FirstName, t.LastName 
order by GradeCount
GO

--Find the Maximal Grade, and the Average Grade per Student on all grades in the system

SELECT s.FirstName, s.LastName, MAX(Grade) as MaxGrade, AVG(Grade) as AvgGrade 
FROM dbo.Grade as g
INNER JOIN dbo.Student as s on s.ID = g.StudentID
group by s.FirstName, s.LastName 
GO