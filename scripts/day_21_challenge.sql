use hospital;

-- Daily Challenge Day 21: Create a comprehensive hospital performance dashboard using CTEs. 
-- Calculate: 1) Service-level metrics (total admissions, refusals, avg satisfaction), 
-- 2) Staff metrics per service (total staff, avg weeks present), 
-- 3) Patient demographics per service (avg age, count). 
-- Then combine all three CTEs to create a final report showing service name, all calculated metrics, 
-- and an overall performance score (weighted average of admission rate and satisfaction). Order by performance score descending.

WITH service_metrics AS (
SELECT
service,
SUM(patients_admitted) AS Total_Admissions,
SUM(patients_refused) AS Total_Refusals,
AVG(patient_satisfaction) AS Average_Satisfaction
FROM services_weekly
GROUP BY service),
staff_metrics AS 
(
SELECT 
service,
COUNT(DISTINCT staff_id) AS Total_Staff,
ROUND(AVG(weekly_present)) AS Average_Weeks_Present
FROM
(
SELECT service, staff_id, COUNT(*)  AS weekly_present
FROM staff_schedule
WHERE present=1
GROUP BY service,staff_id
)d GROUP BY service),
patient_metrics AS 
(
SELECT 
service,
ROUND(AVG(age),0) AS Average_Age,
COUNT(DISTINCT patient_id) AS Patient_Count
FROM patients
GROUP BY service)

SELECT 
service_m.service,
service_m.Total_Admissions,
service_m.Total_Refusals,
service_m.Average_Satisfaction,
staff_m.Total_Staff,
staff_m.Average_Weeks_Present,
patient_m.Average_Age,
patient_m.Patient_Count,
((service_m.Total_Admissions/(service_m.Total_Admissions+service_m.Total_Refusals)) *0.3 + service_m.Average_Satisfaction*0.7) AS Performance_Score
FROM service_metrics  service_m  
JOIN staff_metrics staff_m 
ON service_m.service=staff_m.service
JOIN patient_metrics patient_m
ON staff_m.service=patient_m.service
ORDER BY performance_score DESC;





 