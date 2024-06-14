/*
File:			AlecLaheyPayroll_DataInserts.sql
Description:	Script for inserting values into all tables in the AlecLaheyPayroll database
Author:			Alec Lahey
Date:			June 2024
*/

USE AlecLaheyPayroll

INSERT INTO dbo.Department (DepartmentName, DepartmentDesc) VALUES ('HR', 'Human Resources Department');
INSERT INTO dbo.Department (DepartmentName, DepartmentDesc) VALUES ('IT', 'Information Technology Department');
INSERT INTO dbo.Department (DepartmentName, DepartmentDesc) VALUES ('FIN', 'Finance Department');
INSERT INTO dbo.Department (DepartmentName, DepartmentDesc) VALUES ('MKT', 'Marketing Department');
INSERT INTO dbo.Department (DepartmentName, DepartmentDesc) VALUES ('OPS', 'Operations Department');
INSERT INTO dbo.Department (DepartmentName, DepartmentDesc) VALUES ('SALES', 'Sales Department');
INSERT INTO dbo.Department (DepartmentName, DepartmentDesc) VALUES ('DEV', 'Development Department');
INSERT INTO dbo.Department (DepartmentName, DepartmentDesc) VALUES ('SUP', 'Support Department');
INSERT INTO dbo.Department (DepartmentName, DepartmentDesc) VALUES ('PRD', 'Production Department');
INSERT INTO dbo.Department (DepartmentName, DepartmentDesc) VALUES ('ACC', 'Accounting Department');
INSERT INTO dbo.Department (DepartmentName, DepartmentDesc) VALUES ('QA', 'Quality Assurance Department');
INSERT INTO dbo.Department (DepartmentName, DepartmentDesc) VALUES ('CS', 'Customer Service Department');
INSERT INTO dbo.Department (DepartmentName, DepartmentDesc) VALUES ('ENG', 'Engineering Department');
INSERT INTO dbo.Department (DepartmentName, DepartmentDesc) VALUES ('LOG', 'Logistics Department');
INSERT INTO dbo.Department (DepartmentName, DepartmentDesc) VALUES ('PUR', 'Purchasing Department');
INSERT INTO dbo.Department (DepartmentName, DepartmentDesc) VALUES ('PR', 'Public Relations Department');
INSERT INTO dbo.Department (DepartmentName, DepartmentDesc) VALUES ('ADM', 'Administration Department');
INSERT INTO dbo.Department (DepartmentName, DepartmentDesc) VALUES ('RND', 'Research and Development Department');
INSERT INTO dbo.Department (DepartmentName, DepartmentDesc) VALUES ('LEGAL', 'Legal Department');
INSERT INTO dbo.Department (DepartmentName, DepartmentDesc) VALUES ('EDU', 'Education Department');

INSERT INTO dbo.Position (Title, FromDate, ToDate) VALUES ('Manager', '2018-03-15', NULL);
INSERT INTO dbo.Position (Title, FromDate, ToDate) VALUES ('Software Engineer', '2019-07-22', NULL);
INSERT INTO dbo.Position (Title, FromDate, ToDate) VALUES ('Accountant', '2017-10-05', NULL);
INSERT INTO dbo.Position (Title, FromDate, ToDate) VALUES ('Sales Representative', '2016-05-18', NULL);
INSERT INTO dbo.Position (Title, FromDate, ToDate) VALUES ('Marketing Specialist', '2018-12-09', NULL);
INSERT INTO dbo.Position (Title, FromDate, ToDate) VALUES ('Customer Service Representative', '2019-04-30', NULL);
INSERT INTO dbo.Position (Title, FromDate, ToDate) VALUES ('Project Manager', '2017-08-25', NULL);
INSERT INTO dbo.Position (Title, FromDate, ToDate) VALUES ('Quality Assurance Analyst', '2016-11-11', NULL);
INSERT INTO dbo.Position (Title, FromDate, ToDate) VALUES ('Operations Manager', '2019-02-14', NULL);
INSERT INTO dbo.Position (Title, FromDate, ToDate) VALUES ('Financial Analyst', '2018-06-28', NULL);
INSERT INTO dbo.Position (Title, FromDate, ToDate) VALUES ('Human Resources Coordinator', '2017-09-03', NULL);
INSERT INTO dbo.Position (Title, FromDate, ToDate) VALUES ('Logistics Coordinator', '2016-04-17', NULL);
INSERT INTO dbo.Position (Title, FromDate, ToDate) VALUES ('IT Specialist', '2019-10-11', NULL);
INSERT INTO dbo.Position (Title, FromDate, ToDate) VALUES ('Legal Assistant', '2017-12-30', NULL);
INSERT INTO dbo.Position (Title, FromDate, ToDate) VALUES ('Research Scientist', '2018-08-20', NULL);
INSERT INTO dbo.Position (Title, FromDate, ToDate) VALUES ('Educational Consultant', '2016-01-25', NULL);
INSERT INTO dbo.Position (Title, FromDate, ToDate) VALUES ('Administrative Assistant', '2019-05-07', NULL);
INSERT INTO dbo.Position (Title, FromDate, ToDate) VALUES ('Production Supervisor', '2017-03-12', NULL);
INSERT INTO dbo.Position (Title, FromDate, ToDate) VALUES ('Purchasing Manager', '2018-09-08', NULL);
INSERT INTO dbo.Position (Title, FromDate, ToDate) VALUES ('Public Relations Manager', '2019-11-19', NULL);

