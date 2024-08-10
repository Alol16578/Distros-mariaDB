DROP PROCEDURE IF EXISTS StoredProc1;
DROP PROCEDURE IF EXISTS StoredProc2;
DROP PROCEDURE IF EXISTS StoredProc3;

DELIMITER //

CREATE PROCEDURE StoredProc1()
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

  SELECT ROUND(AVG(ImageDiskSpace),2) AS AverageDiskSpace
  FROM Distro;

  -- Returns the average disk space of the distro

  COMMIT;

END //
CREATE PROCEDURE StoredProc2(IN minFeatureCount INT)
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

  SELECT Distro.Name, COUNT(DistroFeature.FeatureID) AS FeatureCount
  FROM Distro LEFT JOIN DistroFeature
   ON Distro.DistroID = DistroFeature.DistroID
  GROUP BY Distro.Name
  HAVING FeatureCount > minFeatureCount
  ORDER BY FeatureCount ASC;

  -- Returns the name of the distros with the number of features each distro has (limited by the parameter given)

  COMMIT;

END //
CREATE PROCEDURE StoredProc3(IN minDiskSpaceConsidered DECIMAL(10,2), OUT averageOUT DECIMAL(10,2))
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

  SELECT ROUND(AVG(ImageDiskSpace),2) AS AverageDiskSpace INTO averageOUT
  FROM Distro
  WHERE ImageDiskSpace > minDiskSpaceConsidered;

  -- Returns Average Disk space, ignoring the distros who's Disk space are lower than the parameter, and take the result into the variable averageOUT

  COMMIT;

END //


DELIMITER ;

CALL StoredProc1();
CALL StoredProc2(1);
CALL StoredProc3(4.2, @result);
SELECT @result AS AverageValueReturned;
