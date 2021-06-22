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

DECLARE @Output Nvarchar(1000)

select @Output = SUBSTRING (StudentCardNumber,1,2) + '-' + LEFT(FirstName,1) + '.' + LastName
from dbo.Student
where id = @StudentId

RETURN @Output

END
GO




