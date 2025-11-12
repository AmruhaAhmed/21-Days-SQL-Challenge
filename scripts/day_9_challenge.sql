use hospital;

-- PQ1: Extract the year from all patient arrival dates. Method 1
SELECT YEAR(arrival_date) AS "Arrival Year"
FROM patients;

-- PQ1: Extract the year from all patient arrival dates. Method 2
SELECT EXTRACT(YEAR FROM arrival_date) AS "Arrival Year"
FROM patients; 

-- PQ2: Calculate the length of stay for each patient (departure_date - arrival_date)
SELECT 
patient_id,
DATEDIFF(departure_date,arrival_date) AS "Length of Stay"
FROM patients;

-- PQ3: Find all patients who arrived in a specific month. Method 1
SELECT 
	patient_id,
    arrival_date,
	MONTH(arrival_date) AS "Month"
FROM patients
WHERE MONTH(ARRIVAL_DATE)=1;

-- PQ3: Find all patients who arrived in a specific month. Method 2
SELECT 
	patient_id,
	arrival_date,
	EXTRACT(MONTH FROM arrival_date) AS "month"
FROM patients
WHERE EXTRACT(MONTH FROM arrival_date)=1;

-- Daily Challenge Day 9: Calculate the average length of stay (in days) for each service, showing only services where the average stay is more than 7 days. Also show the count of patients and order by average stay descending.
SELECT 
	service,
	ROUND(AVG(DATEDIFF(departure_date,arrival_date))) AS Average_Length_Of_Stay,
	COUNT(patient_id) AS "Number of Patients"
FROM patients
GROUP BY service
HAVING Average_Length_Of_Stay>7
ORDER BY Average_Length_Of_Stay DESC;