INSERT INTO dbo.AddressType (TypeName, TypeDescription) VALUES ('Home', 'Personal residence address');
INSERT INTO dbo.AddressType (TypeName, TypeDescription) VALUES ('Work', 'Workplace address');
INSERT INTO dbo.AddressType (TypeName, TypeDescription) VALUES ('Billing', 'Billing address for invoices and payments');
INSERT INTO dbo.AddressType (TypeName, TypeDescription) VALUES ('Shipping', 'Shipping address for deliveries');
INSERT INTO dbo.AddressType (TypeName, TypeDescription) VALUES ('Mailing', 'Mailing address for correspondence');
INSERT INTO dbo.AddressType (TypeName, TypeDescription) VALUES ('Primary', 'Primary address');
INSERT INTO dbo.AddressType (TypeName, TypeDescription) VALUES ('Secondary', 'Secondary address');
INSERT INTO dbo.AddressType (TypeName, TypeDescription) VALUES ('Vacation Home', 'Address for vacation or second home');
INSERT INTO dbo.AddressType (TypeName, TypeDescription) VALUES ('Corporate', 'Corporate office address');
INSERT INTO dbo.AddressType (TypeName, TypeDescription) VALUES ('Branch', 'Branch office address');
INSERT INTO dbo.AddressType (TypeName, TypeDescription) VALUES ('Temporary', 'Temporary or interim address');

INSERT INTO dbo.AddressInfo (Street, City, Province, PostalCode, Country, AddressTypeID) 
VALUES ('123 Maple Ave', 'Toronto', 'ON', 'M1M 1M1', 'Canada', 1);

INSERT INTO dbo.AddressInfo (Street, City, Province, PostalCode, Country, AddressTypeID) 
VALUES ('456 Oak St', 'Vancouver', 'BC', 'V6B 2W6', 'Canada', 2);

INSERT INTO dbo.AddressInfo (Street, City, Province, PostalCode, Country, AddressTypeID) 
VALUES ('789 Cedar Dr', 'Montreal', 'QC', 'H2X 1X9', 'Canada', 3);

INSERT INTO dbo.AddressInfo (Street, City, Province, PostalCode, Country, AddressTypeID) 
VALUES ('321 Birch St', 'Calgary', 'AB', 'T2P 2G8', 'Canada', 4);

INSERT INTO dbo.AddressInfo (Street, City, Province, PostalCode, Country, AddressTypeID) 
VALUES ('654 Elm St', 'Edmonton', 'AB', 'T5J 2R7', 'Canada', 5);

INSERT INTO dbo.AddressInfo (Street, City, Province, PostalCode, Country, AddressTypeID) 
VALUES ('987 Pine Ave', 'Ottawa', 'ON', 'K1P 5M7', 'Canada', 6);

