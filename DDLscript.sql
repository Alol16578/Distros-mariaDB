DROP TABLE IF EXISTS UserDevice;
DROP TABLE IF EXISTS DeviceDistro;
DROP TABLE IF EXISTS DistroFeature;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Distro;
DROP TABLE IF EXISTS Device;
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
  ImageDiskSpace FLOAT,
  PRIMARY KEY(DistroID)
);

CREATE TABLE Device (
  DeviceID INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(50) NOT NULL,
  DeviceType ENUM('PC', 'Phone', 'Laptop', 'Tablet') NOT NULL,
  Manufacturer VARCHAR(20) NOT NULL,
  PRIMARY KEY (DeviceID)
);

CREATE TABLE Feature (
  FeatureID INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(50) NOT NULL,
  Description VARCHAR(500),
  FeatureType ENUM('graphical', 'text-based', 'mixed'),
  FeatureStatus ENUM('active', 'inactive', 'deprecated'),
  PRIMARY KEY(FeatureID)
);


CREATE TABLE UserDevice (
  UserID INT NOT NULL,
  DeviceID INT NOT NULL,
  PRIMARY KEY (UserID,DeviceID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
      ON DELETE CASCADE,
  FOREIGN KEY (DeviceID) REFERENCES Device(DeviceID)
      ON DELETE CASCADE
);

CREATE TABLE DeviceDistro (
  DeviceID INT NOT NULL,
  DistroID INT NOT NULL,
  PRIMARY KEY (DeviceID, DistroID),
  FOREIGN KEY (DeviceID) REFERENCES Device(DeviceID)
      ON DELETE CASCADE,
  FOREIGN KEY (DistroID) REFERENCES Distro(DistroID)
      ON DELETE CASCADE
);

CREATE TABLE DistroFeature (
  DistroID INT NOT NULL,
  FeatureID INT NOT NULL,
  PRIMARY KEY (DistroID, FeatureID),
  FOREIGN KEY (DistroID) REFERENCES Distro(DistroID)
      ON DELETE CASCADE,
  FOREIGN KEY (FeatureID) REFERENCES Feature(FeatureID)
      ON DELETE CASCADE
);

