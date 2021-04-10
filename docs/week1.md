---
editor_options:
  markdown:
    wrap: 72
---



# <center>DBMS essentials week 2</center>

## 1. Basics of relational databases.

### 1.1. Terminology of databases.

-   A databases is a collection of tables.

-   Each table has a

    -   **heading**: table name and column names.
    -   **body**: shows the rows of the table.

For conventions each column name has an abbreviation of the table name
as prefix. Mixed case in a name highlights the different parts of the
column name.

![dbew1](images/2021/03/dbew1.png)

-   Matching values: they are used to combine multiple tables in a
    relational database.

![dbew1_2](images/2021/03/dbew1-2.png)

-   Alternative Terminology according groups of users:

    ![dbew1_3](images/2021/03/dbew1-3.png)

The table-oriented terminology originally appealed to end users. The
set-oriented terminology appeals to academic researchers. And the
record-oriented terminology really was originally appealed to
information systems professionals.

Relational databases have been the dominant commercial standard in the
database industry for more than 30 years. The relational data model is
commercially dominate for several reasons.

## 2. Integrity rules:

What is the consequence of two taxpayers of customers with the same
government identifier or customer identifier?

What is the consequence of a shipment associated with the wrong order?

### 2.1. Some definitions:

-   Null values: absence of a value, unknown or not applicable for a
    row.
-   Primary Key (PK): is a **column** or **combination** of columns with
    **unique** values in each row.
-   Foreign Key (FK): is a column or combination of columns in a table
    that is related to a **primary key** in a **related table**.

### 2.2. Integrity rules:

-   **Entity Integrity rule**:

    -   PK for each table.
    -   **No part of a PK** can have missing values for PK.
    -   Ensures traceable entities.

For auditing, security, and communication reasons, business entities
should be easily traceable and unique.

-   **Referential Integrity rule**: Referential integrity means that
    column values in one table match column values in a related table.

    -   Two kinds of values for a foreign key in a row match a primary
        key value of a related table (usual).
    -   Some foreign keys can allow null values (but it is not usual).
    -   Ensures that the database contains valid connections.

For example, each row of the enrollment table contains a student number
of a valid student. Otherwise, some enrollments can be meaningless
possibly resulting in students denied enrollment because non-existing
students took their places.

![dbew1_4](images/2021/03/dbew1-4.png)

> Note that StdNo is foreing key in the Enrollment table referring to
> StdNo in the Student table. And OfferNo is a foreign key in the
> Enrollment table referring to OfferNo in the

-   Integrity rule violations in the example above:

    -   StdNo has a null value on Student table being its primary key.
    -   StdNo has a null value in Enrollment and it compose a primary
        key with the OfferNo

-   Referential integrity violation:

    -   There is one OfferNo value in the Enrollment (FK in this table)
        table that is in the Offering table: 6789.

> Some foreign keys can allow null values (but it is not usual). For
> example offerings having not yet a faculty (faculty is foreign table
> in the offering table but is not part of the primary key in the
> offerings table)

### 2.3. Entity Relation Diagram:

![dbew1_5](images/2021/03/dbew1-5.png)

-   Primary keys marked with a `P`.

-   Foreign Key with an F.

-   The lines represent relationships with referential integrity
    constraints.

    -   Each relationship has a parent table: appearing next to the
        **arrow** in the line.
    -   the child table appearing next to the foot symbol. This means
        that a course can related to many offerings.

-   A solid line means that the foreign key can not have missing values.

## 3. Basic SQL Create Table statement.

![dbew1_6](images/2021/03/dbew1-6.png)

``` sql
 CREATE TABLE <table-name>
(<columns-list>[<constraints-list>])
```
```sql
SELECT count(*) FROM my_table;
```

![dbew1_7](images/2021/03/dbew1-7.png)

### 3.1. Common SQL data types.

-   Char(L): Fixed length, L is the maximun length. It is used for
    columns with same length. IT used the maximun length.
-   VARCHAR(L): Variable length character. It not used the maximum
    length.
-   INTEGER.
-   FLOAT(P): P is the number of significant digits. Used for scientific
    calculations.
-   DECIMAL: W indicates the number of digits and R the number of places
    at the right of the decimal point. Used for monetary amounts.
-   DATES, TIME, TIMESTAMP.

## 4. Integrity Constraint Syntax.

### 4.1 Constraint Overview:

Subject:

-   PK
-   FK
-   Unique
-   Required (Not Null)
-   Check (multiple conditions.)

