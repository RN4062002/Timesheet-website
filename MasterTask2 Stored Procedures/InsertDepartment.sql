CREATE OR ALTER PROCEDURE InsertDepartment
@DepartmentName VARCHAR(100)
AS
BEGIN
		INSERT INTO Departments(DepartmentName)VALUES(@DepartmentName);

END