/*Create Customer table */

DROP TABLE IF EXISTS Customer;

CREATE TABLE Customer(
CustNo CHAR(4) NOT NULL,
CustName VARCHAR(30) NOT NULL,
Address VARCHAR(50)  NOT NULL,
Internal CHAR(1)  NOT NULL,
Contact VARCHAR(30)  NOT NULL,
Phone VARCHAR(8)  NOT NULL,
City VARCHAR(30)  NOT NULL,
State VARCHAR(2)  NOT NULL,
Zip VARCHAR(5)  NOT NULL,
CONSTRAINT PRIMARY KEY (CustNo));


/*Create the Facility table*/
DROP TABLE IF EXISTS Location;-- Location must be drop to allow Facility be deleted due to referential integrity rule.
DROP TABLE IF EXISTS Facility;

CREATE TABLE Facility(
FacNo CHAR(4) NOT NULL,
FacName VARCHAR(20) NOT NULL,
CONSTRAINT PRIMARY KEY (FacNo),
CONSTRAINT UNIQUE (FacName));

/*Create Location table*/

DROP TABLE IF EXISTS Location;

CREATE TABLE Location(
LocNo CHAR(4) NOT NULL,
FacNo CHAR(4) NOT NULL,
LocName VARCHAR(30) NOT NULL,
CONSTRAINT PRIMARY KEY (LocNo),
CONSTRAINT FOREIGN KEY (FacNo)
	REFERENCES Facility (FacNo)
);



