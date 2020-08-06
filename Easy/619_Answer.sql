SELECT max(num) AS num FROM my_numbers 
WHERE num in (SELECT num FROM my_numbers GROUP BY num  HAVING COUNT(num) = 1); 