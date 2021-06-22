--Declare scalar function (fn_FormatStudentName) for retrieving the Student description for specific StudentId in the following format:

--StudentCardNumberwithout “sc-”

--“ – “

--First character  of student  FirstName“.”

--Student LastName

DROP FUNCTION IF EXISTS dbo.fn_FormatStudentName;
GO

CREATE FUNCTION dbo.fn_FormatStudentName (@StudentId int)
RETURNS Nvarchar(1000)
AS 
BEGIN

DECLARE @FunctionOutput Nvarchar(1000)

select @FunctionOutput = REPLACE (StudentCardNumber,'sc', ' ') + '-' + LEFT(FirstName,1) + '.' + LastName
from dbo.Student
where id = @StudentId

RETURN @FunctionOutput

END

SELECT *, dbo.fn_FormatStudentName (id) as FunctionOutput
FROM dbo.Student
go






