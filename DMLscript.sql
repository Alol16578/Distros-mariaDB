-- INSERT Statements

INSERT INTO Users (UserName, Email, CreationDate)
VALUES ('Liam0', 'liam0@example.com', '2023-01-01'),
  ('Olivia1', 'olivia1@example.com', '2023-01-02'),
  ('Noah2', 'noah2@example.com', '2023-01-03'),
  ('Emma3', 'emma3@example.com', '2023-01-04'),
  ('Oliver4', 'oliver4@example.com', '2023-01-05'),
  ('Charlotte5', 'charlotte5@example.com', '2023-01-06'),
  ('James6', 'james6@example.com', '2023-01-07'),
  ('Amelia7', 'amelia7@example.com', '2023-01-08'),
  ('Elijah8', 'elijah8@example.com', '2023-01-09'),
  ('Sophia9', 'sophia9@example.com', '2023-01-10');

INSERT INTO Distro (Name, Version, ReleaseDate, ImageDiskSpace)
VALUES ('Ubuntu', '22.04', '2022-04-21', 4.3),
  ('Fedora', '36', '2022-05-13', 5.3),
  ('Manjaro', '21.2', '2022-01-12', 4.7 ),
  ('Pop!_OS', '22.04', '2022-04-20', 4.6 ),
  ('LinuxMint', '20.3', '2022-01-20', 4.5 ),
  ('ElementOS', '6.1', '2022-01-19', 4.4 ),
  ('Solus', '5.1', '2022-01-18', 4.3 ),
  ('Deepin', '20.2', '2022-01-17', 4.2 ),
  ('Zorin OS', '16', '2022-01-16', 4.1 ),
  ('MX Linux', '21.1', '2022-01-15', 4 );

INSERT INTO Feature (Name, Description, FeatureType, FeatureStatus)
VALUES ('Dark Mode', 'The ability to switch the user interface to a dark theme.', 'graphical', 'active'),
  ('Touchscreen Support', 'The ability to use the operating system with a touchscreen device.', 'mixed', 'active'),
  ('Multi-user Support', 'The ability to create multiple user accounts on the same computer.', 'mixed', 'active'),
  ('Terminal Emulator', 'A text-based interface for interacting with the operating system.', 'text-based', 'active'),
  ('Package Manager', 'A tool for installing, updating, and removing software.', 'mixed', 'active'),
  ('File Manager', 'A tool for browsing and managing files on the computer.', 'mixed', 'active'),
  ('Web Browser', 'A program for viewing web pages.', 'graphical', 'active'),
  ('Office Suite', 'A set of programs for creating and editing documents, spreadsheets, and presentations.', 'mixed', 'active'),
  ('Media Player', 'A program for playing audio and video files.', 'graphical', 'active'),
  ('Image Viewer', 'A program for viewing and editing image files.', 'graphical', 'active');

INSERT INTO Device (DeviceID, UserID, DistroID, Name, DeviceType, Manufacturer)
VALUES
  (11, 1, 1, 'Dell XPS 13', 'Laptop', 'Dell'),
  (12, 2, 2, 'Lenovo ThinkPad X1 Carbon', 'Laptop', 'Lenovo'),
  (13, 3, 3, 'Apple MacBook Air', 'Laptop', 'Apple'),
  (14, 4, 4, 'Google Pixelbook Go', 'Laptop', 'Google'),
  (15, 5, 5, 'Microsoft Surface Pro 8', 'Tablet', 'Microsoft'),
  (16, 6, 6, 'Samsung Galaxy Tab S8+', 'Tablet', 'Samsung'),
  (17, 7, 7, 'Asus Chromebook Flip C434', 'Laptop', 'Asus'),
  (18, 8, 8, 'HP Spectre x360 15', 'Laptop', 'HP'),
  (19, 9, 9, 'Razer Blade 14', 'Laptop', 'Razer'),
  (20, 10, 10, 'MSI GS66 Stealth', 'Laptop', 'MSI');

INSERT INTO DistroFeature (DistroID, FeatureID)
VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (2, 4),
  (3, 5),
  (3, 6),
  (4, 7),
  (4, 8),
  (5, 9),
  (5, 10);

-- DELETE Statements

DELETE FROM Device
WHERE DeviceID = 20;

DELETE FROM DistroFeature
WHERE DistroID = 5 AND FeatureID = 10;

DELETE FROM Users WHERE UserID = 10;

DELETE FROM Distro
WHERE DistroID = 10;

DELETE FROM Feature
WHERE FeatureID = 10;

-- UPDATE statements

UPDATE Users SET UserName = 'Elijah10'
WHERE UserID = 9;

UPDATE Distro
SET Name = 'Arco Linux'
WHERE DistroID = 9;

UPDATE Feature
SET Description = 'Audio and Video files player'
WHERE FeatureID = 9;

UPDATE Device
SET Name = 'Alol Device'
WHERE DeviceID = 19;

UPDATE DistroFeature
SET DistroID = 4
WHERE DistroID = 5 AND FeatureID = 9;

-- SELECT STATEMENTS

SELECT * FROM Users;

SELECT UserName FROM Users;

SELECT * FROM Users WHERE UserID = 1;

SELECT UserName FROM Users WHERE UserID = 1;

SELECT * FROM Users WHERE UserName LIKE '%1';

SELECT * FROM Distro
WHERE ImageDiskSpace BETWEEN 4 AND 4.5;

SELECT *
FROM Users AS u INNER JOIN Device AS d
ON u.UserID = d.UserID;

SELECT *
FROM Device AS d RIGHT JOIN Distro AS di
ON d.DistroID = di.DistroID;

SELECT *
FROM Feature AS f LEFT JOIN DistroFeature AS df
ON f.FeatureID = df.FeatureID;
