CREATE PROCEDURE UpdateTimesheet
@TimesheetID INT,
@TimeSheetDate VARCHAR(100),
@TimesheetDescription VARCHAR(100),
@TimesheetTime VARCHAR(100),
@DepartmentID INT,
@EmployeeID INT,
@ActivityID INT
AS
BEGIN
		UPDATE
		Timesheets
	SET
		TimeSheetDate = @TimeSheetDate,
		TimesheetDescription = @TimesheetDescription,
		TimesheetTime = @TimesheetTime,
		DepartmentID = @DepartmentID,
		EmployeeID = @EmployeeID,
		ActivityID = @ActivityID,
		LastModifiedBy = 'admin',
		LastModifiedOn = GETDATE() 
	WHERE
		TimesheetID = @TimesheetID
END

select * from Timesheets