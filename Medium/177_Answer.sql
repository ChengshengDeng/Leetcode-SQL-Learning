 CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
RETURN (
select IFNULL((select salary from (select distinct Salary, dense_rank() over (order by Salary desc) rn from Employee) temp where temp.rn = N),Null)

);
END