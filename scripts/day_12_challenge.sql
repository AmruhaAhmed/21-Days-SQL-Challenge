use hospital;

-- PQ1: Find all weeks in services_weekly where no special event occurred.
SELECT  DISTINCT week, event 
FROM services_weekly
WHERE event = "none" or event IS NULL;

-- PQ2: Count how many records have null or empty event values.
SELECT COUNT(*) AS "Count of Null Values"
FROM services_weekly
WHERE event IS NULL OR event ="none";

-- PQ3: List all services that had at least one week with a special event.
SELECT DISTINCT service, COUNT(week) AS "Count of Special Events"
FROM services_weekly
WHERE event<>"none" AND event IS NOT NULL
GROUP BY service
HAVING COUNT(week)>=1 ;

-- Daily Challenge Day 12: Analyze the event impact by comparing weeks with events vs weeks without events. Show: event status ('With Event' or 'No Event'), count of weeks, average patient satisfaction, and average staff morale. Order by average patient satisfaction descending.
SELECT 
CASE 
	WHEN event="none" OR event IS NULL THEN "No Event"
	ELSE "With Event"
END AS "Event Status",
COUNT(DISTINCT week) AS "Count of Weeks",
AVG(patient_satisfaction) AS "Average Patient Satisfaction",
AVG(staff_morale) AS "Average Staff Morale"
FROM services_weekly
GROUP BY 
	CASE 
		WHEN event="none" OR event IS NULL THEN "No Event"
		ELSE "With Event"
	END 
ORDER BY AVG(patient_satisfaction) DESC;