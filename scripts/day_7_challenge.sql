use hospital;

-- PQ1: Find services that have admitted more than 500 patients in total.
SELECT 
	service, 
	SUM(patients_admitted) AS "Total Patients Admitted"
FROM services_weekly
GROUP BY service
HAVING SUM(patients_admitted) >500;

-- PQ2: Show services where average patient satisfaction is below 75.
SELECT service, AVG(satisfaction) AS "Average Patient Satisfaction"
FROM patients
GROUP BY service
HAVING AVG(satisfaction)<75;

-- PQ3: List weeks where total staff presence across all services was less than 50.
SELECT week, SUM(present) AS "Total Staff Present"
FROM staff_schedule
GROUP BY week
HAVING SUM(present)<50;

-- Daily Challenge Day 7: Identify services that refused more than 100 patients in total and had an average patient satisfaction below 80. Show service name, total refused, and average satisfaction.
SELECT 
	service, 
	SUM(patients_refused) AS "Total Patients Refused",
	AVG(patient_satisfaction) AS "Average Patient Satisfaction"
FROM services_weekly
GROUP BY service
HAVING SUM(patients_refused)>100  AND AVG(patient_satisfaction)<80;