-- Based on the tables outlined on Figure 6.1 from the textbook with constraints from Figure 6.2
CREATE TABLE COMPANY.EMPLOYEE(
    Fname varchar(15) NOT NULL,
    Minit char,
    Lname varchar(15) NOT NULL,
    Ssn char(9) NOT NULL,
    Bdate DATE,
    Address VARCHAR(30),
    Sex CHAR,
    Salary DECIMAL(10,2),
    Super_ssn CHAR(9),
    Dno INT NOT NULL DEFAULT 1,
    CONSTRAINT EMPPK
    PRIMARY KEY  (Ssn),
    CONSTRAINT EMPSUPERFK
    FOREIGN KEY (Super_ssn) References EMPLOYEE(Ssn) ON DELETE SET NULL ON UPDATE CASCADE);
    
CREATE TABLE COMPANY.DEPARTMENT(
	Dname varchar(15) NOT NULL,
	Dnumber INT NOT NULL,
	Mgr_ssn CHAR(9) NOT NULL DEFAULT 888665555,
	Mgr_start_Date DATE,
	CONSTRAINT DEPTPK PRIMARY KEY (Dnumber),
    CONSTRAINT DEPTSK UNIQUE KEY (Dname),
    CONSTRAINT DEPTMGRFK FOREIGN Key(Mgr_ssn) References EMPLOYEE(Ssn) ON DELETE CASCADE ON UPDATE CASCADE);
        
CREATE TABLE COMPANY.DEPT_LOCATIONS(
	Dnumber int not null,
    Dlocation varchar(15) NOT NULL,
    PRIMARY KEY (Dnumber, Dlocation),
    FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber));
CREATE TABLE COMPANY.PROJECT(
	Pname VARCHAR(15) NOT NULL,
	Pnumber INT NOT NULL,
	Plocation VARCHAR(15),
	Dnum INT NOT NULL,
	Primary Key(Pnumber),
	UNIQUE(Pname),
	FOREIGN KEY(DNUM) References DEPARTMENT(Dnumber));
CREATE TABLE COMPANY.WORKS_ON(
	Essn CHAR(9) NOT NULL,
    Pno INT NOT NULL,
    Hours decimal(3,1),
    Primary Key(ESSN, Pno),
    Foreign Key(Essn) References EMPLOYEE(Ssn),
    Foreign Key(Pno) References PROJECT(Pnumber));
CREATE TABLE COMPANY.DEPENDENT(
    Essn CHAR(9) NOT NULL,
    Dependent_name VARCHAR(15) NOT NULL,
    Sex CHAR,
    Bdate DATE,
    Relationship VARCHAR(8),
    PRIMARY KEY (Essn , Dependent_Name),
    FOREIGN KEY (Essn) REFERENCES EMPLOYEE (Ssn));