USE dreamhome;

-- task 1
SELECT staffNo, fName, lName, position
FROM Staff
WHERE branchNo = (SELECT branchNo
 FROM Branch
 WHERE street = '163 Main St');
 
 -- task 2
 SELECT staffNo, fName, lName, position,
 salary - (SELECT AVG (salary) FROM Staff) AS salDiff
FROM Staff
WHERE salary > (SELECT AVG(salary) FROM Staff);

-- task 3
SELECT propertyNo, street, city, postcode, type, rooms, rent
FROM PropertyForRent
WHERE staffNo IN (SELECT staffNo
 FROM Staff
 WHERE branchNo = (SELECT branchNo
 FROM Branch
WHERE street = '163 Main St'));

-- task 4
SELECT staffNo, fName, lName, position, salary
FROM Staff
WHERE salary > SOME (SELECT salary
 FROM Staff
 WHERE branchNo = 'B003');

-- task 5
SELECT staffNo, fName, lName, position, salary
FROM Staff
WHERE salary > (SELECT MIN(salary)
 FROM Staff
 WHERE branchNo = 'B003');
 
 -- task 6
 SELECT staffNo, fName, lName, position, salary
FROM Staff
WHERE salary > ALL (SELECT salary
 FROM Staff
 WHERE branchNo = 'B003');
 
 -- task 7
  SELECT staffNo, fName, lName, position, salary
FROM Staff
WHERE salary > (SELECT MAX(salary)
 FROM Staff
 WHERE branchNo = 'B003');
 
-- task 8
USE store;

select first_name, last_name, points
from customers
where points > (select sum(points)
from customers
where state = 'VA');

-- task 9
select first_name, last_name, points
from customers
where points < (select avg(points)
from customers);

-- task 10
select first_name, last_name, state, points
from customers
where points > some(select points
from customers
where state = 'VA')
order by points desc;

-- task 11
select product_id, name 
from products
where product_id in (select product_id 
from order_items 
where order_id in (select order_id 
from orders 
where customer_id = (select customer_id
from customers
where first_name = 'Levy')));

-- task 12
SELECT order_id, 
SUM(quantity * unit_price) AS OrderTotal
FROM order_items
GROUP BY order_id
HAVING OrderTotal > 50;

-- task 13.i
CREATE VIEW CustomerWithOver1500Points AS
SELECT * 
FROM customers
WHERE points > 1500;

-- task 13.ii
SELECT * 
FROM CustomerWithOver1500Points 
WHERE points >= 1500
ORDER BY points ASC;