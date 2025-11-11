use hospital;

-- PQ1: Convert all patient names to uppercase.
SELECT name, UPPER(name) AS "Name in Uppercase"
FROM patients;

-- PQ2: Find the length of each staff member's name.
SELECT staff_name, LENGTH(staff_name) AS "Length"
FROM staff;

-- PQ3: Concatenate staff_id and staff_name with a hyphen separator.
SELECT CONCAT(staff_id,"-",staff_name)  AS "Concatenated Result"
FROM staff;

-- Create a patient summary that shows patient_id, full name in uppercase, service in lowercase, age category (if age >= 65 then 'Senior', if age >= 18 then 'Adult', else 'Minor'), and name length. Only show patients whose name length is greater than 10 characters.
SELECT 
	patient_id AS "ID",
	UPPER(name) AS "Name",
	LENGTH(name) AS "Name Length",
	LOWER(service) AS "service",
	CASE 
		WHEN age>=65 THEN "Senior"
		WHEN age>=18 THEN "Adult"
		ELSE "Minor" 
	END AS "Age Group"
FROM patients
WHERE LENGTH(NAME)>10;
