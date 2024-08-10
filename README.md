# Idea of DB project
## TITLE: DistroDB
Data Sets (Entities):

 - Distro: Represents a Linux Distribution, and contains it’s basic info. Each Distribution can have multiple Features, and a feature can be on multiple distros (M:M).
 - Feature: Has info about a feature. Each feature can be present in multiple features, and each distro can have multiple features.
 - Device:  Stores information about the device the user has. It’s a 1:M relationship between a User and the device, meaning that one user can have more than one device (must have at least one), but one device has one user. And a 1:M relationship with distros, since a device has a distro, but a distro is used by many.
 - User: Stores information about a User running a linux distro. A user MUST be using a Distribution (assuming it’s running linux), but a distribution can have multiple users running it (1:M).

Entity-Relation Diagram
![Database](https://github.com/Alol16578/Distros-mariaDB/blob/main/erdiagram.png?raw=true)

# Normalization Explanation

1. 1-Normal-Form: There doesn't exist a non-atomic value in table, and no repeated attribute in any table (like having UserName1 and UserName2 columns on the same table)
2. 2-Normal-Form: No Partial Keys dependencies (partial key dependencies must be part of 'composite primary keys'). Each table that has said partial key dependency in the database, is has a composite primary key
3. 3-Normal-Form: No transitive dependencies
4. 4-Normal-Form: Tables that contain Composite Keys (UserDevice, DeviceDistro, DistroFeature) have the composite key attributes as the only attributes on the table. This necessarily means that it cant have more independent Multivalued dependencies, and as already seen the tables in this db satisfy the previous normal forms.
5. 5-Normal-Form: No cyclic dependencies. . This Normal Form was what my previous table since the previous Devices table was a fusion between an intersection table of User and Distro tables and also a table of Devices. To fix this I decomposed this table into 3 tables: Devices, UserDevice, DeviceDistro tables. I did this so that the table couldn’t be decomposed into a set of new tables each having fewer attributes than the original. But appart from this I see that it has all the other lower forms.
6. Boyce-Codd Normal Form: Every determinant on the db is the primary key of the respective table (determinant meaning, the 'element that determines the rest of the elements')

