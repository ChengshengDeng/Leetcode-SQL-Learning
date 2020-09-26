## Question 177 
## Level: Medium 


```
Write a SQL query to get the nth highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
For example, given the above Employee table, the nth highest salary where n = 2 is 200. If there is no nth highest salary, then the query should return null.

+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+
``` 

* This Question is very similar to 178. And again, be careful with `Rank()` and `DENSE_RANK()`. 
* The difference is that we need to rank the salary first and then `SELECT` the Salary with rank = n 

## Answer 

```
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      SELECT DISTINCT a.Salary FROM (SELECT Salary, DENSE_RANK() OVER(ORDER BY Salary DESC) rnk FROM Employee) a 
      WHERE a.rnk = n 
  );
  
END
```