INSERT INTO dbo.AddressInfo (Street, City, Province, PostalCode, Country, AddressTypeID) 
VALUES ('246 Birchwood Dr', 'Quebec City', 'QC', 'G1R 4S9', 'Canada', 7);

INSERT INTO dbo.AddressInfo (Street, City, Province, PostalCode, Country, AddressTypeID) 
VALUES ('135 Maple St', 'Winnipeg', 'MB', 'R3B 0J9', 'Canada', 8);

INSERT INTO dbo.AddressInfo (Street, City, Province, PostalCode, Country, AddressTypeID) 
VALUES ('369 Spruce St', 'Saskatoon', 'SK', 'S7H 0W6', 'Canada', 9);

INSERT INTO dbo.AddressInfo (Street, City, Province, PostalCode, Country, AddressTypeID) 
VALUES ('258 Pine St', 'Halifax', 'NS', 'B3J 3J8', 'Canada', 10);

INSERT INTO dbo.AddressInfo (Street, City, Province, PostalCode, Country, AddressTypeID) 
VALUES ('147 Cedar Dr', 'Victoria', 'BC', 'V8W 1P6', 'Canada', 11);

INSERT INTO dbo.AddressInfo (Street, City, Province, PostalCode, Country, AddressTypeID) 
VALUES ('852 Elm St', 'Regina', 'SK', 'S4P 3N8', 'Canada', 2);

INSERT INTO dbo.AddressInfo (Street, City, Province, PostalCode, Country, AddressTypeID) 
VALUES ('753 Oak St', 'Hamilton', 'ON', 'L8P 4R5', 'Canada', 3);

INSERT INTO dbo.AddressInfo (Street, City, Province, PostalCode, Country, AddressTypeID) 
VALUES ('369 Birchwood Ave', 'London', 'ON', 'N6A 5B6', 'Canada', 4);

INSERT INTO dbo.AddressInfo (Street, City, Province, PostalCode, Country, AddressTypeID) 
VALUES ('456 Pine Ave', 'Halifax', 'NS', 'B3J 3J8', 'Canada', 5);

INSERT INTO dbo.AddressInfo (Street, City, Province, PostalCode, Country, AddressTypeID) 
VALUES ('987 Spruce St', 'Surrey', 'BC', 'V3W 2M6', 'Canada', 6);

INSERT INTO dbo.AddressInfo (Street, City, Province, PostalCode, Country, AddressTypeID) 
VALUES ('123 Cedar St', 'Burnaby', 'BC', 'V5C 2Y6', 'Canada', 7);

INSERT INTO dbo.AddressInfo (Street, City, Province, PostalCode, Country, AddressTypeID) 
VALUES ('456 Maple Ave', 'Mississauga', 'ON', 'L5B 1M2', 'Canada', 8);

INSERT INTO dbo.AddressInfo (Street, City, Province, PostalCode, Country, AddressTypeID) 
VALUES ('789 Oak St', 'Richmond', 'BC', 'V6Y 2C3', 'Canada', 9);

INSERT INTO dbo.AddressInfo (Street, City, Province, PostalCode, Country, AddressTypeID) 
VALUES ('321 Birchwood Ave', 'Saanich', 'BC', 'V8X 1R2', 'Canada', 10);




INSERT INTO dbo.Employee (FirstName, LastName, Gender, HireDate, ManagerEmployeeID, DepartmentID, AddressInfoID, PositionID, LastUpdated)
VALUES ('John', 'Smith', 'M', '2020-01-15', NULL, 1, 1, 1, '2023-05-20');

INSERT INTO dbo.Employee (FirstName, LastName, Gender, HireDate, ManagerEmployeeID, DepartmentID, AddressInfoID, PositionID, LastUpdated)
VALUES ('Jane', 'Doe', 'F', '2019-05-20', 1, 2, 2, 2, '2022-09-12');

INSERT INTO dbo.Employee (FirstName, LastName, Gender, HireDate, ManagerEmployeeID, DepartmentID, AddressInfoID, PositionID, LastUpdated)
VALUES ('Michael', 'Johnson', 'M', '2018-10-10', 1, 1, 3, 3, '2021-11-30');

