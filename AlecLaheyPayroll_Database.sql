/*
File Name:		AlecLaheyPayroll_Database.sql
Description:	SQL script for creating and initializing the AlecLaheyPayroll database schema establishing 
				appropiate constraints and relationships.
Author:			Alec Lahey
Date:			June 2024
*/


USE master;
GO

DROP DATABASE IF EXISTS AlecLaheyPayroll;
CREATE DATABASE AlecLaheyPayroll;

GO 

USE AlecLaheyPayroll;

GO

CREATE TABLE dbo.Department(
	
	DepartmentID		INT IDENTITY NOT NULL,
	DepartmentName		NVARCHAR(50) NOT NULL,
	DepartmentDesc		NVARCHAR(150) NOT NULL CONSTRAINT DF_DFDeptDesc DEFAULT 'Dept. Desc to be determined',


	CONSTRAINT PK_Department PRIMARY KEY CLUSTERED (DepartmentID)

);


CREATE TABLE dbo.Position(

	PositionID		INT IDENTITY NOT NULL,
	Title			NVARCHAR(60),
	FromDate		DATE,
	ToDate			DATE,

	CONSTRAINT PK_Position PRIMARY KEY CLUSTERED (PositionID)
		
);


CREATE TABLE dbo.AddressType(

	AddressTypeID		INT IDENTITY NOT NULL,
	TypeName			NVARCHAR(50) NOT NULL,
    TypeDescription		NVARCHAR(150) NOT NULL,

	CONSTRAINT PK_Address_Type PRIMARY KEY CLUSTERED (AddressTypeID)

);



CREATE TABLE dbo.AddressInfo(

	AddressInfoID		INT IDENTITY NOT NULL,
	Street			NVARCHAR(100) NOT NULL,
    City			NVARCHAR(50) NOT NULL,
    Province        NVARCHAR(50) NOT NULL,
    PostalCode		NVARCHAR(20) NOT NULL,
    Country			NVARCHAR(50) NOT NULL,
    AddressTypeID	INT NOT NULL,

	CONSTRAINT PK_AddressInfo PRIMARY KEY CLUSTERED (AddressInfoID),
	CONSTRAINT FK_Address_Type FOREIGN KEY (AddressTypeID) REFERENCES dbo.AddressType (AddressTypeID)

);

CREATE TABLE dbo.Employee(

	EmployeeID		INT IDENTITY NOT NULL,
	FirstName		NVARCHAR(60) NOT NULL,
	LastName		NVARCHAR(70) NOT NULL,
	Gender			CHAR(1) NOT NULL, 
	HireDate		DATE NULL,
	ManagerEmployeeID INT NULL,
	DepartmentID	INT NULL,
	PositionID		INT NULL,
	AddressInfoID		INT NULL,
	LastUpdated		DATE NOT NULL,

	CONSTRAINT PK_Employee PRIMARY KEY CLUSTERED (EmployeeID),
	CONSTRAINT FK_Employee_Manager FOREIGN KEY (ManagerEmployeeID) REFERENCES dbo.Employee ( EmployeeID ),
	CONSTRAINT FK_Employee_Department FOREIGN KEY (DepartmentID) REFERENCES dbo.Department (DepartmentID),
    CONSTRAINT FK_Employee_Position FOREIGN KEY (PositionID) REFERENCES dbo.Position (PositionID),
    CONSTRAINT FK_Employee_AddressInfo FOREIGN KEY (AddressInfoID) REFERENCES dbo.AddressInfo (AddressInfoID),
	CONSTRAINT CK_Employee_Gender CHECK (Gender IN ('M','F','X')),
	CONSTRAINT CK_Employee_LastUpdated CHECK (LastUpdated <= GETDATE()),
	

);



CREATE TABLE dbo.EmployeeAddress (

	EmployeeAddressID INT IDENTITY NOT NULL,
    EmployeeID   INT NOT NULL,
    AddressInfoID    INT NOT NULL,


    CONSTRAINT PK_EmployeeAddress PRIMARY KEY CLUSTERED (EmployeeAddressID),
    CONSTRAINT FK_EmployeeAddress_Employee FOREIGN KEY (EmployeeID) REFERENCES dbo.Employee (EmployeeID),
    CONSTRAINT FK_EmployeeAddress_AddressInfo FOREIGN KEY (AddressInfoID) REFERENCES dbo.AddressInfo (AddressInfoID)

);

CREATE TABLE dbo.PayrollMonth(

    PayrollMonthID  INT IDENTITY NOT NULL,
    PayrollMonth    NVARCHAR(20),
   

    CONSTRAINT PK_PayrollMonth PRIMARY KEY CLUSTERED (PayrollMonthID)

);


CREATE TABLE dbo.Deductions(
	
	DeductionsID		INT IDENTITY NOT NULL,
	DeductionType		NVARCHAR(60) NOT NULL,
	DeductionAmount		MONEY,

	CONSTRAINT PK_Deductions PRIMARY KEY CLUSTERED (DeductionsID),

);

CREATE TABLE dbo.HourlyEmployee (
    HourlyEmployeeID INT IDENTITY NOT NULL,
    EmployeeID       INT NOT NULL,
	PayrollMonthID	INT NOT NULL,
    StartDate        DATE NOT NULL,
    EndDate          DATE NULL,
    HourlyRate       FLOAT NOT NULL,
	DeductionID        INT NOT NULL,


	CONSTRAINT PK_Hourly_Employee PRIMARY KEY CLUSTERED (HourlyEmployeeID),
    CONSTRAINT FK_HourlyEmployee_Employee FOREIGN KEY (EmployeeID) REFERENCES dbo.Employee (EmployeeID),
	CONSTRAINT FK_HourlyEmployee_PayrollMonth FOREIGN KEY (PayrollMonthID) REFERENCES dbo.PayrollMonth (PayrollMonthID),
	CONSTRAINT FK_HourlyEmployee_Deduction FOREIGN KEY (DeductionID) REFERENCES dbo.Deductions (DeductionsID)

);

