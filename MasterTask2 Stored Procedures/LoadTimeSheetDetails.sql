CREATE PROCEDURE LoadTimeSheetDetails
@TimesheetID INT
AS 
BEGIN
		SELECT
		ISNULL(TimesheetID, '') AS TimesheetID,
		ISNULL(TimeSheetDate, '') AS TimeSheetDate,
		ISNULL(TimesheetDescription, '') AS TimesheetDescription,
		ISNULL(TimesheetTime, '') AS TimesheetTime,
		ISNULL(DepartmentID,'')AS DepartmentID,
		ISNULL(EmployeeID, '') AS EmployeeID,
		ISNULL(ActivityID, '') AS ActivityID,
		ISNULL(IsActive, '') AS IsActive,
		ISNULL(CreatedBy, '') AS CreatedBy,
		ISNULL(CreatedOn, '') AS CreatedOn,
		ISNULL(LastModifiedBy, '') AS ModifiedBy,
		ISNULL(LastModifiedOn, '') AS ModifiedOn
	FROM
		Timesheets 

	WHERE
		TimesheetID = @TimesheetID AND IsActive = 1
END