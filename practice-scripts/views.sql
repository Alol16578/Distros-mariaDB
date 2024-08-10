DROP VIEW IF EXISTS View1;
DROP VIEW IF EXISTS View2;
DROP VIEW IF EXISTS View3;

-- View that displays Username, DeviceID, and creation date
CREATE VIEW View1 AS
SELECT U.UserName, Ud.DeviceID, U.CreationDate
FROM Users AS U
JOIN UserDevice AS Ud
ON U.UserID = Ud.UserID;

-- View that displays Username, Distro Name, and creation date
--  (Join with UserDevice is because of the M:M relation with distro)
CREATE VIEW View2 AS
SELECT U.UserName, D.Name, D.DeviceType
FROM Users AS U
JOIN UserDevice AS Ud
ON U.UserID = Ud.UserID
JOIN Device AS D
ON Ud.DeviceID = D.DeviceID;

-- View Dispalys distro name, and the respective number of features 
CREATE VIEW View3 AS
SELECT Distro.Name, COUNT(DistroFeature.FeatureID) AS FeatureCount
FROM Distro LEFT JOIN DistroFeature
 ON Distro.DistroID = DistroFeature.DistroID
GROUP BY Distro.Name
ORDER BY FeatureCount DESC;

SELECT * FROM View1;
SELECT * FROM View2;
SELECT * FROM View3;
