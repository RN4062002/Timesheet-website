CREATE PROCEDURE DeleteEmployeeDetails
@EmployeeID INT

AS
BEGIN
		UPDATE Employees SET IsActive = 0 WHERE EmployeeID = @EmployeeID
END