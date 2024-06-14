/*
File:			AlecLaheyPayroll_Queries.sql
Description:	Contains useful SQL queries related to payroll management, including functions, 
				stored procedures, indexes, and data manipulation operations. These functions are examples of 
				queries a database administrator may find useful. 
				Note: Due to the nature of each operation, will need to execute each operation seperately
Author:			Alec Lahey
Date:			June 2024
*/


use AlecLaheyPayroll

--CALCULATE NET PAY

--1. FIRST WE NEED TO FIND EMPLOYEE GROSS PAY

CREATE FUNCTION dbo.GetGrossPay (
    @EmployeeID INT,
    @HourlyRate FLOAT = NULL, -- Optional parameter for hourly rate
    @HoursWorked FLOAT = NULL, -- Optional parameter for hours worked
    @SalaryAmount MONEY = NULL -- Optional parameter for salary amount
)
RETURNS MONEY
AS
BEGIN
    DECLARE @GrossPay MONEY;

    -- Check if the employee is hourly-based or salary-based
    IF (@HourlyRate IS NOT NULL AND @HoursWorked IS NOT NULL) -- Hourly-based employee
    BEGIN
        -- Calculate gross pay for hourly employee
        SET @GrossPay = (@HoursWorked * @HourlyRate);
    END
    ELSE IF (@SalaryAmount IS NOT NULL) -- Salary-based employee
    BEGIN
        -- Calculate gross pay for salary-based employee
        SET @GrossPay = @SalaryAmount / 12; -- Assuming monthly salary
    END
    ELSE
    BEGIN
        -- Return NULL if insufficient parameters are provided
        SET @GrossPay = NULL;
    END

    RETURN @GrossPay;
END;

--2. THEN WE NEED TO FIND EMPLOYEES TOTAL DEDUCTIONS

CREATE FUNCTION dbo.GetTotalDeductions (
    @EmployeeID INT
)
RETURNS MONEY
AS
BEGIN
    DECLARE @TotalDeductions MONEY;

    -- Calculate total deductions for the employee
    SELECT @TotalDeductions = SUM(DeductionAmount)
    FROM dbo.Deductions
    WHERE DeductionsID IN (
        SELECT DeductionsID
        FROM dbo.Payments
        WHERE EmployeeID = @EmployeeID
    );

    -- If no deductions found, set total deductions to 0
    IF @TotalDeductions IS NULL
        SET @TotalDeductions = 0;

    RETURN @TotalDeductions;
END;

--3. FINALLY WE WILL USE THE PREVIOUS FUNCTIONS TO FIND THE EMPLOYEE'S

CREATE FUNCTION dbo.CalculateNetPay (
    @EmployeeID INT,
    @GrossPay MONEY,
    @HourlyRate FLOAT = NULL, 
    @HoursWorked FLOAT = NULL, 
    @OvertimePay MONEY = NULL, 
	@BonusAmount MONEY = NULL
)
RETURNS MONEY
AS
BEGIN
    DECLARE @TotalDeductions MONEY;
    DECLARE @NetPay MONEY;

    -- Check if employee is hourly-based or salary-based
    IF (@HourlyRate IS NOT NULL AND @HoursWorked IS NOT NULL) -- Hourly-based employee
    BEGIN
        -- Calculate net pay
        SET @NetPay = (@HoursWorked * @HourlyRate) + ISNULL(@OvertimePay, 0) - dbo.GetTotalDeductions(@EmployeeID);

    END

	-- Salary-based employee
    ELSE 

    BEGIN
        -- Calculate net pay 
        SET @NetPay = @GrossPay - dbo.GetTotalDeductions(@EmployeeID) + @BonusAmount;
    END

    --Data validation for negative values
    IF @NetPay < 0
        SET @NetPay = 0;

    RETURN @NetPay;
END;
 
 USE AlecLaheyPayroll; 

-- 4. Select employee data along with net pay calculated using the function
SELECT 
    emp.EmployeeID,
    emp.FirstName,
    emp.LastName,
    dep.DepartmentName,
    dbo.CalculateNetPay(emp.EmployeeID, he.HourlyRate, hw.HoursWorked, se.SalaryAmount, NULL, NULL) AS NetPay
FROM 
    dbo.Employee emp
JOIN 
    dbo.Department dep ON emp.DepartmentID = dep.DepartmentID
LEFT JOIN 
    dbo.HourlyEmployee he ON emp.EmployeeID = he.EmployeeID
LEFT JOIN 
    dbo.HoursWorked hw ON he.HourlyEmployeeID = hw.HoursWorkedID
LEFT JOIN 
    dbo.SalariedEmployee se ON emp.EmployeeID = se.EmployeeID;


--5. TOP 5 PAID EMPLOYEES WITH THEIR NAMES, EARNINGS, AND DEPARTMENT NAME
WITH EmployeeRanking AS (
    SELECT 
        RANK() OVER (ORDER BY GrossPay DESC) AS 'Rank',
        DepartmentName, 
        FirstName, 
        LastName, 
        GrossPay
    FROM (
        SELECT 
            emp.FirstName, 
            emp.LastName, 
            dep.DepartmentName,
            dbo.GetGrossPay(emp.EmployeeID, he.HourlyRate, hw.HoursWorked, se.SalaryAmount) AS GrossPay
        FROM dbo.Employee emp
        JOIN dbo.Department dep ON emp.DepartmentID = dep.DepartmentID
        LEFT JOIN dbo.HourlyEmployee he ON emp.EmployeeID = he.EmployeeID
        LEFT JOIN dbo.HoursWorked hw ON he.HourlyEmployeeID = hw.HoursWorkedID
        LEFT JOIN dbo.SalariedEmployee se ON emp.EmployeeID = se.EmployeeID
    ) AS GrossPayInfo
)
SELECT TOP 5 
    FirstName + ' ' + LastName AS 'Employee Name',
    GrossPay AS 'Monthly Earnings', DepartmentName
