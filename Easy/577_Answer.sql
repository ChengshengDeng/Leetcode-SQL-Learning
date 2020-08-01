SELECT a.name AS name,
       b. bonus AS bonus 
FROM Employee AS a 
LEFT JOIN Bonus AS b 
ON a.empId = b.empId 
WHERE (b.bonus <1000) OR b.bonus IS NULL