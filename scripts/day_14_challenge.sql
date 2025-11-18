use hospital;

SELECT 
s.staff_id,
s.staff_name,
s.role,
s.service,
COUNT(DISTINCT ss.week) AS "Count of Weeks"
FROM staff s LEFT JOIN staff_schedule ss
ON s.staff_id=ss.staff_id
WHERE ss.present=1
GROUP BY s.staff_id,s.staff_name,s.role,s.service
ORDER BY COUNT(DISTINCT ss.week) DESC