Placement: - Internal - External

... to the column definition.

Constraints involving more than one column must be placed external to
column.

The keyword constraint is optional for inline constraints, but required
for external constraints.

Examples:

![dbew1_8](images/2021/03/dbew1-8.png)

These two constraints are internal but it could be internal because the
involves only single a column.

![edbw1_9](images/2021/03/edbw1-9.png)

The last 2 constraints could be internal but the first one must be
external.

![dbew1_10](images/2021/03/dbew1-10.png)

Not null constraints are typically inline because they involve single
columns


## 5 Setting up the Database week1 Project.

- Create the project using dbeaver. It is named BMs_essentials.
The project can contains multiple databases required for the exercises.

- Create an empty database named `athletic` using the **mysql cli client**.

```sh
sudo mysql
```

```sql
CREATE DATABASE athletic;
```
- Create user and grant privileges.

```sql
CREATE USER 'sergio_athletic'@'localhost' IDENTIFIED BY 'sametheconfigSQLproof'
```

```sql
FLUSH PRIVILEGES;
```

```sql
GRANT ALL PRIVILEGES ON athletic.* TO 'sergio_athletic'@'localhost'
```
- Create connection using dbeaver.

>Remember configuring `use SSL` and unselect `verify ssl certificate`

## 6. Practice problems 1

