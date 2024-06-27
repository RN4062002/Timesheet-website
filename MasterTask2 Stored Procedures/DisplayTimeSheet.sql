CREATE OR ALTER PROCEDURE DisplayTimeSheet 
@EmployeeID INT,
@searchDate VARCHAR(10) = NULL
AS
/*
***********************************************************************************************
    Date            Modified By         Purpose of Modification
1   11-June-2024    Rohan Nagargoje       
***********************************************************************************************
*/
BEGIN
    -- Declare a variable to hold the converted search date
    DECLARE @SearchDateConverted DATE;

    -- Try to convert the @searchDate parameter to a DATE type
    BEGIN TRY
        SET @SearchDateConverted = CONVERT(DATE, @searchDate, 23); --the format is yyyy-MM-dd
    END TRY
    BEGIN CATCH
        SET @SearchDateConverted = NULL; -- If conversion fails, set to NULL
    END CATCH;

    SELECT 
        ISNULL(T.TimesheetID,'') AS TimesheetID,
        ISNULL(E.EmployeeName, '') AS EmployeeName,
        ISNULL(A.ActivityName, '') AS ActivityName,
        ISNULL(D.DepartmentName, '') AS DepartmentName,
        ISNULL(T.TimesheetTime, '') AS TimesheetTime,
        ISNULL(CONVERT(VARCHAR, T.TimeSheetDate, 103), '') AS TimeSheetDate,
        ISNULL(T.TimesheetDescription, '') AS TimesheetDescription,
        ISNULL(T.IsActive, '') AS IsActive,
        ISNULL(T.CreatedBy, '') AS CreatedBy,
        ISNULL(T.CreatedOn, '') AS CreatedOn,
        ISNULL(T.LastModifiedBy, '') AS ModifiedBy,
        ISNULL(T.LastModifiedOn, '') AS ModifiedOn
    FROM Timesheets AS T
    LEFT JOIN Employees AS E ON T.EmployeeID = E.EmployeeID
    LEFT JOIN Activitys AS A ON T.ActivityID = A.ActivityID
    LEFT JOIN Departments AS D ON T.DepartmentID = D.DepartmentID
    WHERE E.EmployeeID = @EmployeeID 
      AND T.IsActive = 1 
      AND (@SearchDateConverted IS NULL OR T.TimeSheetDate = @SearchDateConverted)
END
---------------------------------------------------------------------------------------------------------------------------------------
-- Example Execution
 
