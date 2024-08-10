DROP TABLE IF EXISTS LogTable;

CREATE TABLE LogTable(
        LogID INT AUTO_INCREMENT PRIMARY KEY,
        UserName VARCHAR(30) NOT NULL,
        TableName VARCHAR(30) NOT NULL,
        RecordPK VARCHAR(200) NOT NULL,
  	ActionTaken VARCHAR(200) NOT NULL,
	TimeStamp TIMESTAMP
);

DROP TRIGGER IF EXISTS Trigger1;
DROP TRIGGER IF EXISTS Trigger2;
DROP TRIGGER IF EXISTS Trigger3;
DROP TRIGGER IF EXISTS Trigger4;

DELIMITER //

CREATE TRIGGER Trigger1
BEFORE INSERT
ON Users
FOR EACH ROW
BEGIN
     IF NEW.UserID < 0 OR
        NEW.UserName LIKE '%666%' OR
        NEW.CreationDate < '2010-01-01' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "Invalid attribute inserted (UserID must be > 0, UserName cant contain 666, CreationDate must be >= 2010";
     END IF;
END //

CREATE TRIGGER Trigger2
AFTER INSERT
ON Users
FOR EACH ROW
BEGIN
     SELECT CONCAT('UserID = ', NEW.UserID) INTO @RecordPKV;
     INSERT INTO LogTable (UserName, TableName, RecordPK, ActionTaken, TimeStamp)
     VALUES (CURRENT_USER(), 'Users', @RecordPKV, 'INSERT', NOW());


END //

CREATE TRIGGER Trigger3
AFTER UPDATE
ON Users
FOR EACH ROW
BEGIN
     SELECT CONCAT('UPDATE - set UserName from ', CONCAT(OLD.UserName, CONCAT(' to ', NEW.UserName))) INTO @action;
     INSERT INTO LogTable (UserName, TableName, RecordPK, ActionTaken, TimeStamp)
     VALUES (CURRENT_USER(), 'Users', NEW.UserID, @action, NOW());


END //

CREATE TRIGGER Trigger4
AFTER DELETE
ON Users
FOR EACH ROW
BEGIN
     SELECT CONCAT('UserID = ', OLD.UserID) INTO @RecordPKV;
     INSERT INTO LogTable (UserName, TableName, RecordPK, ActionTaken, TimeStamp)
     VALUES (CURRENT_USER(), 'Users', @RecordPKV, 'DELETE', NOW());


END //
DELIMITER ;

--------------TESTS-------------

-----TEST FIRST TRIGGER----
--UserID < 0
INSERT INTO Users (UserID, UserName, Email, CreationDate)
VALUES (-1, 'alan', 'alan@example.com', '2020-01-01');

--UserName LIKE '%666'
INSERT INTO Users (UserName, Email, CreationDate)
VALUES ('alan666', 'alan@example.com', '2020-01-01');

--CreationDate < '2010-01-01'
INSERT INTO Users (UserName, Email, CreationDate)
VALUES ('alan', 'alan@example.com', '2009-12-31');

--VALID VALUE
INSERT INTO Users (UserName, Email, CreationDate)
VALUES ('alan', 'alan@example.com', '2010-01-01');

-----TEST SECOND TRIGGER----
SELECT * FROM LogTable;

INSERT INTO Users (UserName, Email, CreationDate)
VALUES ('luis', 'luis@example.com', '2011-01-01');
-----TEST THIRD TRIGGER----
SELECT * FROM LogTable;

SELECT * FROM Users;

UPDATE Users
SET UserName = 'Alan10'
WHERE UserID = 11;

SELECT * FROM Users;

-----TEST FOURTH TRIGGER----
SELECT * FROM LogTable;

DELETE FROM Users
WHERE UserID > 10;

SELECT * FROM LogTable;


