USE dreamhome;

-- task 1
SELECT * from staff;

-- task 2
SELECT staffNo, fName, lName, salary
FROM Staff;

-- task 3
SELECT DISTINCT propertyNo
FROM Viewing;

-- task 4
SELECT staffNo, fName, lName, salary/12 as monthlySalary
FROM Staff;

-- task 5
SELECT staffNo, fName, lName, position, salary
FROM Staff
WHERE salary > 10000;

-- task 6
SELECT *
FROM Staff
WHERE salary > 1200;

-- task 7
SELECT *
FROM Branch
WHERE city = 'London' OR city = 'Glasgow';

-- task 8
SELECT staffNo, fName, lName, position, salary
FROM Staff
WHERE salary BETWEEN 20000 AND 30000; 

SELECT staffNo, fName, lName, position, salary
FROM Staff
WHERE salary NOT BETWEEN 20000 AND 30000;

-- task 9
SELECT staffNo, fName, lName, position
FROM Staff
WHERE position IN ('Manager', 'Supervisor');

SELECT staffNo, fName, lName, position
FROM Staff
WHERE position NOT IN ('Manager', 'Supervisor');

-- task 10
SELECT ownerNo, fName, lName, address, telNo
FROM PrivateOwner
WHERE address LIKE '%Glasgow%';

-- task 11
SELECT *
FROM Staff
WHERE position LIKE '%age%';

SELECT *
FROM staff
where lName like '_or_';

-- task 12
SELECT *
FROM Viewing
WHERE propertyNo = 'PG4' AND comment IS NULL;

SELECT *
FROM Viewing
WHERE propertyNo = 'PG4' AND comment IS NOT NULL;

-- task 13
select ownerNo, fName, lName, email 
from PrivateOwner
where email like '%@hotmail.com' or email like '%gmail.com';

-- task 14
select staffNo, fName, lName, position
from Staff
where branchNo is null;

-- task 15
select clientNo, fName, lName, prefType, maxRent
from client
where maxRent >= 500 and prefType = 'Flat' 
or maxRent >= 500 and prefType = 'House';
