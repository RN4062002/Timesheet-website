CREATE OR ALTER PROCEDURE EmployeeLogin
@EmployeeCode VARCHAR(max) ,
@EmployeePassword VARCHAR(max),
@Role INT OUTPUT,
@EmployeeID INT OUTPUT,
@DepartmentID INT OUTPUT
AS
/*
***********************************************************************************************
	Date   			Modified By   	   Purpose of Modification
1	10-June-2024    Rohan Nagargoje	   
***********************************************************************************************
*/

BEGIN
IF EXISTS (
    SELECT 1 FROM Employees
    WHERE EmployeeCode = @EmployeeCode AND EmployeePassword = @EmployeePassword
)
BEGIN
    -- Set @Role and @EmployeeName based on EmployeeCode and EmployeePassword
    SELECT @Role = EmployeeTypeID, @EmployeeID = EmployeeID,@DepartmentID = DepartmentID
    FROM Employees
    WHERE EmployeeCode = @EmployeeCode AND EmployeePassword = @EmployeePassword
END
ELSE
BEGIN
  
    SET @Role = 0
    SET @EmployeeID = ''
	SET @DepartmentID = ''
END
END		

---------------------------------------------------------------------------------------------------------

DECLARE @Role1 INT
DECLARE @EmployeeName1 VARCHAR(100)
DECLARE @Department VARCHAR(100)
EXEC EmployeeLogin 'EMP001','admin123',@Role1 out,@EmployeeName1 out,@Department out
print @Role1
print @EmployeeName1
print @Department









--IF  EXISTS (SELECT EmployeeTypeID FROM Employees WHERE EmployeeCode = @EmployeeCode AND EmployeePassword = @EmployeePassword)
--			BEGIN
--				SET @Role = (SELECT EmployeeTypeID FROM Employees		
--				WHERE EmployeeCode = @EmployeeCode AND EmployeePassword = @EmployeePassword)
--				AND @EmployeeName = (SELECT EmployeeName FROM Employees		
--				WHERE EmployeeCode = @EmployeeCode AND EmployeePassword = @EmployeePassword)
--				END
--				ELSE
--				SET @Role = 0 AND @EmployeeName = ''