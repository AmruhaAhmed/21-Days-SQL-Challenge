use hospital;

-- PQ1: List all unique services in the patients table.
SELECT 
DISTINCT service 
FROM patients;

-- PQ2: Find all unique staff roles in the hospital.
SELECT 
DISTINCT role
FROM staff;

-- PQ3: Get distinct months from the services_weekly table.
SELECT 
DISTINCT month
FROM services_weekly;

-- Daily Challenge Day 11: Find all unique combinations of service and event type from the services_weekly table where events are not null or none, along with the count of occurrences for each combination. Order by count descending.
SELECT 
DISTINCT service, event,
COUNT(*) AS "Count of Occurence"
FROM services_weekly
WHERE event IS NOT NULL AND event <>"None"
GROUP BY service, event
ORDER BY COUNT(*) DESC;