INSERT INTO dbo.Employee (FirstName, LastName, Gender, HireDate, ManagerEmployeeID, DepartmentID, AddressInfoID, PositionID, LastUpdated)
VALUES ('Emily', 'Williams', 'F', '2017-03-25', 3, 3, 4, 4, '2020-07-03');

INSERT INTO dbo.Employee (FirstName, LastName, Gender, HireDate, ManagerEmployeeID, DepartmentID, AddressInfoID, PositionID, LastUpdated)
VALUES ('Christopher', 'Brown', 'M', '2016-09-12', 1, 2, 5, 5, '2019-04-17');

INSERT INTO dbo.Employee (FirstName, LastName, Gender, HireDate, ManagerEmployeeID, DepartmentID, AddressInfoID, PositionID, LastUpdated)
VALUES ('Amanda', 'Jones', 'F', '2015-11-30', 3, 1, 6, 6, '2023-01-08');

INSERT INTO dbo.Employee (FirstName, LastName, Gender, HireDate, ManagerEmployeeID, DepartmentID, AddressInfoID, PositionID, LastUpdated)
VALUES ('Matthew', 'Garcia', 'M', '2019-08-05', 2, 2, 7, 7, '2021-10-01');

INSERT INTO dbo.Employee (FirstName, LastName, Gender, HireDate, ManagerEmployeeID, DepartmentID, AddressInfoID, PositionID, LastUpdated)
VALUES ('Jessica', 'Martinez', 'F', '2018-04-17', 2, 3, 8, 8, '2020-08-15');

INSERT INTO dbo.Employee (FirstName, LastName, Gender, HireDate, ManagerEmployeeID, DepartmentID, AddressInfoID, PositionID, LastUpdated)
VALUES ('David', 'Robinson', 'M', '2017-01-08', 1, 1, 9, 9, '2023-03-24');

INSERT INTO dbo.Employee (FirstName, LastName, Gender, HireDate, ManagerEmployeeID, DepartmentID, AddressInfoID, PositionID, LastUpdated)

VALUES ('Sarah', 'Hernandez', 'F', '2016-06-21', 2, 2, 10, 10, '2021-05-07');

INSERT INTO dbo.EmployeeAddress (EmployeeID, AddressInfoID) VALUES (1, 2);
INSERT INTO dbo.EmployeeAddress (EmployeeID, AddressInfoID) VALUES (2, 2);
INSERT INTO dbo.EmployeeAddress (EmployeeID, AddressInfoID) VALUES (3, 3);
INSERT INTO dbo.EmployeeAddress (EmployeeID, AddressInfoID) VALUES (4, 4);
INSERT INTO dbo.EmployeeAddress (EmployeeID, AddressInfoID) VALUES (5, 5);
INSERT INTO dbo.EmployeeAddress (EmployeeID, AddressInfoID) VALUES (6, 6);
INSERT INTO dbo.EmployeeAddress (EmployeeID, AddressInfoID) VALUES (7, 7);
INSERT INTO dbo.EmployeeAddress (EmployeeID, AddressInfoID) VALUES (8, 8);
INSERT INTO dbo.EmployeeAddress (EmployeeID, AddressInfoID) VALUES (9, 9);
INSERT INTO dbo.EmployeeAddress (EmployeeID, AddressInfoID) VALUES (10, 10);



INSERT INTO dbo.PayrollMonth (PayrollMonth)
VALUES ('January 2023');

INSERT INTO dbo.PayrollMonth (PayrollMonth)
VALUES ('February 2023');

INSERT INTO dbo.PayrollMonth (PayrollMonth)
VALUES ('March 2023');

INSERT INTO dbo.PayrollMonth (PayrollMonth)
VALUES ('April 2023');

INSERT INTO dbo.PayrollMonth (PayrollMonth)
VALUES ('May 2023');

INSERT INTO dbo.PayrollMonth (PayrollMonth)
VALUES ('June 2023');

INSERT INTO dbo.PayrollMonth (PayrollMonth)
VALUES ('July 2023');

INSERT INTO dbo.PayrollMonth (PayrollMonth)
VALUES ('August 2023');

INSERT INTO dbo.PayrollMonth (PayrollMonth)
VALUES ('September 2023');

INSERT INTO dbo.PayrollMonth (PayrollMonth)
VALUES ('October 2023');