CREATE TABLE dbo.SalariedEmployee (

    SalariedEmployeeID INT IDENTITY NOT NULL,
    EmployeeID         INT NOT NULL,
    StartDate          DATE NOT NULL,
    EndDate            DATE NULL,
    SalaryAmount       MONEY CONSTRAINT CK_SalariedEmployee_Salary CHECK (SalaryAmount >= 0),
    BonusAmount        MONEY NULL CONSTRAINT CK_SalariedEmployee_BonusAmount CHECK (BonusAmount >= 0),
    DeductionID        INT NOT NULL,


	CONSTRAINT PK_Salaried_Employee PRIMARY KEY CLUSTERED (SalariedEmployeeID),
    CONSTRAINT FK_SalariedEmployee_Employee FOREIGN KEY (EmployeeID) REFERENCES dbo.Employee (EmployeeID),
    CONSTRAINT FK_SalariedEmployee_Deduction FOREIGN KEY (DeductionID) REFERENCES dbo.Deductions (DeductionsID)

);


CREATE TABLE dbo.Benefits(

	BenefitsID		INT IDENTITY NOT NULL,
	EmployeeID		INT NOT NULL,
	BenefitPlan		NVARCHAR(60) NOT NULL,

	CONSTRAINT PK_benefits PRIMARY KEY CLUSTERED (BenefitsID),
	CONSTRAINT FK_Benefits_Employee FOREIGN KEY (EmployeeID) REFERENCES dbo.Employee (EmployeeID),

);

CREATE TABLE dbo.TimeSheet(

	TimeSheetID		INT IDENTITY NOT NULL,
	EmployeeID		INT NOT NULL,
	ClockIn			TIME,
	ClockOut		TIME,


	CONSTRAINT PK_Time_Sheet PRIMARY KEY CLUSTERED (TimeSheetID),
	CONSTRAINT FK_TimeSheet_Employee FOREIGN KEY (EmployeeID) REFERENCES dbo.Employee (EmployeeID)

);


CREATE TABLE dbo.PersonalDays(

	PersonalDaysID		INT IDENTITY NOT NULL,
	EmployeeID			INT NOT NULL,
	PDType				NVARCHAR(60) NOT NULL,
	Paid				BIT NOT NULL,
	DaysOff				FLOAT NOT NULL,


	CONSTRAINT PK_Personal_Days PRIMARY KEY CLUSTERED (PersonalDaysID),
	CONSTRAINT FK_PersonalDays_Employee FOREIGN KEY (EmployeeID) REFERENCES dbo.Employee (EmployeeID)

);


CREATE TABLE dbo.BankInformation(

	BankInformationID			INT IDENTITY NOT NULL,
	EmployeeID				INT NOT NULL,
	BankInstitution			NVARCHAR(100) NOT NULL,
	InstitutionNumber		CHAR(3) NOT NULL,
    AccountNumber			CHAR(10) NOT NULL,
    TransitNumber			CHAR(5) NOT NULL,

	CONSTRAINT PK_Bank_Information PRIMARY KEY CLUSTERED (BankInformationID),
	CONSTRAINT FK_Employee FOREIGN KEY (EmployeeID) REFERENCES dbo.Employee (EmployeeID)

);




CREATE TABLE dbo.HoursWorked(

	HoursWorkedID		INT IDENTITY NOT NULL,
	PayrollMonthID		INT NOT NULL,
	DaysWorked			INT,
	HoursWorked			FLOAT,
	OvertimeHours		FLOAT NULL,

	CONSTRAINT PK_Hours_Worked PRIMARY KEY CLUSTERED (HoursWorkedID),
	CONSTRAINT FK_HoursWorked_PayrollMonth FOREIGN KEY (PayrollMonthID) REFERENCES dbo.PayrollMonth (PayrollMonthID)

);

CREATE TABLE dbo.Payments(
	
	PaymentsID		INT IDENTITY NOT NULL,
	EmployeeID		INT NOT NULL,
	PayrollMonthID	INT NOT NULL,
	OvertimePay		MONEY,
	DeductionsID	INT NOT NULL,
	HourlyEmployeeID    INT,           
    SalariedEmployeeID  INT,  


	CONSTRAINT PK_Payments PRIMARY KEY CLUSTERED (PaymentsID),
	CONSTRAINT FK_Payments_Employee FOREIGN KEY (EmployeeID) REFERENCES dbo.Employee (EmployeeID),
    CONSTRAINT FK_Payments_Deductions FOREIGN KEY (DeductionsID) REFERENCES dbo.Deductions (DeductionsID),
	CONSTRAINT FK_Payments_HourlyEmployee FOREIGN KEY (HourlyEmployeeID) REFERENCES dbo.HourlyEmployee (HourlyEmployeeID),
    CONSTRAINT FK_Payments_SalariedEmployee FOREIGN KEY (SalariedEmployeeID) REFERENCES dbo.SalariedEmployee (SalariedEmployeeID),
	CONSTRAINT FK_Payments_PayrollMonth FOREIGN KEY (PayrollMonthID) REFERENCES dbo.PayrollMonth (PayrollMonthID)

);












