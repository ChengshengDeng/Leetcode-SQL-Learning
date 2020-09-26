## Question 184 
## Level: Medium 

```
The Employee table holds all employees. Every employee has an Id, a salary, and there is also a column for the department Id.

+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Jim   | 90000  | 1            |
| 3  | Henry | 80000  | 2            |
| 4  | Sam   | 60000  | 2            |
| 5  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
The Department table holds all departments of the company.

+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+
Write a SQL query to find employees who have the highest salary in each of the departments. For the above tables, your SQL query should return the following rows (order of rows does not matter).

+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| IT         | Jim      | 90000  |
| Sales      | Henry    | 80000  |
+------------+----------+--------+
Explanation:

Max and Jim both have the highest salary in the IT department and Henry has the highest salary in the Sales department.

``` 
When we see the question asks for `MAX()` of value, we should first consider `RANK()` OR `DENSE_RANK()` 
 
For this question, there are two points we need to know how to use. 
 
* `JOIN()` 
* `RANK()`


## Answer 

```
WITH temp AS ( SELECT e.Name AS emp, e.Salary, e.DepartmentId, d.Name, 
      RANK()OVER(PARTITION BY e.DepartmentId ORDER BY e.Salary DESC) rnk 
      FROM Employee e 
      JOIN Department d 
      ON e.DepartmentId = d.Id ) 

SELECT Name AS Department, emp AS Employee, Salary 
FROM temp 
WHERE rnk = 1
```
