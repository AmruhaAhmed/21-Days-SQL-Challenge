use hospital;

-- PQ1: Find all patients who are older than 60 years.
SELECT patient_id,name,age
FROM patients
WHERE AGE>60;

-- PQ2: Retrieve all staff members who work in the 'Emergency' service.
SELECT staff_id,staff_name,service
FROM staff
WHERE service="Emergency";

-- PQ3: List all weeks where more than 100 patients requested admission in any service.
SELECT week,patients_request
FROM services_weekly
WHERE patients_request>100;

-- Daily Challenge Day 2
SELECT patient_id, name, age,satisfaction
FROM patients
WHERE satisfaction<70 AND service='Surgery';
