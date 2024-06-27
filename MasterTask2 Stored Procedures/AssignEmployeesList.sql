CREATE OR ALTER PROCEDURE AssignEmployeesList
@search VARCHAR(30) = NULL,
@EmployeeTypeID INT,
@EmployeeCode VARCHAR(100),
@PageNumber INT=1, 
@PageSize   INT=5,
@TotalCount INT OUTPUT,
@TOTALROWS  INT OUTPUT
AS
BEGIN
		DECLARE @DepartmentID INT = (select DepartmentID from Employees Where EmployeeTypeID = @EmployeeTypeID AND EmployeeCode = @EmployeeCode)
        SELECT 
		       ISNULL(T.TimesheetID,'') AS TimesheetID,
		       ISNULL(E.EmployeeName,'') AS EmployeeName,
		       ISNULL(A.ActivityName,'')AS ActivityName,
			   ISNULL(TimesheetTime,'') AS TimesheetTime,
			   ISNULL(TimesheetDescription,'') AS TimesheetDescription,
			   ISNULL(TimeSheetDate,'') AS TimeSheetDate,
			    ISNULL(T.IsActive,'') AS IsActive,
			   	Row_number() OVER(ORDER BY TimesheetID) AS rownum

			    INTO #Paging
	    FROM Timesheets AS T
		LEFT JOIN Employees AS E ON T.EmployeeID = E.EmployeeID
		LEFT JOIN Activitys AS A ON T.ActivityID = A.ActivityID
	    WHERE T.DepartmentID = @DepartmentID 
		AND ((@search is null) or EmployeeName like '%'+@search+'%')
		SELECT * 
	FROM	#Paging 
	WHERE	rownum BETWEEN ((@PageNumber-1) * @pageSize + 1 ) AND ((((@PageNumber-1) * @PageSize + 1) + @PageSize) - 1 )
	SELECT @TOTALROWS = COUNT(*) FROM #Paging WHERE isActive = 1
	SET @TotalCount = ceiling(cast(@TOTALROWS AS decimal)/@PageSize)
END		

EXEC AssignEmployeesList null,1 , 'MGR001'