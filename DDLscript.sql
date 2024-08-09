DROP TABLE IF EXISTS DistroFeature;
DROP TABLE IF EXISTS Device;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Distro;
DROP TABLE IF EXISTS Feature;

CREATE TABLE Users (
  UserID INT NOT NULL AUTO_INCREMENT,
  UserName VARCHAR(20) NOT NULL,
  Email VARCHAR(30),
  CreationDate DATE NOT NULL,
  PRIMARY KEY(UserID)
);

CREATE TABLE Distro (
  DistroID INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(20) NOT NULL,
  Version VARCHAR(10) NOT NULL,
  ReleaseDate DATE,
  ImageDiskSpace DECIMAL(10,2),
  PRIMARY KEY(DistroID)
);

CREATE TABLE Feature (
  FeatureID INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(50) NOT NULL,
  Description VARCHAR(500),
  FeatureType ENUM('graphical', 'text-based', 'mixed'),
  FeatureStatus ENUM('active', 'inactive', 'deprecated'),
  PRIMARY KEY(FeatureID)
);

CREATE TABLE Device (
  DeviceID INT NOT NULL,
  UserID INT NOT NULL,
  DistroID INT NOT NULL,
  Name VARCHAR(30),
  DeviceType ENUM('PC', 'Phone', 'Laptop', 'Tablet') NOT NULL,
  Manufacturer VARCHAR(20) NOT NULL,
  PRIMARY KEY (DeviceID, UserID, DistroID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID),
  FOREIGN KEY (DistroID) REFERENCES Distro(DistroID)
);

CREATE TABLE DistroFeature (
  DistroID INT NOT NULL,
  FeatureID INT NOT NULL,
  PRIMARY KEY (DistroID, FeatureID),
  FOREIGN KEY (DistroID) REFERENCES Distro(DistroID),
  FOREIGN KEY (FeatureID) REFERENCES Feature(FeatureID)
);

