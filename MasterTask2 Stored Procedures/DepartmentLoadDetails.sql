
CREATE OR ALTER PROCEDURE DepartmentLoadDetails
@ActivityID INT

AS
BEGIN
		SELECT
		ISNULL(ActivityID, '') AS ActivityID,
		ISNULL(ActivityName, '') AS ActivityName,
		ISNULL(DepartmentID,'')AS DepartmentID,
		ISNULL(IsActive, '') AS IsActive,
		ISNULL(CreatedBy, '') AS CreatedBy,
		ISNULL(CreatedOn, '') AS CreatedOn,
		ISNULL(LastModifiedBy, '') AS ModifiedBy,
		ISNULL(LastModifiedOn, '') AS ModifiedOn
	FROM
		Activitys 
	WHERE
		ActivityID = @ActivityID AND IsActive = 1
END

GO