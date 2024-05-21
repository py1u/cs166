\dt

SELECT pid
FROM Catalog
WHERE cost < 10;
    pname

SELECT p.pname
FROM Catalog c
JOIN Parts p ON c.pid = p.pid
WHERE c.cost < 10;

SELECT s.address
FROM Suppliers s 
JOIN Catalog c ON s.sid = c.sid 
JOIN Parts p ON c.pid = p.pid 
WHERE p.pname = 'fire hydrant supply';

SELECT s.sname
FROM Suppliers s 
JOIN Catalog c ON s.sid = c.sid 
JOIN Parts p ON c.pid = p.pid 
WHERE p.color = 'green';
    sname

SELECT s.sname AS SupplierName, p.pname AS PartName
FROM Suppliers s 
JOIN Catalog c ON s.sid = c.sid 
JOIN Parts p ON c.pid = p.pid 
ORDER BY  s.sname, p.pname;
    suppliername
    
\q