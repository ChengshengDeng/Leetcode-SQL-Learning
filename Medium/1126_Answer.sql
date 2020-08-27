SELECT b.business_id
FROM(
SELECT e.business_id 
FROM Events e
JOIN(
SELECT event_type, AVG(occurences) AS num FROM Events GROUP BY event_type) a
ON e.event_type = a.event_type 
WHERE e.occurences > a.num )b 
GROUP BY 1
HAVING COUNT(b.business_id) > 1  