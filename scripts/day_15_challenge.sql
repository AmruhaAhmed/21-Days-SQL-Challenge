use hospital;
-- Daily Challenge Day 15:  Create a comprehensive service analysis report for week 20 showing: service name, total patients admitted that week, total patients refused, average patient satisfaction, count of staff assigned to service, and count of staff present that week. Order by patients admitted descending.

SELECT 
	sw.service AS "Service",
	SUM(sw.patients_admitted) AS "Total Patients Admitted",
	SUM(sw.patients_refused) AS "Total Patients Refused",
	AVG(sw.patient_satisfaction) AS "Average Patient Satisfaction",
	COUNT(DISTINCT s.staff_id) AS "Count of Staff Assigned",
	COUNT(CASE WHEN ss.present=1 THEN 1 END) AS "Count of Staff Present"
FROM services_weekly sw LEFT JOIN staff s ON sw.service=s.service 
LEFT JOIN staff_schedule ss ON s.staff_id=ss.staff_id AND sw.week=ss.week
WHERE sw.week=20 
GROUP BY sw.service
ORDER BY SUM(sw.patients_admitted) DESC;