INSERT INTO dbo.PayrollMonth (PayrollMonth)
VALUES ('November 2023');

INSERT INTO dbo.PayrollMonth (PayrollMonth)
VALUES ('December 2023');


INSERT INTO dbo.Deductions (DeductionType, DeductionAmount)
VALUES ('Health Insurance', 100.00);

INSERT INTO dbo.Deductions (DeductionType, DeductionAmount)
VALUES ('401(k) Contribution', 150.00);

INSERT INTO dbo.Deductions (DeductionType, DeductionAmount)
VALUES ('Life Insurance', 50.00);

INSERT INTO dbo.Deductions (DeductionType, DeductionAmount)
VALUES ('Dental Insurance', 75.00);

INSERT INTO dbo.Deductions (DeductionType, DeductionAmount)
VALUES ('Vision Insurance', 60.00);

INSERT INTO dbo.Deductions (DeductionType, DeductionAmount)
VALUES ('Flexible Spending Account', 80.00);

INSERT INTO dbo.Deductions (DeductionType, DeductionAmount)
VALUES ('Employee Stock Purchase Plan', 200.00);

INSERT INTO dbo.Deductions (DeductionType, DeductionAmount)
VALUES ('Transportation Benefits', 70.00);

INSERT INTO dbo.Deductions (DeductionType, DeductionAmount)
VALUES ('Childcare Expenses', 120.00);

INSERT INTO dbo.Deductions (DeductionType, DeductionAmount)
VALUES ('Union Dues', 40.00);

INSERT INTO dbo.Deductions (DeductionType, DeductionAmount)
VALUES ('Garnishments', 90.00);

INSERT INTO dbo.Deductions (DeductionType, DeductionAmount)
VALUES ('Retirement Plan', 180.00);

INSERT INTO dbo.Deductions (DeductionType, DeductionAmount)
VALUES ('Disability Insurance', 80.00);


INSERT INTO dbo.HourlyEmployee (EmployeeID, PayrollMonthID, StartDate, EndDate, HourlyRate, DeductionID)
VALUES (1, 1, '2023-01-01', NULL, 20.50, 1);

INSERT INTO dbo.HourlyEmployee (EmployeeID, PayrollMonthID, StartDate, EndDate, HourlyRate, DeductionID)
VALUES (2, 1, '2023-01-01', NULL, 18.75, 2);

INSERT INTO dbo.HourlyEmployee (EmployeeID, PayrollMonthID, StartDate, EndDate, HourlyRate, DeductionID)
VALUES (3, 1, '2023-01-01', NULL, 22.00, 3);

INSERT INTO dbo.HourlyEmployee (EmployeeID, PayrollMonthID, StartDate, EndDate, HourlyRate, DeductionID)
VALUES (4, 1, '2023-01-01', NULL, 19.25, 4);

INSERT INTO dbo.HourlyEmployee (EmployeeID, PayrollMonthID, StartDate, EndDate, HourlyRate, DeductionID)
VALUES (5, 1, '2023-01-01', NULL, 21.50, 5);

INSERT INTO dbo.HourlyEmployee (EmployeeID, PayrollMonthID, StartDate, EndDate, HourlyRate, DeductionID)
VALUES (6, 1, '2023-01-01', NULL, 20.00, 6);

INSERT INTO dbo.HourlyEmployee (EmployeeID, PayrollMonthID, StartDate, EndDate, HourlyRate, DeductionID)
VALUES (7, 1, '2023-01-01', NULL, 23.75, 7);

INSERT INTO dbo.HourlyEmployee (EmployeeID, PayrollMonthID, StartDate, EndDate, HourlyRate, DeductionID)
VALUES (8, 1, '2023-01-01', NULL, 17.50, 8);

INSERT INTO dbo.HourlyEmployee (EmployeeID, PayrollMonthID, StartDate, EndDate, HourlyRate, DeductionID)
VALUES (9, 1, '2023-01-01', NULL, 24.00, 9);

INSERT INTO dbo.HourlyEmployee (EmployeeID, PayrollMonthID, StartDate, EndDate, HourlyRate, DeductionID)
VALUES (1, 1, '2023-01-01', NULL, 18.25, 10);



