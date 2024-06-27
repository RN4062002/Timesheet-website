CREATE PROCEDURE EmployeeNameDropDown
AS 
BEGIN
		SELECT EmployeeID,EmployeeName FROM Employees
END
--------------------------------------------------------------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE ActivityNameDropDown 
@DepartmentID INT
AS 
BEGIN
		SELECT ActivityID,ActivityName FROM Activitys WHERE DepartmentID = @DepartmentID AND IsActive = 1 AND IsCustom = 0
END
--------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE DepartmentDropDown
AS 
BEGIN
		SELECT DepartmentID,DepartmentName FROM Departments WHERE IsActive = 1
END

------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE EmployeeTypeDropDown
AS 
BEGIN
		SELECT EmployeeTypeID,EmployeeType FROM EmployeeTypes WHERE IsActive = 1
END
---
CREATE OR ALTER PROCEDURE AllActivityNameDropDown 2
@DepartmentID INT
AS 
BEGIN
		SELECT ActivityID,ActivityName FROM Activitys WHERE DepartmentID = @DepartmentID 
END
--------------------------------------------------------------------------------
SELECT * FROM Departments
SELECT * FROM Employees



