
SELECT Salary As SecondHighestSalary 
FROM Employee 
WHERE Sarlary NOT IN (SELECT MAX(Salary) FROM Employee); 