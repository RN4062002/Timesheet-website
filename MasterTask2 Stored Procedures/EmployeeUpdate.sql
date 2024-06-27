CREATE OR ALTER PROCEDURE EmployeeUpdate
@EmployeeID INT,
@EmployeeName VARCHAR (200),
@EmployeeCode VARCHAR(200),
@EmployeePassword VARCHAR(100),
@DepartmentID INT,
@EmployeTypeID INT
/*
***********************************************************************************************
	Date   			Modified By   	   Purpose of Modification
1	17-April-2024    Rohan Nagargoje	   AuthorUpdate
***********************************************************************************************
*/
AS
BEGIN
	UPDATE
		Employees
	SET
		EmployeeName = @EmployeeName,
		EmployeeCode = @EmployeeCode,
		EmployeePassword = @EmployeePassword,
		DepartmentID = @DepartmentID,
		EmployeeTypeID = @EmployeTypeID,
		LastModifiedBy = 'admin',
		LastModifiedOn = GETDATE() 
	WHERE
		EmployeeID = @EmployeeID
END
GO

--EXEC  BooksUpdate 

