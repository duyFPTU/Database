INSERT INTO TaskStatus (StatusName, Description) VALUES
('ToDo', 'Task not started'),
('InProgress', 'Task is in progress'),
('Done', 'Task completed'),
('Blocked', 'Task blocked'),
('Review', 'Task under review'),
('Testing', 'Task in testing phase'),
('OnHold', 'Task on hold'),
('Cancelled', 'Task cancelled'),
('Reopened', 'Task reopened'),
('Approved', 'Task approved');

INSERT INTO Projects (ProjectName, Description, StartDate, EndDate, Budget, Status)
VALUES
('Website Redesign', 'Redesign company website', '2024-01-01', '2024-03-31', 50000, 'InProgress'),
('Mobile App', 'Develop mobile application', '2024-02-01', '2024-06-30', 120000, 'InProgress'),
('ERP System', 'Internal ERP system', '2024-01-15', '2024-12-31', 300000, 'Planning'),
('CRM Upgrade', 'Upgrade CRM features', '2024-03-01', '2024-07-31', 80000, 'Planning'),
('HR System', 'HR management system', '2024-02-10', '2024-05-31', 60000, 'Completed'),
('Data Migration', 'Migrate legacy data', '2024-01-20', '2024-04-30', 40000, 'Completed'),
('AI Chatbot', 'Customer support chatbot', '2024-03-05', '2024-08-31', 90000, 'InProgress'),
('Cloud Setup', 'Cloud infrastructure setup', '2024-01-10', '2024-02-28', 30000, 'Completed'),
('E-commerce Platform', 'Online sales platform', '2024-04-01', '2024-10-31', 150000, 'Planning'),
('Security Audit', 'System security audit', '2024-02-15', '2024-03-31', 25000, 'Completed');

INSERT INTO Employees (FullName, Email, Phone, Position, Department, HireDate)
VALUES
('John Smith', 'john.smith@email.com', '0900000001', 'Developer', 'IT', '2022-01-10'),
('Alice Brown', 'alice.brown@email.com', '0900000002', 'Tester', 'QA', '2021-03-15'),
('David Lee', 'david.lee@email.com', '0900000003', 'Project Manager', 'PM', '2020-06-01'),
('Emma Wilson', 'emma.wilson@email.com', '0900000004', 'Developer', 'IT', '2022-09-20'),
('Michael Tran', 'michael.tran@email.com', '0900000005', 'DevOps', 'IT', '2021-11-11'),
('Sophia Nguyen', 'sophia.nguyen@email.com', '0900000006', 'Business Analyst', 'BA', '2023-01-05'),
('Daniel Kim', 'daniel.kim@email.com', '0900000007', 'Tester', 'QA', '2022-04-18'),
('Linda Pham', 'linda.pham@email.com', '0900000008', 'HR', 'HR', '2019-08-12'),
('Robert Vo', 'robert.vo@email.com', '0900000009', 'Security', 'IT', '2020-12-01'),
('Nancy Hoang', 'nancy.hoang@email.com', '0900000010', 'Designer', 'UI/UX', '2023-02-10');


INSERT INTO Tasks (ProjectID, TaskName, StartDate, EndDate, Priority, StatusID)
VALUES
(1, 'UI Design', '2024-01-05', '2024-01-20', 'High', 2),
(1, 'Frontend Coding', '2024-01-21', '2024-02-20', 'High', 2),
(1, 'Backend API', '2024-01-15', '2024-02-28', 'Medium', 2),
(2, 'Mobile UI', '2024-02-05', '2024-03-01', 'High', 2),
(2, 'API Integration', '2024-03-01', '2024-04-15', 'High', 1),
(3, 'Requirement Analysis', '2024-01-20', '2024-02-15', 'High', 3),
(3, 'Database Design', '2024-02-16', '2024-03-10', 'Medium', 3),
(4, 'CRM UI Update', '2024-03-05', '2024-04-10', 'Medium', 1),
(5, 'HR Workflow', '2024-02-15', '2024-03-15', 'High', 3),
(6, 'Data Cleanup', '2024-01-25', '2024-02-20', 'Low', 3),
(7, 'Chatbot Training', '2024-03-10', '2024-04-30', 'High', 2),
(7, 'NLP Model', '2024-03-20', '2024-05-20', 'High', 2),
(8, 'Cloud Setup', '2024-01-12', '2024-02-10', 'Medium', 3),
(9, 'Product Listing', '2024-04-10', '2024-05-10', 'Medium', 1),
(10, 'Security Testing', '2024-02-20', '2024-03-15', 'High', 3);


