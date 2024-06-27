USE [TrainingDB_RohanNagargoje]
GO
select * from Activitys
CREATE OR ALTER PROCEDURE ActivityLoadDetails 
@ActivityID INT

AS
BEGIN
		SELECT
		ISNULL(ActivityID, '') AS ActivityID,
		ISNULL(ActivityName, '') AS ActivityName,
		ISNULL(DepartmentID,'')AS DepartmentID,
		ISNULL(IsActive, '') AS IsActive,
		ISNULL(IsCustom,'') AS IsCustom,
		ISNULL(CreatedBy, '') AS CreatedBy,
		ISNULL(CreatedOn, '') AS CreatedOn,
		ISNULL(LastModifiedBy, '') AS ModifiedBy,
		ISNULL(LastModifiedOn, '') AS ModifiedOn
	FROM
		Activitys 
	WHERE
		ActivityID = @ActivityID
		and
		IsCustom = 1
END


EXEC ActivityLoadDetails 11