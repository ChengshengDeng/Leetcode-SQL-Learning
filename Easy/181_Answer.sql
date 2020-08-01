SELECT a.Name AS Employee
FROM Employee AS a
JOIN Employee As b 
on a.ManagerId = b.Id 
AND a.Salary > b.Salary ; 