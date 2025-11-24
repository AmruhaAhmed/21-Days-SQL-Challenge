use hospital;

-- PQ1: Combine patient names and staff names into a single list.
SELECT patient_id AS "ID", name FROM patients
UNION ALL
SELECT staff_id,staff_name FROM staff;

-- PQ2: Create a union of high satisfaction patients (>90) and low satisfaction patients (<50).
SELECT patient_id AS "ID", satisfaction FROM patients WHERE satisfaction>90
UNION 
SELECT patient_id , satisfaction FROM patients WHERE satisfaction<50;

-- PQ3: List all unique names from both patients and staff tables.
SELECT  DISTINCT name FROM patients
UNION 
SELECT DISTINCT staff_name FROM staff;

-- Daily Challenge Day 18: Create a comprehensive personnel and patient list showing: identifier (patient_id or staff_id), full name, type ('Patient' or 'Staff'), and associated service. Include only those in 'surgery' or 'emergency' services. Order by type, then service, then name.

SELECT patient_id, name AS name, "Patient" AS type, service FROM patients WHERE service in ("surgery","emergency")
UNION ALL
SELECT staff_id,staff_name AS name,"Staff" AS type,service FROM staff WHERE service in ("surgery","emergency")
ORDER BY type, service, name;
