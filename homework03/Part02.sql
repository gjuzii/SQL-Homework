--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200

SELECT t.FirstName, t.LastName ,COUNT (Grade) as GradeCount
FROM dbo.Grade as g
INNER JOIN dbo.Teacher as t on t.ID = g.TeacherID
group by t.FirstName, t.LastName 
HAVING COUNT (Grade) > 200
GO

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100) and filter teachers with more than 50 Grade count

SELECT t.FirstName, t.LastName , COUNT (Grade) as GradeCount
FROM dbo.Grade as g 
INNER JOIN dbo.Teacher as t on t.ID = g.TeacherID
WHERE g.StudentID < 100
group by t.FirstName, t.LastName 
HAVING COUNT (Grade) > 50
GO

--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade
--List Student First Name and Last Name next to the other details from previous query
SELECT s.ID, s.FirstName, s.LastName , COUNT (Grade) as GradeCount, MAX (Grade) as MaxGrade, AVG (Grade) as AvgGrade
FROM dbo.Grade as g 
INNER JOIN dbo.Student as s on s.ID = g.StudentID
group by s.ID, s.FirstName, s.LastName
HAVING MAX (Grade) = AVG (Grade)
GO