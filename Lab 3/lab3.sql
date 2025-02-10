use dreamhome;

-- task 1
SELECT staffNo, fName, lName, Salary
FROM Staff
ORDER BY salary DESC;

-- task 2
SELECT propertyNo, type, rooms, rent
FROM PropertyForRent
ORDER BY type;

SELECT propertyNo, type, rooms, rent
FROM PropertyForRent
ORDER BY type, rent DESC;

-- task 3
SELECT COUNT(*) AS myCount
FROM PropertyForRent
WHERE rent > 350;

-- task 4
SELECT propertyNo
FROM Viewing
WHERE viewDate BETWEEN '2013-05-01' AND '2013-05-30';

SELECT COUNT(propertyNo) AS propCount
FROM Viewing
WHERE viewDate BETWEEN '2013-05-01' AND '2013-05-30';

SELECT COUNT(DISTINCT propertyNo) AS propCount
FROM Viewing
WHERE viewDate BETWEEN '2013-05-01' AND '2013-05-30';

-- task 5
SELECT COUNT(staffNo) AS NumOfManagers, SUM(salary) AS TotalSalary
FROM Staff
WHERE position = 'Manager';

-- task 6
SELECT MIN(salary) AS MinSalary,
 MAX(salary) AS MaxSalary,
 AVG(salary) AS AvgSalary
FROM Staff;

-- task 7
SELECT branchNo,
 COUNT(staffNo) AS NumOfStaff,
 SUM(salary) AS SalarySum
FROM Staff
GROUP BY branchNo
ORDER BY branchNo;

-- task 8
SELECT branchNo,
 COUNT(staffNo) AS NumOfStaff,
 SUM(salary) AS SalarySum
FROM Staff
GROUP BY branchNo
HAVING COUNT(staffNo) > 1
ORDER BY branchNo;

-- task 8 (again)
SELECT propertyNo, type, rooms, rent
FROM PropertyForRent
WHERE rooms > 3
ORDER BY rent;

-- task 9
SELECT propertyNo, COUNT(*) AS ViewCount
FROM Viewing
GROUP BY propertyNo
HAVING COUNT(*) > 1;

-- task 10
SELECT branchNo, AVG(salary) AS AvgSalary
FROM Staff
GROUP BY branchNo
HAVING AVG(salary) > 15000;

-- task 11
SELECT clientNo, COUNT(*) AS Views
FROM Viewing
GROUP BY clientNo
HAVING COUNT(*) >= 3;

-- task 12
SELECT city, AVG(rent) AS AvgRent
FROM PropertyForRent
GROUP BY city;