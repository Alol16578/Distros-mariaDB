# Idea of DB project
## TITLE: DistroDB
Data Sets (Entities):

 - Distro: Represents a Linux Distribution, and contains it’s basic info. Each Distribution can have multiple Features, and a feature can be on multiple distros (M:M).
 - Feature: Has info about a feature. Each feature can be present in multiple features, and each distro can have multiple features.
 - Device:  Stores information about the device the user has. It’s a 1:M relationship between a User and the device, meaning that one user can have more than one device (must have at least one), but one device has one user. And a 1:M relationship with distros, since a device has a distro, but a distro is used by many.
 - User: Stores information about a User running a linux distro. A user MUST be using a Distribution (assuming it’s running linux), but a distribution can have multiple users running it (1:M).
Basic 

Entity-Relation Diagram
![Database][https://github.com/Alol16578/Distros-mariaDB/erdiagram.png?raw=true]
