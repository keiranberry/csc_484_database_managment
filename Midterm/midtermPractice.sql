use hospitalDB;

select * from doctors
where specialization not in ('Cardiology', 'Radiology');

select * from patients
where address like '%st';

select * from appointments
where status = 'Completed'
order by appointment_date desc;

SELECT *
FROM patients
WHERE dob BETWEEN '1980-01-01' AND '1980-12-31';

SELECT patient_id, COUNT(*) AS apts
FROM appointments
GROUP BY patient_id
HAVING COUNT(*) >= 2
order by patient_id desc;

select patient_id, COUNT(reason) 
as totalreasons
from appointments
group by patient_id;

SELECT *
FROM appointments
WHERE doctor_id in (SELECT doctor_id
 FROM doctors
 WHERE department_id = (SELECT department_id
 FROM departments
WHERE head = 'Dr. Carol Davis'));

-- version 1
select a.patient_id, a.appointment_date, a.reason, p.name, p.phone
from appointments a join patients p on a.patient_id = p.patient_id;

-- version 2
select a.patient_id, a.appointment_date, a.reason, p.name, p.phone
from appointments a join patients p using (patient_id);

-- version 3
select a.patient_id, a.appointment_date, a.reason, p.name, p.phone
from appointments a natural join patients p;