INSERT INTO dbo.SalariedEmployee (EmployeeID, StartDate, EndDate, SalaryAmount, BonusAmount, DeductionID)
VALUES (1, '2024-06-13', NULL, 50000.00, NULL, 1);

INSERT INTO dbo.SalariedEmployee (EmployeeID, StartDate, EndDate, SalaryAmount, BonusAmount, DeductionID)
VALUES (2, '2024-06-10', NULL, 60000.00, 5000.00, 2);

INSERT INTO dbo.SalariedEmployee (EmployeeID, StartDate, EndDate, SalaryAmount, BonusAmount, DeductionID)
VALUES (3, '2024-05-20', '2024-12-31', 55000.00, NULL, 3);

INSERT INTO dbo.SalariedEmployee (EmployeeID, StartDate, EndDate, SalaryAmount, BonusAmount, DeductionID)
VALUES (4, '2024-04-15', NULL, 48000.00, 2000.00, 4);

INSERT INTO dbo.SalariedEmployee (EmployeeID, StartDate, EndDate, SalaryAmount, BonusAmount, DeductionID)
VALUES (5, '2024-03-01', NULL, 52000.00, 3000.00, 5);

INSERT INTO dbo.SalariedEmployee (EmployeeID, StartDate, EndDate, SalaryAmount, BonusAmount, DeductionID)
VALUES (6, '2024-02-10', NULL, 47000.00, NULL, 6);

INSERT INTO dbo.SalariedEmployee (EmployeeID, StartDate, EndDate, SalaryAmount, BonusAmount, DeductionID)
VALUES (7, '2024-01-15', '2024-07-31', 58000.00, 4000.00, 7);

INSERT INTO dbo.SalariedEmployee (EmployeeID, StartDate, EndDate, SalaryAmount, BonusAmount, DeductionID)
VALUES (8, '2023-12-20', NULL, 49000.00, 1500.00, 8);

INSERT INTO dbo.SalariedEmployee (EmployeeID, StartDate, EndDate, SalaryAmount, BonusAmount, DeductionID)
VALUES (9, '2023-11-05', NULL, 54000.00, NULL, 9);

INSERT INTO dbo.SalariedEmployee (EmployeeID, StartDate, EndDate, SalaryAmount, BonusAmount, DeductionID)
VALUES (10, '2023-10-10', '2024-06-30', 56000.00, 2000.00, 10);



INSERT INTO dbo.Benefits (EmployeeID, BenefitPlan)
VALUES (1, 'Health Insurance');

INSERT INTO dbo.Benefits (EmployeeID, BenefitPlan)
VALUES (2, 'Dental Insurance');

INSERT INTO dbo.Benefits (EmployeeID, BenefitPlan)
VALUES (3, 'Vision Insurance');

INSERT INTO dbo.Benefits (EmployeeID, BenefitPlan)
VALUES (4, 'Health Insurance');

INSERT INTO dbo.Benefits (EmployeeID, BenefitPlan)
VALUES (5, 'Dental Insurance');

INSERT INTO dbo.Benefits (EmployeeID, BenefitPlan)
VALUES (6, 'Vision Insurance');

INSERT INTO dbo.Benefits (EmployeeID, BenefitPlan)
VALUES (7, 'Health Insurance');

INSERT INTO dbo.Benefits (EmployeeID, BenefitPlan)
VALUES (8, 'Dental Insurance');

INSERT INTO dbo.Benefits (EmployeeID, BenefitPlan)
VALUES (9, 'Vision Insurance');

INSERT INTO dbo.Benefits (EmployeeID, BenefitPlan)
VALUES (10, 'Health Insurance');

INSERT INTO dbo.TimeSheet (EmployeeID, ClockIn, ClockOut)
VALUES (1, '08:00:00', '17:00:00');

INSERT INTO dbo.TimeSheet (EmployeeID, ClockIn, ClockOut)
VALUES (2, '09:00:00', '18:00:00');

INSERT INTO dbo.TimeSheet (EmployeeID, ClockIn, ClockOut)
VALUES (3, '07:30:00', '16:30:00');

