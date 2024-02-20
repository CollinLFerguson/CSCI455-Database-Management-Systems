-- 1.Retrieve the names of all employees in department 5 who work more than 10 hrs per week on the ‘ProductX’ project
SELECT Fname, Minit, Lname
FROM  project, EMPLOYEE, works_on
WHERE Pname ='ProductX' AND Pnumber = Pno and Hours > 10 AND Essn = Ssn AND Dno=5;

-- 2.List the names of all employees who have a dependent with same first name as themselves.
-- INSERT INTO DEPENDENT VALUES('333445555', 'Franklin', 'F', '1986-04-05', 'Daughter'); -- Used to test the query
SELECT Fname, Minit, Lname
FROM EMPLOYEE, DEPENDENT
WHERE Ssn = Essn AND Fname = dependent_name;
-- DELETE FROM Dependent WHERE Essn='333445555' AND dependent_name='Franklin'; -- Used to test the query

-- 3.Find the names of all employees who are directly supervised by ‘Franklin”
SELECT Fname, Minit, Lname
FROM  EMPLOYEE
WHERE Super_SSN = '333445555';

-- 4.For each project, list the project name and the total hours per week (by all employees) spent on that project.
Select Pname, Pnumber, SUM(Hours)
FROM PROJECT, WORKS_ON
WHERE Pnumber = Pno
GROUP BY Pno;

-- 5.Retrieve the names of all employees who work on every project.
-- INSERT INTO WORKS_ON VALUES('123456789', 3, 1);
-- INSERT INTO WORKS_ON VALUES('123456789', 10, 1);
-- INSERT INTO WORKS_ON VALUES('123456789', 20, 1);
-- INSERT INTO WORKS_ON VALUES('123456789', 30, 1);

SELECT Fname, Minit, Lname
FROM  EMPLOYEE
INNER JOIN works_on
ON works_on.Essn =Ssn
GROUP BY Ssn
HAVING COUNT(*) = (SELECT COUNT(*) FROM PROJECT);

-- DELETE FROM works_on WHERE Essn = '123456789' AND Pno <> 1 AND Pno <> 2;


-- 6.List the last names of all department managers who have no dependents
SELECT Lname
FROM EMPLOYEE
Where Ssn in(
	SELECT ssn
	FROM EMPLOYEE, Department
    WHERE Ssn = mgr_Ssn
)
	AND Ssn not in(
	SELECT ssn
	FROM EMPLOYEE, DEPENDENT
    WHERE Ssn=Essn);
    
-- 7.Retrieve the average salary of all female employees.
SELECT AVG(Salary) FROM EMPLOYEE where sex='F';

