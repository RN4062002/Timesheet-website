CREATE OR ALTER PROCEDURE EmployeeDetails
@search VARCHAR(30) = NULL,
@PageNumber INT=1, 
@PageSize   INT=5,
@TotalCount INT OUTPUT,
@TOTALROWS  INT OUTPUT
AS
/*
***********************************************************************************************
	Date   			Modified By   	   Purpose of Modification
1	13-June-2024    Rohan Nagargoje	   
***********************************************************************************************
*/
BEGIN 
	 SELECT 
	    ISNULL(EmployeeID,'') AS EmployeeID,
	    ISNULL(EmployeeName, '') AS EmployeeName,
		ISNULL(EmployeeCode, '') AS EmployeeCode,
		ISNULL(EmployeePassword, '') AS EmployeePassword,
		ISNULL(DepartmentName, '') AS DepartmentName,
		ISNULL(ET.EmployeeType, '') AS EmployeeType,
		ISNULL(E.IsActive, '') AS IsActive,
		ISNULL(E.CreatedBy, 'admin') AS CreatedBy,
		ISNULL(E.CreatedOn, '') AS CreatedOn,
		ISNULL(E.LastModifiedBy, '') AS ModifiedBy,
		ISNULL(E.LastModifiedOn, '') AS ModifiedOn,
		Row_number() OVER(ORDER BY EmployeeID) AS rownum

        INTO #Paging

	 FROM Employees AS E
	 LEFT JOIN Departments AS D ON E.DepartmentID = D.DepartmentID
	 LEFT JOIN EmployeeTypes AS ET ON E.EmployeeTypeID = ET.EmployeeTypeID
	 WHERE E.IsActive = 1
	 	AND ((@search is null) or EmployeeName like '%'+@search+'%')
	 SELECT * 
	FROM	#Paging 
	WHERE	rownum BETWEEN ((@PageNumber-1) * @pageSize + 1 ) AND ((((@PageNumber-1) * @PageSize + 1) + @PageSize) - 1 )
	SELECT @TOTALROWS = COUNT(*) FROM #Paging WHERE isActive = 1
	SET @TotalCount = ceiling(cast(@TOTALROWS AS decimal)/@PageSize)
END
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from EmployeeTypes

DECLARE @TotalCount INT, @TotalRow INT
EXEC EmployeeDetails @search='john', @PageNumber=1, @PageSize=5, @TotalCount=@TotalCount OUTPUT,@TOTALROWS = @TotalRow OUTPUT
PRINT @TotalCount
PRINT @TotalRow