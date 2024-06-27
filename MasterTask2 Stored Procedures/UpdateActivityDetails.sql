CREATE PROCEDURE UpdateActivityDetails
@ActivityID INT,
@DepartmentID INT,
@ActivityName VARCHAR(100)

AS
BEGIN
		UPDATE
		Activitys
	SET
		ActivityName = @ActivityName,
		DepartmentID = @DepartmentID,
		LastModifiedBy = 'admin',
		LastModifiedOn = GETDATE() 
	WHERE
		ActivityID = @ActivityID
END