INSERT INTO dbo.TimeSheet (EmployeeID, ClockIn, ClockOut)
VALUES (4, '08:30:00', '17:30:00');

INSERT INTO dbo.TimeSheet (EmployeeID, ClockIn, ClockOut)
VALUES (5, '08:00:00', '17:00:00');

INSERT INTO dbo.TimeSheet (EmployeeID, ClockIn, ClockOut)
VALUES (6, '09:00:00', '18:00:00');

INSERT INTO dbo.TimeSheet (EmployeeID, ClockIn, ClockOut)
VALUES (7, '07:30:00', '16:30:00');

INSERT INTO dbo.TimeSheet (EmployeeID, ClockIn, ClockOut)
VALUES (8, '08:30:00', '17:30:00');

INSERT INTO dbo.TimeSheet (EmployeeID, ClockIn, ClockOut)
VALUES (9, '08:00:00', '17:00:00');

INSERT INTO dbo.TimeSheet (EmployeeID, ClockIn, ClockOut)
VALUES (10, '09:00:00', '18:00:00');


INSERT INTO dbo.PersonalDays (EmployeeID, PDType, Paid, DaysOff)
VALUES (1, 'Vacation', 1, 5);

INSERT INTO dbo.PersonalDays (EmployeeID, PDType, Paid, DaysOff)
VALUES (2, 'Sick Leave', 1, 3);

INSERT INTO dbo.PersonalDays (EmployeeID, PDType, Paid, DaysOff)
VALUES (3, 'Family Leave', 1, 2);

INSERT INTO dbo.PersonalDays (EmployeeID, PDType, Paid, DaysOff)
VALUES (4, 'Vacation', 1, 7);

INSERT INTO dbo.PersonalDays (EmployeeID, PDType, Paid, DaysOff)
VALUES (5, 'Sick Leave', 1, 2);

INSERT INTO dbo.PersonalDays (EmployeeID, PDType, Paid, DaysOff)
VALUES (6, 'Vacation', 1, 4);

INSERT INTO dbo.PersonalDays (EmployeeID, PDType, Paid, DaysOff)
VALUES (7, 'Family Leave', 1, 3);

INSERT INTO dbo.PersonalDays (EmployeeID, PDType, Paid, DaysOff)
VALUES (8, 'Vacation', 1, 6);

INSERT INTO dbo.PersonalDays (EmployeeID, PDType, Paid, DaysOff)
VALUES (9, 'Sick Leave', 0, 1);

INSERT INTO dbo.PersonalDays (EmployeeID, PDType, Paid, DaysOff)
VALUES (10, 'Vacation', 1, 5);


INSERT INTO dbo.BankInformation (EmployeeID, BankInstitution, InstitutionNumber, AccountNumber, TransitNumber)
VALUES (1, 'Royal Bank of Canada', '003', '1234567', '98765');

INSERT INTO dbo.BankInformation (EmployeeID, BankInstitution, InstitutionNumber, AccountNumber, TransitNumber)
VALUES (2, 'Toronto-Dominion Bank', '004', '2345678', '87654');

INSERT INTO dbo.BankInformation (EmployeeID, BankInstitution, InstitutionNumber, AccountNumber, TransitNumber)
VALUES (3, 'Scotiabank', '002', '3456789', '76543');

INSERT INTO dbo.BankInformation (EmployeeID, BankInstitution, InstitutionNumber, AccountNumber, TransitNumber)
VALUES (4, 'Bank of Montreal', '001', '4567890', '65432');

INSERT INTO dbo.BankInformation (EmployeeID, BankInstitution, InstitutionNumber, AccountNumber, TransitNumber)
VALUES (5, 'Royal Bank of Canada', '003', '5678901', '54321');

INSERT INTO dbo.BankInformation (EmployeeID, BankInstitution, InstitutionNumber, AccountNumber, TransitNumber)
VALUES (6, 'Toronto-Dominion Bank', '004', '6789012', '43210');

INSERT INTO dbo.BankInformation (EmployeeID, BankInstitution, InstitutionNumber, AccountNumber, TransitNumber)
VALUES (7, 'Scotiabank', '002', '7890123', '32109');

