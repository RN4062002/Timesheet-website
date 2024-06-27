CREATE OR ALTER PROCEDURE EmployeeLoadDetails
@EmployeeID INT

AS
BEGIN
		SELECT
		ISNULL(EmployeeID, '') AS EmployeeID,
		ISNULL(EmployeeName, '') AS EmployeeName,
		ISNULL(EmployeeCode, '') AS EmployeeCode,
		ISNULL(EmployeePassword, '') AS EmployeePassword,
		ISNULL(DepartmentID,'')AS DepartmentID,
		ISNULL(EmployeeTypeID, '') AS EmployeeTypeID,
		ISNULL(IsActive, '') AS IsActive,
		ISNULL(CreatedBy, '') AS CreatedBy,
		ISNULL(CreatedOn, '') AS CreatedOn,
		ISNULL(LastModifiedBy, '') AS ModifiedBy,
		ISNULL(LastModifiedOn, '') AS ModifiedOn
	FROM
		Employees 

	WHERE
		EmployeeID = @EmployeeID AND IsActive = 1
END

GO