```sql
/*Create Customer table */

/*Create Customer table */
DROP TABLE IF EXISTS EVENTPLANLINE;
DROP TABLE IF EXISTS EVENTPLAN;
DROP TABLE IF EXISTS EVENTREQUEST;
DROP TABLE IF EXISTS CUSTOMER;

CREATE TABLE CUSTOMER(
CustNo VARCHAR(8) NOT NULL,
CustName VARCHAR(30) NOT NULL,
Address VARCHAR(50)  NOT NULL,
Internal CHAR(1)  NOT NULL,
Contact VARCHAR(30)  NOT NULL,
Phone VARCHAR(8)  NOT NULL,
City VARCHAR(30)  NOT NULL,
State VARCHAR(2)  NOT NULL,
Zip VARCHAR(5)  NOT NULL,
CONSTRAINT PRIMARY KEY (CustNo));

Insert into CUSTOMER (CUSTNO,CUSTNAME,ADDRESS,INTERNAL,CONTACT,PHONE,CITY,STATE,ZIP) values ('C100','Football','Box 352200','Y','Mary Manager','6857100','Boulder','CO','80309');
Insert into CUSTOMER (CUSTNO,CUSTNAME,ADDRESS,INTERNAL,CONTACT,PHONE,CITY,STATE,ZIP) values ('C101','Men''s Basketball','Box 352400','Y','Sally Supervisor','5431700','Boulder','CO','80309');
Insert into CUSTOMER (CUSTNO,CUSTNAME,ADDRESS,INTERNAL,CONTACT,PHONE,CITY,STATE,ZIP) values ('C103','Baseball','Box 352020','Y','Bill Baseball','5431234','Boulder','CO','80309');
Insert into CUSTOMER (CUSTNO,CUSTNAME,ADDRESS,INTERNAL,CONTACT,PHONE,CITY,STATE,ZIP) values ('C104','Women''s Softball','Box 351200','Y','Sue Softball','5434321','Boulder','CO','80309');
Insert into CUSTOMER (CUSTNO,CUSTNAME,ADDRESS,INTERNAL,CONTACT,PHONE,CITY,STATE,ZIP) values ('C105','High School Football','123 AnyStreet','N','Coach Bob','4441234','Louisville','CO','80027');


/*Create the Facility table*/
DROP TABLE IF EXISTS LOCATION;-- Location must be dropped to allow Facility table be deleted due to referential integrity rule.
DROP TABLE IF EXISTS FACILITY;

CREATE TABLE FACILITY(
FacNo CHAR(4) NOT NULL,
FacName VARCHAR(20) NOT NULL,
CONSTRAINT PRIMARY KEY (FacNo),
CONSTRAINT UNIQUE (FacName));

Insert into FACILITY (FACNO,FACNAME) values ('F100','Football stadium');
Insert into FACILITY (FACNO,FACNAME) values ('F101','Basketball arena');
Insert into FACILITY (FACNO,FACNAME) values ('F102','Baseball field');
Insert into FACILITY (FACNO,FACNAME) values ('F103','Recreation room');

/*Create Location table*/

DROP TABLE IF EXISTS LOCATION;

CREATE TABLE LOCATION(
LocNo VARCHAR(8) NOT NULL,
FacNo VARCHAR(8) NOT NULL,
LocName VARCHAR(30) NOT NULL,
CONSTRAINT PRIMARY KEY (LocNo),
CONSTRAINT FOREIGN KEY (FacNo)
	REFERENCES FACILITY (FacNo)
);


/*Here starts the peergraded assginment*/
DROP TABLE IF EXISTS EMPLOYEE;
CREATE TABLE EMPLOYEE(
EmpNo VARCHAR(8) NOT NULL,
EmpName VARCHAR(30) NOT NULL,
Department VARCHAR(30) NOT NULL,
Email VARCHAR(50) NOT NULL,
Phone CHAR(6) NOT NULL,
CONSTRAINT PRIMARY KEY (EmpNo)
);




Insert into EMPLOYEE (EMPNO,EMPNAME,DEPARTMENT,EMAIL,PHONE)
values ('E100','Chuck Coordinator','Administration','chuck@colorado.edu','3-1111');
Insert into EMPLOYEE (EMPNO,EMPNAME,DEPARTMENT,EMAIL,PHONE)
values ('E101','Mary Manager','Football','mary@colorado.edu','5-1111');
Insert into EMPLOYEE (EMPNO,EMPNAME,DEPARTMENT,EMAIL,PHONE)
values ('E102','Sally Supervisor','Planning','sally@colorado.edu','3-2222');
Insert into EMPLOYEE (EMPNO,EMPNAME,DEPARTMENT,EMAIL,PHONE)
values ('E103','Alan Administrator','Administration','alan@colorado.edu','3-3333');

/*Create Resource Table*/
DROP TABLE IF EXISTS RESOURCETBL;
CREATE TABLE RESOURCETBL(
ResNo VARCHAR(8) NOT NULL,
ResName VARCHAR(20) NOT NULL,
Rate DECIMAL(4,2) NOT NULL CONSTRAINT CHECK (Rate > 0),
CONSTRAINT PRIMARY KEY (ResNo)
);

Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R100','attendant',10);
Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R101','police',15);
Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R102','usher',10);
Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R103','nurse',20);
Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R104','janitor',15);
Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R105','food service',10);

/*Create EVENTREQUEST table*/
DROP TABLE IF EXISTS EVENTPLAN;
DROP TABLE IF EXISTS EVENTREQUEST;
CREATE TABLE EVENTREQUEST(
EventNo VARCHAR(8) NOT NULL,
DateHeld DATE NOT NULL,
DateReq DATE NOT NULL,
CustNo VARCHAR(8) NOT NULL,
FacNo VARCHAR(8) NOT NULL,
DateAuth DATE,
Status VARCHAR(10) NOT NULL,
EstCost INT NOT NULL,
EstAudience INT NOT NULL,
BudNo CHAR(8),
CONSTRAINT PRIMARY KEY (EventNo),
CONSTRAINT FOREIGN KEY (CustNo)
	REFERENCES CUSTOMER (CustNo),
CONSTRAINT FOREIGN KEY (FacNo)
	REFERENCES FACILITY (FacNo),
CONSTRAINT CHECK (Status IN ('Pending', 'Denied',  'Approved'))
);

Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E100',str_to_date('25,OCT,18','%d,%b,%y'),str_to_date('06,JUN,18','%d,%b,%y'),'C100','F100',str_to_date('08,JUN,18','%d,%b,%y'),'Approved',5000,80000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E101',str_to_date('26,OCT,18','%d,%b,%y'),str_to_date('28,JUL,18','%d,%b,%y'),'C100','F100',null,'Pending',5000,80000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E103',str_to_date('21,SEP,18','%d,%b,%y'),str_to_date('28,JUL,18','%d,%b,%y'),'C100','F100',str_to_date('01,AUG,18','%d,%b,%y'),'Approved',5000,80000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E102',str_to_date('14,SEP,18','%d,%b,%y'),str_to_date('28,JUL,18','%d,%b,%y'),'C100','F100',str_to_date('31,JUL,18','%d,%b,%y'),'Approved',5000,80000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E104',str_to_date('03,DEC,18','%d,%b,%y'),str_to_date('28,JUL,18','%d,%b,%y'),'C101','F101',str_to_date('31,JUL,18','%d,%b,%y'),'Approved',2000,12000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E105',str_to_date('05,DEC,18','%d,%b,%y'),str_to_date('28,JUL,18','%d,%b,%y'),'C101','F101',str_to_date('01,AUG,18','%d,%b,%y'),'Approved',2000,10000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E106',str_to_date('12,DEC,18','%d,%b,%y'),str_to_date('28,JUL,18','%d,%b,%y'),'C101','F101',str_to_date('31,JUL,18','%d,%b,%y'),'Approved',2000,10000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E107',str_to_date('23,NOV,18','%d,%b,%y'),str_to_date('28,JUL,18','%d,%b,%y'),'C105','F100',str_to_date('31,JUL,18','%d,%b,%y'),'Denied',10000,5000,null);

/*Create EVENTPLAN table */
DROP TABLE IF EXISTS EVENTPLANLINE;
DROP TABLE IF EXISTS EVENTPLAN;
CREATE TABLE EVENTPLAN(
PlanNo VARCHAR(8) NOT NULL,
EventNo VARCHAR(8) NOT NULL,
WorkDate DATE NOT NULL,
Notes VARCHAR(50),
Activity VARCHAR(20) NOT NULL,
EmpNo VARCHAR(8),
CONSTRAINT PRIMARY KEY (PlanNo),
CONSTRAINT FOREIGN KEY (EventNo)
	REFERENCES EVENTREQUEST (EventNo),
CONSTRAINT FOREIGN KEY (EmpNo)
	REFERENCES EMPLOYEE (EmpNo)
);

Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P100','E100',str_to_date('25,OCT,18','%d,%b,%y'),'Standard operation','Operation','E102');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P101','E104',str_to_date('03,DEC,18','%d,%b,%y'),'Watch for gate crashers','Operation','E100');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P102','E105',str_to_date('05,DEC,18','%d,%b,%y'),'Standard operation','Operation','E102');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P103','E106',str_to_date('12,DEC,18','%d,%b,%y'),'Watch for seat switching','Operation',null);
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P104','E101',str_to_date('26,OCT,18','%d,%b,%y'),'Standard cleanup','Cleanup','E101');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P105','E100',str_to_date('25,OCT,18','%d,%b,%y'),'Light cleanup','Cleanup','E101');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P199','E102',str_to_date('10,DEC,18','%d,%b,%y'),'ABC','Operation','E101');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P299','E101',str_to_date('26,OCT,18','%d,%b,%y'),null,'Operation','E101');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P349','E106',str_to_date('12,DEC,18','%d,%b,%y'),null,'Setup','E101');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P85','E100',str_to_date('25,OCT,18','%d,%b,%y'),'Standard operation','Cleanup','E102');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P95','E101',str_to_date('26,OCT,18','%d,%b,%y'),'Extra security','Cleanup','E102');

/*Create EVENTPLANLINE table*/

DROP TABLE IF EXISTS EVENTPLANLINE;
CREATE TABLE EVENTPLANLINE(
PlanNo VARCHAR(8) NOT NULL,
LineNo VARCHAR(8) NOT NULL,
TimeStart DATETIME NOT NULL,
TimeEnd DATETIME NOT NULL,
NumberFld INT NOT NULL,
LocNo VARCHAR(8) NOT NULL,
ResNo VARCHAR(4) NOT NULL,
CONSTRAINT PRIMARY KEY (PlanNo, LineNo),
CONSTRAINT FOREIGN KEY (PlanNo)
	REFERENCES EVENTPLAN (PlanNo),
CONSTRAINT FOREIGN KEY (ResNo)
	REFERENCES RESOURCETBL (ResNo),
CONSTRAINT CHECK (TimeStart < TimeEnd));

Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P100',1, str_to_date('25,OCT,18 8:00:00','%d,%b,%y %H:%i:%s'), str_to_date('25,OCT,18 17:00:00','%d,%b,%y %H:%i:%s'),2,'L100','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P100',2, str_to_date('25,OCT,18 12:00:00','%d,%b,%y %H:%i:%s'),str_to_date('25,OCT,18 17:00:00','%d,%b,%y %H:%i:%s'), 2,'L101','R101');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P100',3, str_to_date('25,OCT,18 7:00:00','%d,%b,%y %H:%i:%s'), str_to_date('25,OCT,18 16:30:00','%d,%b,%y %H:%i:%s'), 1,'L102','R102');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P100',4, str_to_date('25,OCT,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('25,OCT,18 22:00:00','%d,%b,%y %H:%i:%s'),2,'L100','R102');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P101',1, str_to_date('3,DEC,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('3,DEC,18 20:00:00','%d,%b,%y %H:%i:%s'),2,'L103','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P101',2, str_to_date('3,DEC,18 18:30:00','%d,%b,%y %H:%i:%s'),str_to_date('3,DEC,18 19:00:00','%d,%b,%y %H:%i:%s'),4,'L105','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P101',3, str_to_date('3,DEC,18 19:00:00','%d,%b,%y %H:%i:%s'),str_to_date('3,DEC,18 20:00:00','%d,%b,%y %H:%i:%s'),2,'L103','R103');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P102',1, str_to_date('5,DEC,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('5,DEC,18 19:00:00','%d,%b,%y %H:%i:%s'),2,'L103','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P102',2, str_to_date('5,DEC,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('5,DEC,18 21:00:00','%d,%b,%y %H:%i:%s'),4,'L105','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P102',3, str_to_date('5,DEC,18 19:00:00','%d,%b,%y %H:%i:%s'),str_to_date('5,DEC,18 22:00:00','%d,%b,%y %H:%i:%s'),2,'L103','R103');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P103',1, str_to_date('12,DEC,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('12,DEC,18 21:00:00','%d,%b,%y %H:%i:%s'),2,'L103','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P103',2, str_to_date('12,DEC,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('12,DEC,18 21:00:00','%d,%b,%y %H:%i:%s'),4,'L105','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P103',3, str_to_date('12,DEC,18 19:00:00','%d,%b,%y %H:%i:%s'),str_to_date('12,DEC,18 22:00:00','%d,%b,%y %H:%i:%s'),2,'L103','R103');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P104',1, str_to_date('26,OCT,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('26,OCT,18 22:00:00','%d,%b,%y %H:%i:%s'),4,'L101','R104');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P104',2, str_to_date('26,OCT,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('26,OCT,18 22:00:00','%d,%b,%y %H:%i:%s'),4,'L100','R104');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P105',1, str_to_date('25,OCT,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('25,OCT,18 22:00:00','%d,%b,%y %H:%i:%s'),4,'L101','R104');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P105',2, str_to_date('25,OCT,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('25,OCT,18 22:00:00','%d,%b,%y %H:%i:%s'),4,'L100','R104');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P199',1, str_to_date('10,DEC,18 8:00:00','%d,%b,%y %H:%i:%s'), str_to_date('10,DEC,18 12:00:00','%d,%b,%y %H:%i:%s'),1,'L100','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P349',1, str_to_date('12,DEC,18 12:00:00','%d,%b,%y %H:%i:%s'),str_to_date('12,DEC,18 15:30:00','%d,%b,%y %H:%i:%s'),1,'L103','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P85',1,  str_to_date('25,OCT,18 9:00:00','%d,%b,%y %H:%i:%s'), str_to_date('25,OCT,18 17:00:00','%d,%b,%y %H:%i:%s'),5,'L100','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P85',2,  str_to_date('25,OCT,18 8:00:00','%d,%b,%y %H:%i:%s'), str_to_date('25,OCT,18 17:00:00','%d,%b,%y %H:%i:%s'),2,'L102','R101');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P85',3, str_to_date('25,OCT,18 10:00:00','%d,%b,%y %H:%i:%s'), str_to_date('25,OCT,18 15:00:00','%d,%b,%y %H:%i:%s'),3,'L104','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P95',1, str_to_date('26,OCT,18 8:00:00','%d,%b,%y %H:%i:%s'),  str_to_date('26,OCT,18 17:00:00','%d,%b,%y %H:%i:%s'),4,'L100','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P95',2, str_to_date('26,OCT,18 9:00:00','%d,%b,%y %H:%i:%s'),  str_to_date('26,OCT,18 17:00:00','%d,%b,%y %H:%i:%s'),4,'L102','R101');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P95',3, str_to_date('26,OCT,18 10:00:00','%d,%b,%y %H:%i:%s'), str_to_date('26,OCT,18 15:00:00','%d,%b,%y %H:%i:%s'),4,'L106','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P95',4, str_to_date('26,OCT,18 13:00:00','%d,%b,%y %H:%i:%s'), str_to_date('26,OCT,18 17:00:00','%d,%b,%y %H:%i:%s'),2,'L100','R103');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P95',5, str_to_date('26,OCT,18 13:00:00','%d,%b,%y %H:%i:%s'), str_to_date('26,OCT,18 17:00:00','%d,%b,%y %H:%i:%s'),2,'L101','R104');
```
