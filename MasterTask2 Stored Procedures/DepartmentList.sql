CREATE OR ALTER PROCEDURE DepartmentList
@PageNumber INT=1, 
@PageSize   INT=5,
@TotalCount INT OUTPUT,
@TOTALROWS  INT OUTPUT
AS
BEGIN
		SELECT 
		       ISNULL(DepartmentID,'') AS DepartmentID,
			   ISNULL(DepartmentName,'') AS DepartmentName,
			   ISNULL(IsActive, '') AS IsActive,
		       Row_number() OVER(ORDER BY DepartmentID) AS rownum
		INTO #Paging

		FROM Departments WHERE IsActive = 1

		SELECT * 
		FROM	#Paging 
		WHERE	rownum BETWEEN ((@PageNumber-1) * @pageSize + 1 ) AND ((((@PageNumber-1) * @PageSize + 1) + @PageSize) - 1 )
		SELECT @TOTALROWS = COUNT(*) FROM #Paging WHERE isActive = 1
		SET @TotalCount = ceiling(cast(@TOTALROWS AS decimal)/@PageSize)
END