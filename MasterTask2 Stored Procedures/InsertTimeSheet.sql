CREATE OR ALTER PROCEDURE InsertTimeSheet
@NewActivityID INT OUTPUT,
@EmployeeID VARCHAR(100),
@Date DATE,
@ActivityID INT,
@ActivityTime VARCHAR(100),
@Description VARCHAR(max),
@DepartmentID INT,
@ActivityName VARCHAR(100)
AS
/*
***********************************************************************************************
	Date   			Modified By   	   Purpose of Modification
1	11-June-2024    Rohan Nagargoje	   
***********************************************************************************************
*/
BEGIN
      IF @ActivityID IS NULL
	  BEGIN
	         
			INSERT INTO Activitys(ActivityName,DepartmentID)VALUES(@ActivityName,@DepartmentID)
	        SET @NewActivityID = @@IDENTITY
		    
			UPDATE Activitys SET IsCustom = 1 WHERE ActivityID = @NewActivityID

	   INSERT INTO Timesheets (
								EmployeeID,
								TimeSheetDate,
								ActivityID,
								TimesheetTime,
								TimesheetDescription,
								DepartmentID,
								CustomActivity,
								CreatedBy,
								LastModifiedBy
						      )
						      VALUES
						     (
								@EmployeeID,
								@Date,
								@NewActivityID,
								@ActivityTime,
								@Description,
								@DepartmentID,
								@ActivityName,
								'Admin',
								'Admin'
							 )
	END
	ELSE
	   BEGIN
	   INSERT INTO Timesheets (
								EmployeeID,
								TimeSheetDate,
								ActivityID,
								TimesheetTime,
								TimesheetDescription,
								DepartmentID,
								CreatedBy,
								LastModifiedBy
						      )
						      VALUES
						     (
								@EmployeeID,
								@Date,
								@ActivityID,
								@ActivityTime,
								@Description,
								@DepartmentID,
								'Admin',
								'Admin'
							 )
	   END
  
END
---------------------------------------------------------------------------------------------------------------------------------


Declare @var Int , @Date1 DATE = GetDATE()
exec InsertTimeSheet @var out,4,@Date1,2,'10:34:53.44','swdwee',2,NULL
select * from Activitys
select * from Timesheets



select ActivityID,CustomActivity from Timesheets WHERE TimesheetID = 74