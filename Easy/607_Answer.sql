SELECT name 
FROM salesperson 
WHERE name NOT IN 
	(SELECT s.name 
	FROM salesperson s
	JOIN orders o 
	ON s.sales_id = o.sales_id
	JOIN company c
	ON c.com_id = o.com_id
	WHERE c.name = 'RED') 