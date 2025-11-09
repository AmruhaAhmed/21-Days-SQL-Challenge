use hospital;

-- PQ1: Count the number of patients by each service.
SELECT  service,COUNT(patient_id) AS "Total Patients"
FROM patients
GROUP BY service;

-- PQ2: Calculate the average age of patients grouped by service.
SELECT service, ROUND(AVG(age),0) AS "Average Age"
FROM PATIENTS
GROUP BY service;

-- PQ3: Find the total number of staff members per role.
SELECT role, COUNT(staff_id) AS "Total Staff"
FROM staff
GROUP BY role;

-- Daily Challenge Day 6: For each hospital service, calculate the total number of patients admitted, total patients refused, and the admission rate (percentage of requests that were admitted). Order by admission rate descending.
SELECT  service, 
SUM(patients_admitted) AS "Total Patients Admitted",
SUM(patients_refused) AS "Total Patients Refused",
ROUND(((SUM(patients_admitted)/SUM(patients_request)) *100),2) AS "Admission Rate"
FROM services_weekly
GROUP BY service
ORDER BY "Admission Rate" DESC;
