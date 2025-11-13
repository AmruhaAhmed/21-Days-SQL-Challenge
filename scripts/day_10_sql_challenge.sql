use hospital;

-- PQ1: Categorise patients as 'High', 'Medium', or 'Low' satisfaction based on their scores.
SELECT 
	patient_id AS "ID",
	name,
	satisfaction,
	CASE 
		WHEN satisfaction BETWEEN 75 AND 100 THEN "High"
		WHEN satisfaction BETWEEN 50 AND 74 THEN "Medium"
		ELSE "Low"
	END AS "Satisfaction Group"
FROM patients;

-- PQ2: Label staff roles as 'Medical' or 'Support' based on role type.
SELECT 
	staff_id AS "ID",
	role,
	CASE 
		WHEN role IN ('doctor','nurse') THEN "Medical"
		ELSE "Support"
	END AS "Category"
FROM staff; 

-- PQ3: Create age groups for patients (0-18, 19-40, 41-65, 65+).
SELECT 
patient_id AS "ID",
age,
CASE 
	WHEN age BETWEEN 0 AND 18 THEN "Child"
	WHEN age BETWEEN 19 AND 40 THEN "Young Adult"
	WHEN age BETWEEN 41 AND 65 THEN "Adult"
	ELSE "Senior"
END AS "Age Group"
FROM patients;

-- Daily Challenge Day 10: Create a service performance report showing service name, total patients admitted, and a performance category based on the following: 'Excellent' if avg satisfaction >= 85, 'Good' if >= 75, 'Fair' if >= 65, otherwise 'Needs Improvement'. Order by average satisfaction descending.
SELECT 
	service,
	COUNT(patients_admitted) AS "Total Patients Admitted",
	CASE
		WHEN AVG(patient_satisfaction) BETWEEN 85 AND 100 THEN "Excellent"
		WHEN AVG(patient_satisfaction) BETWEEN 75 AND 84 THEN "Good"
		WHEN AVG(patient_satisfaction) BETWEEN 65 AND 74 THEN "Fair"
		ELSE "Needs Improvement"
	END AS "Performance Category"
FROM services_weekly
GROUP BY service
ORDER BY AVG(patient_satisfaction) DESC;

