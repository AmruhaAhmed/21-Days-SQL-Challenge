use hospital;

-- PQ1: Calculate running total of patients admitted by week for each service.
SELECT 
service,
week,
SUM(patients_admitted) OVER(PARTITION BY SERVICE ORDER BY week ASC) AS "Running Total"
FROM services_weekly;

-- PQ2: Find the moving average of patient satisfaction over 4-week periods.
SELECT 
service,
week,
AVG(patient_satisfaction) OVER (PARTITION BY service ORDER BY week ASC  ROWS BETWEEN CURRENT ROW AND 3 FOLLOWING) AS "Moving Average"
FROM services_weekly;

-- PQ3: Show cumulative patient refusals by week across all services.
SELECT 
service,
week,
patients_refused,
SUM(patients_refused) OVER(ORDER BY week ASC) AS "Cumulative Patient Refusals"
FROM services_weekly;

-- Daily Challenge Day 20:  Create a trend analysis showing for each service and week: week number, patients_admitted, running total of patients admitted (cumulative), 3-week moving average of patient satisfaction (current week and 2 prior weeks), and the difference between current week admissions and the service average. Filter for weeks 10-20 only.
SELECT 
week,
patients_admitted,
SUM(patients_admitted) OVER (PARTITION BY SERVICE ORDER BY week ASC) AS "Running Total of Patients Admitted",
ROUND(AVG(patient_satisfaction) OVER (PARTITION BY SERVICE ORDER BY week ASC ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)) AS "Moving Average of Patient Satisfaction",
ABS(patients_admitted-ROUND(AVG(patients_admitted) OVER (PARTITION BY service ORDER BY week ASC))) AS "Difference"
FROM services_weekly
WHERE week BETWEEN 10 AND 20;

