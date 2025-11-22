use hospital;

-- PQ1:Show each patient with their service's average satisfaction as an additional column.
SELECT 
patient_id AS "ID",
p.service AS "service",
ROUND(avg_patient_satisfaction,2) AS "Average Patient Satifaction"
FROM patients p JOIN 
(SELECT AVG(patient_satisfaction) AS avg_patient_satisfaction , service FROM services_weekly GROUP BY  service) AS s
ON p.service=s.service;

-- PQ2: Create a derived table of service statistics and query from it
SELECT * FROM 
(SELECT 
ROUND(AVG(available_beds)) AS "Average Available Beds",
ROUND(AVG(patients_request)) AS "Average Patients Request",
ROUND(AVG(patients_admitted))AS "Average Patients Admitted",
ROUND(AVG(patients_refused)) AS "Average Patients Refused",
ROUND(AVG(patient_satisfaction)) AS "Average Patient Satisfaction",
service
FROM services_weekly
GROUP BY service) AS stats;

-- PQ3:  Display staff with their service's total patient count as a calculated field.
SELECT staff_id AS "ID",
s.service AS "service",
patients_count AS "Total Patients"
FROM 
staff s INNER JOIN 
(SELECT service, COUNT(patient_id) AS patients_count FROM patients GROUP BY service) AS p
ON s.service=p.service;

-- Daily Challenge Day 17: Create a report showing each service with: service name, total patients admitted, the difference between their total admissions and the average admissions across all services, and a rank indicator ('Above Average', 'Average', 'Below Average'). Order by total patients admitted descending.
SELECT 
service,
SUM(patients_admitted) AS "Total Patients Admitted",
ABS(SUM(patients_admitted) - ROUND((SELECT AVG(total) FROM (SELECT SUM(patients_admitted) AS total FROM services_weekly GROUP BY service) AS d1)))AS "Difference",
CASE 
WHEN  SUM(patients_admitted)> (SELECT AVG(total) FROM (SELECT SUM(patients_admitted) AS total FROM services_weekly GROUP BY service)  AS d3) THEN "Above Average"
WHEN  SUM(patients_admitted)< (SELECT AVG(total) FROM (SELECT SUM(patients_admitted) AS total FROM services_weekly GROUP BY service) AS d4) THEN "Below Average"
ELSE "Average"
END AS "Category"
FROM services_weekly 
GROUP BY service;
