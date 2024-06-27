CREATE PROCEDURE EmployeeInsert
@EmployeeName VARCHAR(100),
@EmployeeCode VARCHAR(100),
@EmployeePassword VARCHAR(100),
@DepartmentID INT,
@EmployeeTypeID	INT
AS
BEGIN
	  INSERT INTO Employees(
			  EmployeeName,
			  EmployeeCode,
			  EmployeePassword,
			  DepartmentID,
			  EmployeeTypeID)
	  VALUES(
			  @EmployeeName,
			  @EmployeeCode,
			  @EmployeePassword,
			  @DepartmentID,
			  @EmployeeTypeID);

END

select * from Employees