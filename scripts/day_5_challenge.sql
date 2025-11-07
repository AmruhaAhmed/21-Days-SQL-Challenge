use hospital;

-- PQ1: Count the total number of patients in the hospital.
SELECT COUNT(patient_id) AS "Total Patients"
FROM patients;

-- PQ2: Calculate the average satisfaction score of all patients.
SELECT AVG(satisfaction) AS "Average Satisfaction Score"
FROM patients;

-- PQ3: Find the minimum and maximum age of patients.
SELECT MIN(age) AS "Minimum Age" , MAX(age) AS "Maximum Age" 
FROM patients;

-- Daily Challenge Day 5: Calculate the total number of patients admitted, total patients refused, and the average patient satisfaction across all services and weeks. Round the average satisfaction to 2 decimal places.
SELECT SUM(patients_admitted) AS "Total Patients Admitted",
SUM(patients_refused) AS "Total Patients Refused",
ROUND(AVG(patient_satisfaction),2) AS "Average Patient Satisfaction"
FROM services_weekly;

