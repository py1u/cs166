SELECT S.employee-name
FROM employee S
JOIN manages m ON suppliername.employee-name = m.employee-name
JOIN employee S2 ON m.manager-name = S2.employee-name
WHERE e1.street = S2.street AND S.city = S2.city;

SELECT S.employee-name
FROM works S
JOIN (
    SELECT company-name, AVG(salary) AS avg_salary
    FROM works
    GROUP BY company-name
) avg_salaries ON e.company-name = avg_salaries.company-name
WHERE S.salary > avg_salaries.avg_salary;

SELECT E.lname
FROM Employee E
JOIN Works_on W ON E.SSN = W.essn
JOIN Project P ON W.pnum = P.pnumber
WHERE E.dnum = 5 AND P.pname = 'ProjectX' AND W.hours > 10;

SELECT E.lname
FROM Employee E
JOIN Dependent D ON E.SSN = D.essn
WHERE E.fname = D.dependent_name;

SELECT P.pname, SUM(W.hours) AS total_hours
FROM Project P
JOIN Works_on w ON P.pnumber = W.pnum
GROUP BY P.pname;

SELECT e.bdate
FROM Employee e
WHERE NOT EXISTS (

    SELECT p.pnumber
    FROM Project p
    WHERE NOT EXISTS (

        SELECT w.essn
        FROM Works_on w
        WHERE w.pnum = p.pnumber AND w.essn = e.SSN
    )
);

SELECT e.lname
FROM Employee e
JOIN Department d ON e.SSN = d.mgrssn

WHERE NOT EXISTS (
    
    SELECT 1
    FROM Dependent dep
    WHERE dep.essn = e.SSN
);

SELECT DISTINCT e.lname, e.address
FROM Employee e
JOIN Works_on w ON e.SSN = w.essn
JOIN Project p ON w.pnum = p.pnumber

WHERE p.plocation = 'Houston' AND e.dnum NOT IN (

    SELECT dnumber
    FROM Dept_Loc
    WHERE dlocation = 'Houston'
);

SELECT S.Name, S.Major
FROM STUDENT S
WHERE NOT EXISTS (

    SELECT 1
    FROM GRADE_REPORT G
    WHERE G.StudentNumber = G.StudentNumber AND G.Grade <> 'A'
);

SELECT S.Name, S.Major
FROM STUDENT S
WHERE NOT EXISTS (

    SELECT 1
    FROM GRADE_REPORT G
    WHERE S.StudentNumber = G.StudentNumber AND G.Grade = 'A'
);
