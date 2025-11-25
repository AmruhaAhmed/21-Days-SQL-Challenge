use hospital;

-- PQ1: Rank patients by satisfaction score within each service.
SELECT
patient_id,
satisfaction,
service,
RANK() OVER(PARTITION BY service ORDER BY satisfaction DESC ) AS "Rank"
FROM patients;

-- PQ2: Assign row numbers to staff ordered by their name.
SELECT 
staff_id AS "ID",
staff_name AS "Name",
ROW_NUMBER() OVER(ORDER BY staff_name) AS "Row Number"
FROM staff;

-- PQ3:Rank services by total patients admitted.
SELECT 
service,
SUM(patients_admitted) AS "Total Patients Admitted",
RANK() OVER(ORDER BY SUM(patients_admitted) DESC) AS "Rank"
FROM services_weekly
GROUP BY service;

-- Daily Challenge Day 19: For each service, rank the weeks by patient satisfaction score (highest first). Show service, week, patient_satisfaction, patients_admitted, and the rank. Include only the top 3 weeks per service.
SELECT * FROM (
SELECT 
service,
week,
patient_satisfaction,
patients_admitted,
RANK() OVER (PARTITION BY service ORDER BY patient_satisfaction DESC) AS week_rank
FROM services_weekly)d
WHERE week_rank BETWEEN 1 AND 3 ;