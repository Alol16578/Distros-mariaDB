SELECT *
FROM Users
WHERE Email IS NULL;

SELECT AVG(ImageDiskSpace) AS AverageDiskSpace
FROM Distro;

SELECT COUNT(*) AS TotalUsers
FROM Users;

SELECT MAX(ReleaseDate) AS LatestReleaseDate
FROM Distro;

SELECT MIN(ReleaseDate) AS EarliestReleaseDate
FROM Distro;

SELECT SUM(ImageDiskSpace) AS TotalDiskSpace
FROM Distro;

SELECT Distro.Name, COUNT(DistroFeature.FeatureID) AS TotalFeatures
FROM Distro LEFT JOIN DistroFeature
 ON Distro.DistroID = DistroFeature.DistroID
GROUP BY Distro.Name
ORDER BY TotalFeatures ASC;

SELECT Distro.Name, COUNT(DistroFeature.FeatureID) AS FeatureCount
FROM Distro LEFT JOIN DistroFeature
 ON Distro.DistroID = DistroFeature.DistroID
GROUP BY Distro.Name
HAVING FeatureCount > 1;

SELECT Distro.Name
FROM Distro
WHERE Distro.DistroID IN (
  SELECT DistroFeature.DistroID
  FROM DistroFeature
  WHERE DistroFeature.FeatureID = 1);

SELECT Users.UserName, (
  SELECT COUNT(*)
  FROM UserDevice
  WHERE UserDevice.UserID = Users.UserID)
  AS DeviceCount
FROM Users;
