DELETE p1 
FROM Person AS p1 
LEFT JOIN Person As p2
on p1.Email = p2.Email 
WHERE p1.Id > p2.Id ;