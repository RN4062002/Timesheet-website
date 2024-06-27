CREATE OR ALTER PROCEDURE DisplayActivity
@PageNumber INT=1, 
@PageSize   INT=5,
@TotalCount INT OUTPUT,
@TOTALROWS  INT OUTPUT
AS
BEGIN
     SELECT 
		 ISNULL(ActivityID,'') AS ActivityID,
		 ISNULL(ActivityName,'')AS ActivityName,
		 ISNULL(D.DepartmentName,'')AS DepartmentName,
		 ISNULL(A.IsActive, '') AS IsActive,
	     ISNULL(A.CreatedBy, 'admin') AS CreatedBy,
		 ISNULL(A.CreatedOn, '') AS CreatedOn,
		 ISNULL(A.LastModifiedBy, '') AS ModifiedBy,
		 ISNULL(A.LastModifiedOn, '') AS ModifiedOn,
		 Row_number() OVER(ORDER BY ActivityID) AS rownum

		  INTO #Paging

	 FROM Activitys AS A
	 JOIN Departments AS D ON A.DepartmentID = D.DepartmentID
	 WHERE A.IsActive = 1
	  SELECT * 
		FROM	#Paging 
		WHERE	rownum BETWEEN ((@PageNumber-1) * @pageSize + 1 ) AND ((((@PageNumber-1) * @PageSize + 1) + @PageSize) - 1 )
		SELECT @TOTALROWS = COUNT(*) FROM #Paging WHERE isActive = 1
		SET @TotalCount = ceiling(cast(@TOTALROWS AS decimal)/@PageSize)
END

select * from Departments

update Departments SET IsActive=0 WHERE DepartmentName = 'sells'