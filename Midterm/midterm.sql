use hospitalDB;

-- question 1
select * from patients
where insurance_info = 'InsureCorp A';

-- question 2
select * from doctors
where name like '%son%';

-- question 3
select * from appointments
where appointment_date like '2024-04-01%';

-- question 4
select d.doctor_id, d.name as doctor_name, e.name as department_name
from doctors d, departments e
where d.department_id = e.department_id
order by department_name desc, doctor_name asc;

-- question 6
select status, count(*) as appointment_count
from appointments
group by status;

-- question 7
select a.appointment_id, a.appointment_date, a.status, 
p.name as patient_name, d.name as doctor_name, e.name as department_name
from appointments a, patients p, doctors d, departments e 
where a.patient_id = p.patient_id 
and a.doctor_id = d.doctor_id
and d.department_id = e.department_id
and a.appointment_date like '2024-04-04%'
and a.status = 'Scheduled'
order by department_name;

-- question 8
select a.patient_id, p.name 
from appointments a, patients p
where p.patient_id = a.patient_id
and a.status = 'Completed'
group by a.patient_id 
having count(*) > 1;

-- question 9
select distinct a.doctor_id, d.name
from appointments a, doctors d
where a.doctor_id = d.doctor_id
and a.status = 'Completed';

-- question 10
-- a
insert into departments(name, location)
values('Dental', 'New Building');

-- b 
select department_id, name, location, head
from departments 
where department_id not in 
(select department_id 
from doctors);

-- question 12
update departments
set location = 'McLaury Building'
where name = 'Emergency';

select * from departments;