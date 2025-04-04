USE store;

-- task 1
select first_name, last_name, points
from customers
order by points desc;

-- task 2
select * 
from customers
where state = 'VA'
order by last_name;

-- task 3
select *
from customers
where address like '%race%';

-- task 4
select state, SUM(points)
as TotalPoints
from customers
group by state;

-- task 5
select state, COUNT(customer_id) 
as TotalCustomers
from customers
group by state;

-- task 6
select MAX(points) as Maximum,
MIN(points) as Minimum,
AVG(points) as Average
from customers;

-- task 7
select state,
SUM(points) as TotalPoints
from customers
group by state
having SUM(points) > 3000;

-- task 8
select first_name, last_name, points,
(points + 10) * 100 as discount
from customers;

-- task 9
select name, unit_price,
unit_price * 1.1 as newPrice
from products;

-- task 10
select * from orders
where order_date like '2018%';
