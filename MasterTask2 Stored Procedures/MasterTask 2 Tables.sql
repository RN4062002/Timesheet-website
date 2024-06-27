Use TrainingDB_RohanNagargoje

-- MASTER TASK TABLES --
-------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Departments(
	DepartmentID INT PRIMARY KEY IDENTITY(1,1),
	DepartmentName VARCHAR(MAX),
	CreatedBy VARCHAR(100),
	CreatedOn DateTime ,
	LastModifiedBy VARCHAR(100),
	LastModifiedOn  DateTime DEFAULT GETDATE(),
	IsActive BIT DEFAULT 1
	)
------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE EmployeeTypes(
	EmployeeTypeID INT PRIMARY KEY IDENTITY(1,1),
	EmployeeType VARCHAR(MAX),
	CreatedBy VARCHAR(100),
	CreatedOn DateTime,
	LastModifiedBy VARCHAR(100),
	LastModifiedOn DateTime DEFAULT GETDATE(),
	IsActive BIT DEFAULT 1
)
------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Activitys(
	ActivityID INT PRIMARY KEY IDENTITY(1,1),
	ActivityName Varchar(max),
	DepartmentID INT,
	CreatedBy VARCHAR(100),
	CreatedOn DateTime ,
	LastModifiedBy VARCHAR(100),
	LastModifiedOn  DateTime DEFAULT GETDATE(),
	IsActive BIT DEFAULT 1
	FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
)
-------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Employees(
	EmployeeID INT PRIMARY KEY IDENTITY(1,1),
	EmployeeName VARCHAR(MAX),
	EmployeeCode VARCHAR(MAX),
	DepartmentID INT,
	EmployeeTypeID INT,
	EmployeePassword VARCHAR(max),
	CreatedBy VARCHAR(100),
	CreatedOn DateTime ,
	LastModifiedBy VARCHAR(100) NULL,
	LastModifiedOn  DateTime DEFAULT GETDATE(),
	IsActive BIT DEFAULT 1,
	FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
	FOREIGN KEY (EmployeeTypeID) REFERENCES EmployeeTypes(EmployeeTypeID)
)
------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Timesheets(
	TimesheetID INT PRIMARY KEY IDENTITY(1,1),
	TimeSheetDate Date,
	TimesheetDescription VARCHAR(MAX),
	TimesheetTime TIME,
	EmployeeID INT,
	ActivityID INT,
	DepartmentID INT,
	CreatedBy VARCHAR(100),
	CreatedOn DateTime ,
	LastModifiedBy VARCHAR(100),
	LastModifiedOn  DateTime DEFAULT GETDATE(),
	IsActive BIT DEFAULT 1
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
	FOREIGN KEY (ActivityID) REFERENCES Activitys (ActivityID),
	FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
)
---------------------------------------------------------------------------------------------------------------------------------------------------

-- Insert dummy data into Departments table
INSERT INTO Departments (DepartmentName, CreatedBy, CreatedOn, LastModifiedBy, LastModifiedOn, IsActive)
VALUES ('HR', 'Admin', '2024-06-10', 'Admin', '2024-06-10', 1),
       ('Finance', 'Admin', '2024-06-10', 'Admin', '2024-06-10', 1),
       ('IT', 'Admin', '2024-06-10', 'Admin', '2024-06-10', 1);

-- Insert dummy data into EmployeeTypes table
INSERT INTO EmployeeTypes (EmployeeType, CreatedBy, CreatedOn, LastModifiedBy, LastModifiedOn, IsActive)
VALUES ('Manager', 'Admin', '2024-06-10', 'Admin', '2024-06-10', 1),
       ('Developer', 'Admin', '2024-06-10', 'Admin', '2024-06-10', 1),
       ('Accountant', 'Admin', '2024-06-10', 'Admin', '2024-06-10', 1);

-- Insert dummy data into Activitys table
INSERT INTO Activitys (ActivityName, CreatedBy, CreatedOn, LastModifiedBy, LastModifiedOn, IsActive)
VALUES ('Meeting', 'Admin', '2024-06-10', 'Admin', '2024-06-10', 1),
       ('Training', 'Admin', '2024-06-10', 'Admin', '2024-06-10', 1),
       ('Project', 'Admin', '2024-06-10', 'Admin', '2024-06-10', 1);

-- Insert dummy data into Employees table
INSERT INTO Employees (EmployeeName, EmployeeCode, DepartmentID, EmployeeTypeID,EmployeePassword, CreatedBy, CreatedOn, LastModifiedBy, LastModifiedOn, IsActive)
VALUES ('John Doe', 'EMP001', 1, 1,'Emp@123', 'Admin', '2024-06-10', NULL, '2024-06-10', 1),
       ('Jane Smith', 'EMP002', 2, 2,'pass@123', 'Admin', '2024-06-10', NULL, '2024-06-10', 1),
       ('Alice Johnson', 'EMP003', 3, 3,'password@123', 'Admin', '2024-06-10', NULL, '2024-06-10', 1);
---------------------------------------------------------------------------------------------------------------------------------------------------
	   select * from Employees
	   select * from EmployeeTypes
	   select * from Departments
	   select * from Activitys
	   select * from Timesheets
	  







