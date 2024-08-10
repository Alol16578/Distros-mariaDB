DROP PROCEDURE IF EXISTS NewDistro;
DROP PROCEDURE IF EXISTS ChangeUserName;

DELIMITER //

CREATE PROCEDURE NewDistro()
BEGIN

  DECLARE exit handler for sqlexception
  BEGIN
     ROLLBACK;
     SELECT 'sql exception';
  END;

  DECLARE exit handler for sqlwarning
  BEGIN
     ROLLBACK;
     SELECT 'sql warning';
  END;


  START TRANSACTION;

-- insert 1 row into Distro table
  INSERT INTO Distro
  (Name, Version, ReleaseDate, ImageDiskSpace)
  VALUES
  ('NewDistro', 'V1', '2023-03-03', 1);

-- insert 1 row into the Users Table
  INSERT INTO Users
  (UserName, Email, CreationDate)
  VALUES
  ('NewUser10', 'newUser10@example.com', '2023-03-03');

  COMMIT;

END //
CREATE PROCEDURE ChangeUserName()
BEGIN

  DECLARE exit handler for sqlexception
  BEGIN
     ROLLBACK;
     SELECT 'sql exception';
  END;

  DECLARE exit handler for sqlwarning
  BEGIN
     ROLLBACK;
     SELECT 'sql warning';
  END;


  START TRANSACTION;

-- tries to change the primary key of a row to one already existing
-- Duplicate entry error
  UPDATE Users
  SET UserName = 'TestSophia90'
  WHERE UserID = 10;

END //


DELIMITER ;

CALL NewDistro();
CALL ChangeUserName;

