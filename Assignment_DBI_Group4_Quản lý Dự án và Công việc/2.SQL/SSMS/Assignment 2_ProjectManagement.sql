/* ================================
   CREATE DATABASE
================================ */
CREATE DATABASE ProjectManagementDB;
GO

USE ProjectManagementDB;
GO

/* ================================
   TABLE: Projects
================================ */
CREATE TABLE Projects (
    ProjectID INT IDENTITY(1,1) PRIMARY KEY,
    ProjectName NVARCHAR(200) NOT NULL,
    Description NVARCHAR(MAX),
    StartDate DATE NOT NULL,
    EndDate DATE,
    Budget DECIMAL(18,2) CHECK (Budget >= 0),
    Status NVARCHAR(50) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO

/* ================================
   TABLE: Employees
================================ */
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(150) NOT NULL,
    Email NVARCHAR(150) NOT NULL UNIQUE,
    Phone NVARCHAR(20),
    Position NVARCHAR(100),
    Department NVARCHAR(100),
    HireDate DATE,
    IsActive BIT DEFAULT 1
);
GO

/* ================================
   TABLE: TaskStatus
================================ */
CREATE TABLE TaskStatus (
    StatusID INT IDENTITY(1,1) PRIMARY KEY,
    StatusName NVARCHAR(50) NOT NULL,
    Description NVARCHAR(255)
);
GO

/* ================================
   TABLE: Tasks
================================ */
CREATE TABLE Tasks (
    TaskID INT IDENTITY(1,1) PRIMARY KEY,
    ProjectID INT NOT NULL,
    TaskName NVARCHAR(200) NOT NULL,
    Description NVARCHAR(MAX),
    StartDate DATE,
    EndDate DATE,
    Priority NVARCHAR(50),
    StatusID INT NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_Tasks_Projects
        FOREIGN KEY (ProjectID)
        REFERENCES Projects(ProjectID),

    CONSTRAINT FK_Tasks_TaskStatus
        FOREIGN KEY (StatusID)
        REFERENCES TaskStatus(StatusID),

    CONSTRAINT CK_Tasks_Date
        CHECK (EndDate IS NULL OR StartDate <= EndDate)
);
GO

/* ================================
   TABLE: TaskAssignments
================================ */
CREATE TABLE TaskAssignments (
    AssignmentID INT IDENTITY(1,1) PRIMARY KEY,
    TaskID INT NOT NULL,
    EmployeeID INT NOT NULL,
    AssignedDate DATE DEFAULT GETDATE(),
    Role NVARCHAR(100),

    CONSTRAINT FK_TaskAssignments_Tasks
        FOREIGN KEY (TaskID)
        REFERENCES Tasks(TaskID),

    CONSTRAINT FK_TaskAssignments_Employees
        FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID)
);
GO

/* ================================
   TABLE: WorkLogs
================================ */
CREATE TABLE WorkLogs (
    WorkLogID INT IDENTITY(1,1) PRIMARY KEY,
    TaskID INT NOT NULL,
    EmployeeID INT NOT NULL,
    WorkDate DATE NOT NULL,
    HoursWorked DECIMAL(5,2) NOT NULL CHECK (HoursWorked > 0),
    Note NVARCHAR(255),

    CONSTRAINT FK_WorkLogs_Tasks
        FOREIGN KEY (TaskID)
        REFERENCES Tasks(TaskID),

    CONSTRAINT FK_WorkLogs_Employees
        FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID)
);
GO

/* ================================
   TABLE: ProjectDocuments
================================ */
CREATE TABLE ProjectDocuments (
    DocumentID INT IDENTITY(1,1) PRIMARY KEY,
    ProjectID INT NOT NULL,
    DocumentName NVARCHAR(200),
    FilePath NVARCHAR(500),
    UploadedBy INT NOT NULL,
    UploadedAt DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_ProjectDocuments_Projects
        FOREIGN KEY (ProjectID)
        REFERENCES Projects(ProjectID),

    CONSTRAINT FK_ProjectDocuments_Employees
        FOREIGN KEY (UploadedBy)
        REFERENCES Employees(EmployeeID)
);
GO

/* ================================
   TABLE: ProgressReports
================================ */
CREATE TABLE ProgressReports (
    ReportID INT IDENTITY(1,1) PRIMARY KEY,
    TaskID INT NOT NULL,
    EmployeeID INT NOT NULL,
    ReportDate DATE DEFAULT GETDATE(),
    ProgressPercent INT CHECK (ProgressPercent BETWEEN 0 AND 100),
    Comment NVARCHAR(MAX),

    CONSTRAINT FK_ProgressReports_Tasks
        FOREIGN KEY (TaskID)
        REFERENCES Tasks(TaskID),

    CONSTRAINT FK_ProgressReports_Employees
        FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID)
);
GO

/* ================================
   TABLE: ProjectCosts
================================ */
CREATE TABLE ProjectCosts (
    CostID INT IDENTITY(1,1) PRIMARY KEY,
    ProjectID INT NOT NULL,
    CostType NVARCHAR(100),
    Amount DECIMAL(18,2) NOT NULL CHECK (Amount > 0),
    CostDate DATE,
    Description NVARCHAR(255),

    CONSTRAINT FK_ProjectCosts_Projects
        FOREIGN KEY (ProjectID)
        REFERENCES Projects(ProjectID)
);
GO

/* ================================
   TABLE: PerformanceReviews
================================ */
CREATE TABLE PerformanceReviews (
    ReviewID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT NOT NULL,
    ProjectID INT NOT NULL,
    ReviewDate DATE DEFAULT GETDATE(),
    Score INT CHECK (Score BETWEEN 1 AND 10),
    Comment NVARCHAR(255),

    CONSTRAINT FK_PerformanceReviews_Employees
        FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID),

    CONSTRAINT FK_PerformanceReviews_Projects
        FOREIGN KEY (ProjectID)
        REFERENCES Projects(ProjectID)
);
GO
