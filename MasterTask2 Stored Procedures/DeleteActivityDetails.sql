CREATE PROCEDURE DeleteActivityDetails
@ActivityID INT

AS
BEGIN
		UPDATE Activitys SET IsActive = 0 WHERE ActivityID = @ActivityID
END