FROM EmployeeRanking 
ORDER BY GrossPay DESC;




--6. INSERT NEW EMPLOYEE PROCEDURE
--ONLY INSERT REQUIRED INFORMATION
--THIS PROCEDURE WOULD BE USEFUL FOR AN EMPLOYEE AT THE BEGINNING OF THE HIRING PROCESS
--AND ALL DATA IS NOT RECEIVED YET

CREATE PROCEDURE dbo.InsertEmployee(@FirstName NVARCHAR(150), @LastName NVARCHAR(150), @Gender CHAR(1),@DateUpdated DATE
)
AS 
BEGIN;
INSERT INTO dbo.Employee(FirstName, LastName, Gender, LastUpdated)
VALUES(@FirstName,@LastName,@Gender,@DateUpdated);
END;

GO


--EXAMPLES OF USING THE PROCEDURE
EXECUTE dbo.InsertEmployee 'Earl', 'Avery','X','2024-01-07';
EXECUTE dbo.InsertEmployee 'Juan', 'Martinez', 'M', '2023-05-15';
EXECUTE dbo.InsertEmployee 'Sakura', 'Tanaka', 'F', '2022-11-20';
EXECUTE dbo.InsertEmployee 'Ahmed', 'Khan', 'M', '2023-08-10';
EXECUTE dbo.InsertEmployee 'Fatima', 'Ali', 'F', '2021-09-05';
SELECT * FROM Employee;

--7. FIND EMPLOYEES WITHOUT MANAGERS AND SETS THE MANAGER FIRT AND LAST NAME TO NULL
--SELECT ALL EMPLOYEES AND MANAGERS AND OUTPUT EMPLOYEE NAME, DEPARTMENTID,EMPLOYEEID, AND THEIR MANAGER'S ID

WITH EmployeeByManager AS (
    SELECT
        emp.FirstName AS EmployeeFirstName,
        emp.LastName AS EmployeeLastName,
        emp.DepartmentID,
		CAST(NULL AS NVARCHAR(MAX)) AS ManagerLastName,
		CAST(NULL AS NVARCHAR(MAX)) AS ManagerFirstName,
        emp.EmployeeID,
		emp.ManagerEmployeeID
    FROM dbo.Employee emp
    WHERE emp.ManagerEmployeeID IS NULL

    UNION ALL

    SELECT
        emp.FirstName AS EmployeeFirstName,
        emp.LastName AS EmployeeLastName,
        emp.DepartmentID,
        ISNULL(CAST(man.EmployeeFirstName AS NVARCHAR(MAX)), NULL) AS ManagerFirstName,
        ISNULL(CAST (man.EmployeeLastName AS NVARCHAR(MAX)), NULL) AS ManagerLastName,
        emp.EmployeeID,
		emp.ManagerEmployeeID
    FROM dbo.Employee emp
    JOIN EmployeeByManager man ON emp.ManagerEmployeeID = man.EmployeeID
)
SELECT * FROM EmployeeByManager;


--8. INSERT DEPARTMENTS PROCEDURE
CREATE PROCEDURE dbo.InsertDepartments(@DepartmentName NVARCHAR(50), @DepatmentDesc NVARCHAR(150)
)
AS 
BEGIN;
INSERT INTO dbo.Department ( DepartmentName, DepartmentDesc )
VALUES(@DepartmentName,@DepatmentDesc);
END;

GO

--ADDING 5 MORE DEPARTMENTS TO PROVE FUNCTIONALITY
EXECUTE dbo.InsertDepartments 'COMM', 'Communication and Media Systems';
EXECUTE dbo.InsertDepartments 'MTND', 'Maitenance Department';
EXECUTE dbo.InsertDepartments 'CSD', 'Cleaning and Sanitation Department';
EXECUTE dbo.InsertDepartments 'DSD', 'Data Security Department';
EXECUTE dbo.InsertDepartments 'TACD', 'Talent Acquisition';
SELECT * FROM Department;

--9. CREATING INDEXES FOR POTENTIAL COMMONLY SEARCHED PROTERTIES
CREATE INDEX IX_Employee_FirstName_LastName ON dbo.Employee (FirstName, LastName);
CREATE INDEX IX_Employee_LastName_FirstName ON dbo.Employee (LastName, FirstName);

CREATE INDEX IX_EmployeeAddress_EmployeeID_AddressInfoID ON dbo.EmployeeAddress (EmployeeID, AddressInfoID);
CREATE INDEX IX_EmployeeAddress_AddressInfoID_EmployeeID ON dbo.EmployeeAddress (AddressInfoID, EmployeeID);

CREATE INDEX IX_SalariedEmployee_StartDate_EndDate ON dbo.SalariedEmployee (StartDate, EndDate);
CREATE INDEX IX_SalariedEmployee_EndDate_StartDate ON dbo.SalariedEmployee (EndDate, StartDate);
CREATE INDEX IX_HourlyEmployee_StartDate_EndDate ON dbo.HourlyEmployee (StartDate, EndDate);
CREATE INDEX IX_HourlyEmployee_EndDate_StartDate ON dbo.HourlyEmployee (EndDate, StartDate);



