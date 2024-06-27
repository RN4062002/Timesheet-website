CREATE PROCEDURE DepartmentUpdateDetails
@DepartmentID INT,
@DepartmentName VARCHAR(100)
AS
BEGIN
		UPDATE Departments 
		SET
		DepartmentName = @DepartmentName,
		LastModifiedBy = 'admin',
		LastModifiedOn = GETDATE() 
	WHERE
		DepartmentID = @DepartmentID
END



