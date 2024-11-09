REM   Script: Joins
REM   Joining various tables from different joins

CREATE TABLE Status ( 
    Status_code VARCHAR2(6) PRIMARY KEY, 
    Name CHAR(20) 
);

desc status


CREATE TABLE Ready_Reason ( 
    Reason_code VARCHAR2(15) PRIMARY KEY, 
    Name CHAR(20) 
);

desc READY_REASON


CREATE TABLE Delay_Reason ( 
    Reason_code VARCHAR2(15) PRIMARY KEY, 
    Name CHAR(20) 
);

desc Delay_Reason


CREATE TABLE Event ( 
    Event_id VARCHAR2(6) PRIMARY KEY, 
    Duration NUMBER(20), 
    Status_code VARCHAR2(6), 
    Reason_code VARCHAR2(15), 
    FOREIGN KEY (Status_code) REFERENCES Status(Status_code), 
    FOREIGN KEY (Reason_code) REFERENCES Ready_Reason(Reason_code) 
);

desc event


SELECT E.Event_id, E.Duration, S.Name AS Status_Name 
FROM Event E 
INNER JOIN Status S ON E.Status_code = S.Status_code;

INSERT INTO Status (Status_code, Name) VALUES ('S001', 'In Progress');

INSERT INTO Status (Status_code, Name) VALUES ('S002', 'Completed');

INSERT INTO Status (Status_code, Name) VALUES ('S003', 'Pending');

INSERT INTO Status (Status_code, Name) VALUES ('S004', 'Cancelled');

INSERT INTO Status (Status_code, Name) VALUES ('S005', 'Delayed');

select * from status;

INSERT INTO Ready_Reason (Reason_code, Name) VALUES ('R001', 'Scheduled');

INSERT INTO Ready_Reason (Reason_code, Name) VALUES ('R002', 'Resources Available');

INSERT INTO Ready_Reason (Reason_code, Name) VALUES ('R003', 'No Delay');

INSERT INTO Ready_Reason (Reason_code, Name) VALUES ('R004', 'Pre-checked');

INSERT INTO Ready_Reason (Reason_code, Name) VALUES ('R005', 'Approved');

select * from Ready_Reason;

INSERT INTO Delay_Reason (Reason_code, Name) VALUES ('D001', 'Weather');

INSERT INTO Delay_Reason (Reason_code, Name) VALUES ('D002', 'Technical Issues');

INSERT INTO Delay_Reason (Reason_code, Name) VALUES ('D004', 'Maintenance');

INSERT INTO Delay_Reason (Reason_code, Name) VALUES ('D005', 'Safety Checks');

INSERT INTO Delay_Reason (Reason_code, Name) VALUES ('D003', 'Unavailable');

select * from delay_reason;

INSERT INTO Event (Event_id, Duration, Status_code, Reason_code) VALUES ('E001', 120, 'S001', 'R001');

INSERT INTO Event (Event_id, Duration, Status_code, Reason_code) VALUES ('E002', 90, 'S002', 'R002');

INSERT INTO Event (Event_id, Duration, Status_code, Reason_code) VALUES ('E003', 45, 'S003', 'R003');

INSERT INTO Event (Event_id, Duration, Status_code, Reason_code) VALUES ('E004', 60, 'S004', 'R004');

INSERT INTO Event (Event_id, Duration, Status_code, Reason_code) VALUES ('E005', 30, 'S005', 'R005');

select * from event;

SELECT E.Event_id, E.Duration, S.Name AS Status_Name 
FROM Event E 
INNER JOIN Status S ON E.Status_code = S.Status_code;

SELECT Reason_code, Name FROM Ready_Reason 
UNION 
SELECT Reason_code, Name FROM Delay_Reason;

SELECT E.Event_id, E.Duration, S.Name AS Status_Name, 
       COALESCE(RR.Name, DR.Name) AS Reason_Name 
FROM Event E 
INNER JOIN Status S ON E.Status_code = S.Status_code 
LEFT JOIN Ready_Reason RR ON E.Reason_code = RR.Reason_code 
LEFT JOIN Delay_Reason DR ON E.Reason_code = DR.Reason_code;

