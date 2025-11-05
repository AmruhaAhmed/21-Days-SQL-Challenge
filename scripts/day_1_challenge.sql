use hospital;

-- PQ1: Retrieve all columns from the patients table.
SELECT *
FROM patients;

-- PQ2: Select only the patient_id, name, and age columns from the patients table.
SELECT patient_id,name,age
FROM patients;

-- PQ3: Display the first 10 records from the services_weekly table.
SELECT * 
FROM services_weekly
LIMIT 10;

-- Daily Challenge Day 1 
SELECT DISTINCT service
FROM services_weekly;