INSERT INTO TaskAssignments (TaskID, EmployeeID, Role)
VALUES
(1,1,'Developer'), (1,10,'Designer'),
(2,1,'Developer'), (2,4,'Developer'),
(3,4,'Backend Dev'),
(4,10,'Designer'),
(5,1,'Developer'),
(6,6,'Analyst'),
(7,3,'Architect'),
(8,10,'Designer'),
(9,8,'HR'),
(10,6,'Analyst'),
(11,1,'Developer'),
(11,5,'DevOps'),
(12,1,'Developer'),
(12,5,'DevOps'),
(13,5,'DevOps'),
(14,6,'BA'),
(15,9,'Security');


INSERT INTO WorkLogs (TaskID, EmployeeID, WorkDate, HoursWorked)
VALUES
(1,1,'2024-01-06',8),
(1,10,'2024-01-06',6),
(2,1,'2024-01-22',7),
(2,4,'2024-01-22',8),
(3,4,'2024-01-18',6),
(4,10,'2024-02-06',7),
(5,1,'2024-03-02',8),
(6,6,'2024-01-22',5),
(7,3,'2024-02-18',6),
(8,10,'2024-03-08',7),
(9,8,'2024-02-20',5),
(10,6,'2024-01-28',6),
(11,1,'2024-03-15',8),
(11,5,'2024-03-15',7),
(12,1,'2024-03-25',8),
(12,5,'2024-03-25',7),
(13,5,'2024-01-15',6),
(14,6,'2024-04-12',7),
(15,9,'2024-02-25',6);


INSERT INTO ProgressReports (TaskID, EmployeeID, ProgressPercent, Comment)
VALUES
(1,1,50,'UI half completed'),
(2,1,40,'Frontend ongoing'),
(3,4,60,'API implemented'),
(4,10,70,'UI nearly done'),
(5,1,20,'Waiting for backend'),
(6,6,100,'Analysis completed'),
(7,3,100,'DB design done'),
(8,10,30,'Initial UI draft'),
(9,8,100,'HR workflow completed'),
(10,6,100,'Data cleaned'),
(11,1,45,'Training in progress'),
(12,5,50,'Model training ongoing'),
(13,5,100,'Cloud ready'),
(14,6,25,'Products setup'),
(15,9,100,'Security passed');


INSERT INTO ProjectDocuments (ProjectID, DocumentName, FilePath, UploadedBy)
VALUES
(1,'UI Mockup','/docs/ui.pdf',10),
(2,'API Spec','/docs/api.pdf',1),
(3,'Requirement Doc','/docs/req.pdf',6),
(4,'CRM Design','/docs/crm.pdf',10),
(5,'HR Manual','/docs/hr.pdf',8),
(6,'Migration Plan','/docs/migrate.pdf',6),
(7,'Chatbot Guide','/docs/chatbot.pdf',1),
(8,'Cloud Diagram','/docs/cloud.pdf',5),
(9,'Product List','/docs/products.pdf',6),
(10,'Security Report','/docs/security.pdf',9);


INSERT INTO ProjectCosts (ProjectID, CostType, Amount, CostDate)
VALUES
(1,'Design',12000,'2024-01-10'),
(1,'Development',20000,'2024-02-15'),
(2,'Development',35000,'2024-03-10'),
(3,'Consulting',15000,'2024-02-05'),
(4,'UI Design',8000,'2024-03-12'),
(5,'HR Software',10000,'2024-02-18'),
(6,'Migration Tools',7000,'2024-02-01'),
(7,'AI Training',20000,'2024-04-01'),
(8,'Cloud Services',9000,'2024-01-20'),
(9,'Platform Setup',18000,'2024-04-15'),
(9,'Marketing',12000,'2024-05-01'),
(10,'Security Tools',6000,'2024-02-22');


INSERT INTO PerformanceReviews (EmployeeID, ProjectID, Score, Comment)
VALUES
(1,1,9,'Excellent performance'),
(4,1,8,'Good contribution'),
(10,1,9,'Creative design'),
(1,2,8,'Solid development'),
(6,3,9,'Strong analysis'),
(8,5,8,'Good HR management'),
(5,7,9,'Effective DevOps'),
(6,9,8,'Good planning'),
(9,10,9,'Strong security skills'),
(3,3,10,'Outstanding leadership');
