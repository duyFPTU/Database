--Query using order by
SELECT  ProjectName,
        StartDate,
        EndDate,
        Budget,
        Status
FROM    Projects
ORDER BY Budget DESC;
--Query using inner join
SELECT  t.TaskID,
        t.TaskName,
        p.ProjectName,
        ts.StatusName
FROM    Tasks t
INNER JOIN Projects p
        ON p.ProjectID = t.ProjectID
INNER JOIN TaskStatus ts
        ON ts.StatusID = t.StatusID
WHERE   ts.StatusName = N'InProgress';
--Query using aggregate function (COUNT)
SELECT  COUNT(*) AS TotalCompletedTasks
FROM    Tasks t
JOIN    TaskStatus ts ON ts.StatusID = t.StatusID
WHERE   ts.StatusName = N'Done';
--Query using aggregate functions with GROUP BY and ORDER BY
SELECT  p.ProjectName,
        SUM(pc.Amount) AS TotalCost
FROM    ProjectCosts pc
JOIN    Projects p ON p.ProjectID = pc.ProjectID
GROUP BY p.ProjectName
ORDER BY TotalCost DESC
--Query using GROUP BY and HAVING
SELECT  e.FullName,
        COUNT(ta.TaskID) AS TotalTasks
FROM    Employees e
JOIN    TaskAssignments ta ON ta.EmployeeID = e.EmployeeID
GROUP BY e.FullName
HAVING  COUNT(ta.TaskID) >= 2
ORDER BY TotalTasks DESC;
--Query using a subquery
SELECT  e.*
FROM    Employees e
WHERE   e.EmployeeID NOT IN (
        SELECT DISTINCT ta.EmployeeID
        FROM   TaskAssignments ta
);
--Query using partial matching (LIKE)
SELECT  *
FROM    Projects
WHERE   ProjectName LIKE N'%System%'
ORDER BY StartDate
--Query reporting total working hours per employee
SELECT  e.FullName,
        SUM(w.HoursWorked) AS TotalHours
FROM    WorkLogs w
JOIN    Employees e ON e.EmployeeID = w.EmployeeID
GROUP BY e.FullName
ORDER BY TotalHours DESC;
--View – Project_Cost_Summary
CREATE OR ALTER VIEW dbo.Project_Cost_Summary
AS
SELECT  p.ProjectID,
        p.ProjectName,
        p.Budget,
        SUM(pc.Amount)        AS TotalCost,
        (p.Budget - SUM(pc.Amount)) AS RemainingBudget
FROM    Projects p
LEFT JOIN ProjectCosts pc ON pc.ProjectID = p.ProjectID
GROUP BY p.ProjectID, p.ProjectName, p.Budget;
GO

-- Example call:
SELECT * FROM Project_Cost_Summary
--View – Employee_Workload
CREATE OR ALTER VIEW dbo.Employee_Workload
AS
SELECT  e.EmployeeID,
        e.FullName,
        COUNT(DISTINCT ta.TaskID) AS TotalTasks,
        SUM(w.HoursWorked)        AS TotalHoursWorked
FROM    Employees e
LEFT JOIN TaskAssignments ta ON ta.EmployeeID = e.EmployeeID
LEFT JOIN WorkLogs w         ON w.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID, e.FullName;
GO

-- Example call:
SELECT * FROM Employee_Workload
--View – Project_Task_Status
CREATE OR ALTER VIEW dbo.Project_Task_Status
AS
SELECT  p.ProjectName,
        ts.StatusName,
        COUNT(t.TaskID) AS TotalTasks
FROM    Projects p
JOIN    Tasks t       ON t.ProjectID = p.ProjectID
JOIN    TaskStatus ts ON ts.StatusID = t.StatusID
GROUP BY p.ProjectName, ts.StatusName;
GO


-- Example call:
SELECT * FROM Project_Task_Status
--Stored Procedure – Project_Information
CREATE OR ALTER PROC dbo.Project_Information
    @ProjectID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT  p.ProjectID,
            p.ProjectName,
            p.StartDate,
            p.EndDate,
            p.Status,
            COUNT(t.TaskID)            AS TotalTasks,
            AVG(pr.ProgressPercent)    AS AverageProgress
    FROM    Projects p
    LEFT JOIN Tasks t           ON t.ProjectID = p.ProjectID
    LEFT JOIN ProgressReports pr ON pr.TaskID = t.TaskID
    WHERE   p.ProjectID = @ProjectID
    GROUP BY p.ProjectID, p.ProjectName, p.StartDate, p.EndDate, p.Status;
END
GO



