--Declare scalar variable for storing FirstName values

DECLARE @FirstNameVar nvarchar (100)

--Assign value ‘Antonio’  to the FirstName variable

SET @FirstNameVar = 'Antonio'

--Find all Students  having FirstName  same as the variable
SELECT * 
FROM dbo.Student 
WHERE FirstName = @FirstNameVar

--Declare table variable that will contain StudentId, StudentName and DateOfBirth
DECLARE @StudentTable Table 
(StudentId int, StudentName nvarchar(100), DateOfBirth date )

--Fill the  table variable with all Female  students
INSERT INTO @StudentTable
SELECT ID , FirstName, DateOfBirth
FROM dbo.Student
WHERE Gender = 'F'

select * from @StudentTable
GO



--Declare temp table that will contain LastName and EnrolledDate columnsq


CREATE TABLE #TempTable
(LastNameTemp nvarchar (50), EnrolledDateTemp date)

--Fill the temp table with all Male students having First Name  starting with ‘A’
INSERT INTO #TempTable
SELECT LastName, EnrolledDate
FROM dbo.Student
WHERE Gender = 'M' and FirstName like 'A%'

SELECT * from #TempTable
GO
--Retrieve  the students  from the  table which last name  is with 7 characters
SELECT *
FROM dbo.Student
WHERE LEN (LastName) = 7
GO
--Find all teachers whose FirstName length is less than 5 and the first 3 characters of their FirstName  and LastName are the same
SELECT *
FROM dbo.Teacher
WHERE LEN (FirstName) < 5  and LEFT(FirstName, 3) = LEFT(LastName, 3)
GO