INSERT INTO dbo.BankInformation (EmployeeID, BankInstitution, InstitutionNumber, AccountNumber, TransitNumber)
VALUES (8, 'Bank of Montreal', '001', '8901234', '21098');

INSERT INTO dbo.BankInformation (EmployeeID, BankInstitution, InstitutionNumber, AccountNumber, TransitNumber)
VALUES (9, 'Royal Bank of Canada', '003', '9012345', '10987');

INSERT INTO dbo.BankInformation (EmployeeID, BankInstitution, InstitutionNumber, AccountNumber, TransitNumber)
VALUES (10, 'Toronto-Dominion Bank', '004', '0123456', '09876');

INSERT INTO dbo.HoursWorked (PayrollMonthID, DaysWorked, HoursWorked, OvertimeHours)
VALUES (1, 22, 176, 6);

INSERT INTO dbo.HoursWorked (PayrollMonthID, DaysWorked, HoursWorked, OvertimeHours)
VALUES (2, 21, 168, 8);

INSERT INTO dbo.HoursWorked (PayrollMonthID, DaysWorked, HoursWorked, OvertimeHours)
VALUES (3, 22, 176, 4);

INSERT INTO dbo.HoursWorked (PayrollMonthID, DaysWorked, HoursWorked, OvertimeHours)
VALUES (4, 20, 160, 10);

INSERT INTO dbo.HoursWorked (PayrollMonthID, DaysWorked, HoursWorked, OvertimeHours)
VALUES (5, 22, 176, 6);

INSERT INTO dbo.HoursWorked (PayrollMonthID, DaysWorked, HoursWorked, OvertimeHours)
VALUES (6, 21, 168, 8);

INSERT INTO dbo.HoursWorked (PayrollMonthID, DaysWorked, HoursWorked, OvertimeHours)
VALUES (7, 22, 176, 4);

INSERT INTO dbo.HoursWorked (PayrollMonthID, DaysWorked, HoursWorked, OvertimeHours)
VALUES (8, 20, 160, 10);

INSERT INTO dbo.HoursWorked (PayrollMonthID, DaysWorked, HoursWorked, OvertimeHours)
VALUES (9, 22, 176, 6);

INSERT INTO dbo.HoursWorked (PayrollMonthID, DaysWorked, HoursWorked, OvertimeHours)
VALUES (10, 21, 168, 8);



INSERT INTO dbo.Payments (EmployeeID, PayrollMonthID, OvertimePay, DeductionsID, HourlyEmployeeID, SalariedEmployeeID)
VALUES (1, 1, 100.00, 1, 1, NULL);

INSERT INTO dbo.Payments (EmployeeID, PayrollMonthID, OvertimePay, DeductionsID, HourlyEmployeeID, SalariedEmployeeID)
VALUES (2, 1, 150.00, 2, 2, NULL);

INSERT INTO dbo.Payments (EmployeeID, PayrollMonthID, OvertimePay, DeductionsID, HourlyEmployeeID, SalariedEmployeeID)
VALUES (3, 1, NULL, 3, 3, NULL);

INSERT INTO dbo.Payments (EmployeeID, PayrollMonthID, OvertimePay, DeductionsID, HourlyEmployeeID, SalariedEmployeeID)
VALUES (4, 1, 200.00, 4, 4, NULL);

INSERT INTO dbo.Payments (EmployeeID, PayrollMonthID, OvertimePay, DeductionsID, HourlyEmployeeID, SalariedEmployeeID)
VALUES (5, 1, NULL, 5, 5, NULL);

INSERT INTO dbo.Payments (EmployeeID, PayrollMonthID, OvertimePay, DeductionsID, HourlyEmployeeID, SalariedEmployeeID)
VALUES (6, 1, NULL, 6, NULL, 1);

INSERT INTO dbo.Payments (EmployeeID, PayrollMonthID, OvertimePay, DeductionsID, HourlyEmployeeID, SalariedEmployeeID)
VALUES (7, 1, NULL, 7, NULL, 2);

INSERT INTO dbo.Payments (EmployeeID, PayrollMonthID, OvertimePay, DeductionsID, HourlyEmployeeID, SalariedEmployeeID)
VALUES (8, 1, NULL, 8, NULL, 3);