-- Example call:
EXEC dbo.Project_Information @ProjectID = 1;
--Stored Procedure – Employee_Performance_Report
CREATE OR ALTER PROC dbo.Employee_Performance_Report
    @EmployeeID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT  e.EmployeeID,
            e.FullName,
            COUNT(DISTINCT pr.ProjectID) AS TotalProjects,
            AVG(pr.Score)                AS AverageScore
    FROM    Employees e
    LEFT JOIN PerformanceReviews pr ON pr.EmployeeID = e.EmployeeID
    WHERE   e.EmployeeID = @EmployeeID
    GROUP BY e.EmployeeID, e.FullName;
END
GO

-- Example call:
EXEC dbo.Employee_Performance_Report @EmployeeID = 1;
--Stored Procedure – Task_Assignment_Details
CREATE OR ALTER PROC dbo.Task_Assignment_Details
    @TaskID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT  t.TaskID,
            t.TaskName,
            p.ProjectName,
            e.FullName,
            ta.Role,
            SUM(w.HoursWorked) AS TotalHoursWorked
    FROM    Tasks t
    JOIN    Projects p        ON p.ProjectID = t.ProjectID
    JOIN    TaskAssignments ta ON ta.TaskID = t.TaskID
    JOIN    Employees e       ON e.EmployeeID = ta.EmployeeID
    LEFT JOIN WorkLogs w      ON w.TaskID = t.TaskID
                              AND w.EmployeeID = e.EmployeeID
    WHERE   t.TaskID = @TaskID
    GROUP BY t.TaskID, t.TaskName, p.ProjectName, e.FullName, ta.Role;
END
GO

-- Example call:
EXEC dbo.Task_Assignment_Details @TaskID = 1;
--Trigger – Prevent Task End Date Before Start Date
CREATE OR ALTER TRIGGER dbo.TRG_Prevent_Invalid_Task_Dates
ON dbo.Tasks
INSTEAD OF INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE EndDate IS NOT NULL
          AND StartDate IS NOT NULL
          AND EndDate < StartDate
    )
    BEGIN
        PRINT N'EndDate cannot be earlier than StartDate.';
    END
    ELSE
    BEGIN
        INSERT INTO Tasks (ProjectID, TaskName, Description, StartDate, EndDate, Priority, StatusID)
        SELECT ProjectID, TaskName, Description, StartDate, EndDate, Priority, StatusID
        FROM inserted;
        PRINT N'Task inserted/updated successfully.';
    END
END
GO

-- Test query:
INSERT INTO Tasks (ProjectID, TaskName, StartDate, EndDate, Priority, StatusID)
VALUES (1, 'Invalid Date Task', '2024-03-10', '2024-03-01', 'High', 1);
--Trigger – Prevent Duplicate Task Assignment to Same Employee
CREATE OR ALTER TRIGGER dbo.TRG_Prevent_Duplicate_Task_Assignment
ON dbo.TaskAssignments
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN TaskAssignments ta
          ON ta.TaskID = i.TaskID
         AND ta.EmployeeID = i.EmployeeID
    )
    BEGIN
        PRINT N'Employee is already assigned to this task.';
    END
    ELSE
    BEGIN
        INSERT INTO TaskAssignments (TaskID, EmployeeID, AssignedDate, Role)
        SELECT TaskID, EmployeeID, AssignedDate, Role FROM inserted;
        PRINT N'Task assignment added successfully.';
    END
END
GO

-- Test query:
INSERT INTO TaskAssignments (TaskID, EmployeeID, Role)
VALUES (1, 1, 'Developer');
--Trigger – Automatically Mark Task as Done When Progress = 100%
CREATE OR ALTER TRIGGER dbo.TRG_Auto_Complete_Task
ON dbo.ProgressReports
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE t
    SET    StatusID = ts.StatusID
    FROM   Tasks t
    JOIN   inserted i ON i.TaskID = t.TaskID
    JOIN   TaskStatus ts ON ts.StatusName = N'Done'
    WHERE  i.ProgressPercent = 100;
END
GO
-- Test query:
INSERT INTO ProgressReports (TaskID, EmployeeID, ProgressPercent, Comment)
VALUES (2, 1, 100, 'Task completed');
--Trigger – Prevent Negative or Excessive Work Hours
CREATE OR ALTER TRIGGER dbo.TRG_Validate_Work_Hours
ON dbo.WorkLogs
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE HoursWorked <= 0 OR HoursWorked > 24
    )
    BEGIN
        PRINT N'Invalid working hours. Must be between 1 and 24.';
    END
    ELSE
    BEGIN
        INSERT INTO WorkLogs (TaskID, EmployeeID, WorkDate, HoursWorked, Note)
        SELECT TaskID, EmployeeID, WorkDate, HoursWorked, Note
        FROM inserted;
        PRINT N'Work log added successfully.';
    END
END
GO

-- Test query:
INSERT INTO WorkLogs (TaskID, EmployeeID, WorkDate, HoursWorked)
VALUES (1, 1, '2024-03-10', 30);
