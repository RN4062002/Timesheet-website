CREATE PROCEDURE DeleteEmployeeTimesheetDetails
@TimesheetID INT
AS
/*
***********************************************************************************************
	Date   			Modified By   	   Purpose of Modification
1	13-June-2024    Rohan Nagargoje	   
***********************************************************************************************
*/
BEGIN
		UPDATE Timesheets SET IsActive = 0 WHERE TimesheetID = @TimesheetID
END