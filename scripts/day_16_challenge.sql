use hospital;

-- 	PQ1: Find patients who are in services with above-average staff count.
SELECT 
p.patient_id AS "ID",
p.name,
p.service
FROM patients p
WHERE service IN
(SELECT service FROM staff GROUP BY service HAVING COUNT(staff_id) > 
(SELECT AVG(staff_count) FROM (SELECT COUNT(*) AS staff_count FROM staff GROUP BY service) AS s));

-- PQ2: List staff who work in services that had any week with patient satisfaction below 70.
SELECT 
ss.staff_id AS "ID",
ss.staff_name AS "Name",
ss.service,
ss.week,
sw.patient_satisfaction AS "Patient Staisfaction"
FROM staff_schedule ss INNER JOIN services_weekly sw 
ON ss.week=sw.week
WHERE sw.patient_satisfaction<70;

-- PQ3: Show patients from services where total admitted patients exceed 1000.
SELECT 
p.patient_id,
p.name,
p.service,
total_patients_admitted
FROM patients p INNER JOIN
( SELECT service, SUM(patients_admitted) AS total_patients_admitted
FROM services_weekly GROUP BY service) AS s
ON p.service=s.service
WHERE total_patients_admitted>1000;

-- Daily Challenge Day 16: Find all patients who were admitted to services that had at least one week where patients were refused AND the average patient satisfaction for that service was below the overall hospital average satisfaction. Show patient_id, name, service, and their personal satisfaction score.
SELECT 
p.patient_id,
p.name,
p.service,
p.satisfaction
FROM patients p
WHERE service IN 
(SELECT service FROM services_weekly GROUP BY service  HAVING SUM(patients_admitted)>0 
AND  AVG(patient_satisfaction)<(SELECT AVG(satisfaction) FROM patients));

