\dt

SELECT s.sid, s.sname, COUNT(c.pid) AS total_parts_supplied 

FROM suppliers s 

JOIN catalog c ON s.sid = c.sid

GROUP BY s.sid, s.sname;

SELECT s.sid, s.sname, COUNT(c.pid) AS total_parts_supplied

FROM suppliers s

JOIN catalog c ON s.sid = c.sid

GROUP BY s.sid, s.sname

HAVING COUNT(c.pid) >= 3;

SELECT s.sid, s.sname, COUNT(c.pid) AS total_parts_supplied

FROM suppliers s

JOIN catalog c ON s.sid = c.sid

JOIN parts p ON c.pid = p.pid

WHERE p.color = 'Green'

GROUP BY s.sid, s.sname

HAVING 
    COUNT(c.pid) = (
        SELECT COUNT(c2.pid)
        FROM catalog c2
        JOIN parts p2 ON c2.pid = p2.pid
        WHERE c2.sid = s.sid
    );

SELECT s.sid, s.sname, MAX(c.cost) AS most_expensive_part

FROM suppliers s

JOIN catalog c ON s.sid = c.sid

JOIN parts p ON c.pid = p.pid

WHERE s.sid IN (
        SELECT c1.sid
        FROM catalog c1
        JOIN parts p1 ON c1.pid = p1.pid
        WHERE p1.color = 'Green'
    )
    AND s.sid IN (
        SELECT c2.sid
        FROM catalog c2
        JOIN parts p2 ON c2.pid = p2.pid
        WHERE p2.color = 'Red'
    )

GROUP BY s.sid, s.sname;

\q