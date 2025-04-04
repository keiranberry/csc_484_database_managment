use dreamhome;

-- task 1
select c.clientNo, fName, lName, propertyNo, comment
from Client c, Viewing v
where c.clientNo = v.clientNo;

-- task 2

-- version 1
select c.clientNo, fName, lName, propertyNo, comment
from Client c join Viewing v on c.clientNo = v.clientNo;

-- version 2
select c.clientNo, fName, lName, propertyNo, comment
from Client c join Viewing using (clientNo);

-- version 3
select c.clientNo, fName, lName, propertyNo, comment
from Client c natural join Viewing;

-- task 3
select s.branchNo, s.staffNo, fName, lName, propertyNo
from Staff s, PropertyForRent p
where s.staffNo = p.staffNo
order by s.branchNo, s.staffNo, propertyNo;

-- task 4

-- version 1
select s.branchNo, s.staffNo, fName, lName, propertyNo
from Staff s join PropertyForRent p on s.staffNo = p.staffNo
order by s.branchNo, s.staffNo, propertyNo;

-- version 2
select s.branchNo, s.staffNo, fName, lName, propertyNo
from Staff s join PropertyForRent using (staffNo)
order by s.branchNo, s.staffNo, propertyNo;

-- version 3
select s.branchNo, s.staffNo, fName, lName, propertyNo
from Staff s natural join PropertyForRent
order by s.branchNo, s.staffNo, propertyNo;

-- task 5
select s.branchNo, b.city, s.staffNo, s.fName, s.lName, propertyNo
from Staff s, PropertyForRent p, Branch b
where s.staffNo = p.staffNo and s.branchNo = b.branchNo
order by s.branchNo, s.staffNo, propertyNo;

-- task 6

-- version 1
select s.branchNo, s.staffNo, fName, lName, propertyNo
from Staff s join PropertyForRent p join Branch b 
on s.staffNo = p.staffNo and s.branchNo = b.branchNo
order by s.branchNo, s.staffNo, propertyNo;

-- version 2
select s.branchNo, b.city, s.staffNo, s.fName, s.lName, propertyNo
from Branch b join Staff s using (branchNo) 
join PropertyForRent p using (staffNo)
order by s.branchNo, s.staffNo, propertyNo;

-- version 3
select b.branchNo, b.city, s.staffNo, s.fName, s.lName, p.propertyNo
from (Branch b natural join Staff s)
join PropertyForRent p on s.staffNo = p.staffNo
order by b.branchNo, s.staffNo, p.propertyNo;

-- version 4
select Distinct s.branchNo, p.city, s.staffNo, s.fName, s.lName, p.propertyNo
from Staff s natural join PropertyForRent p, Staff natural join Branch b
order by branchNo, staffNo, propertyNo;

-- task 7

-- version 1
select s.branchNo, s.staffNo, count(propertyNo) as myCount
from Staff s, PropertyForRent p
where s.staffNo = p.staffNo
group by s.staffNo
order by s.branchNo;

-- version 2
select s.branchNo, s.staffNo, count(propertyNo) as myCount
from Staff s join PropertyForRent using (staffNo)
group by s.staffNo
order by s.branchNo;

-- version 3
select s.branchNo, s.staffNo, count(propertyNo) as myCount
from Staff s natural join PropertyForRent
group by s.staffNo
order by s.branchNo;

-- version 4
select s.branchNo, s.staffNo, count(*) as myCount
from Staff s join PropertyForRent p on s.staffNo = p.staffNo
group by s.staffNo
order by s.branchNo;

-- task 8
select b.*, p.*
from Branch b left join PropertyForRent p on b.City = p.City;

-- task 9
select b.*, p.*
from Branch b right join PropertyForRent p on b.City = p.City;

-- task 10
select b.*, p.*
from Branch b left join PropertyForRent p on b.City = p.City
union
select b.*, p.*
from Branch b right join PropertyForRent p on b.City = p.City;