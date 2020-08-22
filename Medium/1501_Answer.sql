SELECT c.name AS Country 
FROM Country c 
JOIN Person p 
ON c.country_code = LEFT(p.phone_number,3) 
JOIN Calls a 
ON a.caller_id = p.id OR a.callee_id = p.id 
GROUP BY c.name 
HAVING AVG(a.duration) > (SELECT AVG(duration) FROM Calls)